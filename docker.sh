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

#Start this containder with port 80 for apache server
sudo docker run -itd -p 80:80 ubuntu

#Get container name
temp_name="$(docker ps --format "{{.Names}}")"
docker_name=$(sudo echo "${temp_name}" | head -1)
sudo echo "${docker_name}"

#Rename container
sudo docker rename ${docker_name} ubuntu_apache

#Execute commands on container (install apache2)
sudo docker exec ubuntu_apache apt-get update
sudo docker exec ubuntu_apache apt-get upgrade -y
sudo docker exec ubuntu_apache apt-get install apache2 -y
sudo docker exec ubuntu_apache /etc/init.d/apache2 restart