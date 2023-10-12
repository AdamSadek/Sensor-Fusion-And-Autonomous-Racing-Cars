#!/bin/bash

# some env setups that might be needed
sudo apt update
sudo apt install python3-pip python3-dev build-essential

# for workon cv setup 
sudo apt install virtualenv virtualenvwrapper
mkvirtualenv cv
# export WORKON_HOME=$HOME/.virtualenvs
# VIRTUALENVWRAPPER_PYTHON='/usr/bin/python3'
# # note this path below might be different for you!
# source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
workon cv

pip3 install "picamera[array]"

