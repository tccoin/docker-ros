# pull images
docker pull cruise/webviz
if [[ $architecture == "arm64" ]]; then
    docker pull arm64v8/ros:noetic-perception
    docker tag arm64v8/ros:noetic-perception tccoin/docker-ros:ros
elif [[ $architecture == "amd64" ]]; then
    docker pull osrf/ros:noetic-desktop-full
    docker tag osrf/ros:noetic-desktop-full tccoin/docker-ros:ros
fi

# create workspace
touch ws/zsh/.zsh_history
git clone https://github.com/RoboVigor/RV-AutoAim ws/autoaim