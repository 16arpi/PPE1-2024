#!/bin/sh
YEAR=$1
TYPE=$2

if [ ! $YEAR ] || [ ! $TYPE ]
then
    echo "Arguments nécessaires : année ET type"
    exit
else
    if [[ ! $YEAR =~ ^[0-9]+$ ]]
    then
        echo "L'année doit être un nombre"
        exit
    fi
fi

echo "Nombre de" $TYPE "en" $YEAR
cat ./ann/$YEAR/*.ann | cut -f 2 | grep $TYPE | wc -l
