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
query="bfs.void.init.ttl";

echo Exporting "$namespace"graph/void to "$void" ;
java "$JVM_ARGS" tdb.tdbquery --time --desc="$tdbAssembler" --results=turtle --query="$query" > "$void" ;

