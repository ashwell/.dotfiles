# vi:syntax=sh
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ENVIRONMENT VARS
[[ `command -v less` ]] && PAGER=`command -v less`
[[ `command -v vim` ]] && EDITOR=`command -v vim` ; VISUAL=`command -v vim`

# CUSTOM PATH
PATH="/usr/local/bin:/usr/local/sbin:~/.dotfiles/bin:$PATH:./node_modules/.bin"

# CUSTOM CDPATH
[ -d ~/repos ] && CDPATH="$CDPATH:~/repos"
[ -d ~/repos/jsla ] && CDPATH="$CDPATH:~/repos/jsla"
[ -d ~/workspace ] && CDPATH="$CDPATH:~/workspace"
[ -d ~/workspace/hound ] && CDPATH="$CDPATH:~/workspace/hound"

# INPUTRC
[ -f ~/.dotfiles/link/.inputrc ] && INPUTRC="~/.dotfiles/link/.inputrc"


# if bash 4 enable double star
[[ "$BASH_VERSION" == "4"* ]] && shopt -s globstar

# Source files, Should change to function, maybe change the folder structure a little too
[ -f ~/.dotfiles/source/.aliases ] && source ~/.dotfiles/source/.aliases
[ -f ~/.dotfiles/source/.bash_prompt ] && source ~/.dotfiles/source/.bash_prompt
[ -f ~/.dotfiles/source/.commacd.bash ] && source ~/.dotfiles/source/.commacd.bash

# if has homebrew
if [[ `command -v brew` == *"brew" ]]; then
  [[ -f `brew --prefix`/etc/bash_completion ]] && source `brew --prefix`/etc/bash_completion
fi

# [[ `command mono -v 2> /dev/null` ]] && export MONO_GAC_PREFIX="/usr/local"
# [[ `command -v phantomjs 2> /dev/null` ]] && export PHANTOMJS_BIN=`command -v phantomjs`

export PATH CDPATH INPUTRC PAGER EDITOR VISUAL

