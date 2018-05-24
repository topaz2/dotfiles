#!/bin/zsh

brew install \
     aircrack-ng axel brew-gem colordiff ctags \
     emacs \
     global --with-exuberant-ctags --with-pygments \
     ispell lv screen libffi mysql nkf nodejs \
     pbzip2 postgresql python \
     rbenv ruby ruby-build \
     s3cmd svn transmission tree \
     w3m wget homebrew/php/php55
brew cask install \
     chefdk dropbox karabiner keepassx mono-mdk \
     gimp google-chrome google-drive google-japanese-ime \
     mysqlworkbench \
     packer seil vagrant virtualbox
Darwin/karabiner-import.sh
Darwin/seil-import.sh
sudo systemsetup -setremotelogin on
