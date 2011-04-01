_LOADED_SPECIFIC_SCREEN=1
push PRECMD_LIST "_set_window_name_pwd"
push CHPWD_LIST "_set_window_name_pwd"

function _set_window_name_pwd() {
  if [ $TERM = "screen" ]; then
    current=$(print -P "%~")
    if [ $current = "~" ]; then
      current='$HOME'
    fi
    if [ "`git ls-files 2>/dev/null`" -a -n "$_LOADED_SPECIFIC_GIT" ]; then
      current="$current:$GIT_CURRENT_BRANCH"
    fi
    echo -ne "\ek$(basename $current)\e\\"
  fi
}

