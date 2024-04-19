from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
    return LaunchDescription([
        Node(
            package='arc_autonomous_ctrl',
            executable='autonomous_ctrl',
            name='autonomous_ctrl',
        ),
    ])
