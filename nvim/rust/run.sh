#!/bin/bash

# Set the Docker image name
IMAGE_NAME="nvim-rust"

# Build the Docker image (if it doesn't exist)
docker build -t $IMAGE_NAME .

# Get the current user's ID
USER_ID=$(id -u)

# Get the current group's ID
GROUP_ID=$(id -g)

# Run the Docker container, mounting the current user's home directory
docker run -it \
  --rm \
  -v "$HOME:/home/$USER" \
  -e USER_ID=$USER_ID \
  -e GROUP_ID=$GROUP_ID \
  $IMAGE_NAME
