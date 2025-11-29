#!/bin/bash

. $HOME/.toolbox/nvim/constants.sh
. $HOME/.toolbox/nvim/utils.sh

copy_nvim_initial_config_to_home_cache $HOME/.toolbox/nvim/profiles/rust

docker build -t $NVIM_RUST_IMAGE_NAME \
  --build-arg USER_NAME=$NVIM_BASE_USER_NAME \
  --build-arg GROUP_NAME=$NVIM_BASE_GROUP_NAME \
  --build-arg USER_ID=$NVIM_BASE_USER_ID \
  --build-arg USER_GROUP_ID=$NVIM_BASE_GROUP_ID \
  ~/.toolbox/nvim/profiles/rust/ 
