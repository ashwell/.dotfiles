#!bin/sh

# install xcode
xcode-select --install

# install homebrew
# ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update
brew doctor

# brew install stuffs: [bash, bash-completion, git, node]

# install bash
brew install bash
# setup homebrew bash
# Add the new shell to the list of legit shells
sudo bash -c "echo /opt/homebrew/bin/bash >> /private/etc/shells"
# Change the shell for the user
chsh -s /opt/homebrew/bin/bash
# Check for Bash 4 and /usr/local/bin/bash...
echo "Checking Bash Version"
echo $BASH && echo $BASH_VERSION


brew install bash-completion git node

# Do dotfiles first
# pull down .dotfiles
#cd ~
#git clone http://github.com/ashwell/.dotfiles.git

# Setup Keybindings
sudo mkdir ~/Library/KeyBindings
sudo cp ~/.dotfiles/mac/DefaultKeyBinding.dict ~/Library/KeyBindings/

# Enable Key Repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
