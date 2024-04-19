#/bin/bash

"""
!!Please run this script from the root directory!!

This script will install 
- ROS2 Foxy on your machine (i.e RPi)
- OpenCV
- NumPy
- cv_bridge

It will also clone all the necessary repos
"""

# From the ROS2 foxy documentation, and some tweaks of my own.
# https://docs.ros.org/en/foxy/Installation/Ubuntu-Install-Debians.html

echo "Installing ROS2 Foxy..."
locale  # check for UTF-8

sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

locale  # verify settings

sudo apt install software-properties-common -y
sudo add-apt-repository universe -y 

sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

sudo apt update -y
sudo apt upgrade -y

sudo apt install ros-foxy-ros-base python3-argcomplete -y
sudo apt install ros-dev-tools -y

# Replace ".bash" with your shell if you're not using bash
# Possible values are: setup.bash, setup.sh, setup.zsh
source /opt/ros/foxy/setup.bash
echo "ROS2 Installation complete!"

echo "Installing dependencies..."
# install pip if not installed
echo "Installing pip if it's not already installed..."
sudo apt-get install python3-pip -y

# install the required Python packages with specified versions
echo "Installing specific versions of OpenCV and NumPy..."
pip3 install numpy==1.24.4
pip3 install opencv-python==4.8.1

# Install a specific version of cv_bridge for ROS Foxy
# you might not be able to choose a specific version if it is not in the apt repository
# the following command installs the latest available version
echo "Installing cv_bridge for ROS2 Foxy..."
sudo apt-get install ros-foxy-cv-bridge -y

echo "Dependencies Installation complete!"

echo "Cloning important repos..."
cd ros_ws/src
git clone https://github.com/AdamSadek/ldlidar_ros2 lidar_controller
git clone --branch foxy https://gitlab.com/boldhearts/ros2_v4l2_camera.git v4l2_camera
git clone --branch foxy https://github.com/AdamSadek/vision_opencv
git clone --branch foxy https://github.com/AdamSadek/image_common
git clone --branch foxy-devel https://github.com/AdamSadek/image_transport_plugins
git clone -b foxy --recursive https://github.com/AdamSadek/transport_drivers.git
git clone -b foxy --recursive https://github.com/AdamSadek/vesc.git

cd ..
colcon build
source install/setup.sh

echo "Cloning done!"
