#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ENVIRONMENT VARS
[[ `command -v less` ]] && export PAGER=`command -v less`
[[ `command -v vim` ]] && export EDITOR=`command -v vim` ; export VISUAL=`command -v vim`

# CUSTOM PATH
export PATH="/usr/local/bin:~/.dotfiles/bin:$PATH"

# CUSTOM CDPATH
[[ -d ~/workspace ]] && export CDPATH="~/workspace"
[[ -d ~/workspace/hound ]] && export CDPATH="~/workspace/hound"

# INPUTRC
[[ -f ~/.dotfiles/link/.inputrc ]] && export INPUTRC="~/.dotfiles/link/.inputrc"


# if bash 4 enable double star
[[ "$BASH_VERSION" == "4"* ]] && shopt -s globstar

# Source files, Should change to function, maybe change the folder structure a little too
[[ -f ~/.dotfiles/source/.bash_aliases ]] && source ~/.dotfiles/source/.bash_aliases
[[ -f ~/.dotfiles/source/.bash_prompt ]] && source ~/.dotfiles/source/.bash_prompt

[[ -f `brew --prefix`/etc/bash_completion ]] && source `brew --prefix`/etc/bash_completion
[[ `command mono -v` ]] && export MONO_GAC_PREFIX="/usr/local"

