#!/bin/bash

# ==== CONFIGURATION ====
DOTFILES_REPO="$HOME/repos/dotfiles"
CONFIG_SRC="$HOME/.config"
CONFIG_DEST="$DOTFILES_REPO/.config"
HOME_DIR_SRC="$HOME/"
HOME_DIR_DEST="$DOTFILES_REPO/home-dir/"

# ==== COPY DOTFILES ====
echo "🧩 Syncing dotfiles to $DOTFILES_REPO..."

mkdir -p "$CONFIG_DEST"

# Copy top-level files
cp -v "$HOME/.bashrc" "$DOTFILES_REPO/"
cp -v "$HOME/.bash_aliases" "$DOTFILES_REPO/"

# Sync config directories (mirror exactly, including deletions)
rsync -av --delete "$CONFIG_SRC/hypr/"  "$CONFIG_DEST/hypr/"
rsync -av --delete "$CONFIG_SRC/kitty/" "$CONFIG_DEST/kitty/"
rsync -av --delete "$CONFIG_SRC/waybar/" "$CONFIG_DEST/waybar/"
rsync -av --delete "$CONFIG_SRC/rofi/" "$CONFIG_DEST/rofi/"

rsync -av --delete "$HOME_DIR_SRC/scripts/" "$HOME_DIR_DEST/scripts/"

echo "✅ Dotfiles synced successfully!"

# ==== GIT AUTO-COMMIT ====
cd "$DOTFILES_REPO" || exit

# Stage all changes
git add -A

# Check if there are any changes to commit
if git diff --cached --quiet; then
    echo "🟢 No changes to commit."
else
    COMMIT_MSG="Updated files"
    git commit -m "$COMMIT_MSG" && echo "📦 Committed: $COMMIT_MSG"
    git push && echo "🚀 Changes pushed to GitHub!"
fi

echo "✅ All done!"

