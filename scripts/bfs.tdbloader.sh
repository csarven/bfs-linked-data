#!/bin/bash

#
#    Author: Sarven Capadisli <info@csarven.ca>
#    Author URI: http://csarven.ca/#i
#

. ./bfs.config.sh

echo "Removing $db";
rm -rf "$db";

#java "$JVM_ARGS" tdb.tdbloader -v --desc="$tdbAssembler" --graph="$namespace"graph/data "$data"STATTAB-SDMX-01-2A01+2011.1.1+GENERIC.nt;
#java "$JVM_ARGS" tdb.tdbloader -v --desc="$tdbAssembler" --graph="$namespace"graph/meta "$data"STATTAB-SDMX-01-2A01+2011.1.nt;

java "$JVM_ARGS" tdb.tdbloader -v --desc="$tdbAssembler" --graph="$namespace"graph/meta "$data"import/meta.nt

#rapper -g bfs-worldbank.country.trigrams.accept.nt > /data/bfs-linked-data/data/bfs.exactMatch.worldbank.nt
#rapper -g bfs-worldbank.country.trigrams.review.nt >> /data/bfs-linked-data/data/bfs.exactMatch.worldbank.nt
#rapper -g bfs-dbpedia.country.trigrams.accept.nt > /data/bfs-linked-data/data/bfs.exactMatch.dbpedia.nt
#rapper -g bfs-dbpedia.country.trigrams.review.nt >> /data/bfs-linked-data/data/bfs.exactMatch.dbpedia.nt
#sort -u /data/bfs-linked-data/data/bfs.exactMatch.worldbank.nt > o.nt && mv o.nt /data/bfs-linked-data/data/bfs.exactMatch.worldbank.nt
#sort -u /data/bfs-linked-data/data/bfs.exactMatch.dbpedia.nt > o.nt && mv o.nt /data/bfs-linked-data/data/bfs.exactMatch.dbpedia.nt

java "$JVM_ARGS" tdb.tdbloader --desc="$tdbAssembler" --graph="$namespace"graph/meta "$data"bfs.exactMatch.worldbank.nt
java "$JVM_ARGS" tdb.tdbloader --desc="$tdbAssembler" --graph="$namespace"graph/meta "$data"bfs.exactMatch.dbpedia.nt
java "$JVM_ARGS" tdb.tdbloader --desc="$tdbAssembler" --graph="$namespace"graph/meta "$data"bfs.exactMatch.imf.nt
java "$JVM_ARGS" tdb.tdbloader --desc="$tdbAssembler" --graph="$namespace"graph/meta "$data"bfs.exactMatch.ecb.nt


./bfs.tdbstats.sh
#INFO  ** Completed: 1,048,223 triples loaded in 31.03 seconds [Rate: 33,775.51 per second]
#real    1m28.978s
#user    1m44.035s
#sys     0m3.048s

