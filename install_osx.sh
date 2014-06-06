#!bin/sh

# install xcode
xcode-select --install

# install homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

brew update
brew doctor

# brew install stuffs: [bash, bash-completion, git, node]

# install bash
brew install bash
# setup homebrew bash
# Add the new shell to the list of legit shells
sudo bash -c "echo /usr/local/bin/bash >> /private/etc/shells"
# Change the shell for the user
chsh -s /usr/local/bin/bash
# Check for Bash 4 and /usr/local/bin/bash...
echo $BASH && echo $BASH_VERSION


brew install bash-completion

brew install git

brew install node


# pull down .dotfiles
cd ~
git clone http://github.com/Ashwell/.dotfiles.git

# install .dotfiles (link step)
# TODO
