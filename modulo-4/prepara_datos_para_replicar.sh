#!/bin/bash

function usage() {
    echo "Uso: $0 NUMERO_DE_CLAVES"
    echo ""
    echo "Por ejemplo: $0 1000"
}

DATAFILE="replicacion.data"

if [ -z $1 ]
then
    echo "No has indicado el número de elementos a crear"
    usage
    exit 1
fi
rm $DATAFILE >/dev/null  2>&1

NOMBRES[0]="Pepito"
NOMBRES[1]="Menganito"
NOMBRES[2]="Fulanito"
GENERO[0]="h"
GENERO[1]="m"
PAIS[0]="es"
PAIS[1]="cn"
PAIS[2]="mx"

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
