# Yay for fish shell!
if not set -q CDPATH
  # CUSTOM CDPATH
  if test -d "$HOME/repos"
    set -U CDPATH $CDPATH "$HOME/repos"
    cd $HOME/repos
    set -l folders "gh" "bb" "ed" "mh"
    for dir in $folders
      if test -d $HOME/repos/$dir
        set -U CDPATH $CDPATH "$HOME/repos/$dir"
      end
    end
  end

  if test -d "$HOME/workspace"
    set -U CDPATH $CDPATH $HOME/workspace
    cd $HOME/workspace
    set -l folders "hound"
    for dir in $folders
      if test -d $HOME/workspace/$dir
        set -U CDPATH $CDPATH "$HOME/workspace/$dir"
      end
    end
  end

  set -U CDPATH ./ $CDPATH
end

# CUSTOM PATHS
set -x PATH $HOME/.dotfiles/bin /usr/local/bin $PATH

# NVM fish wrapper
source $HOME/.config/fish/nvm-wrapper/nvm.fish

# Load Aliases "in" aliases function file
aliases >/dev/null

alias routine "brewu;brewcasku;cd $HOME/repos/ed/clientapp;ostorm"

function fish_greeting
  archey -c
end
