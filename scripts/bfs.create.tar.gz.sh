#!/bin/bash

. ./bfs.config.sh

cd "$data"
tar -cvzf meta.tar.gz bfs*.nt *.rdf

#real    0m1.498s
#user    0m1.452s
#sys     0m0.136s

