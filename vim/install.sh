#!/bin/bash

. $HOME/.toolbox/vim/constants.sh

mkdir ~/.toolbox/vim/deps # cache for vim dependencies

docker build --pull -t $VIM_IMAGE_NAME \
  --build-arg USER_NAME=$VIM_USER_NAME \
  --build-arg GROUP_NAME=$VIM_GROUP_NAME \
  --build-arg USER_ID=$VIM_USER_ID \
  --build-arg USER_GROUP_ID=$VIM_GROUP_ID \
  ~/.toolbox/vim/ 
