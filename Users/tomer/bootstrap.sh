#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Homebrew
if [ ! -f /opt/homebrew/bin/brew ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
  brew update
fi;

# Update Homebrew and upgrade existing formulae
brew update
brew upgrade

# Bash
brew install bash bash-completion@2

# Fish
brew install fish fisher
FISH_BIN=$(which fish)
sudo grep -qxF "$FISH_BIN" /etc/shells || echo "$FISH_BIN" | sudo tee -a /etc/shells >/dev/null
chsh -s "$(which fish)"

# Utilities
brew install coreutils
brew install moreutils findutils tree rename gnu-sed grep bat git-delta wget imagemagick screen openssh direnv watch

# Security
brew install gnupg pinentry-mac pass
brew tap amar1729/formulae
brew install browserpass

# Version control
brew install git git-lfs gh

# Backups
brew install borgbackup borgmatic
brew install --cask vorta

# Terminal and editors 
brew install vim micro
brew install --cask kitty sublime-text visual-studio-code

# JavaScript
brew install node yarn pnpm

# Browsers
brew install --cask google-chrome firefox 

# Music
brew install --cask spotify

# Social
brew install --cask discord slack zoom
brew install --cask signal

brew install --cask alfred

brew install --cask disk-inventory-x

brew install go

brew install postgresql

brew install --cask vlc
brew install --cask figma
brew install lolcat
brew install --cask calibre
brew install superfly/tap/flyctl
brew install graphviz

brew cleanup



brew install --cask android-file-transfer
