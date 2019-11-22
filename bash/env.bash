
# environments management

# https://datagrok.org/python/activate/
# instead of "source <env path>/bin/activate"
# start a subshell for the first env and replace the shell when env is changed

export ENVDIR="$HOME/.env"
if [ ! -d "$ENVDIR" ]; then
  mkdir "$ENVDIR"
fi

export NVIMCONFIG="$HOME/.config/nvim/init.vim"

nvimenvdir="$ENVDIR/nvim"
pyenvdir="$ENVDIR/python"


lenv() {
  if [ -z "$1" ]; then
    # pipe to xargs to list only names without path
    ls "$ENVDIR/"* | xargs -n 1 basename
  elif [ "$1" = "nvim" ] && [ -d "$nvimenvdir" ]; then
    ls "$nvimenvdir" -1
  elif [ "$1" = "py" ] && [ -d "$pyenvdir" ]; then
    ls "$pyenvdir" -1
  fi
}

menv() {
  if [ -z "$1" ]; then
    echo "make environment"
    echo "usage: menv [<type>/]<name> [<parameters>]"
    echo "types: nvim (default), python"
    echo "vim parameter: project root path (if not present then current dir is used)"
    return 0
  fi

  envname="$( basename "$1" )"
  envtype="$( dirname "$1" )"
  if [ "$envtype" = "." ] || [ "$envtype" = "nvim" ]; then
    envdir="$nvimenvdir"
  elif [ "$envtype" = "python" ]; then
    envdir="$pyenvdir"
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

  if [ "$envdir" = "$nvimenvdir" ]; then
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
# write default nvim config file
cat <<EOF >"$envdir/$envname/init.vim"
source $( readlink $NVIMCONFIG )
let g:env_proj_name = "$envname"
let g:env_proj_root = "$projroot"

" add project configuration below
EOF
    echo "done"
    return 0
  fi

  if [ "$envdir" = "$pyenvdir" ]; then
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
    envdir="$nvimenvdir"
  elif [ "$envtype" = "python" ]; then
    envdir="$pyenvdir"
  else
    echo "unsupported environment type (can be [nvim], python)"
    return 0
  fi

  # if environment does not exist then create it first
  if [ ! -d "$envdir/$envname" ]; then
    echo "environment does not exist, create it first with menv"
    return 0
  fi

  if [ "$envdir" = "$nvimenvdir" ]; then
    if [ -z "$VIMENVNAME" ]; then
      # TODO what if init.vim is not a symlink?
      export ORIGINAL_INIT_PATH="$( readlink $NVIMCONFIG )"
      (
        # start subshell for the first environment
        export VIMENVNAME="$envname"
        if [ -z "$ENVCONTEXT" ]; then
          export ENVCONTEXT="$envname"
        else
          export OLDCONTEXT="$ENVCONTEXT"
          export ENVCONTEXT="$OLDCONTEXT.$envname"
        fi
        ln -sf "$envdir/$envname/init.vim" $NVIMCONFIG
        exec $SHELL
      )
      ln -sf $ORIGINAL_INIT_PATH $NVIMCONFIG
    else
      # change the environment
      export VIMENVNAME="$envname"
      if [ -z "$OLDCONTEXT" ]; then
        export ENVCONTEXT="$envname"
      else
        export ENVCONTEXT="$OLDCONTEXT.$envname"
      fi
      ln -sf "$envdir/$envname/init.vim" $NVIMCONFIG
    fi
    return 0
  fi

  if [ "$envdir" = "$pyenvdir" ]; then
    if [ -z "$PYENVNAME" ]; then
      (
        # save original path at activation of the first env to correctly handle the case when
        # env is later changed from within this env
        export PYENVNAME="$envname"
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
      export PYENVNAME="$envname"
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

renv() {
  if [ -z "$1" ]; then
    echo "remove environment"
    echo "usage: renv [<type>/]<name>"
    echo "types: nvim (default), python"
    return 0
  fi

  envname="$( basename "$1" )"
  envtype="$( dirname "$1" )"
  if [ "$envtype" = "." ] || [ "$envtype" = "vim" ]; then
    envdir="$nvimenvdir"
  elif [ "$envtype" = "python" ]; then
    envdir="$pyenvdir"
  else
    echo "unsupported environment type (can be [nvim], python)"
    return 0
  fi

  if [ -d "$envdir/$envname" ]; then
    rm -rf "$envdir/$envname"
    echo "done"
    if [ "$VIMENVNAME" = "$envname" ] || [ "$PYENVNAME" = "$envname" ]; then
      # if removing the active env then quit it
      exit 0
    fi
  else
    echo "environment ($1) not found, nothing to remove"
  fi
}

