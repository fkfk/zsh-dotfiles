autoload -U compinit
compinit

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

alias ll='ls -l'
alias la='ls -a'
alias lla='ls -al'
alias sshx='ssh -X'
alias :q='exit'
alias reload='exec zsh'

alias vim='/opt/local/bin/vim'
alias sqlite='sqlite3'
alias ruby='/opt/local/bin/ruby'
alias gem='/opt/local/bin/gem'

bindkey -v

case "${TERM}" in
xterm*)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}\007"
    }
    ;;
esac

case "${HOST}" in
*book.local)
    precmd() {
    echo -ne "\033]0;${USER}@localhost\007"
    }
esac

function rm() {
  mv $* ~/.Trash
}

if [ $SHLVL = 1 ];then
  screen -U
fi
