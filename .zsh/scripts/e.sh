function :e() {
  case $# in
  0)
    screen -r;
  ;;
  1)
    screen -r $1;
  ;;
  *)
    screen -d;
  ;;
  esac
}
