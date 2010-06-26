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
export JAVA_OPTIONS="-Dfile.encoding=UTF-8" # MacのJDK6のデフォルトエンコーディングがSJISなのでその対策

#Go用の設定
export GOROOT=/opt/go
if test -d $GOROOT; then
  # $GOOSの判別用
  case `uname` in
    Darwin)
      export GOOS=darwin
    ;;
    Linux)
      export GOOS=linux
    ;;
    *)
    ;;
  esac
  # $GOARCHの判別用/x86_64は未テスト
  case `uname -p` in
    x86_64)
      export GOARCH=amd64
    ;;
    arm)
      export GOARCH=arm
    ;;
    *)
      export GOARCH=386
    ;;
  esac
  export GOBIN=$GOROOT/bin
  export PATH=$PATH:$GOBIN
fi

GEM_BIN_DIR=""
if [ "`gem -v 2>/dev/null`" ]; then
  export PATH=$PATH:`ruby -rubygems -e "puts Gem.path.map{|path| \"#{path}/bin\"}.join(':')"`
fi

if [ "`gem1.9.1 -v 2>/dev/null`" ]; then
  export PATH=$PATH:`ruby1.9.1 -rubygems -e "puts Gem.path.map{|path| \"#{path}/bin\"}.join(':')"`
fi

if [ "`gem1.8 -v 2>/dev/null`" ]; then
  export PATH=$PATH:`ruby1.8 -rubygems -e "puts Gem.path.map{|path| \"#{path}/bin\"}.join(':')"`
fi

if [ "`gem1.9 -v 2> /dev/null`" ];then
  export PATH=$PATH:`ruby1.9 -rubygems -e "puts Gem.path.map{|path| \"#{path}/bin\"}.join(':')"`
fi

# jrubyのせいでshell起動が遅くなっているため一旦消しとく
#if [ "`jgem -v 2> /dev/null`" ];then
#  export PATH=$PATH:`jgem env gempath`
#fi

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
if test -d "/opt/appengine-java-sdk"; then
  export PATH=$PATH:/opt/appengine-java-sdk/bin
fi

if test -d "/opt/android-sdk"; then
  export PATH=$PATH:/opt/android-sdk/tools
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

#source-highlightを通してlvをsyntax highlight対応させる
function lvc() {
  source-highlight -f esc -o STDOUT $1 | lv -c
}

# rvm-install added line:
if [[ -s $HOME/.rvm/scripts/rvm ]] ; then
  source $HOME/.rvm/scripts/rvm
fi
