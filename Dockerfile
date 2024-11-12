FROM ubuntu:latest

# Update
RUN apt update && apt upgrade -y

# Install packages
RUN apt install curl git -y

# Gazybo, ROS, PX4 setup
# PX4
RUN git config --global core.compression 0 && git clone --depth 1 https://github.com/PX4/PX4-Autopilot.git --recursive && git config --global --unset core.compression

# ROS
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" >> /etc/apt/sources.list.d/ros2.list 
RUN apt update


RUN curl -sSL https://github.com/ros2/ros2/releases/download/release-jazzy-20240919/ros2-jazzy-20240919-linux-noble-amd64.tar.bz2 -o file.tar.bz2


# # Gazybo
# RUN apt install -y \
#   libbullet-dev \
#   python3-pip \
#   python3-pytest-cov \
#   ros-dev-tools
# 
# # install some pip packages needed for testing
# RUN python3 -m pip install -U \
#   argcomplete \
#   flake8-blind-except \
#   flake8-builtins \
#   flake8-class-newline \
#   flake8-comprehensions \
#   flake8-deprecated \
#   flake8-docstrings \
#   flake8-import-order \
#   flake8-quotes \
#   pytest-repeat \
#   pytest-rerunfailures \
#   pytest
# 
# # install Fast-RTPS dependencies
# RUN apt install --no-install-recommends -y \
#   libasio-dev \
#   libtinyxml2-dev
# 
# # install Cyclone DDS dependencies
# RUN apt install --no-install-recommends -y \
#   libcunit1-dev
# 
# RUN mkdir -p ~/ros2_foxy/src
# cd ~/ros2_foxy
# vcs import --input https://raw.githubusercontent.com/ros2/ros2/foxy/ros2.repos src


# Start command
ENTRYPOINT [ "bash" ]
