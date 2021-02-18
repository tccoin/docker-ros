FROM osrf/ros:noetic-desktop-full

ENV ROS_DISTRO noetic
ENV HTTP_PROXY="http://172.17.0.1:10809"
ENV HTTPS_PROXY="http://172.17.0.1:10809"
ENV http_proxy="http://172.17.0.1:10809"
ENV https_proxy="http://172.17.0.1:10809"

RUN sudo touch /etc/apt/apt.conf.d/proxy.conf \ 
    && sudo echo "Acquire::http::Proxy \"http://172.17.0.1:10809\";" > /etc/apt/apt.conf.d/proxy.conf \ 
    && sudo echo "Acquire::http::Proxy \"http://172.17.0.1:10809\";" >> /etc/apt/apt.conf.d/proxy.conf \ 
    && sudo cat /etc/apt/apt.conf.d/proxy.conf

RUN echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list
RUN apt-key adv --keyserver "hkp://ha.pool.sks-keyservers.net" --recv-key "0xB01FA116" \
    || { wget "https://raw.githubusercontent.com/ros/rosdistro/master/ros.key" -O - | sudo apt-key add -; }
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros-latest.list' \ 
    && apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

RUN sed -i "/^# deb.*multiverse/ s/^# //" /etc/apt/sources.list \ 
    && apt-get update \ 
    && apt-get install --no-install-recommends -y \
    apt-utils \
    wget \
    ca-certificates \
    git \
    sudo \
    ros-${ROS_DISTRO}-ros-base \
    ros-${ROS_DISTRO}-catkin \
    build-essential \
    python3-colcon-common-extensions \
    python3-catkin-tools \
    python3-osrf-pycommon \
    python3-rosdep \
    python3-wstool \
    ros-${ROS_DISTRO}-catkin

WORKDIR /root/build

RUN git clone https://github.com/tccoin/easy-linux.git \
    && cd easy-linux \
    && ./zsh.sh 

RUN sudo apt-get update && sudo apt-get install libqtgui4 -y


WORKDIR /root/ws