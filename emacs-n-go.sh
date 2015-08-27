#!/bin/bash
set -e

if [ $# -eq 0 ]; then
    HOST_DIR=$PWD
    TARGET_DIR=/workspace/src/github.com/$USER/${PWD##*/}
elif [ $# -eq 2 ]; then
    HOST_DIR=$1
    TARGET_DIR=/workspace/src/$2
else
    echo "This script should be called with two or none parameters!"
    exit -1
fi

create_cmd(){
    echo "'cd $TARGET_DIR && /workspace/bin/goconvey -host=0.0.0.0 >> /dev/null & 2>&1 && /usr/bin/emacs $TARGET_DIR'"
}

eval sudo docker run \
    -v $HOST_DIR:$TARGET_DIR \
    -p 127.0.0.1:8080:8080 \
    -i -t \
    fgimenez/emacs-n-go \
    /bin/bash -ci $(create_cmd)
