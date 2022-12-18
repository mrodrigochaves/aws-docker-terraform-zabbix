#!/bin/bash
# Instalação do Docker

apt install apt-transport-https ca-certificates curl software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

apt-cache policy docker-ce

apt install docker-ce

docker version

# Instalação do Docker Compose

curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose

docker-compose --version

mkdir ~/docker-compose

cd ~/docker-compose

curl https://mr-aws-zabbix.s3.amazonaws.com/docker-compose.zip -O -J -L

apt install unzip

unzip docker-compose.zip

docker-compose up -d