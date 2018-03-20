_LOADED_SPECIFIC_GOLANG=1
#Go用の設定
export GOPATH=$HOME/go
if test -d $GOPATH; then
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
  case `uname -m` in
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
  export GOBIN=$GOPATH/bin
  push path $GOBIN
  export PATH
fi
