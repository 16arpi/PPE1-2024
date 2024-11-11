#!/usr/bin/env bash

FILENAME=$1

if [ ! $FILENAME ]
then
	echo "Merci d'indiquer un fichier d'URLs"
	exit
fi

I=0

echo "N" $'\t' "URL" $'\t' "Code HTTP" $'\t' "Encodage" $'\t' "Mots"

while read -r line
do
	# On ajoute à deux reprises xargs pour se débarasser des espaces inutiles

	# Code HTTP
	HTTP_CODE=$(curl -s -I "$line" | head -n 1 | cut -d ' ' -f 2)
	# Encodage
	ENCODING=$(curl -s -I "$line" | egrep -i '^content-type:' | egrep 'charset=[[:alnum:]-]+[:space:]' | cut -d '=' -f 2 | xargs)
	# Comptage des mots
	WORDS_COUNT=$(lynx -dump "$line" | egrep "\b[[:alnum:]]+\b" -o | wc -l | xargs)
	echo $I$'\t'$line$'\t'$HTTP_CODE$'\t'$ENCODING$'\t'$WORDS_COUNT
	((I++))
done < $FILENAME
