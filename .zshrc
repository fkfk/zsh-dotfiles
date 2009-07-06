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

setopt auto_pushd
setopt hist_ignore_dups
setopt list_packed
setopt correct

unset PS1

case "${TERM}" in
  #MacVimで:shしたときの最低限のプロンプト設定
  dumb)
    PROMPT="> "
  ;;
  *) 
    PROMPT="%{[32m%}>%{[m%}%{[m%} "
  ;;
esac

#環境変数セット
export LANG=ja_JP.UTF-8
export PATH=/opt/local/bin:/opt/local/sbin/:/usr/local/bin:$PATH
export MANPATH=/opt/local/man:$MANPATH
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/opt/local/lib/pkgconfig
export EDITOR='vim'
export GIT_EDITOR='vim'
export PAGER='less'
export XDG_DATA_DIRS=/opt/local/share
export GISTY_DIR=$HOME/src/gists
export RUBYOPT='-rubygems'

#jrubyディレクトリがあったらそれを追加
#if test -d "/opt/jruby"; then
#  export JRUBY_HOME=/opt/jruby
#  export PATH=$PATH:$JRUBY_HOME/bin
#fi

#flex3ディレクトリがあったらそれを追加
if test -d "/opt/flex3"; then
  export PATH=$PATH:/opt/flex3/bin
fi

#appengine-java-sdkがあったらそれを追加
if test -d "/opt/appengine-java-sdk-1.2.0"; then
  export PATH=$PATH:/opt/appengine-java-sdk-1.2.0/bin
fi

if test -d "$HOME/.gem/"; then
  GEM_BIN_DIR=$HOME/.gem/ruby/1.9.1/bin:$HOME/.gem/ruby/1.8/bin:$HOME/.gem/jruby/1.8/bin
  export PATH=$PATH:$GEM_BIN_DIR
fi

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

if test -e "/opt/local/bin/gnutar"; then
  alias tar='gnutar'
fi

#viモード
bindkey -v

#gitブランチ名取得
function _set_env_git_current_branch() {
  GIT_CURRENT_BRANCH=$( git branch 2> /dev/null | grep '^\*' | cut -b 3- )
}

#gitブランチ内の場合に右プロンプトにgitブランチ名を表示
function _update_rprompt () {
  if [ "`git ls-files 2>/dev/null`" ]; then
    RPROMPT="%{[32m%}[%/:$GIT_CURRENT_BRANCH]%{[m%}"
  else
    RPROMPT="%{[32m%}[%/]%{[m%}"
  fi
}

#screenのwindows名にカレントディレクトリ名を表示
function _set_window_name_pwd() {
  if [ "$TERM = screen" ]; then
    current=$(print -P "%~")
    if [ $current = "~" ]; then
      current='$HOME'
    fi
    echo -ne "\ek$(basename $current)\e\\"
  fi
}

#screenのwindow名に現在実行中のコマンド名を表示
function _set_window_name_cmd() {
  if [ $TERM = "screen" ]; then
    echo -ne "\ek$cmd\e\\"
  fi
}
      
function precmd() {
  #gitブランチ表示用
  _set_env_git_current_branch
  _update_rprompt
  #screenのwindow名にカレントディレクトリ名を表示
  _set_window_name_pwd
}

function preexec() {
  #screenのwindow名に現在実行中のコマンド名を表示
  cmd=${1%% *}
  _set_window_name_cmd
}
     
function chpwd() {
  #cdd用
  _reg_pwd_screennum
  #gitブランチ表示用
  _set_env_git_current_branch
  _update_rprompt
  #screenのwindow名を変更
  #_set_window_name_pwd
}

#port searchに--lineオプション追加をデフォルトに
function port() {
  case $1 in
    search) /opt/local/bin/port search --line $2;;
    *) /opt/local/bin/port $*;;
  esac
}

#source-highlightを通してlvをsyntax highlight対応させる
function lvc() {
  source-highlight -f esc -o STDOUT $1 | lv -c
}
