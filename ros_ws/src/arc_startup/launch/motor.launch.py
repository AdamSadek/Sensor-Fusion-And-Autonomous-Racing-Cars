from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
    return LaunchDescription([
        Node(
            package='motor_controller',
            namespace='motor_controller1',
            executable='motor_node',
            name='motor'
        )
    ])