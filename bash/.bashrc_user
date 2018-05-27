
# prompt
git_branch() {
  git branch 2>/dev/null | grep '^*' | colrm 1 2
}

PS1="\[\033[01;32m\]\t \u@\h\[\033[00m\]:\w \[\033[01;34m\]\$(git_branch)\[\033[00m\]\n> "

# TeXlive
export PATH=/usr/local/texlive/2017/bin/x86_64-linux:$PATH
export INFOPATH=$INFOPATH:/usr/local/texlive/2017/texmf-dist/doc/info
export MANPATH=$MANPATH:/usr/local/texlive/2017/texmf-dist/doc/man

