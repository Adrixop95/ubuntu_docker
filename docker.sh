#!/bin/bash

#Created by Adrian Rupala
#Simple fully automated Docker script for Ubuntu GNU/Linux

#Update OS
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo dpkg --configure -a

#Add GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

#Add Docker repo to APT sources
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

#Update pkgs database
sudo apt-get update

#Installing docker pkgs
sudo apt-get install docker-ce -y

#Check docker status
sudo systemctl status docker
sleep 10

#Pull docker Ubuntu image
docker pull ubuntu
docker run ubuntu

docker ps -q | grep ""

#Rename container
docker rename my_container ubuntu_web_apache
