#!/bin/bash

docker run -it -u node --volume $(pwd):/app opencode sh -uelic "source ~/.profile; opencode -m ollama/nemotron-3-nano"

