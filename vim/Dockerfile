FROM alpine:3.24.1

ARG USER_NAME
ARG GROUP_NAME
ARG USER_ID
ARG USER_GROUP_ID

# Add non-root user
RUN addgroup -g ${USER_GROUP_ID} -S ${GROUP_NAME}
RUN adduser -D -u ${USER_ID} -G ${GROUP_NAME} ${USER_NAME}

# Install depedencies
RUN apk add git vim bash curl ripgrep --update

# Install vim plug
RUN curl -fLo /home/${USER_NAME}/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Copy vim config
COPY ./.vimrc /home/${USER_NAME}/.vimrc

# Fix permission issues
RUN chown -R ${USER_NAME} /home/${USER_NAME}/.vim/
RUN chown ${USER_NAME} /home/${USER_NAME}/.vimrc
