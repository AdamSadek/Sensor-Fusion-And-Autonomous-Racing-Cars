# import rclpy
# from rclpy.node import Node
# from std_msgs.msg import Float64
# import sys
# import select
# import tty
# import termios
# from rclpy.qos import QoSProfile

# class ManualControlNode(Node):
#     def __init__(self):
#         super().__init__('manual_control_node')
#         self.get_logger().info('Manual Control Node has started.')

#         # setup the publishers with appropriate Quality of Service QoS for throttling command updates
#         qos_profile = QoSProfile(depth=10)
#         # where i'll be publish the data to
#         self.duty_cycle_pub = self.create_publisher(Float64, '/commands/motor/duty_cycle', qos_profile)
#         self.servo_position_pub = self.create_publisher(Float64, '/commands/servo/position', qos_profile)

#         # neutral (stop)
#         self.duty_cycle = 0.0
#         # centered steering
#         self.servo_position = 0.0
#         # target duty cycle for exponential smoothing (it jitters a bit and I think this helps)
#         self.target_duty_cycle = 0.0

#         # parameters for control adjustments
#         self.acceleration_rate = 0.01
#         self.steering_adjustment = 0.05
#         self.smoothing_factor = 0.1 

#     def update_duty_cycle(self):
#         # exponential smoothing towards the target duty cycle
#         self.duty_cycle += self.smoothing_factor * (self.target_duty_cycle - self.duty_cycle)
#         # make sure the cycle value is within valid range
#         self.duty_cycle = max(min(self.duty_cycle, 1.0), -1.0)
#         msg = Float64()
#         msg.data = self.duty_cycle
#         self.duty_cycle_pub.publish(msg)

#     def update_servo_position(self):
#         # make sure the cycle value is within valid range
#         self.servo_position = max(min(self.servo_position, 0.85), 0.15)
#         msg = Float64()
#         msg.data = self.servo_position
#         self.servo_position_pub.publish(msg)

#     def adjust_speed(self, direction):
#         if direction == 'forward':
#             self.target_duty_cycle += self.acceleration_rate
#         elif direction == 'backward':
#             self.target_duty_cycle -= self.acceleration_rate

#     def adjust_steering(self, direction):
#         if direction == 'left':
#             self.servo_position -= self.steering_adjustment
#         elif direction == 'right':
#             self.servo_position += self.steering_adjustment

#     def control_loop(self):
#         # configuring the terminal to capture keyboard inputs in a non-canonical mode which allows the program to read key presses immediately without waiting for a newline character
#         # basically saves the current terminal settings (before they're altered)
#         old_settings = termios.tcgetattr(sys.stdin)
#         try:
#             # this allows the script to react immediately to key presses
#             tty.setcbreak(sys.stdin.fileno())
#             while True:
#                 key = self.read_keyboard_input()
#                 if key == 'w' or key == 's':
#                     self.adjust_speed('forward' if key == 'w' else 'backward')
#                 elif key == 'a' or key == 'd':
#                     self.adjust_steering('left' if key == 'a' else 'right')
#                 elif key == '\x03' or key == 'q':
#                     break

#                 self.update_duty_cycle()
#                 self.update_servo_position()
#                 rclpy.spin_once(self, timeout_sec=0.05)  # Rate limiting
#         finally:
#             # this restores the original terminal settings when exiting the control loop
#             termios.tcsetattr(sys.stdin, termios.TCSADRAIN, old_settings)

#     def read_keyboard_input(self):
#         if sys.stdin in select.select([sys.stdin], [], [], 0)[0]:
#             return sys.stdin.read(1)
#         return None

# def main(args=None):
#     rclpy.init(args=args)
#     manual_control_node = ManualControlNode()
#     manual_control_node.get_logger().info('Control the RC car (w/s for forward/backward, a/d for left/right, q to quit).')
#     try:
#         manual_control_node.control_loop()
#     except KeyboardInterrupt:
#         pass
#     finally:
#         manual_control_node.destroy_node()
#         rclpy.shutdown()

# if __name__ == '__main__':
#     main()

# import rclpy
# from rclpy.node import Node
# from ackermann_msgs.msg import AckermannDriveStamped
# import threading
# import time

# class AccelerateCarNode(Node):
#     def __init__(self):
#         super().__init__('accelerate_car_node')
#         self.publisher_ = self.create_publisher(AckermannDriveStamped, '/ackermann_cmd', 10)
#         self.max_speed = 3.0
#         self.min_speed = 0.0 
#         self.speed_increment = 0.1 
#         self.current_speed = 0.0
#         self.target_steering_angle = 1.0 
#         self.steering_increment = 0.5 
#         self.current_steering_angle = 0.0 
#         self.update_frequency = 10  # how often to update in Hz
#         self.running = True

#     def control_loop(self):
#         rate = self.create_rate(self.update_frequency)
#         while self.running:
#             # go from low to to max speed
#             while self.current_speed < self.max_speed:
#                 self.update_speed(self.speed_increment)
#                 rate.sleep()

#             # go from max to low speed
#             while self.current_speed > self.min_speed:
#                 self.update_speed(-self.speed_increment)
#                 rate.sleep()

#             # stop after one cycle of acceleration and deceleration
#             self.running = False

#     def update_speed(self, increment):
#         self.current_speed += increment
#         if increment > 0 and self.current_speed > self.max_speed: 
#             self.current_speed = self.max_speed
#         elif increment < 0 and self.current_speed < self.min_speed:
#             self.current_speed = self.min_speed
        
#         # self.current_steering_angle = 0.80
#         # rate.sleep()
#         # self.current_steering_angle = 0.20

#         drive_msg = AckermannDriveStamped()
#         drive_msg.drive.speed = self.current_speed
#         drive_msg.drive.steering_angle = self.current_steering_angle
#         self.publisher_.publish(drive_msg)
#         self.get_logger().info(f'Publishing speed: {self.current_speed:.2f}, Steering angle: {self.current_steering_angle:.2f}')

#     def stop_control(self):
#         self.running = False

# def main(args=None):
#     rclpy.init(args=args)
#     node = AccelerateCarNode()

#     try:
#         control_thread = threading.Thread(target=node.control_loop)
#         control_thread.start()
#         rclpy.spin(node)
#     except KeyboardInterrupt:
#         node.get_logger().info('Keyboard Interrupt (SIGINT)')
#     finally:
#         node.stop_control()
#         control_thread.join()
#         node.destroy_node()
#         rclpy.shutdown()

# if __name__ == '__main__':
#     main()

import rclpy
from rclpy.node import Node
from ackermann_msgs.msg import AckermannDriveStamped

class AckermannPublisher(Node):
    def __init__(self):
        super().__init__('ackermann_publisher')
        self.publisher_ = self.create_publisher(AckermannDriveStamped, '/ackermann_cmd', 10)
        self.timer_period = 0.2  # seconds (5Hz)
        self.start_time = self.get_clock().now()
        self.timer = self.create_timer(self.timer_period, self.timer_callback)

    def timer_callback(self):
        current_time = self.get_clock().now()
        # Convert Duration to seconds by dividing nanoseconds by 1e9
        elapsed_time = (current_time - self.start_time).nanoseconds / 1e9
        if elapsed_time < 2:  # Run for 2 seconds
            msg = AckermannDriveStamped()
            msg.drive.speed = 1.0
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






