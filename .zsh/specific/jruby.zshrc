if [ "`jgem -v 2> /dev/null`" ];then
  export PATH=$PATH:`jgem env gempath`
fi
