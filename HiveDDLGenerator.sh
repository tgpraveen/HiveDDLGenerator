#!/bin/bash

args=("$@")

DELIMITER=${args[0]}
FILENAME=${args[1]}

HIVECOLUMNS=`head -n1 $FILENAME|sed s/"$DELIMITER"/" STRING, "/g`

TABLENAME=`echo $FILENAME|cut -d'.' -f1`

echo CREATE TABLE $TABLENAME \(`echo $HIVECOLUMNS` STRING\)
echo row format serde 'com.bizo.hive.serde.csv.CSVSerde'
echo with serdeproperties \(
echo   \"separatorChar\" = \"$DELIMITER\"
echo  \)
echo STORED AS TEXTFILE
echo TBLPROPERTIES\(\"skip.header.line.count\"=\"1\"\);
echo LOAD DATA LOCAL INPATH \'$FILENAME\' INTO TABLE $TABLENAME\;

echo ""
