#!/bin/bash

PORT=8001
VOLUME=$(pwd)/tmp/
NAME=node
TAG=ssd_v1

src="${BASH_SOURCE[0]}"
dir=$(dirname $src)
cd $dir


do_build() {
    docker build -t $TAG .
}


do_exec(){
    do_build
    docker run -p $PORT:8000 -v $VOLUME:/data   --name $NAME -i -t $TAG
}


do_clean(){
    docker rm $(docker ps -a -q)
}

do_clear(){
    do_clean
    docker rmi $(docker images -a -q)
}

do_help(){
    exho "Usage $0 [bluid|exec|clean|clear|help]"
}

cd "$( dirname "${BASH_SOURCE[0]}" )"


if [[ $# -eq 0 ]]; then
    do_exec
elif [[ $# -eq 1 ]]; then
    if [[ "$1" == "build" ]]; then
        do_build
    elif [[ "$1" == "exec" ]]; then
        do_exec
    elif [[ "$1" == "clean" ]]; then
        do_clean
    elif [[ "$1" == "clear" ]]; then
        do_clear
    else
        do_help
    fi
else
    do_help
fi


