# made from Pure by Sindre Sorhus
# https://github.com/sindresorhus/pure
# MIT License


# fastest possible way to check if repo is dirty
git_dirty() {
	# check if we're in a git repo
  [[ "$(command git rev-parse --is-inside-work-tree 2>/dev/null)" == "true" ]] || return
	# check if it's dirty
	command test -n "$(git status --porcelain --ignore-submodules -uno)"
	(($? == 0)) && echo '%{$fg[red]%}*%{$reset_color%}' || echo '%{$fg[green]%}*%{%$reset_color%}'
}


autoload -U colors && colors

eval USERNAME_COLOR='%{$fg[blue]%}'
eval PATH_COLOR='%{$fg[yellow]%}'
eval PROMPT_COLOR='%{$fg_bold[red]%}'
#eval VCS_COLOR='%{$fg[magenta]%}'

# show username in red if root
[[ $UID -eq 0 ]] && userathost='%{$fg[red]%}%n@$USERNAME_COLOR%m%{$reset_color%}' || userathost="$USERNAME_COLOR%n@%m%{$reset_color%}"

current_path='$PATH_COLOR%~%{$reset_color%}'

prompt_symbol='$PROMPT_COLOR>%{$reset_color%}%b'

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git hg
zstyle ':vcs_info:git*' formats "%b%{$reset_color%}"

precmd() {
    vcs_info
    local preprompt="$userathost $current_path `git_dirty`%B$vcs_info_msg_0_%b"
    print ""
    print -P $preprompt
}

setopt prompt_subst

PROMPT="$prompt_symbol "
