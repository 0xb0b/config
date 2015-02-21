# made from Pure by Sindre Sorhus
# https://github.com/sindresorhus/pure
# MIT License

# 256 colors in zsh
# based on
# P.C. Shyamshankar <sykora@lucentbeing.com>
# github.com/sykora/etc/blob/master/zsh/functions/spectrum/

SPECTRUM_TEXT=' hello world '

# Show all 256 colors with color number
function spectrum_ls() {
  for color in {000..255}; do
    print -P "$color: %{\033[38;5;${color}m%}$SPECTRUM_TEXT%{$reset_color%}"
  done
}

# Show all 256 colors where the background is set to specific color
function spectrum_bls() {
  for color in {000..255}; do
    print -P "%{\033[48;5;${color}m%} $color: $SPECTRUM_TEXT %{$reset_color%}"
  done
}

function spectrum_16() {
  for color in {00..15}; do
    print -P "$color: %{\033[38;5;${color}m%}$SPECTRUM_TEXT%{$reset_color%} %{\033[48;5;${color}m%}%{\033[38;5;08m%}$SPECTRUM_TEXT%{$reset_color%} %{\033[48;5;${color}m%}%{\033[38;5;07m%}$SPECTRUM_TEXT%{$reset_color%}"
  done
}


autoload -U colors && colors

FG="%{\033[38;5;08m%}"
USER_BG="%{\033[48;5;04m%}"
ROOT_FG="%{\033[38;5;01m%}"
PATH_BG="%{\033[48;5;03m%}"
PROMPT_FG="%{\033[38;5;01m%}"
VCS_BG="%{\033[48;5;12m%}"
VCS_FG="%{\033[38;5;08m%}"
VCSDIRTY_FG="%{\033[38;5;01m%}"
#VCSCLEAN_FG="%{\033[38;5;02m%}"
RESET="%{$reset_color%}"

# show username in red if root
[[ $UID -eq 0 ]] && userathost="%B$ROOT_FG %n@%m $RESET%b" || userathost="%B$USER_BG$FG %n@%m $RESET%b"

current_path="%B$PATH_BG$FG %~ $RESET%b"

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git hg
zstyle ':vcs_info:git*' formats "%b$RC"

# fastest possible way to check if repo is dirty
git_dirty() {
  command test -n "$(git status --porcelain --ignore-submodules -uno)"
  (($? == 0)) && echo "$VCS_BG$VCSDIRTY_FG *$RESET" || echo "$VCS_BG$VCSCLEAN_FG *$RESET"
}

git_branch() {
  # check if we're in a git repo
  [[ "$(command git rev-parse --is-inside-work-tree 2>/dev/null)" == "true" ]] || return
  # check if it's dirty
  command test -n "$(git status --porcelain --ignore-submodules -uno)"
  (($? == 0)) && echo "$VCSDIRTY_FG *$RESET%B$vcs_info_msg_0_%b" || echo "%B $vcs_info_msg_0_%b"
}

precmd() {
    vcs_info
    local preprompt="$userathost$current_path`git_branch`"
    print ""
    print -P $preprompt
}

setopt prompt_subst

PROMPT="%B%{$fg[red]%}>$RESET%b "
