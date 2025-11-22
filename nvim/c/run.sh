#!/bin/bash

. $HOME/.toolbox/nvim/constants.sh

docker run --volume $(pwd):/app \
  --user $NVIM_BASE_USER_NAME \
  --volume ~/.toolbox/nvim/c/nvim-state/.config/nvim:/home/$NVIM_BASE_USER_NAME/.config/nvim \
  -w /app \
  --rm \
  -it $NVIM_C_IMAGE_NAME sh -uelic "nvim $@"
