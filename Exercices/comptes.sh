#!/bin/bash

for i in {2016..2018}
do
    echo "Annotations en" $i ":"
    cat ./ann/$i/*.ann | grep Location | wc -l
done
