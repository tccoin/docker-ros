#!/usr/bin/env bash
architecture=$(dpkg --print-architecture)
echo "Pulling image for ${architecture}..."
if [[ $architecture == "arm64" ]]; then
    docker pull arm64v8/ros:noetic-perception
    docker tag arm64v8/ros:noetic-perception tccoin/docker-ros:ros
    docker build -t tccoin/docker-ros --file Dockerfile.arm64 .
    docker build -t tccoin/docker-ros:rosbridge webviz
elif [[ $architecture == "amd64" ]]; then
    docker pull osrf/ros:noetic-desktop-full
    docker tag osrf/ros:noetic-desktop-full tccoin/docker-ros:ros
    docker pull tccoin/docker-ros:latest
    docker pull tccoin/docker-ros:rosbridge
fi