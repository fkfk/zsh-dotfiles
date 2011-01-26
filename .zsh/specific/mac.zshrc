# カレントディレクトリの絶対パスをクリップボードにコピー
source $HOME/.zsh/scripts/pwdcopy.zsh

#MacPortsの設定
export PATH=/opt/local/bin:/opt/local/sbin/:/usr/local/bin:$PATH
export MANPATH=/opt/local/man:$MANPATH
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/opt/local/lib/pkgconfig
export XDG_DATA_DIRS=/opt/local/share

# MacのJDK6のデフォルトエンコーディングがSJISなのでその対策
export JAVA_OPTIONS="-Dfile.encoding=UTF-8" 

# cddの設定
export CDD_PWD_FILE=$HOME/.cdd_pwd_list

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

if test -e "/opt/local/bin/gnutar"; then
  alias tar='gnutar'
fi

#port searchに--lineオプション追加をデフォルトに
function port() {
  case $1 in
    search) /opt/local/bin/port search --line $2;;
    *) /opt/local/bin/port $*;;
  esac
}

