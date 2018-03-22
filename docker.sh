#!/bin/bash

#Created by Adrian Rupala
#Simple fully automated Docker script for Ubuntu GNU/Linux

#Update OS
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo dpkg --configure -a
sudo apt-get install -f -a

#Set up repo
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

#Install Docker CE
sudo apt-get update
sudo apt-get install docker-ce -y

#Install Ubuntu GNU/Linux on Docker Containder
sudo docker pull ubuntu

#Start this containder
sudo docker run -itd ubuntu

#Get container name
docker_name="$(docker ps --format "{{.Names}}")"
sudo echo "${docker_name}"

#Rename container
sudo docker rename ${docker_name} ubuntu_apache

