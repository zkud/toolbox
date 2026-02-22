#!/bin/bash

. $HOME/.toolbox/opencode/constants.sh

docker build -t $OPENCODE_IMAGE_NAME ~/.toolbox/opencode/

