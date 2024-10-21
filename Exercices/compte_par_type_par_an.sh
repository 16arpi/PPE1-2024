#!/bin/sh

if [ ! $1 ]
then
    echo "Argument manquant"
    exit
fi

./compte_par_type.sh 2016 $1
./compte_par_type.sh 2017 $1
./compte_par_type.sh 2018 $1
