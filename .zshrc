autoload -U compinit
compinit

autoload -U colors
colors

# 必須functionのロード
export ADD_FUNC_DIR=$HOME/.zsh/scripts
source $ADD_FUNC_DIR/array_fnc.sh # 後述の組み込み関数でarray_fnc.sh内で定義した関数が必須となる

setopt auto_pushd
setopt hist_ignore_dups
setopt list_packed
setopt correct

unset PS1

# 組み込み関数で使う変数
PRECMD_LIST=()
CHPWD_LIST=()

# cddの設定
export CDD_PWD_FILE=$HOME/.cdd_pwd_list
export ENABLE_CDD=1

PROMPT="%{[32m%}>%{[m%}%{[m%} "
RPROMPT="%{[32m%}[%/]%{[m%}"

#環境変数セット
export LANG=ja_JP.UTF-8
export EDITOR='vim'
export PAGER='less'

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

function precmd(){
  for cmd in $PRECMD_LIST; do
    eval $cmd
  done
}

function chpwd(){
  for cmd in $CHPWD_LIST; do
    eval $cmd
  done
}
