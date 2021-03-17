FROM tccoin/docker-ros

ENV ROS_DISTRO noetic

WORKDIR /root/build

RUN apt-get install --no-install-recommends -y libusb-dev \
    && git clone https://github.com/slightech/MYNT-EYE-D-SDK.git mynt-eye-d-sdk

RUN cd mynt-eye-d-sdk \
    && make init \
    && source /opt/ros/noetic/setup.bash \
    && make ros \
    && make samples

# RUN rosdep update \ 
#     && rosdep install -y \
#     --from-paths /root/catkin_ws/src/ \
#     --ignore-src \
#     --as-root=apt:false

# RUN cp /root/build/mynt-eye-d-sdk/wrappers/ros/src/mynteye_wrapper_d /root/catkin_ws/src/ \
#     && cd /root/catkin_ws/ \
#     && source /opt/ros/noetic/setup.bash \
#     && catkin_make