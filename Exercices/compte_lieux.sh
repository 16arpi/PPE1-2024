#!/bin/bash
YEAR=$1
MONTH=$2
MAX=$3

if [ ! $YEAR ] || [ ! $MONTH ] || [ ! $MAX ]
then
    echo "Merci d'inscrire une année, un mois et un maximum."
    exit
else
    if [[ ! $YEAR =~ ^[0-9]+$ ]] || [[ ! $MONTH =~ ^[0-9]+$ ]] || [[ ! $MAX =~ ^[0-9]+$ ]]
    then
        echo "Les arguments doivent être des nombres"
        exit
    fi
fi

cat ./ann/$YEAR/$YEAR_$MONTH_*.ann | grep "Location" | cut -f 3 | sort | uniq -c | sort | tail -n$MAX
