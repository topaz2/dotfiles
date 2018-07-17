#!/bin/zsh

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install \
     aircrack-ng awscli axel \
     brew-gem colordiff ctags \
     docker docker-compose \
     emacs \
     global --with-exuberant-ctags --with-pygments \
     ispell lv screen libffi mysql nkf nodejs \
     pbzip2 postgresql python \
     rbenv ruby ruby-build \
     transmission tree \
     w3m wget
brew cask install \
     dropbox docker \
     keepassx mono-mdk \
     gimp google-chrome google-drive-file-stream google-japanese-ime \
     karabiner-elements seil \
     mysqlworkbench \
     slack \
     virtualbox virtualbox-extension-pack
brew link docker docker-compose
Darwin/karabiner-import.sh
Darwin/seil-import.sh
sudo systemsetup -setremotelogin on
