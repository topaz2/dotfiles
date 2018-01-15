#!/bin/zsh

brew install \
     aircrack-ng axel brew-gem colordiff ctags \
     emacs \
     global --with-exuberant-ctags --with-pygments \
     ispell lv libffi mysql nkf nodejs \
     pbzip2 postgresql python \
     rbenv ruby ruby-build \
     awscli \
     transmission tree \
     w3m wget homebrew/php/php55
brew cask install \
     chefdk dropbox keepassx mono-mdk \
     gimp google-chrome google-drive-file-stream google-japanese-ime \
     karabiner-elements seil \
     mysqlworkbench \
     virtualbox virtualbox-extension-pack docker docker-compose
brew link docker docker-compose
Darwin/karabiner-import.sh
Darwin/seil-import.sh
sudo systemsetup -setremotelogin on
