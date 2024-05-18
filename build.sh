#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define variables
REPO_URL="https://github.com/Rajakumaran-dev/devops-build.git"
DOCKER_IMAGE_DEV="reactapp-dev"
DOCKER_IMAGE_PROD="reactapp-prod"
DOCKERFILE_PATH="."


# Build the Docker image for development
echo "Building Docker image $DOCKER_IMAGE_DEV:latest"
docker build -t reactapp-dev:latest $DOCKERFILE_PATH

# Build the Docker image for production
echo "Building Docker image $DOCKER_IMAGE_PROD:latest"
docker build -t reactapp-prod:latest $DOCKERFILE_PATH

# Print success message
echo "Docker images $DOCKER_IMAGE_NAME:latest and $DOCKER_IMAGE_NAME:latest built successfully"
