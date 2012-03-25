_LOADED_SPECIFIC_GIT=1
unshift PRECMD_LIST "_set_env_git_current_branch"
push PRECMD_LIST "_update_rprompt_git_repo"
unshift CHPWD_LIST "_set_env_git_current_branch"
push CHPWD_LIST "_update_rprompt_git_repo"

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
  #gitブランチ内の場合に右プロンプトにgitブランチ名を表示
  if [ "`git ls-files 2>/dev/null`" ]; then
    RPROMPT="%{[32m%}[%/:$GIT_CURRENT_BRANCH]%{[m%}"
  else
    RPROMPT="%{[32m%}[%/]%{[m%}"
  fi
}

