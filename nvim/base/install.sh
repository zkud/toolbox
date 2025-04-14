#!/bin/bash

docker build --pull -t nvim-base \
  --build-arg USER_ID=$(id -u) \
  --build-arg USER_GROUP_ID=$(id -g) \
  ~/.toolbox/nvim/base/ 
