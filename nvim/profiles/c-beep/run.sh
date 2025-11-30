#!/bin/bash

. $HOME/.toolbox/nvim/constants.sh

docker run --volume $(pwd):/app \
  --user $NVIM_BASE_USER_NAME \
  --volume ~/.toolbox/nvim/profiles/c-beep/home:/home/$NVIM_BASE_USER_NAME \
  -w /app \
  --rm \
  -it $NVIM_C_BEEP_IMAGE_NAME sh -uelic "nvim $@"
