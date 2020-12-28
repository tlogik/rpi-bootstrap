#!/bin/bash

echo "Apt update and upgrade"
sudo apt-get update -y
sudo apt-get upgrade -y

echo "Apt install git"
sudo apt install git -y
git --version

echo "Enable SSH"
sudo systemctl enable ssh
sudo systemctl start ssh


#docker
echo "Install docker"
curl -fsSL https://get.docker.org -o get-docker.sh &&
sudo sh get-docker.sh

echo "Add user pi to docker group"
sudo usermod -aG docker pi


#compose
echo "Install docker compose"
sudo apt-get install -y libffi-dev libssl-dev
sudo apt-get install -y python3-dev
#sudo apt-get remove -y python-configparser
sudo apt-get install -y python3 python3-pip
sudo pip3 install docker-compose

# RPI TIG

echo "Install RPI TIG https://github.com/tlogik/rpi-tig.git"
cd ~/
git clone https://github.com/tlogik/rpi-tig.git
cd rpi-tig/
git checkout --track origin/develop
sh start.sh

echo "Done - Now REBOOT"