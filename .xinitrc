#! /bin/bash

# read X resources settings
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

exec openbox-session
