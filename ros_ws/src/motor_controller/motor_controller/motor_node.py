"""
Adam Sadek

Motor node for controlling a motor's speed using PWM on a RaspberryPi. It publishes motor throttle values on the "/motor_throttle" topic.
The script utilizes RPi.GPIO for GPIO control and std_msgs/Float64 messages in ROS2.
"""

import rclpy
from std_msgs.msg import Float64
import RPi.GPIO as GPIO
import time

class MotorControlNode:

    def __init__(self):
        # Creating the ROS node
        self.node = rclpy.create_node('motor_control_node')

        # This is the ROS publisher for motor control on the '/motor_throttle' topic
        self.motor_pub = self.node.create_publisher(Float64, '/motor_throttle', 10)

        # Setting up GPIO for motor control
        GPIO.setmode(GPIO.BOARD)
        GPIO.setup(13, GPIO.OUT)
        # Creating PWM instance for GPIO pin 13 with frequency 100 Hz (not working when on 50hz - need to investigate a bit)
        self.motor = GPIO.PWM(13, 100)
        # Starting PWM with initial duty cycle '0'
        self.motor.start(0)

    # Same as my test script
    def run_motor_test(self):
        test_count = 1
        while test_count != 3:
            print("----- Test #{} -----".format(test_count))
            min_speed = 5
            max_speed = 10

            # Going from low to high speed
            print("* Low to high speed *")
            for throttle in range(min_speed, max_speed):
                self.publish_motor_throttle(throttle)
                time.sleep(1)
                print("Speed: ", throttle)

            # Going from high to low speed
            print("* High to low speed *")
            for throttle in range(max_speed, min_speed, -1):
                self.publish_motor_throttle(throttle)
                time.sleep(1)
                print("Speed: ", throttle)

            test_count += 1

    # Publishing motor throttle value to the '/motor_throttle' topic
    def publish_motor_throttle(self, throttle):
        print("Publishing motor throttle:", throttle)
        msg = Float64()
        msg.data = float(throttle)
        self.motor_pub.publish(msg)

        # Setting the PWM duty cycle to control the motor speed
        print("Changing duty cycle to:", throttle)
        self.motor.ChangeDutyCycle(throttle)

    def cleanup(self):
        # Stopping the motor and clean up GPIO
        self.motor.stop()
        GPIO.cleanup()

    def spin(self):
        # Running the motor test, cleanup, and stop the ROS 2 node
        # Extra logging - logging important information with ROS2 loggers
        self.node.get_logger().info("Motor control node is running.")
        self.run_motor_test()
        self.cleanup()
        self.node.get_logger().info("Motor control node is stopping.")
        self.node.destroy_node()

def main():
    # Initialize ROS
    rclpy.init()
    # Create and run the MotorControlNode
    motor_node = MotorControlNode()
    motor_node.spin()
    # Shutdown ROS 2
    rclpy.shutdown()

if __name__ == '__main__':
    main()
