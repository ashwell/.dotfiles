#
# ~/.bash_aliases
#

alias vi=vim

# Aliases
alias ls='command ls --color=auto'
#alias ls='command ls -G'
alias ll="ls -l"
alias la="ls -la"
alias c="clear"
#alias cls="c && !!"
alias lg="logout"

# Git Short Commands (see .gitconfig for git aliases)
alias gfshow="git fetch origin && echo 'fetched origin' && git remote show origin"
alias cstat="clear && git status"

