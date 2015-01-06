# made from Pure by Sindre Sorhus
# https://github.com/sindresorhus/pure
# MIT License


# fastest possible way to check if repo is dirty
git_dirty() {
	# check if we're in a git repo
  [[ "$(command git rev-parse --is-inside-work-tree 2>/dev/null)" == "true" ]] || return
	# check if it's dirty
	command test -n "$(git status --porcelain --ignore-submodules -uno)"
	(($? == 0)) && echo '%{$fg[red]%}*%{$reset_color%}' || echo '%{$fg[green]%}*%{$reset_color%}'
}


autoload -U colors && colors

eval USERNAME_COLOR='%{$fg[blue]%}'
eval ROOT_COLOR='%{$fg[red]%}'
eval PATH_COLOR='%{$fg[green]%}'
eval PROMPT_COLOR='%{$fg_bold[red]%}'
#eval VCS_COLOR='%{$fg[magenta]%}'
eval RC='%{$reset_color%}'

# show username in red if root
[[ $UID -eq 0 ]] && userathost='$ROOT_COLOR%n$RC%B@%b$USERNAME_COLOR%m$RC' || userathost="$USERNAME_COLOR%n$RC%B@%b$USERNAME_COLOR%m$RC"

current_path='$PATH_COLOR${PWD/#$HOME/~}$RC'

prompt_symbol='$PROMPT_COLOR>$RC%b'

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git hg
zstyle ':vcs_info:git*' formats "%b$RC"

precmd() {
    vcs_info
    local preprompt="$userathost $current_path `git_dirty`%B$vcs_info_msg_0_%b"
    print ""
    print -P $preprompt
}

setopt prompt_subst

PROMPT="$prompt_symbol "
