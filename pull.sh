#!/usr/bin/env bash
architecture=$(dpkg --print-architecture)
echo "Pulling image for ${architecture}..."
if [[ $architecture == "arm64" ]]; then
    docker build -t tccoin/docker-ros --file Dockerfile.arm64 .
elif [[ $architecture == "amd64" ]]; then
    docker pull tccoin/docker-ros:latest
fi