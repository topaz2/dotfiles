#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set option.emacsmode_controlY 1
/bin/echo -n .
$cli set repeat.wait 33
/bin/echo -n .
$cli set repeat.initial_wait 250
/bin/echo -n .
$cli set remap.controlJ2enter 1
/bin/echo -n .
$cli set option.emacsmode_controlPNBF 1
/bin/echo -n .
$cli set option.emacsmode_controlM 1
/bin/echo -n .
$cli set option.emacsmode_controlD 1
/bin/echo -n .
$cli set option.emacsmode_controlAE 1
/bin/echo -n .
$cli set option.emacsmode_controlK_ex 1
/bin/echo -n .
/bin/echo
