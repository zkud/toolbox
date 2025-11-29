#!/bin/bash

. $HOME/.toolbox/nvim/constants.sh

docker run --volume $(pwd):/app \
  --user $NVIM_BASE_USER_NAME \
  --volume ~/.toolbox/nvim/python/home:/home/$NVIM_BASE_USER_NAME \
  -w /app \
  --rm \
  -it $NVIM_PYTHON_IMAGE_NAME sh -uelic "nvim $@"
