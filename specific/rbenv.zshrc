_LOADED_SPECIFIC_RBENV=1
if [ $RBENV_ROOT ]; then
  push path $RBENV_ROOT/bin
  export PATH
  eval "$(rbenv init - zsh)"
elif [ -d /usr/local/rbenv ]; then
  export RBENV_ROOT="/usr/local/rbenv"
  push path /usr/local/rbenv/bin
  export PATH
  eval "$(rbenv init - zsh)"
elif [ -d $HOME/.rbenv ]; then
  export RBENV_ROOT="$HOME/.rbenv"
  push path $HOME/.rbenv/bin
  export PATH
  eval "$(rbenv init - zsh)"
fi
