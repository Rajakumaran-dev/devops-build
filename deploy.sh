#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define variables
DOCKER_IMAGE_NAME="reactapp"
DOCKERHUB_USERNAME="prinzspace"
DOCKERHUB_PASSWORD="R@jesh1997"
COMPOSE_FILE="docker-compose.yml"

# Log in to Docker Hub
echo "Logging in to Docker Hub"
echo $DOCKERHUB_PASSWORD | docker login -u $DOCKERHUB_USERNAME --password-stdin

# Tag and push the Docker image for development
echo "Pushing Docker image $DOCKER_IMAGE_NAME:dev to Docker Hub"
docker tag $DOCKER_IMAGE_NAME:dev $DOCKERHUB_USERNAME/$DOCKER_IMAGE_NAME:dev
docker push $DOCKERHUB_USERNAME/$DOCKER_IMAGE_NAME:dev

# Tag and push the Docker image for production
echo "Pushing Docker image $DOCKER_IMAGE_NAME:prod to Docker Hub"
docker tag $DOCKER_IMAGE_NAME:prod $DOCKERHUB_USERNAME/$DOCKER_IMAGE_NAME:prod
docker push $DOCKERHUB_USERNAME/$DOCKER_IMAGE_NAME:prod
