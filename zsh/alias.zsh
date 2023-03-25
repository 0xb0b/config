# command completion from history
# https://unix.stackexchange.com/questions/97843/how-can-i-search-history-with-text-already-entered-at-the-prompt-in-zsh
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

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

alias ls="ls -x --color"

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

# git
alias gs="git status"
alias gl="git log"
alias ga="git add"
alias gc="git commit"
alias gca="git commit --amend"
alias gp="git push origin"

