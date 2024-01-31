#!/bin/bash

# These packages are needed for running the Pi-Camera and LiDAR
git clone https://github.com/AdamSadek/ldlidar_ros2
git clone --branch foxy https://gitlab.com/boldhearts/ros2_v4l2_camera.git
git clone --branch foxy https://github.com/AdamSadek/vision_opencv/tree/foxy
git clone --branch foxy https://github.com/AdamSadek/image_common
git clone --branch foxy-devel https://github.com/AdamSadek/image_transport_plugins