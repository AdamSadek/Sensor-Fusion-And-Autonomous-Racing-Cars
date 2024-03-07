"""
Adam Sadek

Servo node for controlling a servo motor's movement. It publishes servo angles on '/servo_movement' topic and Includes functions for servo updates, neutral position, 
and a test moving between 0 and 150 degrees. 
"""

import rclpy
from rclpy.node import Node
from std_msgs.msg import Float64  # Assuming servo positions are published as Float64
from pyvesc import VESC, SetCurrent

class ServoControlNode(Node):
    def __init__(self):
        super().__init__('servo_control_node')
        self.subscription = self.create_subscription(Float64, 'servo_position', self.servo_position_callback, 10)
        self.vesc = VESC(serial_port='/dev/ttyACM0', baudrate=115200)  # Update with your VESC serial port

    def servo_position_callback(self, msg):
        position = msg.data  # Assuming this is the desired servo position
        # Convert position to PPM signal (adjust the conversion based on your servo's range and requirements)
        ppm_value = self.position_to_ppm(position)
        self.vesc.send(SetCurrent(current=ppm_value))  # Using SetCurrent for demonstration; replace with appropriate PPM command

    def position_to_ppm(self, position):
        # Example conversion function; you'll need to adapt this based on your servo's specifications
        return position * 1000  # Placeholder conversion

def main(args=None):
    rclpy.init(args=args)
    servo_control_node = ServoControlNode()
    rclpy.spin(servo_control_node)
    servo_control_node.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()


