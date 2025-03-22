OLLAMA_API_BASE=http://192.168.0.209:11434
MODEL=ollama_chat/gemma3:12b
docker run -it --user $(id -u):$(id -g) -e OLLAMA_API_BASE=$OLLAMA_API_BASE --volume $(pwd):/app paulgauthier/aider-full --model $MODEL 