#!/bin/bash

. $HOME/.toolbox/nvim/constants.sh

docker run --volume $(pwd):/app \
  --user $NVIM_BASE_USER_NAME \
  --volume ~/.toolbox/nvim/lua/home:/home/$NVIM_BASE_USER_NAME \
  -w /app \
  --rm \
  -it $NVIM_LUA_IMAGE_NAME sh -uelic "nvim $@"
