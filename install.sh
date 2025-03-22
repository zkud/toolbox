#!/bin/sh

# Installation start message
echo "Starting toolbox installation/upgrade..."

# Check if .toolbox directory exists, create if not
if [ ! -d "$HOME/.toolbox" ]; then
 echo "Creating .toolbox directory..."
 mkdir -p "$HOME/.toolbox"
fi

# Clean the .toolbox directory if it exists
if [ -d "$HOME/.toolbox" ]; then
 echo "Cleaning existing .toolbox directory..."
 rm -rf "$HOME/.toolbox"
 mkdir -p "$HOME/.toolbox"
fi

# Copy the current directory to ~/.toolbox
echo "Copying toolbox files to ~/.toolbox..."
cp -r "$(pwd)" "$HOME/.toolbox"

# Add nvim-rust command to .bashrc
if [ -f "$HOME/.bashrc" ]; then
 echo "Adding nvim-rust alias to .bashrc..."
 echo "alias nvim-rust='~/.toolbox/nvim/rust/run.sh'" >> "$HOME/.bashrc"
 echo "alias aider='~/.toolbox/aider/run.sh'" >> "$HOME/.bashrc"
else
 echo "Creating .bashrc and adding nvim-rust alias..."
 echo "alias nvim-rust='~/.toolbox/nvim/rust/run.sh'" > "$HOME/.bashrc"
 echo "alias aider='~/.toolbox/aider/run.sh'" >> "$HOME/.bashrc"
fi

# Source the .bashrc file to apply the changes immediately
echo "Applying changes to current shell..."
source "$HOME/.bashrc"

echo "Toolbox installed/upgraded successfully!"
echo "Remember to open a new terminal or run 'source ~/.bashrc' to use the new command."
