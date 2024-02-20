"""
Adam Sadek

Motor node for controlling a motor's speed using PWM on a RaspberryPi. It publishes motor throttle values on the "/motor_throttle" topic.
The script utilizes RPi.GPIO for GPIO control and std_msgs/Float64 messages in ROS2.
"""

import rclpy
from rclpy.node import Node
from std_msgs.msg import Int32  # For motor speed commands
import pyvesc
import serial
import time

class VESCMotorController(Node):
    def __init__(self):
        super().__init__('vesc_motor_controller')
        self.serial_connection = self.init_vesc()

        # Publisher for motor speed command
        self.publisher = self.create_publisher(Int32, 'motor_speed_command', 10)
        
        # Subscriber to motor speed command topic
        self.subscription = self.create_subscription(
            Int32, 
            'motor_speed_command', 
            self.motor_speed_callback, 
            10)
        self.subscription  # Prevent unused variable warning

        # Schedule motor command publishing
        self.timer = self.create_timer(2, self.publish_motor_command)
        self.speed_to_publish = 3000  # Example speed in RPM

    def init_vesc(self):
        VESC_SERIAL_PORT = '/dev/ttyACM0'  # Update with your serial port
        VESC_BAUDRATE = 115200
        try:
            ser = serial.Serial(VESC_SERIAL_PORT, VESC_BAUDRATE, timeout=1)
            self.get_logger().info("VESC serial connection established.")
            return ser
        except Exception as e:
            self.get_logger().error(f"Error establishing serial connection: {e}")
            return None

    def publish_motor_command(self):
        msg = Int32()
        msg.data = self.speed_to_publish
        self.publisher.publish(msg)
        self.get_logger().info(f'Publishing motor speed command: {msg.data}')

    def motor_speed_callback(self, msg):
        self.set_motor_speed(msg.data)

    def set_motor_speed(self, speed):
        if self.serial_connection:
            try:
                message = pyvesc.SetRPM(speed)
                self.serial_connection.write(pyvesc.encode(message))
                self.get_logger().info(f"Motor speed set to: {speed} RPM")
            except Exception as e:
                self.get_logger().error(f"Error sending speed command: {e}")

def main(args=None):
    rclpy.init(args=args)
    vesc_motor_controller = VESCMotorController()
    rclpy.spin(vesc_motor_controller)
    vesc_motor_controller.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()
