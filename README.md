# zkud's toolbox

This monorepo contains a collection of CLI tools for development, each tool is **fully dockerized, but still feels like local**.

## Installation

If you'd like to reuse the repo, please note currently Windows is **NOT** supported. And it won't be in forseeable future as I don't use it for development at all.

The only single dependency you need to start is Docker.

To install the toolbox, simply run the `install.sh` script.

## Tools Overview

- aider

Basic aider with ollama configs, it's an AI assistant to streamline productivity.

- ollama-review

Pr review automation with local ollama api, see ollama/review/run.sh.

- opencode

Sandboxed opencode with preconfigured agents and model providers.

- vim 

Dockerized vim + custom configs + deps for development.
