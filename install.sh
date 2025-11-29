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
custom_profiles=("c" "c-beep" "lua" "python" "rust")
sh "$HOME/.toolbox/nvim/profiles/base/install.sh"
for profile in "${custom_profiles[@]}"; do
	sh "$HOME/.toolbox/nvim/profiles/$profile/install.sh"
done

if [ -f "$HOME/.bashrc" ]; then
 echo "Adding nvim alias to .bashrc..."
 echo "alias nvim='~/.toolbox/nvim/profiles/base/run.sh'" >> "$HOME/.bashrc"
else
 echo "Creating .bashrc and adding nvim alias..."
 echo "alias nvim='~/.toolbox/nvim/profiles/base/run.sh'" > "$HOME/.bashrc"
fi
for profile in "${custom_profiles[@]}"; do
	echo "Adding nvim-$profile alias to .bashrc..."
	echo "alias nvim-$profile='~/.toolbox/nvim/profiles/$profile/run.sh'" >> "$HOME/.bashrc"
done
echo "Adding aider alias to .bashrc..."
echo "alias aider='~/.toolbox/aider/run.sh'" >> "$HOME/.bashrc"
echo "Adding ollama-review alias to .bashrc..."
echo "alias ollama-review='~/.toolbox/ollama/review/run.sh'" >> "$HOME/.bashrc"

echo "Toolbox installed/upgraded successfully!"
echo "Remember to open a new terminal or run 'source ~/.bashrc' to use the new command."
