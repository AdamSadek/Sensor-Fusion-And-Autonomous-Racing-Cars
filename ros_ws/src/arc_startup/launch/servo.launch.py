from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
    return LaunchDescription([
        Node(
            package='servo_controller',
            namespace='servo_controller1',
            executable='servo_node',
            name='servo'
        )
    ])