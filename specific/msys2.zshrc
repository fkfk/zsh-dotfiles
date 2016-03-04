# vim: set ft=zsh :

# via: https://github.com/Alexpux/MSYS2-packages/issues/38#issuecomment-150131217
drives=$(mount | sed -rn 's#^[A-Z]: on /([a-z]).*#\1#p' | tr '\n' ' ')
zstyle ':completion:*' fake-files /: "/:$drives"
unset drives

alias ssh='TERM=xterm ssh'
