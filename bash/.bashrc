#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Add Custom Paths
# PATH="$PATH:~/dotfiles/bin/"
# export PATH

# ENV VARS
export PAGER=/bin/less
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

[[ -f ~/.dotfiles/bash/.bash_aliases ]] && . ~/.dotfiles/bash/.bash_aliases
[[ -f ~/.dotfiles/bash/.bash_prompt ]] && . ~/.dotfiles/bash/.bash_prompt
