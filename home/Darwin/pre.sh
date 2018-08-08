#!/bin/zsh

dirname=$(dirname "$0")

xargs brew install < $dirname/Brewfile
xargs brew cask install < $dirname/Brewfile.cask
brew link docker docker-compose
sudo systemsetup -setremotelogin on
