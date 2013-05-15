#!/bin/bash

#
#    Author: Sarven Capadisli <info@csarven.ca>
#    Author URI: http://csarven.ca/#i
#

. $HOME/lodstats-env/bin/activate

. ./bfs.config.sh

rm "$data"import/*stats*

#lodstats -val "$data"import/graph.meta.nt > "$data"import/graph.meta.nt.stats.ttl
#find "$data" -name "*[!Structure|prov].rdf" | while read i ; do file=$(basename "$i"); dataSetCode=${file%.*};
#    lodstats -val "$data"import/graph.data.nt > "$data"import/graph.data.nt.stats.ttl
#    done;

for i in "$data"import/*.nt ; do
    lodstats -val "$i" > "$i".stats.ttl
    echo "Created $i.stats.ttl"
    done;
#real    2m48.002s
#user    2m47.366s
#sys     0m0.292s

echo "Fixing URI for meta stats" ;
find "$data"import/*stats.ttl -name "*[!Structure|prov]" | while read i ; do sed -ri 's/<file:\/\/\/data\/'"$agency"'-linked-data\/data'"$state"'\/import\/([^\.]*)\.nt/<http:\/\/'"$agency"'.270a.info\/dataset\/\1/g' "$i" ; done ;

