#!/bin/bash

DOCKER_HUB_USERNAME="pmo839"
IMAGE_NAME="flask"
PASS="@jupiter123"

sudo apt-get update
sudo apt-get install -y docker.io

docker login -u "$DOCKER_HUB_USERNAME" -p "$PASS"

docker pull "$DOCKER_HUB_USERNAME/$IMAGE_NAME:latest"
if ! docker info | grep -q "Swarm: active"; then
    sudo docker swarm init
fi
docker service rm flask-service 2>/dev/null
docker service create --name flask-service -p 5000:5000 --replicas 2 "$DOCKER_HUB_USERNAME/$IMAGE_NAME:latest"
