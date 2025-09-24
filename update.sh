# A small helper script to automate the process of copying dotfiles from home dir to project file

#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="."
CONFIG_DIR="$HOME/.config"
SCRIPT_DIR="$HOME/.local/bin"

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

# List of scripts
SCRIPTS=(
    "hyprgame"
)

# Determine sync direction
# Default: backup (home -> project)
DIRECTION="backup"
if [[ "${1:-}" == "--restore" ]]; then
    DIRECTION="restore"
fi

sync_dir() {
    local src=$1
    local dest=$2
    printf "\n==========================================================================\n"
    printf "\n🗂️  Syncing dir: %s -> %s\n" "$src" "$dest"
    if [ -d "$src" ]; then
        rsync -av --delete "$src/" "$dest" > /dev/null
        printf "✅  Sync successful\n"
    else
        printf "❌  Source file missing: %s\n" "$src" 
    fi
}

sync_file() {
    local src=$1
    local dest=$2
    printf "\n==========================================================================\n"
    printf "\n📄  Syncing dir: %s -> %s\n" "$src" "$dest"
    if [ -f "$src" ]; then
        rsync -av "$src" "$dest" > /dev/null
        printf "✅  Sync successful\n"
    else
        printf "❌  Source file missing: %s\n" "$src" 
    fi
}

# Run sync
for dir in "${DIRS[@]}"; do
    if [[ $DIRECTION == "backup" ]]; then
        sync_dir "$CONFIG_DIR/$dir" "$PROJECT_DIR/.config/$dir"
    else
        sync_dir "$PROJECT_DIR/.config/$dir" "$CONFIG_DIR/$dir"
    fi
done

for file in "${FILES[@]}"; do
    if [[ $DIRECTION == "backup" ]]; then
        sync_file "$HOME/$file" "$PROJECT_DIR/$file"
    else
        sync_file "$PROJECT_DIR/$file" "$HOME/$file"
    fi
done

for script in "${SCRIPTS[@]}"; do
    if [[ $DIRECTION == "backup" ]]; then
        sync_file "$SCRIPT_DIR/$script" "$PROJECT_DIR/.local/bin/$script"
    else
        sync_file "$PROJECT_DIR/.local/bin/$script" "$SCRIPT_DIR/$script"
    fi
done

printf "\n==========================================================================\n"
if [[ "$DIRECTION" == "backup" ]]; then
    printf "\n✅ Dotfiles updated in %s\n" "$(pwd)"
else
    printf "\n✅ Dotfiles updated in %s\n" "$HOME"
fi
