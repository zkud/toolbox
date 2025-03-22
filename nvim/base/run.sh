#!/bin/bash

# Set the Docker image name
IMAGE_NAME="nvim-base"

# Check if the image exists
if docker images | grep -q "$IMAGE_NAME"; then
 echo "Image '$IMAGE_NAME' exists. Checking for updates..."
else
 echo "Image '$IMAGE_NAME' does not exist. Building..."
fi

# Build the Docker image, pulling updates if available
docker build --pull -t $IMAGE_NAME \
   --build-arg USER_ID=$(id -u) \
   --build-arg USER_GROUP_ID=$(id -g) \
   ~/.toolbox/nvim/base/ 

# Run the Docker container, mounting the current user's home directory
docker run -it \
   --volume $(pwd):/app \
   $IMAGE_NAME "$@"
