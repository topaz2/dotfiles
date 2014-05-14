#!/bin/bash -ex

emacs --batch --eval '(byte-recompile-directory "~/.emacs.d" 0)'
