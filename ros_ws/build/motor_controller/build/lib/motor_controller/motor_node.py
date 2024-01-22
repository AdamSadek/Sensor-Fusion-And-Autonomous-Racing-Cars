# """
# Adam Sadek

# When creating these nodes, the ROS2 docs have proven to be very useful i.e 
# """

# import rclpy
# from rclpy.node import Node
# import cv2
# import RPi.GPIO as GPIO
# from std_msgs.msg import Float32


# class MotorNode(Node):

#     # creating a ROS2 node and naming it 'motor_node'
#     def __init__(self):
#         # creating the node with the name motor_node
#         Node.__init__(self, 'motor_node')

#         # create publisher to send motor signals. Here, motor_control will be the topic that will have msgs sent to it.
#         # Note that the topic will be created if it doesn't already exist.
#         subscriber_q_size = 10
#         self.motor_publisher = self.create_publisher(Float32, 'motor_control', subscriber_q_size)

#         # Create a subscriber to receive control commands
#         self.control_command_subscription = self.create_subscription(Float32, 'control_command', self.run_motor, subscriber_q_size)
#         #self.control_command_subscription  # Prevent unused variable warning


#         # here i'm setting the literal GPIO pin locations to be used
#         GPIO.setmode(GPIO.BOARD)

#         # pin number 13 is where i've connected the motor so I need to make it available for signals
#         GPIO.setup(13,GPIO.OUT)

#         # here I use Pulse Width Modulation to control the motor
#         self.motor = GPIO.PWM(13, 50)

#         # starting the car at a low speed
#         self.motor.start(0)
        

#     def run_motor(self, msg):
#         # getting the control commands. + values mean forward, - values mean reverse.
#         set_speed = msg.data

#         # Ensure the speed setpoint is within a valid range (e.g., -1.0 to 1.0)
#         # speed_setpoint = max(-1.0, min(1.0, speed_setpoint))

#         # Convert the speed setpoint to a motor control command (e.g., PWM signal)
#         speed_to_cmd = 50 * speed_setpoint  # Adjust this based on your hardware interface

#         # Publish the motor control command
#         # self.motor_publisher.publish(speed_to_cmd)
#         self.motor.ChangeDutyCycle(speed_to_cmd)

#         motor_msg = Float32()
#         motor_msg.data = motor_command
#         self.motor_publisher.publish(motor_msg)


# def main():
#     # initilizing ROS2, no arguments for now
#     rclpy.init(args=None)

#     # here we're just creating an object of the class above "MotorNode" so we can call it later.
#     motor_node = MotorNode()

#     # this will keep the node running until we stop it
#     rclpy.spin(motor_node)

#     # telling ROS to stop and clean up
#     rclpy.shutdown()
import rclpy
from std_msgs.msg import Float64
import RPi.GPIO as GPIO
import time

class MotorControlNode:

    def __init__(self):
        self.node = rclpy.create_node('motor_control_node')

        # Set up ROS 2 publisher for motor control
        self.motor_pub = self.node.create_publisher(Float64, '/motor_throttle', 10)

        # Set up GPIO
        GPIO.setmode(GPIO.BOARD)
        GPIO.setup(13, GPIO.OUT)
        self.motor = GPIO.PWM(13, 100)
        self.motor.start(0)

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

    def publish_motor_throttle(self, throttle):
        print("Publishing motor throttle:", throttle)
        msg = Float64()
        msg.data = float(throttle)
        self.motor_pub.publish(msg)
        print("Changing duty cycle to:", throttle)
        self.motor.ChangeDutyCycle(throttle)

    def cleanup(self):
        self.motor.stop()
        GPIO.cleanup()

    def spin(self):
        self.node.get_logger().info("Motor control node is running.")
        self.run_motor_test()
        self.cleanup()
        self.node.get_logger().info("Motor control node is stopping.")
        self.node.destroy_node()

def main():
    rclpy.init()
    motor_node = MotorControlNode()
    motor_node.spin()
    rclpy.shutdown()

if __name__ == '__main__':
    main()


