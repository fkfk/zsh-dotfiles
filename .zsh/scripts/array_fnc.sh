# via http://wiki.fdiary.net/zsh/?cmd=view&p=ArrayOperation&key=array
push() {
    local name=$1
    shift
    eval $name'=($'$name' $*)'
}

pop() {
    local count=1
    [[ $1 == <-> ]] && {
        count=$1
        shift
    }
    for name in $*; do
        repeat $count do
            eval $name'[$#'$name']=()'
        done
    done
}

unshift() {
    local name=$1
    shift
    eval $name'=($* $'$name')'
}
