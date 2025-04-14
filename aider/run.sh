. $HOME/.toolbox/aider/constants.sh

docker run -it --user $(id -u):$(id -g) -e OLLAMA_API_BASE=$OLLAMA_API_BASE --volume $(pwd):/app paulgauthier/aider-full --model $MODEL 
