
# https://datagrok.org/python/activate/
# instead of "source <env path>/bin/activate"
# start a subshell for the first env and replace the shell when env is changed

# TODO remove unneeded quotes

export ENVDIR="$HOME/.env"
if [ ! -d "$ENVDIR" ]; then
  mkdir $ENVDIR
fi

export NVIM_ENVDIR="$ENVDIR/nvim"
py_envdir="$ENVDIR/python"


e() {
  if [ -z "$NVIM_ENVNAME" ]; then
    nvim $1
  else
    if [ -f $NVIM_ENVDIR/$NVIM_ENVNAME/session.vim ]; then
      nvim -u $NVIM_ENVDIR/init.vim -S $NVIM_ENVDIR/$NVIM_ENVNAME/session.vim $1
    else
      nvim -u $NVIM_ENVDIR/init.vim $1
    fi
  fi
}

getname() {
  envtype=$( dirname "$1" )
  envname=$( basename "$1" )
  echo $(basename "$envtype")/$envname
}

lsenv() {
  if [ -z "$1" ]; then
    # pipe to xargs to list only names without path
    # ls "$ENVDIR/"* | xargs -n 1 basename
    find $ENVDIR -maxdepth 2 -mindepth 2 -type d
  elif [ "$1" = "nvim" ] && [ -d "$NVIM_ENVDIR" ]; then
    ls "$NVIM_ENVDIR" -1
  elif [ "$1" = "py" ] && [ -d "$py_envdir" ]; then
    ls "$py_envdir" -1
  fi
}

mkenv() {
  if [ -z "$1" ]; then
    echo "make environment"
    echo "usage: mkenv [<type>/]<name> [<parameters>]"
    echo "types: nvim (default), python"
    echo "vim parameter: project root path (if not present then current dir is used)"
    return 0
  fi

  envname=$( basename "$1" )
  envtype=$( dirname "$1" )
  if [ "$envtype" = "." ] || [ "$envtype" = "nvim" ]; then
    envdir="$NVIM_ENVDIR"
  elif [ "$envtype" = "python" ]; then
    envdir="$py_envdir"
  else
    echo "unsupported environment type (can be [nvim], python)"
    return 0
  fi

  if [ ! -d "$envdir" ]; then
    mkdir "$envdir"
  fi

  if [ -d "$envdir/$envname" ]; then
    echo "environment ($1) already exists"
    return 0
  fi

  if [ "$envdir" = "$NVIM_ENVDIR" ]; then
    if [ -z "$2" ]; then
      projroot="$( pwd )"
    else
      if [ -d "$2" ]; then
        # expand to full path
        # https://stackoverflow.com/a/13087801/3001041
        pushd "$2" >/dev/null
        projroot="$( pwd )"
        popd >/dev/null
      else
        echo "($2) does not exist!"
        return 127
      fi
    fi
    mkdir "$envdir/$envname"
# write environment nvim config file
cat <<EOF >"$envdir/$envname/init.vim"
let g:env_proj_root = "$projroot"

" add project configuration below.
" if the project config becomes big consider moving it to the separate file in
" the project repo under version control.
" and then source it here.

EOF
    echo "done"
    return 0
  fi

  if [ "$envdir" = "$py_envdir" ]; then
    python3 -m venv --copies "$envdir/$envname"
    echo "done"
  fi
}

aenv() {
  if [ -z "$1" ]; then
    echo "activate environment"
    echo "usage: aenv [<type>/]<name>"
    echo "types: nvim (default), python"
    return 0
  fi

  envname="$( basename "$1" )"
  envtype="$( dirname "$1" )"
  if [ "$envtype" = "." ] || [ "$envtype" = "nvim" ]; then
    envdir="$NVIM_ENVDIR"
  elif [ "$envtype" = "python" ]; then
    envdir="$py_envdir"
  else
    echo "unsupported environment type (can be [nvim], python)"
    return 0
  fi

  if [ ! -d "$envdir/$envname" ]; then
    echo "environment does not exist, create it first with mkenv"
    return 0
  fi

  if [ "$envdir" = "$NVIM_ENVDIR" ]; then
    if [ -z "$NVIM_ENVNAME" ]; then
      (
        # start subshell for the first environment
        export NVIM_ENVNAME="$envname"
        if [ -z "$ENVCONTEXT" ]; then
          export ENVCONTEXT="$envname"
        else
          export OLDCONTEXT="$ENVCONTEXT"
          export ENVCONTEXT="$OLDCONTEXT.$envname"
        fi
        exec $SHELL
      )
    else
      # change the environment
      export NVIM_ENVNAME="$envname"
      if [ -z "$OLDCONTEXT" ]; then
        export ENVCONTEXT="$envname"
      else
        export ENVCONTEXT="$OLDCONTEXT.$envname"
      fi
    fi
    return 0
  fi

  if [ "$envdir" = "$py_envdir" ]; then
    if [ -z "$PY_ENVNAME" ]; then
      (
        # save original path at activation of the first env to correctly handle the case when
        # env is later changed from within this env
        export PY_ENVNAME="$envname"
        if [ -z "$ENVCONTEXT" ]; then
          export ENVCONTEXT="$envtype/$envname"
        else
          export OLDCONTEXT="$ENVCONTEXT"
          export ENVCONTEXT="$OLDCONTEXT.$envtype/$envname"
        fi
        unset PYTHONHOME
        export ORIGINAL_PATH="$PATH"
        export PATH="$envdir/$envname/bin:$ORIGINAL_PATH"
        exec $SHELL
      )
    else
      export PY_ENVNAME="$envname"
      if [ -z "$OLDCONTEXT" ]; then
        export ENVCONTEXT="$envtype/$envname"
      else
        export ENVCONTEXT="$OLDCONTEXT.$envtype/$envname"
      fi
      unset PYTHONHOME
      export PATH="$envdir/$envname/bin:$ORIGINAL_PATH"
    fi
  fi
}

rmenv() {
  if [ -z "$1" ]; then
    echo "remove environment"
    echo "usage: rmenv [<type>/]<name>"
    echo "types: nvim (default), python"
    return 0
  fi

  envname="$( basename "$1" )"
  envtype="$( dirname "$1" )"
  if [ "$envtype" = "." ] || [ "$envtype" = "vim" ]; then
    envdir="$NVIM_ENVDIR"
  elif [ "$envtype" = "python" ]; then
    envdir="$py_envdir"
  else
    echo "unsupported environment type (can be [nvim], python)"
    return 0
  fi

  if [ -d "$envdir/$envname" ]; then
    rm -rf "$envdir/$envname"
    echo "done"
    if [ "$NVIM_ENVNAME" = "$envname" ] || [ "$PY_ENVNAME" = "$envname" ]; then
      # if removing the active env then quit it
      exit 0
    fi
  else
    echo "environment ($1) not found, nothing to remove"
  fi
}

