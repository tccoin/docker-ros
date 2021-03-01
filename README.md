# DOCKER-ROS

[![build status](https://img.shields.io/docker/cloud/build/tccoin/docker-ros)](https://hub.docker.com/repository/docker/tccoin/docker-ros/)

## Installation

1. Install Docker
1. Install Docker Compose:
https://docs.docker.com/compose/install/
1. Setup proxy:
https://docs.docker.com/config/daemon/systemd/
1. Setup workspace:
    ```
    bash install.sh
    ```
1. Build images:
    ```
    bash build.sh
    ```
    Or, you can also pull images from Docker Hub instead of building them:
    ```
    bash pull.sh
    ```

## Test & Usage
1. **Test ROS container**:

    ```
    cd chatter
    docker-compose up
    ```

    You should see:

    ```
    listener_1    | data: "hello"
    listener_1    | ---
    listener_1    | data: "hello"
    listener_1    | ---
    ...
    ```
1. **Development environment**:
    including VNC, novnc (a web-based VNC client), zsh, tilix, conda

    ```
    docker-compose run --service-ports vnc
    ```

    Then you should be able to visit the desktop at `http://localhost:6901/vnc.html?password=rv666`.
1. **Galaxy camera**:
    To launch Galaxy camera in ROS, run:
    ```
    docker-compose run --service-ports camera
    ```

    Images will be published at topic `/galaxy_camera/image_color`.
1. **Webviz**:
    Webviz is a web-based application for playback and visualization of ROS bag files.

    ```
    cd webviz
    docker-compose up
    ```

    Then you should be able to visit the desktop at `http://localhost:7901/?rosbridge-websocket-url=ws://localhost:9090`.
1. **Microsoft Kinect**:
    This image is not built by default. To build it, run:
    ```
    docker build -t tccoin/docker-ros:kinect kinect
    ```
    Detailed usage can be found in [code-iai/iai_kinect2](https://github.com/code-iai/iai_kinect2).

## Acknowledgement


Hugh thanks to the following repositories / projects:

- [ConSol/docker-headless-vnc-container](https://github.com/ConSol/docker-headless-vnc-container)
- [QiayuanLiao/galaxy_camera](https://github.com/QiayuanLiao/galaxy_camera)
- [cruise-automation/webviz](https://github.com/cruise-automation/webviz)
- [code-iai/iai_kinect2](https://github.com/code-iai/iai_kinect2)