#!/bin/bash -f
YEAR=$1
MONTH=$2
MAX=$3

echo $YEAR
echo $MONTH
cat ./ann/$YEAR/$YEAR_$MONTH_*.ann | grep "Location" | cut -f 3 | sort | uniq -c | sort | tail -n$MAX
