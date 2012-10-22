function search() { 
  dir=.
  file=*
  case $# in
  0)
    echo usage: search STRING [DIR [FILE]]
  ;;
  1) 
    string=$1
  ;;
  2)
    string=$1
    dir=$2
  ;;
  3)
    string=$1
    dir=$2
    file=$3
  ;;
  esac  
  find $dir -name "$file" -exec grep -IHn $string {} \; ;
}
