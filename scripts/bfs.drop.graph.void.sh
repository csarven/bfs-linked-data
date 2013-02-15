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

echo Dropping graph "$namespace"graph/void ;
java "$JVM_ARGS" tdb.tdbupdate --desc="$tdbAssembler" 'DROP GRAPH <'"$namespace"'graph/void>'

