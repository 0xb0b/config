black='\e[0;30m'
darkgray='\e[1;30m'
red='\e[0;31m'
lightred='\e[1;31m'
green='\e[0;32m'
lightgreen='\e[1;32m'
orange='\e[0;33m'
yellow='\e[1;33m'
blue='\e[0;34m'
lightblue='\e[1;34m'
purple='\e[0;35m'
lightpurple='\e[1;35m'
cyan='\e[0;36m'
lightcyan='\e[1;36m'
lightgray='\e[0;37m'
white='\e[1;37m'
nocolor='\e[0m'

git_branch() {
  if [ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" ]; then
    branch=$(git branch | grep '^*' | colrm 1 2)
    if [ -z "$branch" ]; then  #empty repo
      branch="(empty)"
    fi
    if [ "$(git status --porcelain 2>/dev/null)" ]; then
      printf "${branch}${red}*"
    else
      printf "${branch}"
    fi
  fi
}

PS1="\n${blue}\u@\h ${nocolor}\w  ${cyan}\$(git_branch)${nocolor}\$(ps1_context)\n▶ "

