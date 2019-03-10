# python3 venv management

export VENVDIR="$HOME/.python_venv"
if [ ! -d "$VENVDIR" ]; then
  mkdir "$VENVDIR"
fi

lsvenv() {
  ls "$VENVDIR" -1
}

mkvenv() {
  if [ -z "$1" ]; then
    echo "usage: mkvenv <name>"
  elif [ -d "$VENVDIR/$1" ]; then
    echo "virtual environment ($1) already exists"
  else
    python3 -m venv --copies "$VENVDIR/$1"
    echo "done"
  fi
}

avenv() {
  if [ -z "$1" ]; then
    echo "usage: avenv <name>"
  else
    # if virtual env does not exist then create it first
    if [ ! -d "$VENVDIR/$1" ]; then
      echo "creating virtual environment ($1) ..."
      python3 -m venv --copies "$VENVDIR/$1"
    fi
# instead of "source $VENVDIR/"$1"/bin/activate"
# https://datagrok.org/python/activate/
    # start a subshell for the first virtual env and replace the shell when
    # virtual env is changed
    if [ -z "$VIRTUAL_ENV" ]; then
      (
        # save oiginal path to correctly handle the case when virtual env is
        # changed from within this virtual env
        export _ORIGINAL_PATH="$PATH"
        export VIRTUAL_ENV="$VENVDIR/$1"
        export PATH="$VIRTUAL_ENV/bin:$_ORIGINAL_PATH"
        unset PYTHONHOME
        exec $SHELL
      )
    else
        export VIRTUAL_ENV="$VENVDIR/$1"
        export PATH="$VIRTUAL_ENV/bin:$_ORIGINAL_PATH"
        unset PYTHONHOME
        exec $SHELL
    fi
  fi
}

rmvenv() {
  if [ -z "$1" ]; then
    echo "usage: rmvenv <name>"
  elif [ -d "$VENVDIR/$1" ]; then
    rm -rf "$VENVDIR/$1"
    echo "done"
    if [ "$(basename "$VIRTUAL_ENV")" = "$1" ] ; then
      # if removing the active virtual env then quit it also
      exit 0
    fi
  else
    echo "virtual env ($1) not found, nothing to remove"
  fi
}

