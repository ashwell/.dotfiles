#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "Hello inside script"

# Copy Files from Copy Folder
#[[ -f "~/.dotfiles/init.sh" ]] && echo "do copy"

# Symlink Files from Link Folder
# not safe!
