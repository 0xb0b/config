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

source prompt.zsh
