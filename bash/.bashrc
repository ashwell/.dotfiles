#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ENVIRONMENT VARS
export PAGER=/bin/less
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

# CUSTOM PATH
# export PATH="$PATH:~/dotfiles/bin/"

# CUSTOM CDPATH
# export CDPATH=".:$HOME/workspace"

# INPUTRC
[[ -f ~/.dotfiles/bash/.inputrc ]] && export INPUTRC="~/.dotfiles/bash/.inputrc"


# Source files, Should change to function, maybe change the folder structure a little too
[[ -f ~/.dotfiles/bash/.bash_aliases ]] && . ~/.dotfiles/bash/.bash_aliases
[[ -f ~/.dotfiles/bash/.bash_prompt ]] && . ~/.dotfiles/bash/.bash_prompt
