"""
Adam Sadek

Motor node for controlling a motor's speed using PWM on a RaspberryPi. It publishes motor throttle values on the "/motor_throttle" topic.
The script utilizes RPi.GPIO for GPIO control and std_msgs/Float64 messages in ROS2.
"""

import rclpy
from std_msgs.msg import Float64
from rclpy.node import Node
import RPi.GPIO as GPIO
import time

class MotorControlNode(Node):

    def __init__(self):
        # creating the ROS node
        super().__init__('motor_control_node')
        # this is the ROS publisher for motor control on the '/motor_throttle' topic
        self.motor_publisher = self.create_publisher(Float64, '/motor_throttle', 10)

        # setting up GPIO for motor control
        GPIO.setmode(GPIO.BOARD)
        GPIO.setup(13, GPIO.OUT)
        # creating PWM instance for GPIO pin 13 with frequency 100 Hz (not working when on 50hz - need to investigate a bit)
        self.motor = GPIO.PWM(13, 100)
        # starting PWM with initial duty cycle '0'
        self.motor.start(0)

    # same as my test script
    def run_motor_test(self):
        test_count = 1
        while test_count != 3:
            print("----- Test #{} -----".format(test_count))
            min_speed = 0
            max_speed = 10

            # going from low to high speed
            print("* Low to high speed *")
            for throttle in range(min_speed, max_speed):
                self.publish_motor_throttle(throttle)
                time.sleep(1)
                print("Speed: ", throttle)

            # going from high to low speed
            print("* High to low speed *")
            for throttle in range(max_speed, min_speed, -1):
                self.publish_motor_throttle(throttle)
                time.sleep(1)
                print("Speed: ", throttle)

            test_count += 1

    # publishing motor throttle value to the '/motor_throttle' topic
    def publish_motor_throttle(self, throttle):
        print("Publishing motor throttle:", throttle)
        msg = Float64()
        msg.data = float(throttle)
        self.motor_publisher.publish(msg)

        # setting the PWM duty cycle to control the motor speed
        print("Changing duty cycle to:", throttle)
        self.motor.ChangeDutyCycle(throttle)

    def cleanup(self):
        # stopping the motor and clean up GPIO
        self.motor.stop()
        GPIO.cleanup()

    def spin(self):
        # running the motor test, cleanup, and stop the ROS 2 node
        # extra logging - logging important information with ROS2 loggers
        self.get_logger().info("Motor control node is running.")
        self.run_motor_test()
        self.cleanup()
        self.get_logger().info("Motor control node is stopping.")
        self.destroy_node()

def main():
    # starting ROS
    rclpy.init()
    # creating and running the MotorControlNode
    motor_node = MotorControlNode()
    motor_node.spin()
    # stoppping ROS 2
    rclpy.shutdown()

if __name__ == '__main__':
    main()
