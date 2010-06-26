#source-highlightを通してlvをsyntax highlight対応させる
function lvc() {
  source-highlight -f esc -o STDOUT $1 | lv -c
}
