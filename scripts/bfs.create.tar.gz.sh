#!/bin/bash

data="/data/bfs-linked-data/data/"

cd "$data"
tar -cvzf meta.tar.gz bfs*.nt *.rdf

#real    0m1.498s
#user    0m1.452s
#sys     0m0.136s

