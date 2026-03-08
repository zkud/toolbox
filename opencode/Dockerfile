FROM node:lts-alpine3.22

# dependencies
RUN apk add git lazygit fzf curl ripgrep bash --update

# developer agent dependencies
RUN apk add --no-cache python3 py3-pip

USER node

# installing opencode
RUN npm config set prefix ~/.local
RUN echo "PATH=~/.local/bin:$PATH" > ~/.profile
RUN source ~/.profile
RUN npm i -g opencode-ai@1.2.0

# copying opencode configs
COPY ./opencode.json /home/node/.config/opencode/opencode.json
COPY ./prompts/ /home/node/prompts/

CMD sh

