from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
    return LaunchDescription([
        Node(
            package='v4l2_camera',
            namespace='v4l2_camera1',
            executable='v4l2_camera_node',
            name='pi-cam'
        ),
        Node(
            package='motor_controller',
            namespace='motor_controller1',
            executable='motor_node',
            name='motor'
        ),
        Node(
            package='servo_controller',
            namespace='servo_controller1',
            executable='servo_node',
            name='servo'
        )
    ])