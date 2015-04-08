
set -x PATH ~/.dotfiles/bin $PATH

# NVM fish wrapper
source ~/.config/fish/nvm-wrapper/nvm.fish

# Load Aliases "in" aliases function file
aliases >-

alias routine "brewu;brewcasku;cd ~/repos/ed/clientapp;ostorm"

function fish_greeting
  archey -c
end
