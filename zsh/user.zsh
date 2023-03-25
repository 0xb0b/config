# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY
# adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY
# do not store duplicates
setopt HIST_IGNORE_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS

. ~/config/zsh/alias.zsh

# . ~/config/bash/ssh.bash

. ~/proj/envs/envs.sh

#. ~/config/bash/fzf.bash

. ~/config/zsh/prompt.zsh

. ~/config/zsh/pyenv.zsh


EDITOR=nvim

