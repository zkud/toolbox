# zkud's toolbox

This repository contains a collection of CLI tools for development, each tool is fully dockerized for consistency and ease of use. 

## Installation

Currently Windows is not supported, as I don't use it for development.

Dependencies:

- Docker.

- Nerdfonts. It depends on distro how to use install it. On ubuntu the next command will do

```
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip \
    && cd ~/.local/share/fonts \
    && unzip JetBrainsMono.zip \
    && rm JetBrainsMono.zip \
    && fc-cache -fv
```

Since all deps are here, to install the toolbox, simply run the `install.sh` script.

## Tools Overview

- aider

Stock aider, it's an AI assistant to streamline productivity.

- nvim

NvChad build for some basic editing.

