# zkud's toolbox

This monorepo contains a collection of CLI tools for development, each tool is **fully dockerized, but still feels local**.

## Installation

Currently Windows is **not** supported, as I don't use it for development at all.

Dependencies:

- Docker.

- Nerdfonts. It depends on distro/OS how to use install it. On ubuntu the next command will do

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

Basic aider with ollama configs, it's an AI assistant to streamline productivity.

- nvim

Dockerized nvim + NvChad build for some basic editing. State is fully cached.

