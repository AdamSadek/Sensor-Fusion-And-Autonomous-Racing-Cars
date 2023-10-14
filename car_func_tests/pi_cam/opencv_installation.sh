#!/bin/bash

# IMPORTANT: make sure you dont have opencv-python-headless installed as it will affect setting up opencv
sudo pip3 uninstall -y opencv-python-headless

# making sure packages are up to date
sudo apt update
sudo apt upgrade

# installing some essential dependencies
sudo apt install -y build-essential cmake git pkg-config libgtk-3-dev libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libxvidcore-dev libx264-dev libjpeg-dev libpng-dev libtiff-dev gfortran libatlas-base-dev python3-dev python3-numpy

# installing additional libs
sudo apt install -y libtbb2 libtbb-dev libdc1394-22-dev libopenexr-dev libgstreamer-plugins-base1.0-dev libgstreamer1.0-dev

# opencv build
git clone https://github.com/opencv/opencv.git
cd opencv
git checkout 4.x
cd ../opencv
mkdir build
cd build

# running cmake to configure build
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local ..

# building opencv. you can set the amt of cores to your liking. My pi has 4 cores so I wil use 3.
# do not use all your cores as it might crash your system.
make -j3

# installing opencv and updating lib cache
sudo make install
sudo ldconfig

# making sure opencv is installed
python3 -c "import cv2; print(cv2.__version__)"
