#!/bin/bash
. ./CommonLibrary.lib

# Installation of Docker

sudo apt-get update

sudo apt-get install -y --no-install-recommends \
		  	linux-image-extra-$(uname -r) \
			linux-image-extra-virtual

sudo apt-get install -y --no-install-recommends \
			apt-transport-https \
			ca-certificates \
			software-properties-common

curl -fsSL https://apt.dockerproject.org/gpg | sudo apt-key add -

apt-key fingerprint 58118E89F3A912897C070ADBF76221572C52609D

sudo add-apt-repository \
       "deb https://apt.dockerproject.org/repo/ \
       ubuntu-$(lsb_release -cs) \
       main"

sudo apt-get update

sudo apt-get -y install docker-engine

# Checking that Docker is installed correctly

echo \
'We are gonna run the Docker hello-world.\n \
If it runs, then docker was installed successfully'
sudo docker run hello-world

sudo groupadd docker

sudo usermod -aG docker $USER

echo 'You should now be able to run docker commands \n\
without the sudo keyword.'

echo 'Now log out and log back in, to reflect the changes in your user privileges'

