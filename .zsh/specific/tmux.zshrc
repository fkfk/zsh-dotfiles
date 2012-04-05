_LOADED_SPECIFIC_TMUX=1

# tmux wrapper for Mac OSX
# base: https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard
function tmuxx() {
  case $# in
    0)
      if [[ ( $OSTYPE == darwin* ) && ( -x $(which tmux 2>/dev/null) ) && ( -x $(which reattach-to-user-namespace 2>/dev/null ) ) ]]; then
        conf=$(cat $HOME/.tmux.conf <(echo 'set-option -g default-command "reattach-to-user-namespace -l $SHELL"'))
        tmux attach || tmux -f <(echo "$conf") new-session
      else
        tmux attach || tmux
      fi
    ;;
    *) tmux $*;;
  esac
}
alias tmux="tmuxx"
