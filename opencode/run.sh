#!/bin/bash

docker run -it \
	-u node \
	--volume $(pwd):/app \
	-w /app \
	opencode sh -uelic "~/node_modules/opencode-ai/bin/opencode"

