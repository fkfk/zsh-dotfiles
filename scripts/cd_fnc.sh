function cd-up() {
  echo
  cd ..
  zle reset-prompt
}

function cd-last() {
  echo
  cd -
  zle reset-prompt
}
