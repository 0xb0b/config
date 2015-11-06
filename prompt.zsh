autoload -U colors && colors

ROOT_PATH_FG="%{$fg[red]%}"
PATH_FG="%{$fg[green]%}"
VCS_BG="%{$bg[grey]%}"
VCS_FG="%{$fg[black]%}"
VCSDIRTY_FG="%{$fg[red]%}"
RESET_COLOR="%{$reset_color%}"

# change path color to red if root
[[ $UID -eq 0 ]] && current_path="$ROOT_PATH_FG%~ $RESET_COLOR" || current_path="$PATH_FG%~ $RESET_COLOR" 

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git hg
zstyle ':vcs_info:git*' formats "%b$RC"

git_branch() {
  # check if we're in a git repo
  [[ "$(command git rev-parse --is-inside-work-tree 2>/dev/null)" == "true" ]] || return
  # check if it's dirty
  command test -n "$(git status --porcelain --ignore-submodules -uno)"
  (($? == 0)) && echo "$VCSDIRTY_FG *$VCS_FG$vcs_info_msg_0_$RESET_COLOR" || echo " $VCS_FG$vcs_info_msg_0_$RESET_COLOR"
}

precmd() {
    vcs_info
    local preprompt="$current_path`git_branch`"
    print ""
    print -P $preprompt
}

setopt prompt_subst

PROMPT="%{$fg[red]%}>$RESET_COLOR "
