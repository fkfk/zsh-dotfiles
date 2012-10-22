_LOADED_SPECIFIC_TMUX=1

if [ "$ENABLE_WINDOW_NAME_PWD" -eq 1 ]; then
  add-zsh-hook chpwd _set_tmux_window_name_pwd
fi

function _set_tmux_window_name_pwd() {
  if [ $TMUX ]; then
    current=$(print -P "%~")
    if [ $current = "~" ]; then
      current='$HOME'
    fi
    if [ "`git ls-files 2>/dev/null`" -a -n "$_LOADED_SPECIFIC_GIT" ]; then
      current="$current:$GIT_CURRENT_BRANCH"
    fi
    tmux rename-window $current
  fi
}

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
