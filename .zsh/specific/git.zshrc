_LOADED_SPECIFIC_GIT=1
add-zsh-hook chpwd _set_env_git_current_branch
add-zsh-hook chpwd _update_rprompt_git_repo

export GIT_EDITOR='vim'
export GISTY_DIR=$HOME/src/gists

if [ -s "$HOME/.ssl/cacert.pem" ]; then
  export GISTY_SSL_CA=$HOME/.ssl/cacert.pem
fi

#gitブランチ名取得
function _set_env_git_current_branch() {
  GIT_CURRENT_BRANCH=$( git branch 2> /dev/null | grep '^\*' | cut -b 3- )
}

function _update_rprompt_git_repo () {
  if [ $ENABLE_RPROMPT_PATH -eq 1 ]; then
    #gitブランチ内の場合に右プロンプトにgitブランチ名を表示
    if [ "`git ls-files 2>/dev/null`" ]; then
      RPROMPT="%{[32m%}[%/:$GIT_CURRENT_BRANCH]%{[m%}"
    else
      RPROMPT="%{[32m%}[%/]%{[m%}"
    fi
  fi
}
