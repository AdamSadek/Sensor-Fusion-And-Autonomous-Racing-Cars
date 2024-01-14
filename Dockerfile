FROM ubuntu:20.04
ENV DEBIAN_FRONTEND noninteractive

# Creating a direcotyr for 
WORKDIR /docker_ros_ws

# Copy necessary files to the Docker image
COPY . /docker_ros_ws

# Update the package list and install necessary dependencies
RUN apt-get update && apt-get install -y \
    curl \
    gnupg2 \
    lsb-release \
    python3 \
    python3-pip \
    python3-numpy \
    python3-scipy \
    python3-matplotlib \
    opencv-python \
    libopencv-dev \
    python3-rpi.gpio \
    i2c-tools \
    libi2c-dev \
    libgpiod-dev \
    pigpio \
    libpigpiod-dev \
    openssh-server \
    avahi-daemon \
    net-tools

RUN rm -rf /var/lib/apt/lists/*

# Add ROS 2 apt repository
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | gpg --dearmor -o /usr/share/keyrings/ros-archive-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros2.list

# Install ROS 2 Foxy
RUN apt-get update && apt-get install -y \
    ros-foxy-desktop \
    && rm -rf /var/lib/apt/lists/*

# Set up ROS 2 environment
RUN echo "source /opt/ros/foxy/setup.bash" >> /root/.bashrc

CMD ["/bin/bash"]
