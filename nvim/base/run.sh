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

# Run the Docker container, mounting the current user's directory
USER=zkud
docker run --volume $(pwd):/app \
  --volume ~/.toolbox/nvim/base/config:/home/$USER/.config/nvim \
  --user $USER \
  -w /app \
  --rm \
  -it $IMAGE_NAME sh -uelic "nvim $@"
