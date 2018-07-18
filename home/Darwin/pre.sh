#!/bin/zsh

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

xargs brew install < Brewfile
xargs brew cask install < Brewfile.cask
brew link docker docker-compose
sudo systemsetup -setremotelogin on
