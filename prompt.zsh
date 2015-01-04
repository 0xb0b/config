# made from Pure by Sindre Sorhus
# https://github.com/sindresorhus/pure
# MIT License


# fastest possible way to check if repo is dirty
git_dirty() {
	# check if we're in a git repo
  [[ "$(command git rev-parse --is-inside-work-tree 2>/dev/null)" == "true" ]] || return
	# check if it's dirty
	command test -n "$(git status --porcelain --ignore-submodules -uno)"
	(($? == 0)) && echo '*'
}


autoload -U colors && colors

# show username in red if root
[[ $UID -eq 0 ]] && userathost='%{$fg[red]%}%n%{$reset_color%}@%m' || userathost='%n@%m'

current_path='%{$fg[green]%}%~%{$reset_color%}'

prompt_symbol='%{$fg_bold[red]%}>%{$reset_color%}%b'

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git hg
zstyle ':vcs_info:git*' formats "%{$fg[yellow]%}%b%{$reset_color%}"

precmd() {
    vcs_info
	local preprompt="$userathost::$current_path `git_dirty`$vcs_info_msg_0_"
	print ""
	print -P $preprompt
}

setopt prompt_subst

PROMPT="$prompt_symbol "
