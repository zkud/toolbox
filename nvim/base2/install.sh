#!/bin/bash

. $HOME/.toolbox/nvim/constants.sh

docker build -t $NVIM_BASE2_IMAGE_NAME \
  --build-arg USER_NAME=$NVIM_BASE_USER_NAME \
  --build-arg GROUP_NAME=$NVIM_BASE_GROUP_NAME \
  --build-arg USER_ID=$NVIM_BASE_USER_ID \
  --build-arg USER_GROUP_ID=$NVIM_BASE_GROUP_ID \
  ~/.toolbox/nvim/base2/ 
