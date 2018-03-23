#!/bin/bash

SVC=${PWD##*/}
PORT=25566

docker rm -f $SVC
docker rmi $SVC

docker build -t $SVC . || exit 1

docker run -d -p $PORT:25565 \
    --name $SVC \
    $SVC $1
