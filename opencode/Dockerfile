FROM node:lts-alpine3.22

# dependencies
RUN apk add git lazygit fzf curl ripgrep bash --update

# developer agent dependencies
RUN apk add --no-cache python3 py3-pip

# installing opencode
USER node
WORKDIR /home/node
COPY ./package.json ./package.json
RUN npm i
COPY ./opencode.json ./.config/opencode/opencode.json
COPY ./prompts/ ./prompts/

CMD sh

