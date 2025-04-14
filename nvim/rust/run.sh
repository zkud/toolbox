#!/bin/bash

. $HOME/.toolbox/nvim/constants.sh

docker run --volume $(pwd):/app \
  --user $NVIM_BASE_USER_NAME \
  --volume ~/.toolbox/nvim/rust/nvim-state/.config/nvim:/home/$USER/.config/nvim \
  --volume ~/.toolbox/nvim/rust/nvim-state/.local/share/nvim:/home/$USER/.local/state/nvim \
  --volume ~/.toolbox/nvim/rust/nvim-state/.local/share/nvim:/home/$USER/.local/share/nvim \
  -w /app \
  --rm \
  -it $NVIM_RUST_IMAGE_NAME sh -uelic "nvim $@"
