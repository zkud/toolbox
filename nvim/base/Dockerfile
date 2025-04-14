FROM alpine:3.21.3

ARG USER_NAME
ARG GROUP_NAME
ARG USER_ID
ARG USER_GROUP_ID

# Add non-root user
RUN addgroup -g ${USER_GROUP_ID} -S ${GROUP_NAME}
RUN adduser -D -u ${USER_ID} -G ${GROUP_NAME} ${USER_NAME}

# Install NvChad Vim & Dependencies
RUN apk add git lazygit fzf curl neovim ripgrep alpine-sdk --update
RUN cd /home/${USER_NAME}/ && git clone https://github.com/NvChad/starter .config/nvim
RUN cd /home/${USER_NAME} && chown ${USER_NAME} -R .
