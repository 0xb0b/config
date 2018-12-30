
# prompt

git_branch() {
  if [[ $(git rev-parse --is-inside-work-tree 2>/dev/null) ]]; then
    branch=$(git branch | grep '^*' | colrm 1 2)
    if [ -z "$branch" ]; then  #empty repo
      branch="(empty)"
    fi
    echo "$branch"
  fi
}

git_dirty() {
  if [[ $(git status --porcelain 2>/dev/null) ]]; then
    echo "*"
  fi
}


PS1="\[\033[00;32m\]\u@\h \[\033[00;33m\]\w \[\033[00m\]\$(git_branch)\[\033[01;31m\]\$(git_dirty)\[\033[00m\]\n> "

