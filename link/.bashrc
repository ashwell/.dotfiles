#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ENVIRONMENT VARS
[[ `command -v less` ]] && export PAGER=`command -v less`
[[ `command -v vim` ]] && export EDITOR=`command -v vim` ; export VISUAL=`command -v vim`

# CUSTOM PATH
# export PATH="$PATH:~/dotfiles/bin/"

# CUSTOM CDPATH
[[ -d "$HOME/workspace" ]] && export CDPATH="$HOME/workspace"

# INPUTRC
[[ -f ~/.dotfiles/link/.inputrc ]] && export INPUTRC="~/.dotfiles/link/.inputrc"


# if bash 4
[[ "$BASH_VERSION" == "4"* ]] shopt -s globstar

# Source files, Should change to function, maybe change the folder structure a little too
[[ -f ~/.dotfiles/source/.bash_aliases ]] && . ~/.dotfiles/source/.bash_aliases
[[ -f ~/.dotfiles/source/.bash_prompt ]] && . ~/.dotfiles/source/.bash_prompt
