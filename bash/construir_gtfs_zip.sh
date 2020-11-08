#!/bin/bash

file $1 | tr -d ' ' |
    grep --ignore-case -c 'sqliteversion3'  || exit 1

rm -rf dir_gtfs_zip
mkdir dir_gtfs_zip

COMMANDS="$(
sqlite3 $1 <<<"
.tables
" | grep -o 'rutas[^ ]*' |
while read TABLE
do
echo ".mode csv $TABLE
.output dir_gtfs_zip/$TABLE
select * from $TABLE;"
done
)"

sqlite3 $1 <<< "$COMMANDS"
