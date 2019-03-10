# place at the end of shell configuration file

# check if the environment has been set already to not modify the path again
# for example, when config is sourced, the shell is replaced or a subshell is
# started
if [ -z "$PYENV_ROOT" ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"

  if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
  fi
fi

