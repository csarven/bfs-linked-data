#!/bin/bash

#
#    Author: Sarven Capadisli <info@csarven.ca>
#    Author URI: http://csarven.ca/#i
#

data="/data/bfs-linked-data/data/";
namespace="http://bfs.270a.info/";
db="/SSD/data/tdb/db/bfs/";
tdbAssembler="/usr/lib/fuseki/tdb.bfs.ttl";
JVM_ARGS="-Xmx12000M"
void="/var/www/bfs.270a.info/void.ttl";

./bfs.drop.graph.void.sh

echo Importing LODStats into "$namespace"graph/void ;
for i in "$data"import/*stats.ttl ; do java "$JVM_ARGS" tdb.tdbloader --desc="$tdbAssembler" --graph="$namespace"graph/void "$i"; done ;

./bfs.construct.void.sh

./bfs.drop.graph.void.sh

echo Inserting "$void" back into "$namespace"graph/void ;
java "$JVM_ARGS" tdb.tdbloader --desc="$tdbAssembler" --graph="$namespace"graph/void "$void"

