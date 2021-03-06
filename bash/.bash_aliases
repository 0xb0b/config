# https://mhoffman.github.io/2015/05/21/how-to-navigate-directories-with-the-shell.html
# command completion from history
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# https://askubuntu.com/questions/66498/setting-tex-live-path-for-root
# sudo resets the value of $PATH (the whole environment, indeed) to a
# "known good" one, and is thus ignoring any changes you made to your local
# environment. The env command sets the PATH variable in the environment of
# the command to be executed:
# alias esudo='sudo env HOME="$HOME" PATH="$PATH"'
#
# to keep all the environment variables use -E or --preserve-env
alias esudo="sudo --preserve-env"

alias h="history"

alias ls="ls -x --color --group-directories-first"

alias ll="ls -AlF"

# unset alias to avoid recursion (e.g. if this is sourced more than once)
unalias cd 2>/dev/null
cdls() {
  if [[ -z $1 ]]; then
    directory=$HOME
  else
    directory="$1"
  fi
  cd $directory && ls -AF
}

alias cd="cdls"
alias ..="cdls .."


alias c="clear"

alias :q="exit &>/dev/null"

