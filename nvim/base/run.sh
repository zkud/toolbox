#!/bin/bash

# Set the Docker image name
IMAGE_NAME="nvim-base"

# Build the Docker image, pulling updates if available
docker build --pull -t $IMAGE_NAME \
  --build-arg USER_ID=$(id -u) \
  --build-arg USER_GROUP_ID=$(id -g) \
  ~/.toolbox/nvim/base/ 

# Run the Docker container, mounting the current user's directory
USER=zkud
docker run --volume $(pwd):/app \
  --user $USER \
  -w /app \
  --rm \
  -it $IMAGE_NAME sh -uelic "nvim $@"
