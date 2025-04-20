FROM alpine:3.21.3

ARG USER_NAME
ARG GROUP_NAME
ARG USER_ID
ARG USER_GROUP_ID

# Add non-root user
RUN addgroup -g ${USER_GROUP_ID} -S ${GROUP_NAME}
RUN adduser -D -u ${USER_ID} -G ${GROUP_NAME} ${USER_NAME}

# Install NeoVim & Dependencies
RUN apk add git lazygit fzf curl neovim ripgrep alpine-sdk bash --update
