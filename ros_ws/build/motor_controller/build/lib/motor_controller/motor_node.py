"""
Adam Sadek

This motor node manages the motor speed via the VESC protocol. It subscribes to the 'motor_speed_command' topic, receiving and executing speed commands, and also auto-publishes speed settings every two seconds using a timer. 
It's a compact, efficient way to keep your RC car agile and responsive.
"""

import rclpy
from rclpy.node import Node
from rclpy.timer import Timer
from std_msgs.msg import Int32
import pyvesc
import serial

class VESCMotorController(Node):
    def __init__(self):
        super().__init__('vesc_motor_controller')
        self.serial_connection = self.init_vesc()

        # Publisher for motor speed command node. It will publish messages of type Int32 to the 'motor_speed_command' topic with a queue size of 10.
        self.publisher = self.create_publisher(Int32, 'motor_speed_command', 10)
        
        # Subscriber to motor speed command topic. It listens to the 'motor_speed_command' topic and receives Int32 messages.
        # Calls the motor_speed_callback method to handle them.
        self.subscription = self.create_subscription(Int32, 'motor_speed_command', self.motor_speed_callback, 10)

        # Variable to hold the current speed command.
        self.current_speed_command = 50000
        self.set_motor_speed(self.current_speed_command)

        # Initialize a timer to continuously update the motor speed
        self.timer = self.create_timer(1.0, self.timer_callback)

    # Function to establish connection to VESC.
    def init_vesc(self):
        # Your serial port might be different.
        VESC_SERIAL_PORT = '/dev/ttyACM0'
        VESC_BAUDRATE = 115200
        # Error handling if connection was not established to VESC.
        try:
            _serial = serial.Serial(VESC_SERIAL_PORT, VESC_BAUDRATE, timeout=1)
            self.get_logger().info("VESC serial connection established.")
            return _serial
        except Exception as e:
            self.get_logger().error(f"Error establishing serial connection: {e}")
            return None

    # Callback function that is called when a new message is received on the motor_speed_command topic.
    def motor_speed_callback(self, msg):
        # Update the current speed command and execute it.
        self.current_speed_command = msg.data
        self.set_motor_speed(self.current_speed_command)
    
    # Timer callback to maintain or update the motor speed
    def timer_callback(self):
        self.set_motor_speed(self.current_speed_command)
        self.get_logger().info("Timer callback: Motor speed maintained.")

    # Function to send motor commands to VESC.
    def set_motor_speed(self, speed):
        # Check if there is a connection to VESC.
        if self.serial_connection:
            try:
                # Encode and send the RPM command to the VESC.
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
    # keep the node running, listening for events like incoming messages
    rclpy.spin(vesc_motor_controller)
    # clean up the node by destroying it
    vesc_motor_controller.destroy_node()
    # shutting down the ROS2 client
    rclpy.shutdown()

if __name__ == '__main__':
    main()
