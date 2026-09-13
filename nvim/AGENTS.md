# Neovim Dockerized Configurations

This repository contains a collection of Dockerized Neovim environments, each customized for specific programming languages and development workflows. The goal is to provide consistent, isolated, and pre-configured development environments.

## Overview

The project is structured around a shared base configuration and multiple language-specific profiles. Each profile can be built as a standalone Docker image.

## Project Structure

- `nvim/`
    - `common-nvim-config`: The core Neovim configuration (Lua-based) used across all profiles.
    - `profiles/`: Contains the directory for each language-specific Docker environment.
        - `base`: The fundamental profile containing essential CLI tools like `git`, `lazygit`, `fzf`, `ripgrep`, and `bash`.
        - `c` / `c-beep`: Profiles optimized for C development.
        - `lua`: Profile optimized for Lua development.
        - `python`: Profile optimized for Python development.
        - `rust`: Profile optimized for Rust development.
        - `sap-cap-java`: Profile tailored for SAP CAP Java development.
    - `constants.sh`: Shared constants used during the build process.
    - `utils.sh`: Shared utility functions for automation and configuration management.

## How It Works

### Profile Architecture

Each profile directory (e.g., `nvim/profiles/python/`) contains:

- `Dockerfile`: Defines the environment, starting from a base Alpine Linux image and installing language-specific dependencies.
- `install.sh`: An automation script that:
    1.  Prepares the Neovim configuration.
    2.  Triggers the `docker build` process.
    3.  Tags the resulting image with a specific name.
- `run.sh`: A script to easily launch the containerized Neovim environment.
- `home-init/`: Scripts or configuration files to initialize the user's home directory within the container.

### Build Process

The build process relies on injecting the `common-nvim-config` into each profile's environment. This ensures that while the underlying system tools vary by language, the Neovim editor experience remains consistent across all profiles.

## Key Features

- **Consistency**: Uniform Neovim configuration across all development environments.
- **Isolation**: Each language environment is encapsulated within its own Docker container, preventing dependency conflicts.
- **Extensibility**: Adding a new language is as simple as creating a new profile directory and defining its specific `Dockerfile` and `install.sh`.
- **Ready-to-use**: Pre-integrated with essential modern developer tools like `lazygit` and `fzf`.
