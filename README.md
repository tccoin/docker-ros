# README

## Install ROS image

1. Install Docker
1. Install Docker Compose:
https://docs.docker.com/compose/install/
1. Setup proxy:
https://docs.docker.com/config/daemon/systemd/
1. Install ROS image (Ubuntu 18.04)
    ```
    docker pull osrf/ros:noetic-desktop-full
    ```
1. Test installation.

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

## Install shell environment
```
mkdir ~/ros-ws/
mkdir ~/ros-ws/zsh/
touch ~/ros-ws/zsh/.zsh_history
touch ~/ros-ws/zsh/.z
cd base
docker build -t docker-ros/base .
docker-compose run shell
```


## Kinect 2
```
-v /dev/cam0:/dev/cam0
--privileged=true
```