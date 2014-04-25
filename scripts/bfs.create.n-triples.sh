#!/bin/bash

. ./bfs.config.sh
mkdir -p "$data"import
rm "$data"import/*.nt ;

for i in "$data"*.rdf ; do rapper -g "$i" >> "$data"import/meta.nt ; done ;
sort -u "$data"import/meta.nt > "$data"import/meta.sortu.nt ; mv "$data"import/meta.sortu.nt "$data"import/meta.nt

#for i in "$data"*.rdf ; do file=$(basename "$i"); dataSetCode=${file%.*}; rapper -g "$i" > "$data"import/"$dataSetCode".nt ; done;
