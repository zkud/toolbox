#!/bin/sh

echo "Starting toolbox installation/upgrade..."

if [ ! -d "$HOME/.toolbox" ]; then
 echo "Creating .toolbox directory..."
 mkdir -p "$HOME/.toolbox"
fi

if [ -d "$HOME/.toolbox" ]; then
 echo "Cleaning existing .toolbox directory..."
 rm -rf "$HOME/.toolbox"
 mkdir -p "$HOME/.toolbox"
fi

echo "Copying toolbox files to ~/.toolbox..."
cp -r . "$HOME/.toolbox"

echo "Installing scripts"
sh "$HOME/.toolbox/nvim/profiles/base/install.sh"
sh "$HOME/.toolbox/nvim/profiles/lua/install.sh"
sh "$HOME/.toolbox/nvim/profiles/rust/install.sh"
sh "$HOME/.toolbox/nvim/profiles/c/install.sh"
sh "$HOME/.toolbox/nvim/profiles/python/install.sh"

if [ -f "$HOME/.bashrc" ]; then
 echo "Adding nvim alias to .bashrc..."
 echo "alias nvim='~/.toolbox/nvim/profiles/base/run.sh'" >> "$HOME/.bashrc"
else
 echo "Creating .bashrc and adding nvim alias..."
 echo "alias nvim='~/.toolbox/nvim/profiles/base/run.sh'" > "$HOME/.bashrc"
fi
echo "Adding nvim-rust alias to .bashrc..."
echo "alias nvim-rust='~/.toolbox/nvim/profiles/rust/run.sh'" >> "$HOME/.bashrc"
echo "Adding nvim-c alias to .bashrc..."
echo "alias nvim-c='~/.toolbox/nvim/profiles/c/run.sh'" >> "$HOME/.bashrc"
echo "Adding nvim-lua alias to .bashrc..."
echo "alias nvim-lua='~/.toolbox/nvim/profiles/lua/run.sh'" >> "$HOME/.bashrc"
echo "Adding nvim-python alias to .bashrc..."
echo "alias nvim-python='~/.toolbox/nvim/profiles/python/run.sh'" >> "$HOME/.bashrc"
echo "Adding aider alias to .bashrc..."
echo "alias aider='~/.toolbox/aider/run.sh'" >> "$HOME/.bashrc"
echo "alias ollama-review='~/.toolbox/ollama/review/run.sh'" >> "$HOME/.bashrc"

echo "Toolbox installed/upgraded successfully!"
echo "Remember to open a new terminal or run 'source ~/.bashrc' to use the new command."
