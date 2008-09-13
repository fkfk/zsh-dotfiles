autoload -U compinit
compinit

source $HOME/.zsh/scripts/search.sh
setopt auto_pushd
setopt hist_ignore_dups

unset PS1

RPROMPT="%{[32m%}[%/]%{[m%}"
PROMPT="%{[32m%}>%{[m%}%{[m%} "

export LANG=ja_JP.UTF-8
export JRUBY_HOME=/opt/jruby
export PATH=/usr/local/bin:/opt/local/bin:/opt/local/sbin/:$JRUBY_HOME/bin:/opt/flex3/bin:$PATH
export MANPATH=/opt/local/man:$MANPATH
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/opt/local/lib/pkgconfig
export GIT_EDITOR='vim'

alias ll='ls -l'
alias la='ls -a'
alias lla='ls -al'
alias sshx='ssh -X'
alias :q='exit'
alias reload='exec zsh'

alias sqlite='sqlite3'

bindkey -v
