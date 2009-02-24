autoload -U compinit
compinit

#functionの設定
source $HOME/.zsh/scripts/cdd.sh
source $HOME/.zsh/scripts/search.sh
source $HOME/.zsh/scripts/merb-gen.sh
source $HOME/.zsh/scripts/rake.sh
source $HOME/.zsh/scripts/capistrano.sh
source $HOME/.zsh/scripts/sub.sh

setopt auto_pushd
setopt hist_ignore_dups

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
export JRUBY_HOME=/opt/jruby
export PATH=/opt/local/bin:/opt/local/sbin/:/usr/local/bin:$JRUBY_HOME/bin:/opt/flex3/bin:/usr/local/sbin:$PATH
export MANPATH=/opt/local/man:$MANPATH
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/opt/local/lib/pkgconfig
export EDITOR='vim'
export GIT_EDITOR='vim'
export XDG_DATA_DIRS=/opt/local/share

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
 
function precmd() {
  #gitブランチ表示用
  _set_env_git_current_branch
  _update_rprompt
}
     
function chpwd() {
  #cdd用
  _reg_pwd_screennum
  #gitブランチ表示用
  _set_env_git_current_branch
  _update_rprompt
}
