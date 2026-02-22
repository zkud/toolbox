FROM node:lts-alpine3.22

USER node

RUN npm config set prefix ~/.local
RUN echo "PATH=~/.local/bin:$PATH" > ~/.profile
RUN source ~/.profile
RUN npm i -g opencode-ai@latest

COPY ./opencode.json /home/node/.config/opencode/opencode.json

CMD sh

