# python3 venv management

export VENVDIR=$HOME/.python_venv

mkvenv() {
  if [ -z "$1" ]
    then
      echo "usage: mkvenv <name>"
  else
    python3 -m venv --copies $VENVDIR/"$1"
  fi
}

lsvenv() {
  ls $VENVDIR -1
}

avenv() {
  if [ -z "$1" ]
    then
      echo "usage: avenv <name>"
  else
    source $VENVDIR/"$1"/bin/activate
  fi
}

rmvenv() {
  if [ -z "$1" ]
    then
      echo "usage: rmvenv <name>"
  else
    deactivate 2>/dev/null
    rm -rf $VENVDIR/"$1"
  fi
}

