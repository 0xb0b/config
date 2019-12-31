export FZF_DEFAULT_OPTS='--height 40% --multi --layout=reverse'
# find files under current directory
export FZF_DEFAULT_COMMAND='fd --hidden --type f'
# find files under current directory and append after cursor
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# find any directory and cd
export FZF_ALT_C_COMMAND='fd --hidden --type d . /'
export FZF_COMPLETION_TRIGGER='//'

