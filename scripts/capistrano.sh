_cap () {
  compadd `cap -T | grep '^cap ' | sed 's/^cap //' | sed 's/ .*//' | xargs`
}
compdef _cap cap
