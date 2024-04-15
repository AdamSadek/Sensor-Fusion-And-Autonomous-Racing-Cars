# import rclpy
# from rclpy.node import Node
# from sensor_msgs.msg import Image
# from ackermann_msgs.msg import AckermannDriveStamped
# from cv_bridge import CvBridge
# import cv2
# import numpy as np

# class PIDController:
#     def __init__(self, kp, ki, kd):
#         # initialize PID constants and state
#         self.kp = kp
#         self.ki = ki
#         self.kd = kd
#         self.previous_error = 0
#         self.integral = 0

#     def compute_correction(self, error, delta_time):
#         # calculate integral and derivative components
#         self.integral += error * delta_time
#         derivative = (error - self.previous_error) / delta_time if delta_time > 0 else 0
#         # compute total correction using PID formula
#         correction = self.kp * error + self.ki * self.integral + self.kd * derivative
#         self.previous_error = error
#         return correction

# # main node
# class AutonomousRCCarNode(Node):
#     def __init__(self):
#         super().__init__('autonomous_rc_car')
#         # set up subscribers and publishers for image data and driving commands
#         self.subscription = self.create_subscription(Image, '/image_raw', self.image_callback, 10)
#         self.publisher = self.create_publisher(AckermannDriveStamped, '/ackermann_cmd', 10)
#         # helps convert ROS images to OpenCV format
#         self.bridge = CvBridge()
#         self.get_logger().info('Autonomous RC Car Node has started.')

#         # initialize parameters for car control
#         self.servo_min = 0.35
#         self.servo_max = 0.95
#         self.servo_neutral = 0.65
#         self.speed = 2.0
#         self.frame_width = 640
#         self.track_width = self.frame_width // 2
#         self.previous_time = self.get_clock().now()
#         self.safe_speed = 1.0
#         self.last_steering_angle = self.servo_neutral
#         self.max_steering_rate = 0.05
#         self.forward_focus_distance = 0.75  # Percentage of the frame height to focus on for curve detection
#         # for steering smoothing
#         self.alpha = 0.20
#         self.filtered_steering_angle = self.servo_neutral
#         # self.pid_controller = PIDController(kp=0.00040, ki=0.00003, kd=0.00010)
#         self.pid_controller = PIDController(kp=0.00040, ki=0.00001, kd=0.00015)


#     def image_callback(self, data):
#         # process each incoming image frame
#         try:
#             # convert ROS image to OpenCV format
#             current_frame = self.bridge.imgmsg_to_cv2(data, 'bgr8')
#             # save the current frame for debugging
#             cv2.imwrite('images/image.jpg', current_frame)

#             # process image to find the track
#             processed_image = self.process_image(current_frame)
#             # calculate control based on processed image
#             steering_angle, speed = self.calculate_control(processed_image)

#             # prepare and publish driving command based on calculated control
#             drive_msg = AckermannDriveStamped()
#             drive_msg.drive.steering_angle = steering_angle
#             drive_msg.drive.speed = speed
#             self.publisher.publish(drive_msg)

#         except Exception as e:
#             self.get_logger().error('Failed to process image frame: %r' % (e,))

#     def adjust_hsv_ranges(self, frame):
#         # convert to HSV
#         hsv_frame = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)
#         # calculate the brightness by averaging the V channel
#         brightness = np.mean(hsv_frame[:, :, 2])
#         # adjust HSV ranges based on the brightness
#         self.get_logger().info(f'brightness={brightness}')
#         if brightness < 50:  # low light conditions
#             lower_green = np.array([40, 100, 50])
#             upper_green = np.array([80, 255, 200])
#         elif brightness > 200:  # very bright conditions
#             lower_green = np.array([40, 40, 100])
#             upper_green = np.array([80, 255, 255])
#         else:  # normal conditions
#             lower_green = np.array([40, 40, 40])
#             upper_green = np.array([80, 255, 255])
#         return lower_green, upper_green

