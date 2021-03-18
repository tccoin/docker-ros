FROM tccoin/docker-ros

WORKDIR /root/build

RUN sudo apt-get -y install libglew-dev cmake libgoogle-glog-dev \
    && cd ~ \
    && git clone https://github.com/stevenlovegrove/Pangolin.git \
    && cd Pangolin \
    && mkdir build \
    && cd build \
    && cmake .. \
    && cmake --build . \
    && sudo make install

RUN git clone https://github.com/tccoin/ORB_SLAM2.git \
    && cd ORB_SLAM2 \
    && bash build.sh \
    && source /opt/ros/noetic/setup.bash \
    && export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:/root/build/ORB_SLAM2/Examples/ROS/ORB_SLAM2 \
    && bash build_ros.sh