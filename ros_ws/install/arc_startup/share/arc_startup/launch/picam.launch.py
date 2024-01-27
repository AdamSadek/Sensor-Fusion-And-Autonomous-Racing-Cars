from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
    return LaunchDescription([
        Node(
            package='v4l2_camera',
            namespace='v4l2_camera1',
            executable='v4l2_camera_node',
            name='pi_cam'
        ),
        
    ])