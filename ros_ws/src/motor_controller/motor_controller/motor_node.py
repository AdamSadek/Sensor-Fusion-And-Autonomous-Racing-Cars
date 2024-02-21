"""
Adam Sadek

This motor node manages the motor speed via the VESC protocol. It subscribes to the 'motor_speed_command' topic, receiving and executing speed commands, and also auto-publishes speed settings every two seconds using a timer. 
It's a compact, efficient way to keep your RC car agile and responsive.
"""

import rclpy
from rclpy.node import Node
from std_msgs.msg import Int32
import pyvesc
import serial
import time

class VESCMotorController(Node):
    def __init__(self):
        super().__init__('vesc_motor_controller')
        self.serial_connection = self.init_vesc()

        # creating publisher for motor speed command node. It will publish messages of type Int32 to the 'motor_speed_command' topic with a queue size of 10.
        self.publisher = self.create_publisher(Int32, 'motor_speed_command', 10)
        
        # creating subscriber to motor speed command topi so it listens to the 'motor_speed_command' topic.
        # tt receives Int32 messages and calls the motor_speed_callback method below to handle them
        self.subscription = self.create_subscription(Int32, 'motor_speed_command', self.motor_speed_callback, 10)

        # scheduling the motor command publishing. Essentially it's a timer that triggers every 2 seconds,
        # calling the publish_motor_command method. This is where the periodic automated publishing of speed commands takes place\
        self.timer = self.create_timer(2, self.publish_motor_command)
        # RPM
        self.speed_to_publish = 5000

    # function to establish connection to vesc
    def init_vesc(self):
        # Note: your serial port might be different 
        VESC_SERIAL_PORT = '/dev/ttyACM0'
        VESC_BAUDRATE = 115200
        # Error handling if connection was not established to vesc
        try:
            _serial = serial.Serial(VESC_SERIAL_PORT, VESC_BAUDRATE, timeout=1)
            self.get_logger().info("VESC serial connection established.")
            return _serial
        except Exception as e:
            self.get_logger().error(f"Error establishing serial connection: {e}")
            return None

    # function to publish motor motor commands
    def publish_motor_command(self):
        # msg will be of type int32 (standard message type in ROS2)
        msg = Int32()
        msg.data = self.speed_to_publish
        self.publisher.publish(msg)
        # some logging for visualizing in cli
        self.get_logger().info(f'Publishing motor speed command: {msg.data}')

    # this funciton will get called when a new message is received on the motor_speed_command topic. it will set the motor speed.
    def motor_speed_callback(self, msg):
        self.set_motor_speed(msg.data)

    # function to set motor motor commands
    def set_motor_speed(self, speed):
        # first check if there is connection to vesc
        if self.serial_connection:
            try:
                message = pyvesc.SetRPM(speed)
                self.serial_connection.write(pyvesc.encode(message))
                self.get_logger().info(f"Motor speed set to: {speed} RPM")
            except Exception as e:
                self.get_logger().error(f"Error sending speed command: {e}")

def main(args=None):
    # initializing the ROS2 client
    rclpy.init(args=args)
    # creating an instance of the VESCMotorController node
    vesc_motor_controller = VESCMotorController()
    # keep the node running, listening for events like incoming messages, timer events
    rclpy.spin(vesc_motor_controller)
    # clean up the node by destroying it
    vesc_motor_controller.destroy_node()
    # shutting down the ROS2 client
    rclpy.shutdown()

if __name__ == '__main__':
    main()
