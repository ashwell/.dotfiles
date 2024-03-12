#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "Hello inside script"

# Copy Files from Copy Folder
FILES_TO_COPY=$(ls -A ~/.dotfiles/copy)
#[[ -f "~/.dotfiles/init.sh" ]] && echo "do copy"
echo "Copying Files to ~"
for f in $FILES_TO_COPY
do
  echo "Copy: $f"
  # todo guard that file being copied exists
  # todo guard that file does NOT exist in ~ before copy
  # cp "$HOME/.dotfiles/copy/$f" ~/$f
done

# Symlink Files from Link Folder
# not safe!
FILES_TO_LINK=$(ls -A ~/.dotfiles/link)
echo "Linking Files to ~"
for f in $(ls -A ~/.dotfiles/link)
do
  echo "Linking: $f"
  # todo guard that file being linked to exists
  # todo guard that file doesn't exist in ~ before linking
  # ln -s "$HOME/.dotfiles/link/$f" ~/
done

#TODO "apps folder" needs a rework probably
