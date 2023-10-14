#!/bin/bash

# This script should be run in your off-board machine i.e laptop

cd ..
mkdir -p ros_ws/src
cd ros_ws
colcon build --symlink-install
cd src


