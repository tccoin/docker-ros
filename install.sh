# pull images
if [[ $architecture == "arm64" ]]; then
    docker pull arm64v8/ros:noetic-perception
    docker tag arm64v8/ros:noetic-perception tccoin/docker-ros:ros
elif [[ $architecture == "amd64" ]]; then
    docker pull osrf/ros:noetic-desktop-full
    docker tag osrf/ros:noetic-desktop-full tccoin/docker-ros:ros
fi
docker pull frankjoshua/ros-webviz

# create workspace
rm -rf ws/zsh/.zsh_history > /dev/null
rm -rf ws/autoaim > /dev/null
rm -rf ws/zsh/.zsh_history > /dev/null
touch ws/zsh/.zsh_history

# clone workspace
git clone https://github.com/RoboVigor/RV-AutoAim ws/autoaim
git clone https://github.com/RoboVigor/RV-Node-Bridge.git ws/node_bridge
git clone https://github.com/RoboVigor/gold-miner-robot.git ws/gold_miner_robot