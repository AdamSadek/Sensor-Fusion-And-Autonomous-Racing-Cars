import rclpy
from rclpy.node import Node
from ackermann_msgs.msg import AckermannDriveStamped

class AckermannSteeringPublisher(Node):
    def __init__(self):
        super().__init__('ackermann_steering_publisher')
        self.publisher_ = self.create_publisher(AckermannDriveStamped, '/ackermann_cmd', 10)
        self.initiate_steering_sequence()

    def initiate_steering_sequence(self):
        # Define servo range according to vesc_driver parameters
        self.servo_min = 0.30  # Leftmost position
        self.servo_max = 0.85  # Rightmost position
        self.servo_neutral = 0.60  # Neutral position

        # Start the sequence by steering to the leftmost position
        self.publish_steering_angle(self.servo_min)
        self.get_logger().info(f'Steering to the leftmost position: servo value {self.servo_min}')

        # Schedule the timer to return to neutral after 2 seconds, then rightmost, then neutral again
        self.timer_ = self.create_timer(2, self.return_to_neutral)

    def return_to_neutral(self):
        # Neutral position
        self.publish_steering_angle(self.servo_neutral)
        self.get_logger().info(f'Returning to neutral position: servo value {self.servo_neutral}')
        
        # Cancel previous timer and setup for next step
        self.timer_.cancel()
        self.timer_ = self.create_timer(2, self.steer_to_rightmost)

    def steer_to_rightmost(self):
        # Rightmost position
        self.publish_steering_angle(self.servo_max)
        self.get_logger().info(f'Steering to the rightmost position: servo value {self.servo_max}')
        
        # Cancel previous timer and setup for final return to neutral
        self.timer_.cancel()
        self.timer_ = self.create_timer(2, self.final_neutral)

    def final_neutral(self):
        # Final neutral position
        self.publish_steering_angle(self.servo_neutral)
        self.get_logger().info(f'Final return to neutral position: servo value {self.servo_neutral}')
        
        # Sequence completed, prepare for shutdown
        self.steering_sequence_completed = True
        self.get_logger().info('Completed steering sequence. Preparing for shutdown.')

    def publish_steering_angle(self, servo_value):
        msg = AckermannDriveStamped()
        msg.drive.speed = 0.0  # Maintain speed at zero
        msg.drive.steering_angle = servo_value  # Use servo_value directly
        self.publisher_.publish(msg)

def main(args=None):
    rclpy.init(args=args)
    ackermann_steering_publisher = AckermannSteeringPublisher()
    
    # Spin until the node has indicated it has completed its sequence
    while rclpy.ok():
        rclpy.spin_once(ackermann_steering_publisher, timeout_sec=0.1)
        if getattr(ackermann_steering_publisher, 'steering_sequence_completed', False):
            break
    
    ackermann_steering_publisher.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()
