import rclpy
from rclpy.node import Node
from sensor_msgs.msg import Image
from ackermann_msgs.msg import AckermannDriveStamped
from cv_bridge import CvBridge
import cv2
import numpy as np
from scipy.optimize import least_squares

class PIDController:
    def __init__(self, kp, ki, kd):
        self.kp = kp
        self.ki = ki
        self.kd = kd
        self.previous_error = 0
        self.integral = 0

    def compute_correction(self, error, delta_time):
        self.integral += error * delta_time
        derivative = (error - self.previous_error) / delta_time if delta_time > 0 else 0
        correction = self.kp * error + self.ki * self.integral + self.kd * derivative
        self.previous_error = error
        return correction

class AutonomousRCCarNode(Node):
    def __init__(self):
        super().__init__('autonomous_rc_car')
        self.subscription = self.create_subscription(Image, '/image_raw', self.image_callback, 10)
        self.publisher = self.create_publisher(AckermannDriveStamped, '/ackermann_cmd', 10)
        self.bridge = CvBridge()
        self.get_logger().info('Autonomous RC Car Node has started.')
        self.servo_min = 0.30
        self.servo_max = 0.90
        self.servo_neutral = 0.65
        self.speed = 0.75  # Base speed
        self.frame_width = 640
        self.frame_length = 0.6288
        self.track_width = self.frame_width // 2
        self.previous_time = self.get_clock().now()
        self.last_steering_angle = self.servo_neutral
        self.alpha = 0.2  # smoothing factor
        self.filtered_steering_angle = self.servo_neutral
        self.pid_controller = PIDController(kp=0.00095, ki=0.00001, kd=0.00095)

    def image_callback(self, data):
        try:
            current_frame = self.bridge.imgmsg_to_cv2(data, 'bgr8')
            processed_image = self.process_image(current_frame)
            steering_angle, speed = self.calculate_control(processed_image,current_frame)
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
        height, width = frame.shape[:2]
        """
        length is 0.6288. Please note that it depends on you camera/frame
        roi get the region of interest from the frame, just the bottom part where the track is
        """
        roi = frame[int(height * self.frame_length):height]
        cv2.imwrite('images/roi_image.jpg', roi) # saving image locally to debug
        # convert the roi to hsv color space, it's better for color detection
        hsv_roi = cv2.cvtColor(roi, cv2.COLOR_BGR2HSV)
        #  find the right hsv range for the green color, it varies with the brightness
        lower_green, upper_green = self.adjust_hsv_ranges(frame)
        # create a mask that only includes the green colors
        mask = cv2.inRange(hsv_roi, lower_green, upper_green)
        # make a square kernel for morphological operations, it's like a little window
        kernel = np.ones((5, 5), np.uint8)
        # clean up the mask, removing noise and small blobs
        mask_cleaned = cv2.morphologyEx(mask, cv2.MORPH_OPEN, kernel)
        # find the edges in the cleaned-up mask, it's where the green color changes sharply
        edges = cv2.Canny(mask_cleaned, 50, 150) 
        # detect lines from those edges, this is where the math happens
        lines = cv2.HoughLinesP(edges, 1, np.pi / 180, 50, minLineLength=50, maxLineGap=10)  # detect lines from those edges, this is where the math happens
        cv2.imwrite('images/processed_image.jpg', edges) # for debugging
        return lines

    def find_track_center(self, lines):
        # if there are no lines, just guess we're in the middle
        if lines is None:
            return self.frame_width // 2 

        left_line_segments = []
        right_line_segments = []

        # go through each linE found
        for line in lines:
            for x1, y1, x2, y2 in line:
                # calculate the slope of the line
                slope = (y2 - y1) / (x2 - x1) if (x2 - x1) != 0 else float('inf')
                # how long is the line segment?
                length = np.sqrt((y2 - y1)**2 + (x2 - x1)**2)
                # if the slope is negative it's a left line, otherwise it's right
                if slope < 0:
                    left_line_segments.append((x1, y1, x2, y2, length))
                else:
                    right_line_segments.append((x1, y1, x2, y2, length))

        # figure out the average position of the left and right lines, weighted by their length
        left_x_avg = np.average([x for x, _, _, _, length in left_line_segments], weights=[length for _, _, _, _, length in left_line_segments]) if left_line_segments else self.frame_width / 4
        right_x_avg = np.average([x for _, _, x, _, length in right_line_segments], weights=[length for _, _, _, _, length in right_line_segments]) if right_line_segments else 3 * self.frame_width / 4

        # mix a bit of the old track width with the new one to keep things steady
        smoothing_factor = 0.08
        current_center = (left_x_avg + right_x_avg) / 2
        self.track_width = smoothing_factor * current_center + (1 - smoothing_factor) * self.track_width

        return self.track_width  # this is where "the middle" of the track is
 
    def calculate_control(self, lines, frame):
        current_time = self.get_clock().now()
        delta_time = (current_time - self.previous_time).nanoseconds / 1e9
        self.previous_time = current_time

        # if we can't see any lines, the car will reverse
        if lines is None or len(lines) == 0:
            if not hasattr(self, 'no_lines_detected_time'):
                # start a timer to see how long we cant see the line
                self.no_lines_detected_time = current_time
                self.get_logger().info('no lines, might need to reverse soon...')
            else:
                # if its been over half a second, we want to reverse
                time_since_no_lines_detected = (current_time - self.no_lines_detected_time).nanoseconds / 1e9
                if time_since_no_lines_detected >= 0.5:
                    steering_angle = self.servo_neutral  # stay straight
                    speed = -0.75  # back it up
                    self.get_logger().info('still no lines, reversing now...')
                    return steering_angle, speed
        else:
            # if we see lines again, stop the reverse countdown
            if hasattr(self, 'no_lines_detected_time'):
                del self.no_lines_detected_time

        # find where the track is and steer towards it
        track_center = self.find_track_center(lines)
        error = self.frame_width // 2 - track_center
        # pid magic to smoothly steer us back on track
        steering_correction = self.pid_controller.compute_correction(error, delta_time)
        proposed_steering_angle = self.servo_neutral - steering_correction
        # more smoothing for the steering so its not jerky/jittery
        self.filtered_steering_angle = self.alpha * proposed_steering_angle + (1 - self.alpha) * self.last_steering_angle
        self.last_steering_angle = self.filtered_steering_angle
        # make sure the car doesn't oversteer past what the car can actually do
        steering_angle = np.clip(self.filtered_steering_angle, self.servo_min, self.servo_max)

        # slow down so the car doesn't fly off the track
        curvature, curve_direction = self.calculate_curvature(lines)
        self.get_logger().info(f'Curvature: {curvature}')
        speed_factor = 1.0
        if hasattr(self, 'curve_detected_time') and (current_time - self.curve_detected_time).nanoseconds / 1e9 < 10.0:
            #  already in a curve, keep it slow
            self.get_logger().info('still in that curve...')
            speed_factor = 0.75
        elif curvature >= 0.017:
            # new curve coming up, time to slow down
            self.get_logger().info('new curve ahead, slowing down...')
            self.curve_detected_time = current_time
            speed_factor = 0.75
        else:
            # if the curve is done, or if there was no curve, full speed ahead
            if hasattr(self, 'curve_detected_time'):
                del self.curve_detected_time

        speed = self.speed * speed_factor  # adjust speed based on the curve
        self.get_logger().info(f'Steering angle: {steering_angle}, Speed: {speed}') # for debugging
        return steering_angle, speed
    
    def calculate_curvature(self, lines):
        left_points = []  # holding the points that are part of the left lane line
        right_points = []  # and these are for the right lane line

        # looking at each line that was detected
        for line in lines:
            for x1, y1, x2, y2 in line:
                # how steep is this line?
                slope = (y2 - y1) / (x2 - x1) if (x2 - x1) != 0 else 0  # can't divide by zero, so we check
                # based on the slope, sort them into left or right lane lines
                if slope < 0:
                    left_points.extend([(x1, y1), (x2, y2)])
                else:
                    right_points.extend([(x1, y1), (x2, y2)])

        # try and make a circle that fits these points
        left_circle = self.fit_circle(left_points)
        right_circle = self.fit_circle(right_points)
        frame_center = self.frame_width // 2 

        # checking how curvy the track is
        curve_direction = None
        if left_circle and right_circle:
            # grab the centers of the fitted circles
            left_center, right_center = left_circle[0], right_circle[0]
            # center between these two circles
            average_center = (left_center + right_center) / 2

            # a smaller radius means a tighter curve
            min_radius_for_curve = 800
            left_radius = left_circle[2]
            right_radius = right_circle[2]
            if left_radius < min_radius_for_curve or right_radius < min_radius_for_curve:
                # if either radius is small enough, there is a curve
                curvature = 1 / ((left_radius + right_radius) / 2)
                # curve will be left or right, depends on where the center point is
                curve_direction = 'left' if average_center < frame_center else 'right'
            else:
                curvature = 0  # if both radii are big, it's pretty much a straight road
        else:
            curvature = 0  # if it couldn't fit circles, i can't say much about the curvature

        return curvature, curve_direction  

    def fit_circle(self, points):
        # need at least three points to define a circle
        if len(points) < 3:
            return None
        
        # let's get those points into a numpy array to make math easier
        points = np.array(points)
        x = points[:, 0]  # all the x-coordinates
        y = points[:, 1]  # and all the y-coordinates

        # we're looking for the average point, which will be our circle's center
        x_avg = np.mean(x)
        y_avg = np.mean(y)
        center = (x_avg, y_avg)  # here's the center

        # for the radius, we'll find the average distance of all points from the center
        radius = np.mean(np.sqrt((x - x_avg) ** 2 + (y - y_avg) ** 2))

        return (x_avg, y_avg, radius)  # and this is our circle: center and radius

        
def main(args=None):
    rclpy.init(args=args)
    node = AutonomousRCCarNode()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()