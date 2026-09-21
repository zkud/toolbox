#!/bin/bash

. $HOME/.toolbox/vim/constants.sh

docker run --volume $(pwd):/app \
  --user $VIM_USER_NAME \
  --volume ~/.toolbox/vim/deps:/home/$VIM_USER_NAME/.vim/deps \
  -w /app \
  --rm \
  -it $VIM_IMAGE_NAME sh -uelic "vim $@"

clear # to clear the mess after vim
