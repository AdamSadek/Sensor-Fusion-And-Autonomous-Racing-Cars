#!/bin/bash
# This script should be run in your off-board machine i.e laptop


# going to the root of the repo
cd ..
# creating the ros workspace dir with src. this dir will contain the ros packages
mkdir -p ros_ws/src
cd ros_ws
# using colcon to build the empty workspace. the extra flag uses symlink rather than copying.
colcon build --symlink-install


