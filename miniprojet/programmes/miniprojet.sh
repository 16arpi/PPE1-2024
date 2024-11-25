#!/usr/bin/env bash

FILENAME=$1

if [ ! $FILENAME ]
then
	echo "Merci d'indiquer un fichier d'URLs"
	exit
fi

I=0
echo "<!DOCTYPE html>"
echo "<html>"
echo "<head>"
echo "<title>Mini-projet</title>"
echo "<meta charset=\"utf-8\" />"
echo "<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bulma@1.0.2/css/bulma.min.css\">"
echo "</head>"
echo "<body>"

echo "<section class=\"section\" >"
echo "<div class=\"container is-max-desktop\" >"
echo "<div class=\"content\" >"
echo "<h2 class=\"title\" >Résultat du script</h2>"
echo "<table class=\"table\" >"

echo "<tr>" "<th>n°</th>" "<th>URL</th>" "<th>Code HTTP</th>" "<th>Encodage</th>" "<th>Nombre de mots</th>" "</tr>"

while read -r line
do
	# On ajoute à deux reprises xargs pour se débarasser des espaces inutiles

	# Code HTTP
	HTTP_CODE=$(curl -s -I "$line" | head -n 1 | cut -d ' ' -f 2)
	# Encodage
	ENCODING=$(curl -s -I "$line" | egrep -i '^content-type:' | egrep 'charset=[[:alnum:]-]+' | cut -d '=' -f 2 | xargs)
	# Comptage des mots
	WORDS_COUNT=$(lynx -dump "$line" | egrep "\b[[:alnum:]]+\b" -o | wc -l | xargs)

	echo "<tr>"
	echo "<td>" $I "</td>"
	echo "<td>" $line "</td>"
	echo "<td>" $HTTP_CODE "</td>"
	echo "<td>" $ENCODING "</td>"
	echo "<td>" $WORDS_COUNT "</td>"
	echo "</tr>"

	((I++))
done < $FILENAME

echo "</table>"
echo "</div>"
echo "</div>"
echo "</section>"
echo "</body>"
echo "</html>"
