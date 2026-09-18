#!/bin/bash

. $HOME/.toolbox/vim/constants.sh

docker run --volume $(pwd):/app \
  --user $VIM_USER_NAME \
  -w /app \
  --rm \
  -it $VIM_IMAGE_NAME sh -uelic "vim $@"
