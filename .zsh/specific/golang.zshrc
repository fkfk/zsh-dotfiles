_LOADED_SPECIFIC_GOLANG=1
#Go用の設定
export GOROOT=/opt/go
if test -d $GOROOT; then
  # $GOOSの判別用
  case `uname` in
    Darwin)
      export GOOS=darwin
    ;;
    Linux)
      export GOOS=linux
    ;;
    *)
    ;;
  esac
  # $GOARCHの判別用/x86_64は未テスト
  case `uname -p` in
    x86_64)
      export GOARCH=amd64
    ;;
    arm)
      export GOARCH=arm
    ;;
    *)
      export GOARCH=386
    ;;
  esac
  export GOBIN=$GOROOT/bin
  export PATH=$PATH:$GOBIN
fi
