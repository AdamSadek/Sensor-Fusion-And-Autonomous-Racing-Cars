#!/bin/bash

# installing some build essentials
sudo apt update
sudo apt install python3-pip python3-dev build-essential
sudo pip3 install PyQt5
sudo pip3 install opencv-python

# for workon cv setup 
sudo apt install virtualenv virtualenvwrapper

# setting some env vars to make sure workon works
export WORKON_HOME=~/.env
VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3

# note this path below might be different for you!
source /home/adam/.local/bin/virtualenvwrapper.sh

# creating a new python virtual environment and then activing it with workon for the py development
mkvirtualenv cv
workon cv

# setting some env variables to satisfy the cv enviroment
echo "start_x=1" | sudo tee -a /boot/firmware/config.txt
echo "gpu_mem=128" | sudo tee -a /boot/firmware/config.txt

# giving my user camera permissions incase
sudo usermod -a -G video $USER



