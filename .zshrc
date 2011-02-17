autoload -U compinit
compinit

autoload -U colors
colors

#functionの設定
source $HOME/.zsh/scripts/cdd.sh
source $HOME/.zsh/scripts/search.sh
source $HOME/.zsh/scripts/merb-gen.sh
source $HOME/.zsh/scripts/rake.sh
source $HOME/.zsh/scripts/capistrano.sh
source $HOME/.zsh/scripts/sub.sh
source $HOME/.zsh/scripts/psgrep.sh

setopt auto_pushd
setopt hist_ignore_dups
setopt list_packed
setopt correct

unset PS1

# cddの設定
export CDD_PWD_FILE=$HOME/.cdd_pwd_list

PROMPT="%{[32m%}>%{[m%}%{[m%} "

#環境変数セット
export LANG=ja_JP.UTF-8
export EDITOR='vim'
export GIT_EDITOR='vim'
export PAGER='less'
export GISTY_DIR=$HOME/src/gists

#alias設定
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -al'
alias sshx='ssh -X'
alias :q='exit'
alias :wq='screen -d'
alias :e='screen -r'
alias reload='exec zsh'
alias sqlite='sqlite3'

#viモード
bindkey -v
#viモード時にインサート位置を超えて削除が可能なように設定
zle -A .backward-kill-word vi-backward-kill-word
zle -A .backward-delete-char vi-backward-delete-char

#gitブランチ名取得
function _set_env_git_current_branch() {
  GIT_CURRENT_BRANCH=$( git branch 2> /dev/null | grep '^\*' | cut -b 3- )
}

function _update_rprompt () {
  #gitブランチ内の場合に右プロンプトにgitブランチ名を表示
  if [ "`git ls-files 2>/dev/null`" ]; then
    RPROMPT="%{[32m%}[%/:$GIT_CURRENT_BRANCH]%{[m%}"
  else
    RPROMPT="%{[32m%}[%/]%{[m%}"
  fi
}

function _set_window_name_pwd() {
  #screenのwindows名にカレントディレクトリ名を表示
  if [ $TERM = "screen" ]; then
    current=$(print -P "%~")
    if [ $current = "~" ]; then
      current='$HOME'
    fi
    if [ "`git ls-files 2>/dev/null`" ]; then
      current="$current:$GIT_CURRENT_BRANCH"
    fi
    echo -ne "\ek$(basename $current)\e\\"
  fi
}

function precmd() {
  #gitブランチ表示用
  _set_env_git_current_branch
  _update_rprompt
  #screenのwindow名にカレントディレクトリ名を表示
  _set_window_name_pwd
}

function chpwd() {
  #cdd用
  _reg_pwd_screennum
  #gitブランチ表示用
  _set_env_git_current_branch
  _update_rprompt
  #screenのwindow名を変更
  _set_window_name_pwd
}
