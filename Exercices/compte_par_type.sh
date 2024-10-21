#!/bin/sh
echo "Nombre de" $2 "en" $1
cat ./ann/$1/*.ann | cut -f 2 | grep $2 | wc -l
