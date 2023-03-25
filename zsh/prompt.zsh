setopt PROMPT_SUBST
autoload -U add-zsh-hook



generate_prompt() {
  git_branch=""
  if [ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" ]; then
    branch=$(git branch | grep '^*' | colrm 1 2)
    if [ -z "$branch" ]; then  #empty repo
      branch="(empty)"
    fi
    if [ "$(git status --porcelain 2>/dev/null)" ]; then
      git_branch="${branch}%F{red}*"
    else
      git_branch="${branch}"
    fi
  fi
  PROMPT="
%F{blue}%n@%m %f%~  %F{cyan}${git_branch}%f$(prompt_context)
%(!.%F{226}%K{240} ▶ %f%k.▶) "
}

add-zsh-hook precmd generate_prompt



