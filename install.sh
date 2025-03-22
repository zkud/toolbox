#!/bin/sh

# Check if .toolbox directory exists, create if not
if [ ! -d "$HOME/.toolbox" ]; then
 mkdir -p "$HOME/.toolbox"
fi

# Clean the .toolbox directory if it exists
if [ -d "$HOME/.toolbox" ]; then
 rm -rf "$HOME/.toolbox"
 mkdir -p "$HOME/.toolbox"
fi

# Copy the current directory to ~/.toolbox
cp -r "$(pwd)" "$HOME/.toolbox"

# Add nvim-rust command to .bashrc
if [ -f "$HOME/.bashrc" ]; then
 echo "alias nvim-rust='~/.toolbox/nvim/rust/run.sh'" >> "$HOME/.bashrc"
else
 echo "alias nvim-rust='~/.toolbox/nvim/rust/run.sh'" > "$HOME/.bashrc"
fi

# Source the .bashrc file to apply the changes immediately
source "$HOME/.bashrc"

echo "Toolbox installed/upgraded successfully!"
echo "Remember to open a new terminal or run 'source ~/.bashrc' to use the new command."
