#!/bin/bash

function usage() {
    echo "Uso: $0 NUMERO_DE_CLAVES"
    echo ""
    echo "Por ejmplo: $0 1000"
}

DATAFILE="replicacion.data"

if [ -z $1 ]
then
    echo "No has indicado el n..mero de elementos a crear"
    usage
    exit 1
fi
rm $DATAFILE >/dev/null  2>&1

NOMBRES[0]="Jack"
NOMBRES[1]="MIKE"
NOMBRES[2]="Mary"
GENERO[0]="m"
GENERO[1]="f"
PAIS[0]="us"
PAIS[1]="cn"
PAIS[2]="uk"

for i in `seq -w 1 $1`
do
    randnombre=$[ $RANDOM % 3 ]
    randgenero=$[ $RANDOM % 2 ]
    randtime=$[ $RANDOM % 30 ]
    randpais=$[ $RANDOM % 3 ]
    echo "hset \"usuario:${i}\" \"nombre\" \"${NOMBRES[$randnombre]}\" \"genero\" \"${GENERO[$randgenero]}\" \"hora_registro\" `date +%s%N` \"pais\" \"${PAIS[$ran
    sleep 0.00000${randtime}
done

unix2dos $DATAFILE
