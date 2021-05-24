#!/usr/bin/env bash

architecture=$(dpkg --print-architecture)
echo "Building image for ${architecture}..."

if [[ $architecture == "arm64" ]]; then
    docker build -t tccoin/docker-ros --file Dockerfile.arm64 .
elif [[ $architecture == "amd64" ]]; then
    docker build -t tccoin/docker-ros --file Dockerfile.amd64 .
fi

# docker build -t tccoin/docker-ros:kinect kinect
docker build -t tccoin/docker-ros:node-bridge node-bridge
docker build -t tccoin/docker-ros:manipulator manipulator