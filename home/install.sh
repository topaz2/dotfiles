#!/bin/bash -ex

`uname -s`/pre.sh
homesick link dotfiles --force
emacs --batch --eval '(byte-recompile-directory "~/.emacs.d" 0)'
curl -s https://raw.githubusercontent.com/xdissent/ievms/master/ievms.sh | bash
