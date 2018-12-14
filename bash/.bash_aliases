# https://askubuntu.com/questions/66498/setting-tex-live-path-for-root
# sudo resets the value of $PATH (the whole environment, indeed) to a
# "known good" one, and is thus ignoring any changes you made to your local
# environment. The env command sets the PATH variable in the environment of
# the command to be executed
alias psudo='sudo env PATH="$PATH"'

alias h="history"

alias lsa="ls -la"
