#port searchに--lineオプション追加をデフォルトに
function port() {
  case $1 in
    search) /opt/local/bin/port search --line $2;;
    *) /opt/local/bin/port $*;;
  esac
}

