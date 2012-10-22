autoload -U compinit
compinit

autoload -U colors
colors

autoload -Uz add-zsh-hook
autoload -U edit-command-line


# 必須functionのロード
ZSHRC_BASEDIR=`dirname \`readlink -f $0\``
export SCRIPTS_DIR=$ZSHRC_BASEDIR/scripts
export SPECIFIC_DIR=$ZSHRC_BASEDIR/specific
source $SCRIPTS_DIR/load_fnc.sh # 独自定義関数群・環境設定を読み込む関数を定義
load_script array_fnc # 後述の組み込み関数でarray_fnc.sh内で定義した関数が必須となる

setopt auto_pushd
setopt hist_ignore_dups
setopt list_packed
setopt correct

unset PS1

# cddの設定
export CDD_PWD_FILE=$HOME/.cdd_pwd_list
export ENABLE_CDD=1

# RPROMPTの設定
if [ $TMUX ]; then
  export ENABLE_RPROMPT_PATH=0
  export ENABLE_WINDOW_NAME_PWD=1
  unset RPROMPT
else
  export ENABLE_RPROMPT_PATH=1
fi

PROMPT="%{[32m%}>%{[m%}%{[m%} "
if [ $ENABLE_RPROMPT_PATH -eq 1 ]; then
  RPROMPT="%{[32m%}[%/]%{[m%}"
fi

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

# コマンドラインをエディタで編集する
zle -N edit-command-line
bindkey '^Ee' edit-command-line

# クオート
bindkey '^Xq' quote-line
bindkey '^XQ' quote-region

# viモードの表示
source $SCRIPTS_DIR/vi_mode_status_bar.sh

# ディレクトリ移動のbind
source $SCRIPTS_DIR/cd_fnc.sh
zle -N cd-up
zle -N cd-last
bindkey '^X\^' cd-up
bindkey '^X\-' cd-last
