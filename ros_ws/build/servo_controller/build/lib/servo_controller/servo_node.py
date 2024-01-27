"""
Adam Sadek

Servo node for controlling a servo motor's movement. It publishes servo angles on '/servo_movement' topic and Includes functions for servo updates, neutral position, 
and a test moving between 0 and 150 degrees. 
"""

import rclpy
from rclpy.node import Node
from std_msgs.msg import Float64
import RPi.GPIO as GPIO
import time

class ServoControlNode(Node):

    def __init__(self):
        # creating the node with the name servo_control_node
        super().__init__('servo_control_node')
        # setting up ROS2 publisher for servo control on the '/servo_movement' topic
        self.servo_publisher = self.create_publisher(Float64, '/servo_movement', 10)

        # setting up GPIO for servo control
        GPIO.setmode(GPIO.BOARD)
        GPIO.setup(11, GPIO.OUT)
        # creating PWM instance for GPIO pin 11 with frequency of 50 Hz
        self.servo = GPIO.PWM(11, 50)
        self.servo.start(0)

    # publishing servo angle on the '/servo_movement' topic
    def update_servo_movement(self, angle):
        msg = Float64()
        msg.data = float(angle)
        self.servo_publisher.publish(msg)

        # calculating duty cycle on the provided angle and move the servo
        common_scale_factor = 18.0
        min_duty_cycle = 2.5
        duty_cycle = min_duty_cycle + (angle / common_scale_factor)
        self.servo.ChangeDutyCycle(duty_cycle)
        time.sleep(0.5)

    def servo_to_neutral(self):
        # return servo to neutral position
        self.servo.ChangeDutyCycle(0)
        time.sleep(1)

    def run_servo_test(self):
        test_count = 0
        while test_count != 10:
            # moving servo to 0 degrees
            self.update_servo_movement(0)
            time.sleep(1)

            # moving servo to 150 degrees
            self.update_servo_movement(100)
            time.sleep(1)

            test_count += 1
            print("Test #", test_count)

    def cleanup(self):
        self.servo.stop()
        GPIO.cleanup()

    def spin(self):
        # run the servo test, cleanup, and stop the ROS2 node with some nice debugging
        self.get_logger().info("Servo control node is running.")
        self.run_servo_test()
        self.cleanup()
        self.get_logger().info("Servo control node is stopping.")
        self.destroy_node()

def main():
    # starting ROS2
    rclpy.init()
    # creating and running the ServoControlNode
    servo_node = ServoControlNode()
    servo_node.spin()
    # stopping ROS2
    rclpy.shutdown()

if __name__ == '__main__':
    main()
