FROM osrf/ros:noetic-desktop-full

ENV ROS_DISTRO noetic
ENV HTTP_PROXY="http://172.17.0.1:10809"
ENV HTTPS_PROXY="http://172.17.0.1:10809"

RUN sudo touch /etc/apt/apt.conf.d/proxy.conf && \
    sudo echo "Acquire::http::Proxy \"http://172.17.0.1:10809\";" > /etc/apt/apt.conf.d/proxy.conf && \
    sudo echo "Acquire::http::Proxy \"http://172.17.0.1:10809\";" >> /etc/apt/apt.conf.d/proxy.conf && \
    sudo cat /etc/apt/apt.conf.d/proxy.conf

WORKDIR /root/ws

RUN echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list
RUN apt-key adv --keyserver "hkp://ha.pool.sks-keyservers.net" --recv-key "0xB01FA116" \
    || { wget "https://raw.githubusercontent.com/ros/rosdistro/master/ros.key" -O - | sudo apt-key add -; }
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros-latest.list' && \
    apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

RUN sed -i "/^# deb.*multiverse/ s/^# //" /etc/apt/sources.list && \
    apt-get update && \
    apt-get install --no-install-recommends -y \
        apt-utils \
        wget \
        ca-certificates \
        git \
        sudo \
        ros-${ROS_DISTRO}-ros-base \
        ros-${ROS_DISTRO}-catkin \
        build-essential \
        python3-catkin-tools \
        python3-osrf-pycommon \
        python3-rosdep \
        python3-wstool \
        ros-${ROS_DISTRO}-catkin \
        beignet-dev \
        libusb-1.0.0-dev \
        libturbojpeg \
        libturbojpeg0-dev \
        libjpeg-turbo8-dev \
        libglfw3-dev \
        libopenni2-dev \
        opencl-headers \
        openni2-utils \
        pkg-config \
        udev \
        python3-colcon-common-extensions \
        && rm -rf /var/lib/apt/lists/*

RUN mkdir src && \
  cd src && \
  git clone https://github.com/TheEngineRoom-UniGe/iai_kinect2.git

RUN rosdep update && \
    rosdep install -y \
      --from-paths src \
      --ignore-src \
      --as-root=apt:false

RUN git clone https://github.com/OpenKinect/libfreenect2.git \
    && cd libfreenect2 \
    && mkdir build && cd build \
    && cmake .. -DBUILD_OPENNI2_DRIVER=ON -DCMAKE_INSTALL_PREFIX=/root/freenect2 \
    && make \
    && make install \
    && cp libfreenect2/platform/linux/udev/90-kinect2.rules /etc/udev/rules.d/ \
    && ldconfig /root/freenect2 \
    && ln -s /libfreenect2/build/bin/Protonect /usr/local/bin/kinect_test \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
  
RUN . /opt/ros/$ROS_DISTRO/setup.sh && \
    colcon build