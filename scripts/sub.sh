function sub()
{
  dir=.
  target=*
  case $# in
  2)
    pattern=$1
    replace=$2
  ;;
  3)
    pattern=$1
    replace=$2
    target=$3
  ;;
  4)
    pattern=$1
    replace=$2
    target=$3
    dir=$4
  ;;
  *)
    echo usage: sub PATTERN REPLACE [FILE [DIR]]
  ;;
  esac
  for FILE in `find . -type f -name "$target" -exec grep -l $pattern \{\} \;` ; do ruby -Ks -pi -e "gsub(/$pattern/,'$replace')" $FILE; done
}
