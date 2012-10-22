function _load() {
  fdir=$1
  script=""
  if [ -f "$fdir/$2" ]; then
    script=$fdir/$2
  elif [ -f "$fdir/$2.sh" ]; then
    script=$fdir/$2.sh
  elif [ -f "$fdir/$2.zsh" ]; then
    script=$fdir/$2.zsh
  elif [ -f "$fdir/$2.zshrc" ]; then
    script=$fdir/$2.zshrc
  elif [ -f "$2" ]; then
    script=$2
  fi

  if [ -f "$script" ]; then
    source $script
  fi
  unset script
}

function _list() {
  if [ -d "$1" ]; then
    ls $1 | sed "s/\(.\+\)\.\(.\+\)/\1/"
  fi
}

function load_specific() {
  _load $SPECIFIC_DIR $1
}

function load_script() {
  _load $SCRIPTS_DIR $1
}

function list_specifics() {
  _list $SPECIFIC_DIR
}

function list_scripts() {
  _list $SCRIPTS_DIR
}
