#!/bin/bash
tst=$(date "+%Y%m%d-%H%M%S")
bk_file=bk-world-${tst}.tar.gz
docker exec -it mine tar -zcvf ${bk_file} world
docker cp mine:/server/${bk_file} .
