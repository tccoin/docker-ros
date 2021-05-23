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

# RUN git clone https://github.com/tccoin/MYNT-EYE-ORB-SLAM2-Sample.git ORB_SLAM2 \
#     && cd ORB_SLAM2 \
#     && bash build.sh \
#     && source /opt/ros/noetic/setup.bash \
#     && export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:/root/build/ORB_SLAM2/Examples/ROS/ORB_SLAM2 \
#     && bash build_ros.sh

# RUN git clone https://github.com/gaoxiang12/ORBSLAM2_with_pointcloud_map.git ORBSLAM2_with_pointcloud_map \
#     && mv ORBSLAM2_with_pointcloud_map/ORB_SLAM2_modified ORB_SLAM2 \
#     && rm -rf ORBSLAM2_with_pointcloud_map\
#     && cd ORB_SLAM2 \
#     && bash build.sh \
#     && source /opt/ros/noetic/setup.bash \
#     && export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:/root/build/ORB_SLAM2/Examples/ROS/ORB_SLAM2 \
#     && bash build_ros.sh


RUN git clone https://github.com/shanpenghui/ORB_SLAM3_Fixed.git ORB_SLAM3
RUN cd ORB_SLAM3/Vocabulary \
    && tar -xf ORBvoc.txt.tar.gz \
    && rm ORBvoc.txt.tar.gz

RUN git clone https://github.com/google/glog \
    && cd glog \
    && cmake -H. -Bbuild -G "Unix Makefiles" \
    && cmake --build build \
    && cmake --build build --target test \
    && cd build \
    && sudo make install

RUN cd ORB_SLAM3/shells \
    && bash build.sh \
    && source /opt/ros/noetic/setup.bash \
    && export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:/root/build/ORB_SLAM3/Examples/ROS \
    && bash build_ros.sh
