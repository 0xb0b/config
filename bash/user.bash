# prompt

git_branch() {
  if [ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" ]; then
    branch=$(git branch | grep '^*' | colrm 1 2)
    if [ -z "$branch" ]; then  #empty repo
      branch="(empty)"
    fi
    echo "$branch"
  fi
}

git_dirty() {
  if [ "$(git status --porcelain 2>/dev/null)" ]; then
    echo "*"
  fi
}

PS1="\n\[\e[00;32m\]\u@\h \[\e[00;33m\]\w \[\e[00m\]\$(git_branch)\[\e[01;31m\]\$(git_dirty)\[\e[00m\]\$(ps1_context)\n> "