#     # def process_image(self, frame):
#     #     # apply preprocessing steps to focus on relevant track parts
#     #     height, width = frame.shape[:2]
#     #     # region of interest (ROI) to reduce the area to be processed
#     #     roi_height_start = int(height * 0.59) # 0.55 and 0.62
#     #     roi_height_end = height
#     #     roi_width_start = int(width * 0.1) # 0.05
#     #     roi_width_end = int(width * 0.90) # 0.95
#     #     roi = frame[roi_height_start:roi_height_end, roi_width_start:roi_width_end]
#     #     cv2.imwrite('images/roi_image.jpg', roi) 

#     #     # convert the roi to HSV color space to identify track colors better
#     #     hsv_roi = cv2.cvtColor(roi, cv2.COLOR_BGR2HSV)
#     #     # define range for green color (track) in HSV space
#     #     lower_green, upper_green = self.adjust_hsv_ranges(frame)

#     #     # create a mask that isolates the green parts of the image
#     #     mask = cv2.inRange(hsv_roi, lower_green, upper_green)
#     #     cv2.imwrite('images/mask_image.jpg', mask)
        
#     #     # apply the mask to keep only the green parts
#     #     green_only = cv2.bitwise_and(roi, roi, mask=mask)
#     #     cv2.imwrite('images/green_image.jpg', green_only)

#     #     # convert the result to grayscale and apply a blur to smooth it
#     #     gray_green_only = cv2.cvtColor(green_only, cv2.COLOR_BGR2GRAY)
#     #     blur = cv2.GaussianBlur(gray_green_only, (5, 5), 0)
#     #     cv2.imwrite('images/blur_image.jpg', blur)

#     #     # apply a binary threshold to isolate the lines even more
#     #     _, binary = cv2.threshold(blur, 50, 255, cv2.THRESH_BINARY)
#     #     # use dilation to close gaps in detected lines
#     #     kernel = np.ones((15, 15), np.uint8)
#     #     dilation = cv2.dilate(binary, kernel, iterations=2)
#     #     cv2.imwrite('images/dilation_image.jpg', dilation)

#     #     # detect edges in the dilated image using Canny edge detection
#     #     edges = cv2.Canny(dilation, 50, 150)
#     #     cv2.imwrite('images/processed_image.jpg', edges)

#     #     # detect lines in the edge-detected image using the Hough transform
#     #     lines = cv2.HoughLinesP(edges, 1, np.pi / 180, threshold=50, minLineLength=50, maxLineGap=10)
#     #     return lines

#     def process_image(self, frame):
#         # apply preprocessing steps to focus on relevant track parts
#         height, width = frame.shape[:2]
#         roi_height_start = int(height * 0.595)  # adjust ROI to focus on the lower part of the image where the track is
#         roi_height_end = height
#         roi_width_start = int(width * 0.1)
#         roi_width_end = int(width * 0.95)
#         roi = frame[roi_height_start:roi_height_end, roi_width_start:roi_width_end]
#         cv2.imwrite('images/roi_image.jpg', roi)

#         # convert the roi to HSV color space to identify track colors better
#         hsv_roi = cv2.cvtColor(roi, cv2.COLOR_BGR2HSV)
#         # define a more precise range for green color (track) in HSV space
#         lower_green, upper_green = self.adjust_hsv_ranges(frame)

#         # create a mask that isolates the green parts of the image
#         mask = cv2.inRange(hsv_roi, lower_green, upper_green)
#         cv2.imwrite('images/mask_image.jpg', mask)

#         # Additional morphological opening to remove small objects (noise)
#         kernel = np.ones((5, 5), np.uint8)
#         mask_opened = cv2.morphologyEx(mask, cv2.MORPH_OPEN, kernel)
#         cv2.imwrite('images/mask_opened.jpg', mask_opened)

#         # Additional morphological closing to close small holes inside the foreground
#         mask_closed = cv2.morphologyEx(mask_opened, cv2.MORPH_CLOSE, kernel)
#         cv2.imwrite('images/mask_closed.jpg', mask_closed)

