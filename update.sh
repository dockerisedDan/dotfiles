# A small helper script to automate the process of copying dotfiles from home dir to project file

#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="$HOME/Documents/github/dotfiles-backup"
CONFIG_DIR="$HOME/.config"

# List of config dirs in $HOME/.config
DIRS=(
    "nvim"
    "ghostty"
)

# List of config files in $HOME
FILES=(
    ".tmux.conf"
    ".zshrc"
)

for dir in "${DIRS[@]}"; do
    echo "Syncing $dir..."
    rsync -av --delete "$CONFIG_DIR/$dir/" "$PROJECT_DIR/.config/$dir"
done

for file in "${FILES[@]}"; do
    echo "Syncing $file..."
    rsync -av --delete "$HOME/$file" "$PROJECT_DIR/$file"
done

echo "✅ Dotfiles updated in $PROJECT_DIR"
