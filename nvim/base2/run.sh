#!/bin/bash

. $HOME/.toolbox/nvim/constants.sh

docker run --volume $(pwd):/app \
  --user $NVIM_BASE_USER_NAME \
  --volume ~/.toolbox/nvim/base2/nvim-state/.config/nvim:/home/$USER/.config/nvim \
  -w /app \
  --rm \
  -it $NVIM_BASE2_IMAGE_NAME sh -uelic "nvim $@"
