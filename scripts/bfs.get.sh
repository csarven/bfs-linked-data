#!/bin/bash

#
#    Author: Sarven Capadisli <info@csarven.ca>
#    Author URI: http://csarven.ca/#i
#

. ./bfs.config.sh

rm "$data""$agency".prov.retrieval.rdf

echo '<?xml version="1.0" encoding="UTF-8"?>
<rdf:RDF
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:dcterms="http://purl.org/dc/terms/"
    xmlns:prov="http://www.w3.org/ns/prov#"
    xmlns:foaf="http://xmlns.com/foaf/0.1/"
    xmlns:sdmx="http://purl.org/linked-data/sdmx#">' > "$data""$agency".prov.retrieval.rdf ;

sleep 1
        dtstart=$(date +"%Y-%m-%dT%H:%M:%SZ") ;
        dtstartd=$(echo "$dtstart" | sed 's/[^0-9]*//g') ;
#        wget -t 0 --no-http-keep-alive "$i" -O "$data""$DataSetCode".xml
sleep 1
        dtend=$(date +"%Y-%m-%dT%H:%M:%SZ") ;
        dtendd=$(echo "$dtend" | sed 's/[^0-9]*//g') ;
    echo "0 CH1_RN+HCL_HGDE_HIST" ;
    echo '
    <rdf:Description rdf:about="http://bfs.270a.info/provenance/activity/'$dtstartd'">
        <rdf:type rdf:resource="http://www.w3.org/ns/prov#Activity"/>
        <prov:startedAtTime rdf:datatype="http://www.w3.org/2001/XMLSchema#dateTime">'$dtstart'</prov:startedAtTime>
        <prov:endedAtTime rdf:datatype="http://www.w3.org/2001/XMLSchema#dateTime">'$dtend'</prov:endedAtTime>
        <prov:wasAssociatedWith rdf:resource="http://csarven.ca/#i"/>
        <prov:used rdf:resource="https://launchpad.net/ubuntu/+source/wget"/>
        <prov:used>
            <rdf:Description rdf:about="http://www.bfs.admin.ch/xmlns/sdmx/CH1_RN+HCL_HGDE_HIST+1.0.xml">
                <dcterms:identifier>CH1_RN+HCL_HGDE_HIST+1.0</dcterms:identifier>
            </rdf:Description>
        </prov:used>
        <prov:generated>
            <rdf:Description rdf:about="http://bfs.270a.info/data/CH1_RN+HCL_HGDE_HIST+1.0.xml">
                <dcterms:identifier>CH1_RN+HCL_HGDE_HIST</dcterms:identifier>
            </rdf:Description>
        </prov:generated>

        <rdfs:label xml:lang="en">Retrieved CH1_RN+HCL_HGDE_HIST+1.0</rdfs:label>
        <rdfs:comment xml:lang="en">CH1_RN+HCL_HGDE_HIST+1.0 retrieved from source and saved to local filesystem.</rdfs:comment>
    </rdf:Description>' >> "$data""$agency".prov.retrieval.rdf ;

counter=1;
while read i ;
    do
        DataSetCode=$(echo "$i" | perl -pe 's/http:\/\/www.bfs.admin.ch\/xmlns\/sdmx\/(.*)(?=.xml).xml/$1/g');
        echo "$counter $DataSetCode" ;

        DataType="http://purl.org/linked-data/sdmx#DataStructureDefinition"
        DataTypeLabel="Structure"

sleep 1
        dtstart=$(date +"%Y-%m-%dT%H:%M:%SZ") ;
        dtstartd=$(echo "$dtstart" | sed 's/[^0-9]*//g') ;
#        wget -t 0 --no-http-keep-alive "$i" -O "$data""$DataSetCode".xml
sleep 1
        dtend=$(date +"%Y-%m-%dT%H:%M:%SZ") ;
        dtendd=$(echo "$dtend" | sed 's/[^0-9]*//g') ;

        echo '
        <rdf:Description rdf:about="http://bfs.270a.info/provenance/activity/'$dtstartd'">
            <rdf:type rdf:resource="http://www.w3.org/ns/prov#Activity"/>
            <prov:startedAtTime rdf:datatype="http://www.w3.org/2001/XMLSchema#dateTime">'$dtstart'</prov:startedAtTime>
            <prov:endedAtTime rdf:datatype="http://www.w3.org/2001/XMLSchema#dateTime">'$dtend'</prov:endedAtTime>
            <prov:wasAssociatedWith rdf:resource="http://csarven.ca/#i"/>
            <prov:used rdf:resource="https://launchpad.net/ubuntu/+source/wget"/>
            <prov:used>
                <rdf:Description rdf:about="'$i'">
                    <dcterms:identifier>'$DataSetCode'</dcterms:identifier>
                </rdf:Description>
            </prov:used>
            <prov:generated rdf:resource="http://bfs.270a.info/data/'$DataSetCode'.xml"/>
            <prov:generated>
                <rdf:Description rdf:about="http://bfs.270a.info/data/'$DataSetCode'.xml">
                    <dcterms:identifier>'$DataSetCode'</dcterms:identifier>
                </rdf:Description>
            </prov:generated>

            <rdfs:label xml:lang="en">Retrieved '$DataSetCode'</rdfs:label>
            <rdfs:comment xml:lang="en">'$DataSetCode' retrieved from source and saved to local filesystem.</rdfs:comment>
        </rdf:Description>' >> "$data""$agency".prov.retrieval.rdf ;

        (( counter++ ));

    done < data.txt

echo -e "\n</rdf:RDF>" >> "$data""$agency".prov.retrieval.rdf ;
