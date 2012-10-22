_LOADED_SPECIFIC_MAC=1
#MacPortsの設定
# /etc/paths に追記して運用中なのでしばらくコメントアウト
#export PATH=/opt/local/bin:/opt/local/sbin/:/usr/local/bin:$PATH
#export MANPATH=/opt/local/man:$MANPATH
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/opt/local/lib/pkgconfig
export XDG_DATA_DIRS=/opt/local/share

# MacのJDK6のデフォルトエンコーディングがSJISなのでその対策
export JAVA_OPTIONS="-Dfile.encoding=UTF-8" 

#appengine-java-sdkがあったらそれを追加
if test -d "/opt/appengine-java-sdk"; then
  push path /opt/appengine-java-sdk/bin
  export PATH
fi

#android-sdkがあったらそれを追加
#MacPortsで入れていたらそれを、入れていなければ手動で導入しているものを追加
if test -d "/opt/local/share/java/android-sdk-macosx"; then
  push path /opt/local/share/java/android-sdk-macosx/tools
  push path /opt/local/share/java/android-sdk-macosx/platform-tools
  export PATH
elif test -d "/opt/android-sdk"; then
  push path /opt/android-sdk/tools
  push path /opt/android-sdk/platform-tools
  export PATH
fi

#gnutarがあったらtarと置き換え
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

function volume() {
  osascript -e "set volume $1"
}
