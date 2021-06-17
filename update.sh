sudo chmod 777 ws/autoaim/.git/*
sudo chmod 777 ws/node_bridge/.git/*
sudo chmod 777 ws/gold_miner_robot/.git/*
echo "> Updating Autoaim repository..."
cd ws/autoaim
git fetch && git pull
echo "> Updating NodeBridge repository..."
cd ../node_bridge
git fetch && git pull
echo "> Updating GoldMinerRobot repository..."
cd ../gold_miner_robot
git fetch && git pull