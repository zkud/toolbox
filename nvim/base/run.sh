#!/bin/bash

docker run --volume $(pwd):/app \
  --user zkud \
  -w /app \
  --rm \
  -it nvim-base sh -uelic "nvim $@"