#         # detect edges in the processed mask using Canny edge detection
#         edges = cv2.Canny(mask_closed, 50, 150)
#         cv2.imwrite('images/processed_image.jpg', edges)

#         # detect lines in the edge-detected image using the Hough transform
#         lines = cv2.HoughLinesP(edges, 1, np.pi / 180, threshold=50, minLineLength=50, maxLineGap=20)
#         return lines

#     def find_track_center(self, lines):
#         # find the center of the track based on detected lines
#         left_line_x = []
#         right_line_x = []
#         for line in lines:
#             for x1, y1, x2, y2 in line:
#                 slope = (y2 - y1) / (x2 - x1) if x2 != x1 else float('inf')
#                 # categorize lines as left or right based on their slope
#                 if slope < 0:
#                     left_line_x.extend([x1, x2])
#                 else:
#                     right_line_x.extend([x1, x2])

#         # calculate average positions for left and right lines
#         left_x_avg = np.mean(left_line_x) if left_line_x else None
#         right_x_avg = np.mean(right_line_x) if right_line_x else None

#         # calculate track center based on the averages
#         if left_x_avg is not None and right_x_avg is not None:
#             track_center = (left_x_avg + right_x_avg) / 2
#         elif left_x_avg is not None:
#             track_center = left_x_avg + (self.track_width / 2)
#         elif right_x_avg is not None:
#             track_center = right_x_avg - (self.track_width / 2)
#         else:
#             # default to center
#             track_center = self.frame_width / 2

#         return track_center

#     # def calculate_control(self, lines):
#     #     current_time = self.get_clock().now()
#     #     delta_time = (current_time - self.previous_time).nanoseconds / 1e9
#     #     self.previous_time = current_time

#     #     if delta_time <= 0:
#     #         delta_time = 1e-3

#     #     if lines is None or len(lines) == 0:
#     #         # self.get_logger().info('No lines detected, reverting to last known steering angle')
#     #         # if no lines detected, stop the car at a neutral position and stop the motor
#     #         return self.servo_neutral, 0.0

#     #     track_center = self.find_track_center(lines)
#     #     error = self.frame_width // 2 - track_center
#     #     steering_correction = self.pid_controller.compute_correction(error, delta_time)
#     #     # limit the steering correction to prevent abrupt changes
#     #     steering_correction = np.clip(steering_correction, -0.2, 0.2)

#     #     # calculate the proposed steering angle with smoothing
#     #     proposed_steering_angle = self.servo_neutral - steering_correction
#     #     adaptive_alpha = max(0.1, 1 - abs(steering_correction) / 0.2)
#     #     self.filtered_steering_angle = adaptive_alpha * proposed_steering_angle + (1 - adaptive_alpha) * self.filtered_steering_angle
#     #     steering_angle = np.clip(self.filtered_steering_angle, self.servo_min, self.servo_max)

#     #     # enforce a maximum rate of change to the steering angle
#     #     steering_diff = steering_angle - self.last_steering_angle
#     #     if abs(steering_diff) > self.max_steering_rate:
#     #         steering_angle = self.last_steering_angle + np.sign(steering_diff) * self.max_steering_rate

#     #     # use the angle of the track (calculated elsewhere) to inform speed
#     #     angle = self.calculate_turn_angle(lines)
#     #     speed = self.determine_speed_based_on_angle(angle)

#     #     # Log steering and speed for debugging
#     #     self.get_logger().info(f'Steering angle: {steering_angle}')
#     #     self.get_logger().info(f'Speed: {speed}')

#     #     self.last_steering_angle = steering_angle

#     #     return steering_angle, speed
#     def calculate_control(self, lines):
#         current_time = self.get_clock().now()
#         delta_time = (current_time - self.previous_time).nanoseconds / 1e9
#         self.previous_time = current_time

#         if delta_time <= 0:
#             delta_time = 1e-3

#         if lines is None or len(lines) == 0:
#             return self.servo_neutral, 0.0

