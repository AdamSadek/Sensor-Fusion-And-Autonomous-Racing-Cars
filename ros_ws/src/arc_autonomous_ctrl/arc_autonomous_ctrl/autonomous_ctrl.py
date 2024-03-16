import rclpy
from rclpy.node import Node
from sensor_msgs.msg import Image
from ackermann_msgs.msg import AckermannDriveStamped
import cv2
from cv_bridge import CvBridge
import numpy as np

class AutonomousRCCar(Node):
    def __init__(self):
        super().__init__('autonomous_ctrl')
        self.subscription = self.create_subscription(Image,'/image_raw',self.image_callback,10)
        self.publisher = self.create_publisher(AckermannDriveStamped,'/ackermann_cmd',10)
        self.bridge = CvBridge()

    def image_callback(self, msg):
        cv_image = self.bridge.imgmsg_to_cv2(msg, "bgr8")
        processed_image, center_offset = self.process_image(cv_image)
        drive_command = self.calculate_control_commands(center_offset)
        self.publisher.publish(drive_command)

    def process_image(self, image):
        # converting to grayscale for simpler and more efficient processing
        gray_image = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
        # applying Gaussian blur to reduce noise for more reliable edge detection
        blurred_image = cv2.GaussianBlur(gray_image, (5, 5), 0)
        # Use adaptive thresholding to keep into account for varying lighting conditions
        threshold_image = cv2.adaptiveThreshold(blurred_image, 255, cv2.ADAPTIVE_THRESH_GAUSSIAN_C, cv2.THRESH_BINARY_INV, 11, 2)
        # Find contours which could correspond to track edges (black lines)
        contours, _ = cv2.findContours(threshold_image, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
        # handle the case where no contours is found
        if len(contours) == 0:
            self.get_logger().warn('No contours found')
            return threshold_image, 0  # no offset if we have no contours
        # continue with contour processing
        try:
            track_contour = max(contours, key=cv2.contourArea)
        except ValueError:
            self.get_logger().error('Error finding max contour area: Contours list is empty.')
            return threshold_image, 0  # no offset if we can't find a max contour
        # calculate moments of the largest contour
        M = cv2.moments(track_contour)
        if M["m00"] != 0:
            cx = int(M["m10"] / M["m00"])
            cy = int(M["m01"] / M["m00"])
        else:
            cx, cy = 0, 0
        # calculate offset from the center
        center_offset = cx - image.shape[1] // 2
        # visualization (might only show from the pi hdmi display - could find another approach)
        cv2.drawContours(image, [track_contour], -1, (0, 255, 0), 3)
        cv2.circle(image, (cx, cy), 7, (255, 255, 255), -1)
        cv2.imshow("Track Detection", image)
        cv2.waitKey(1)

        return threshold_image, center_offset

    def calculate_control_commands(self, center_offset):
        drive_msg = AckermannDriveStamped()
        # proportional controller
        kp = 0.005  # proportional gain
        steering_angle = kp * center_offset
        # set a constant speed
        speed = 1.0 # m/s
        # adjust speed based on steering angle for safety
        if abs(steering_angle) > 0.1:
            speed = 0.5
        drive_msg.drive.speed = speed
        drive_msg.drive.steering_angle = steering_angle
        return drive_msg

def main(args=None):
    rclpy.init(args=args)
    autonomous_rc_car = AutonomousRCCar()
    rclpy.spin(autonomous_rc_car)
    autonomous_rc_car.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()
