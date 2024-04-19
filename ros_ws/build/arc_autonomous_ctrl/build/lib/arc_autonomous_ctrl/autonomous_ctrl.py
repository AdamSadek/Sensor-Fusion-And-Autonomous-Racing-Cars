import rclpy
from rclpy.node import Node
from sensor_msgs.msg import Image
from ackermann_msgs.msg import AckermannDriveStamped
from cv_bridge import CvBridge
import cv2
import numpy as np

class PIDController:
    def __init__(self, kp, ki, kd):
        # initialize PID constants and state
        self.kp = kp
        self.ki = ki
        self.kd = kd
        self.previous_error = 0
        self.integral = 0

    def compute_correction(self, error, delta_time):
        # calculate integral and derivative components
        self.integral += error * delta_time
        derivative = (error - self.previous_error) / delta_time if delta_time > 0 else 0
        # compute total correction using PID formula
        correction = self.kp * error + self.ki * self.integral + self.kd * derivative
        self.previous_error = error
        return correction

# main node
class AutonomousRCCarNode(Node):
    def __init__(self):
        super().__init__('autonomous_rc_car')
        # set up subscribers and publishers for image data and driving commands
        self.subscription = self.create_subscription(Image, '/image_raw', self.image_callback, 10)
        self.publisher = self.create_publisher(AckermannDriveStamped, '/ackermann_cmd', 10)
        # helps convert ROS images to OpenCV format
        self.bridge = CvBridge()
        self.get_logger().info('Autonomous RC Car Node has started.')

        # initialize parameters for car control
        self.servo_min = 0.35
        self.servo_max = 0.95
        self.servo_neutral = 0.65
        self.speed = 2.0
        self.frame_width = 640
        self.track_width = self.frame_width // 2
        self.previous_time = self.get_clock().now()
        self.safe_speed = 1.0
        self.last_steering_angle = self.servo_neutral
        self.max_steering_rate = 0.05
        # for steering smoothing
        self.alpha = 0.2
        self.filtered_steering_angle = self.servo_neutral
        # self.pid_controller = PIDController(kp=0.00095, ki=0.00003, kd=0.00015)
        self.pid_controller = PIDController(kp=0.00095, ki=0.000035, kd=0.00010)


    def image_callback(self, data):
        # process each incoming image frame
        try:
            # convert ROS image to OpenCV format
            current_frame = self.bridge.imgmsg_to_cv2(data, 'bgr8')
            # save the current frame for debugging
            cv2.imwrite('images/image.jpg', current_frame)

            # process image to find the track
            processed_image = self.process_image(current_frame)
            # calculate control based on processed image
            steering_angle, speed = self.calculate_control(processed_image)

            # prepare and publish driving command based on calculated control
            drive_msg = AckermannDriveStamped()
            drive_msg.drive.steering_angle = steering_angle
            drive_msg.drive.speed = speed
            self.publisher.publish(drive_msg)

        except Exception as e:
            self.get_logger().error('Failed to process image frame: %r' % (e,))

    def adjust_hsv_ranges(self, frame):
        # convert to HSV
        hsv_frame = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)
        # calculate the brightness by averaging the V channel
        brightness = np.mean(hsv_frame[:, :, 2])
        # adjust HSV ranges based on the brightness
        if brightness < 50:  # low light conditions
            lower_green = np.array([40, 100, 50])
            upper_green = np.array([80, 255, 200])
        elif brightness > 200:  # very bright conditions
            lower_green = np.array([40, 40, 100])
            upper_green = np.array([80, 255, 255])
        else:  # normal conditions
            lower_green = np.array([40, 40, 40])
            upper_green = np.array([80, 255, 255])
        return lower_green, upper_green

    def process_image(self, frame):
        # apply preprocessing steps to focus on relevant track parts
        height, width = frame.shape[:2]
        # region of interest (ROI) to reduce the area to be processed
        roi_height_start = int(height * 0.58) # 0.55
        roi_height_end = height
        roi_width_start = int(width * 0.05)
        roi_width_end = int(width * 0.95)
        roi = frame[roi_height_start:roi_height_end, roi_width_start:roi_width_end]
        cv2.imwrite('images/roi_image.jpg', roi) 

        # convert the roi to HSV color space to identify track colors better
        hsv_roi = cv2.cvtColor(roi, cv2.COLOR_BGR2HSV)
        # define range for green color (track) in HSV space
        lower_green, upper_green = self.adjust_hsv_ranges(frame)

        # create a mask that isolates the green parts of the image
        mask = cv2.inRange(hsv_roi, lower_green, upper_green)
        cv2.imwrite('images/mask_image.jpg', mask)
        
        # apply the mask to keep only the green parts
        green_only = cv2.bitwise_and(roi, roi, mask=mask)
        cv2.imwrite('images/green_image.jpg', green_only)

        # convert the result to grayscale and apply a blur to smooth it
        gray_green_only = cv2.cvtColor(green_only, cv2.COLOR_BGR2GRAY)
        blur = cv2.GaussianBlur(gray_green_only, (5, 5), 0)
        cv2.imwrite('images/blur_image.jpg', blur)

        # apply a binary threshold to isolate the lines even more
        _, binary = cv2.threshold(blur, 50, 255, cv2.THRESH_BINARY)
        # use dilation to close gaps in detected lines
        kernel = np.ones((15, 15), np.uint8)
        dilation = cv2.dilate(binary, kernel, iterations=2)
        cv2.imwrite('images/dilation_image.jpg', dilation)

        # detect edges in the dilated image using Canny edge detection
        edges = cv2.Canny(dilation, 50, 150)
        cv2.imwrite('images/processed_image.jpg', edges)

        # detect lines in the edge-detected image using the Hough transform
        lines = cv2.HoughLinesP(edges, 1, np.pi / 180, threshold=50, minLineLength=50, maxLineGap=10)
        return lines


    def find_track_center(self, lines):
        # find the center of the track based on detected lines
        left_line_x = []
        right_line_x = []
        for line in lines:
            for x1, y1, x2, y2 in line:
                slope = (y2 - y1) / (x2 - x1) if x2 != x1 else float('inf')
                # categorize lines as left or right based on their slope
                if slope < 0:
                    left_line_x.extend([x1, x2])
                else:
                    right_line_x.extend([x1, x2])

        # calculate average positions for left and right lines
        left_x_avg = np.mean(left_line_x) if left_line_x else None
        right_x_avg = np.mean(right_line_x) if right_line_x else None

        # calculate track center based on the averages
        if left_x_avg is not None and right_x_avg is not None:
            track_center = (left_x_avg + right_x_avg) / 2
        elif left_x_avg is not None:
            track_center = left_x_avg + (self.track_width / 2)
        elif right_x_avg is not None:
            track_center = right_x_avg - (self.track_width / 2)
        else:
            # default to center
            track_center = self.frame_width / 2

        return track_center

    def calculate_control(self, lines):
        # calculate control actions (steering and speed) based on track position
        current_time = self.get_clock().now()
        delta_time = (current_time - self.previous_time).nanoseconds / 1e9
        self.previous_time = current_time
        if delta_time <= 0:
            # prevent division by zero
            delta_time = 1e-3

        if lines is None or len(lines) == 0:
            self.get_logger().info('No lines detected, reverting to last known steering angle')
            return self.servo_neutral, 0.0

        track_center = self.find_track_center(lines)
        error = self.frame_width // 2 - track_center
        steering_correction = self.pid_controller.compute_correction(error, delta_time)
        # limit the steering correction to prevent abrupt changes
        steering_correction = np.clip(steering_correction, -0.2, 0.2)

        # calculate the proposed steering angle with smoothing
        proposed_steering_angle = self.servo_neutral - steering_correction
        adaptive_alpha = max(0.1, 1 - abs(steering_correction) / 0.2)
        self.filtered_steering_angle = adaptive_alpha * proposed_steering_angle + (1 - adaptive_alpha) * self.filtered_steering_angle
        steering_angle = np.clip(self.filtered_steering_angle, self.servo_min, self.servo_max)

        # enforce a maximum rate of change to the steering angle
        steering_diff = steering_angle - self.last_steering_angle
        if abs(steering_diff) > self.max_steering_rate:
            steering_angle = self.last_steering_angle + np.sign(steering_diff) * self.max_steering_rate

        self.last_steering_angle = steering_angle

        # adjust speed based on the steering angle to slow down for turns
        speed = self.speed * (1 - min(abs(steering_correction), 1))
        speed = np.clip(speed, 0, 3.0)

        return steering_angle, speed

# the main function to initialize the node and spin it
def main(args=None):
    rclpy.init(args=args)  # initialize the ROS2 client library
    autonomous_rc_car_node = AutonomousRCCarNode()
    rclpy.spin(autonomous_rc_car_node)  # keep the node running
    autonomous_rc_car_node.destroy_node()  # cleanup before shutting down
    rclpy.shutdown()

if __name__ == '__main__':
    main()
