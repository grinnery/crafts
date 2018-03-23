#!/bin/bash
tst=$(date "+%Y%m%d-%H%M%S")
SVC=${PWD##*/}
bk_file=bk-world-${tst}.tar.gz
docker exec -it $SVC tar -zcvf ${bk_file} world
docker cp $SVC:/home/miner/${bk_file} .