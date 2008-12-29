autoload -U compinit
compinit

#functionの設定
source $HOME/.zsh/scripts/cdd.sh
source $HOME/.zsh/scripts/search.sh
source $HOME/.zsh/scripts/merb-gen.sh
source $HOME/.zsh/scripts/rake.sh
source $HOME/.zsh/scripts/capistrano.sh

setopt auto_pushd
setopt hist_ignore_dups

unset PS1

case "${TERM}" in
  #MacVimで:shしたときの最低限のプロンプト設定
  dumb)
    PROMPT="> "
  ;;
  *) 
    RPROMPT="%{[32m%}[%/]%{[m%}"
    PROMPT="%{[32m%}>%{[m%}%{[m%} "
  ;;
esac

#環境変数セット
export LANG=ja_JP.UTF-8
export JRUBY_HOME=/opt/jruby
export PATH=/usr/local/bin:/opt/local/bin:/opt/local/sbin/:$JRUBY_HOME/bin:/opt/flex3/bin:/usr/local/sbin:$PATH
export MANPATH=/opt/local/man:$MANPATH
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/opt/local/lib/pkgconfig
export GIT_EDITOR='vim'

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

#cdd用設定
function chpwd() {
  _reg_pwd_screennum
}
