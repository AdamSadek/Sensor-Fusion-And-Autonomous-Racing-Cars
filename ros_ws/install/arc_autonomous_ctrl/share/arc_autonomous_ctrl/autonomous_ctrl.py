import cv2
import numpy as np
import rclpy
from rclpy.node import Node
from sensor_msgs.msg import Image
from std_msgs.msg import Float64
from cv_bridge import CvBridge

class AutonomousCarNode(Node):
    def __init__(self):
        super().__init__('autonomous_car_node')
        self.bridge = CvBridge()
        self.image_subscriber = self.create_subscription(Image, '/image_raw', self.image_callback, 10)
        self.steering_publisher = self.create_publisher(Float64, '/commands/servo/position', 10)
        self.speed_publisher = self.create_publisher(Float64, '/commands/motor/duty_cycle', 10)

    def image_callback(self, msg):
        cv_image = self.bridge.imgmsg_to_cv2(msg, 'bgr8')
        processed_image = self.process_image(cv_image)
        steering_angle = self.calculate_steering_angle(processed_image)
        self.publish_commands(steering_angle)

    def process_image(self, image):
        # Convert to grayscale
        gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
        # Gaussian blur
        blur = cv2.GaussianBlur(gray, (5, 5), 0)
        # Canny edge detection
        edges = cv2.Canny(blur, 50, 150)
        # Define the region of interest
        height, width = edges.shape
        mask = np.zeros_like(edges)
        polygon = np.array([[
            (0, height * 0.8),
            (width, height * 0.8),
            (width, height),
            (0, height),
        ]], np.int32)
        cv2.fillPoly(mask, polygon, 255)
        cropped_edges = cv2.bitwise_and(edges, mask)
        # Hough transform for line detection
        lines = cv2.HoughLinesP(cropped_edges, 1, np.pi/180, 50, np.array([]), minLineLength=10, maxLineGap=250)
        return lines

    def calculate_steering_angle(self, lines):
        if lines is None:
            return 0.0  # No steering adjustment needed if no lines are detected
        
        # Placeholder for filtering and averaging the lane lines
        left_line_angle, right_line_angle = self.filter_and_average_lines(lines)
        
        # Calculate steering angle based on the orientation of the lane lines
        steering_angle = (left_line_angle + right_line_angle) / 2
        return steering_angle

    def filter_and_average_lines(self, lines):
        left_lines = []  # Lines on the left have a negative slope
        right_lines = []  # Lines on the right have a positive slope

        for line in lines:
            x1, y1, x2, y2 = line[0]
            parameters = np.polyfit((x1, x2), (y1, y2), 1)  # Fit a linear polynomial
            slope = parameters[0]
            intercept = parameters[1]
            if slope < 0:  # Negative slope -> left lane
                left_lines.append((slope, intercept))
            else:  # Positive slope -> right lane
                right_lines.append((slope, intercept))

        left_line = np.mean(left_lines, axis=0) if left_lines else (1, 0)
        right_line = np.mean(right_lines, axis=0) if right_lines else (-1, 0)

        # Calculate angles from slopes
        left_angle = np.arctan(left_line[0]) * 180 / np.pi
        right_angle = np.arctan(right_line[0]) * 180 / np.pi

        # Ensuring the angles are meaningful for steering
        left_angle = self.adjust_angle(left_angle)
        right_angle = self.adjust_angle(right_angle)

        return left_angle, right_angle

    def adjust_angle(self, angle):
        """
        Adjusts the angle to be within a meaningful range for steering.
        This is a placeholder function; the actual implementation would depend on how the angle affects steering in your setup.
        """
        if angle < -90:
            angle += 180
        elif angle > 90:
            angle -= 180
        return angle


    def publish_commands(self, steering_angle):
        # Dynamically adjust speed based on the steering angle for smoother turns
        speed = 0.5 - abs(steering_angle) / 2  # Reduce speed for sharper turns

        steering_msg = Float64()
        steering_msg.data = steering_angle
        self.steering_publisher.publish(steering_msg)

        speed_msg = Float64()
        speed_msg.data = max(speed, 0.1)  # Ensure some minimum speed
        self.speed_publisher.publish(speed_msg)

def main(args=None):
    rclpy.init(args=args)
    autonomous_car_node = AutonomousCarNode()
    rclpy.spin(autonomous_car_node)
    rclpy.shutdown()

if __name__ == '__main__':
    main()
	