#         track_center = self.find_track_center(lines)
#         error = self.frame_width // 2 - track_center
#         steering_correction = self.pid_controller.compute_correction(error, delta_time)
#         # limit the steering correction to prevent abrupt changes
#         steering_correction = np.clip(steering_correction, -0.3, 0.3)

#         # calculate the proposed steering angle with smoothing
#         proposed_steering_angle = self.servo_neutral - steering_correction
#         adaptive_alpha = max(0.1, 1 - abs(steering_correction) / 0.3)
#         self.filtered_steering_angle = adaptive_alpha * proposed_steering_angle + (1 - adaptive_alpha) * self.filtered_steering_angle
#         steering_angle = np.clip(self.filtered_steering_angle, self.servo_min, self.servo_max)

#         # enforce a maximum rate of change to the steering angle
#         steering_diff = steering_angle - self.last_steering_angle
#         if abs(steering_diff) > self.max_steering_rate:
#             steering_angle = self.last_steering_angle + np.sign(steering_diff) * self.max_steering_rate

#         angle = self.calculate_turn_angle(lines)
#         speed = self.determine_speed_based_on_angle(angle)

#         self.last_steering_angle = steering_angle

#         return steering_angle, speed

#     def calculate_turn_angle(self, lines):
#         if lines is None or len(lines) < 2:
#             # not enough lines to calculate an angle, assume straight path or undefined turn
#             return 0

#         # assume the two longest lines are the track edges
#         lines = sorted(lines, key=lambda l: np.hypot(l[0][2] - l[0][0], l[0][3] - l[0][1]), reverse=True)
#         first_line = lines[0][0]
#         second_line = lines[1][0]

#         # compute the direction vectors of the two lines
#         vec1 = ((first_line[2] - first_line[0]), (first_line[3] - first_line[1]))
#         vec2 = ((second_line[2] - second_line[0]), (second_line[3] - second_line[1]))

#         # normalize the direction vectors
#         vec1 = vec1 / np.linalg.norm(vec1)
#         vec2 = vec2 / np.linalg.norm(vec2)

#         # use the dot product to find the cosine of the angle between the vectors
#         dot_product = np.dot(vec1, vec2)
#         angle = np.arccos(dot_product)

#         # the angle is in radians, make sure it's not NaN in case of a straight line (dot_product close to 1)
#         if np.isnan(angle):
#             return 0
#         return angle    


#     def determine_speed_based_on_angle(self, angle):
#         # define angle thresholds for speed adjustments
#         sharp_turn_angle = np.radians(40)  # 40 degrees
#         mild_turn_angle = np.radians(35)  # 20 degrees

#         # adjust speed based on the angle
        
#         self.get_logger().info(f'\nANGLE: {angle}')
#         self.get_logger().info(f'sharp_turn: {sharp_turn_angle}')
#         self.get_logger().info(f'\nmild_turn: {mild_turn_angle}')
#         if angle > 0.5 and angle < 0.7:
#             self.get_logger().info("\nSHARP!!")

#             self.pid_controller.kp = 0.00100
#             self.pid_controller.kd = 0.00082
#             return 0.5  # slow down for sharp turns
#         if angle >= 0.3 and angle < 0.5:
#             self.get_logger().info("\nMILD!!")

#             self.pid_controller.kp = 0.00900
#             self.pid_controller.kd = 0.00070
#             return 0.75  # moderate speed for mild turns
#         else:
#             self.pid_controller.kp = 0.00010
#             self.pid_controller.kd = 0.00028
#             return 1.0  # full speed on straight paths
# # the main function to initialize the node and spin it
# def main(args=None):
#     rclpy.init(args=args)  # initialize the ROS2 client library
#     autonomous_rc_car_node = AutonomousRCCarNode()
#     rclpy.spin(autonomous_rc_car_node)  # keep the node running
#     autonomous_rc_car_node.destroy_node()  # cleanup before shutting down
#     rclpy.shutdown()

# if __name__ == '__main__':
#     main()


