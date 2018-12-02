# Created by newuser for 5.0.7
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename '/home/xbob/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1024
SAVEHIST=1024
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install

# no duplicate lines in history
setopt HIST_IGNORE_DUPS

# https://nixtricks.wordpress.com/2009/12/03/zsh-print-the-full-command-line-history/
#> h prints the full commands history (equiv to > history 1)
#> h cmd prints the history grepped for cmd 
h() { if [ -z "$*" ]; then history 1; else history 1 | grep "$@"; fi; }

# needed by RubyGems
GEM_HOME=$(ruby -e 'print Gem.user_dir')
PATH="$GEM_HOME/bin:$PATH"
# make Bundler install gems per-user into ~/.gem
export GEM_HOME

source prompt.zsh
