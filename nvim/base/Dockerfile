FROM alpine:3.21.3

# Add non-root user
ARG USER_NAME=zkud
ARG GROUP_NAME=chads
ARG USER_ID=1000
ARG USER_GROUP_ID=1000
RUN addgroup -g ${USER_GROUP_ID} -S ${GROUP_NAME}
RUN adduser -D -u ${USER_ID} -G ${GROUP_NAME} ${USER_NAME}

# Install NvChad
RUN apk add git nodejs neovim ripgrep build-base wget --update
RUN cd /home/${USER_NAME}/ && git clone https://github.com/NvChad/starter .config/nvim
RUN cd /home/${USER_NAME} && chown ${USER_NAME} -R .
