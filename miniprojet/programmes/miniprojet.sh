#!/usr/bin/env bash

FILENAME=$1

if [ ! $FILENAME ]
then
	echo "Merci d'indiquer un fichier d'URLs"
	exit
fi

I=0

while read -r line
do
	echo $I $line
	((I++))
done < $FILENAME
