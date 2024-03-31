#!/usr/bin/env python3
import os
import yaml
import launch
from launch import LaunchDescription
from ament_index_python.packages import get_package_share_directory
from launch_ros.actions import Node
from launch.actions import SetEnvironmentVariable
from launch.substitutions import LaunchConfiguration
from launch.actions import DeclareLaunchArgument

def generate_launch_description():
    camera_params = os.path.join(get_package_share_directory('v4l2_camera'), 'config', 'v4l2_camera.yaml')
    vesc_config = os.path.join(get_package_share_directory('vesc_driver'),'params','vesc_config.yaml')

    return LaunchDescription([
        DeclareLaunchArgument(
            name="vesc_driver_config",
            default_value=vesc_config,
            description="VESC yaml configuration file.",
        ),
        Node(
            package='vesc_driver',
            executable='vesc_driver_node',
            name='vesc_driver_node',
            parameters=[LaunchConfiguration("vesc_driver_config")]
        ),
        DeclareLaunchArgument(
            name="cam_config",
            default_value=camera_params,
            description="camera YAML configuration file.",
        ),
        Node(
            package='v4l2_camera',
            executable='v4l2_camera_node',
            name='pi_cam',
            parameters=[LaunchConfiguration("cam_config")]
        )
        # Node(
        #     package='ldlidar_ros2',
        #     executable='ldlidar_ros2_node',
        #     name='ldlidar_publisher_ld19',
        #     output='screen',
        #     parameters=[
        #         {'product_name': 'LDLiDAR_LD19'},
        #         {'laser_scan_topic_name': 'scan'},
        #         {'point_cloud_2d_topic_name': 'pointcloud2d'},
        #         {'frame_id': 'base_laser'},
        #         {'port_name': '/dev/ttyUSB0'},
        #         {'serial_baudrate': 230400},
        #         {'laser_scan_dir': True},
        #         {'enable_angle_crop_func': False},
        #         {'angle_crop_min': 135.0},  # unit is degress
        #         {'angle_crop_max': 225.0},  # unit is degress
        #         {'range_min': 0.02}, # unit is meter
        #         {'range_max': 12.0}   # unit is meter
        #     ]
        # ),

        # # base_link to base_laser tf node
        # Node(
        #     package='tf2_ros',
        #     executable='static_transform_publisher',
        #     name='base_link_to_base_laser_ld19',
        #     arguments=['0','0','0.18','0','0','0','base_link','base_laser']
        # )
    ])
