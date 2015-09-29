#! /bin/bash

# read X resources settings
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# exec gnome-session

exec startkde
