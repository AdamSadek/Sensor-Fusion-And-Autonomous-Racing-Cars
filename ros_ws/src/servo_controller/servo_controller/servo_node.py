"""
Adam Sadek

This code tests a servo motor's steering by moving it between two angles (0 and 150 degrees) with a delay,
and it returns the servo to a neutral position when it completes the test 10 times.
"""

import rclpy
from std_msgs.msg import Float64
import RPi.GPIO as GPIO
import time

class ServoControlNode:

    def __init__(self):
        self.node = rclpy.create_node('servo_control_node')

        # setting up ROS2 publisher for servo control on the '/servo_movement' topic
        self.servo_pub = self.node.create_publisher(Float64, '/servo_movement', 10)

        # setting up GPIO for servo control
        GPIO.setmode(GPIO.BOARD)
        GPIO.setup(11, GPIO.OUT)
        self.servo = GPIO.PWM(11, 50)  # Create PWM instance for GPIO pin 11 with frequency 50 Hz
        self.servo.start(7.1)  # Start PWM with initial duty cycle for neutral position

    def update_servo_movement(self, angle):
        # Publish servo angle on the '/servo_movement' topic
        msg = Float64()
        msg.data = float(angle)
        self.servo_pub.publish(msg)

        # Calculate duty cycle based on the provided angle and move the servo
        common_scale_factor = 18.0
        min_duty_cycle = 2.5
        duty_cycle = min_duty_cycle + (angle / common_scale_factor)
        self.servo.ChangeDutyCycle(duty_cycle)
        time.sleep(0.5)

    def run_servo_test(self):
        test_count = 0
        while test_count != 10:
            # Move servo to 0 degrees
            self.update_servo_movement(0)
            time.sleep(1)

            # Move servo to 150 degrees
            self.update_servo_movement(150)
            time.sleep(1)

            test_count += 1
            print("Test #", test_count)

        # Return servo to neutral position
        self.servo.ChangeDutyCycle(7.1)
        time.sleep(1)

    def cleanup(self):
        # Stop the servo and clean up GPIO
        self.servo.stop()
        GPIO.cleanup()

    def spin(self):
        # Run the servo test, cleanup, and stop the ROS 2 node
        self.node.get_logger().info("Servo control node is running.")
        self.run_servo_test()
        self.cleanup()
        self.node.get_logger().info("Servo control node is stopping.")
        self.node.destroy_node()

def main():
    # Initialize ROS 2
    rclpy.init()

    # Create and run the ServoControlNode
    servo_node = ServoControlNode()
    servo_node.spin()

    # Shutdown ROS 2
    rclpy.shutdown()

if __name__ == '__main__':
    main()
