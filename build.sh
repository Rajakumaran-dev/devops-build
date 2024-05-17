#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define variables
REPO_URL="https://github.com/Rajakumaran-dev/devops-build.git"
DOCKER_IMAGE_NAME="reactapp"
DOCKERFILE_PATH="."

# Clone the repository
echo "Cloning repository from $REPO_URL"
git clone $REPO_URL

# Navigate to the repository directory
cd your-repo

# Build the Docker image for development
echo "Building Docker image $DOCKER_IMAGE_NAME:dev"
docker build -t $DOCKER_IMAGE_NAME:dev $DOCKERFILE_PATH

# Build the Docker image for production
echo "Building Docker image $DOCKER_IMAGE_NAME:prod"
docker build -t $DOCKER_IMAGE_NAME:prod $DOCKERFILE_PATH

# Print success message
echo "Docker images $DOCKER_IMAGE_NAME:dev and $DOCKER_IMAGE_NAME:prod built successfully"
