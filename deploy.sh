#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define variables
DOCKER_IMAGE_DEV="reactapp-dev"
DOCKER_IMAGE_PROD="reactapp-prod"
DOCKERHUB_USERNAME="prinzspace"
DOCKERHUB_PASSWORD="R@jesh1997"
COMPOSE_FILE="docker-compose.yml"

# Log in to Docker Hub
echo "Logging in to Docker Hub"
echo $DOCKERHUB_PASSWORD | docker login -u $DOCKERHUB_USERNAME --password-stdin

# Tag and push the Docker image for development
echo "Pushing Docker image $DOCKER_IMAGE_DEV:latest to Docker Hub"
docker tag $DOCKER_IMAGE_DEV:latest $DOCKERHUB_USERNAME/$DOCKER_IMAGE_DEV:latest
docker push $DOCKERHUB_USERNAME/$DOCKER_IMAGE_DEV:latest

# Tag and push the Docker image for production
echo "Pushing Docker image $DOCKER_IMAGE_PROD:latest to Docker Hub"
docker tag $DOCKER_IMAGE_PROD:latest $DOCKERHUB_USERNAME/$DOCKER_IMAGE_PROD:latest
docker push $DOCKERHUB_USERNAME/$DOCKER_IMAGE_PROD:latest
