#!/bin/bash

#
#    Author: Sarven Capadisli <info@csarven.ca>
#    Author URI: http://csarven.ca/#i
#

. ./bfs.config.sh

echo Exporting "$namespace"graph/void to "$void" ;
java "$JVM_ARGS" tdb.tdbquery --time --desc="$tdbAssembler" --results=turtle --query="$voidInit" > "$void" ;

