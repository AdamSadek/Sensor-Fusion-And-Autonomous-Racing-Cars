FROM ubuntu:20.04
ENV DEBIAN_FRONTEND noninteractive

# Creating a directory for the workspace in the image
WORKDIR /docker_ros_ws

# Copy all files (for now), to the Docker image
COPY . /docker_ros_ws

# Update the package list and install necessary dependencies for ROS2
RUN apt-get update && apt-get install -y \
    curl \
    gnupg2 \
    lsb-release \
    software-properties-common \
    python3 \
    python3-pip \
    python3-numpy \
    python3-scipy \
    python3-matplotlib \
    python3-argcomplete \
    libopencv-dev \
    i2c-tools \
    libi2c-dev \
    openssh-server \
    avahi-daemon \
    net-tools

RUN add-apt-repository universe

# Adding ROS2 apt repository - from documentation
RUN apt-get update && apt-get install -y \
    curl

RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null

# After adding the repo, we can install ROS2 Foxy
RUN apt update && apt upgrade && apt install ros-foxy-desktop ros-dev-tools python3-argcomplete -y

# Cleanup the list of packages we wanted to install. Using find to avoid using * in case there's none.
RUN find /var/lib/apt/lists -mindepth 1 -delete

# Set up ROS2 environment - from documentation
RUN echo "source /opt/ros/foxy/setup.bash" >> /root/.bashrc

# Shell entrypoint
CMD ["/bin/bash"]
