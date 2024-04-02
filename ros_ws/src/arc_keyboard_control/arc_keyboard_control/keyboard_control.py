import rclpy
from rclpy.node import Node
from ackermann_msgs.msg import AckermannDriveStamped

class AckermannPublisher(Node):
    def __init__(self):
        super().__init__('ackermann_publisher')
        self.publisher_ = self.create_publisher(AckermannDriveStamped, '/ackermann_cmd', 10)
        # seconds (5Hz)
        self.timer_period = 0.2
        self.start_time = self.get_clock().now()
        self.timer = self.create_timer(self.timer_period, self.timer_callback)

    def timer_callback(self):
        current_time = self.get_clock().now()
        # here we convert the duration to seconds by dividing nanoseconds by 1e9
        elapsed_time = (current_time - self.start_time).nanoseconds / 1e9
        # run for 2 seconds so we can measure 200cm (2m) and see if it's actually moving as we expect
        if elapsed_time < 2:
            msg = AckermannDriveStamped()
            msg.drive.speed = 1.0 # m/s
            msg.drive.steering_angle = 0.0
            self.publisher_.publish(msg)
            self.get_logger().info(f'Publishing: speed={msg.drive.speed}, steering_angle={msg.drive.steering_angle}')
        else:
            self.get_logger().info('2 seconds have passed. Shutting down.')
            rclpy.shutdown()

def main(args=None):
    rclpy.init(args=args)
    ackermann_publisher = AckermannPublisher()
    rclpy.spin(ackermann_publisher)
    ackermann_publisher.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()






