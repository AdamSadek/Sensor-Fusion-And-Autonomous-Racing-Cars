#/bin/bash

# Installing Gazebo using ROS2 

sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
wget https://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -

sudo apt-get update -y
sudo apt-get install gazebo11 -y

sudo apt-get install ros-foxy-gazebo-ros-pkgs -y

# test to see if working but executing "gazebo" in the terminal
