#!/bin/bash
set -e

MAESTRO_IP=${6}
MAESTRO_PUERTO=${7}
REPLICA_IP=${4}
REPLICA_PUERTO=${5}
IP=192.168.157.144 # Configura aquí la IP para cada máquina

# Si estoy en el maestro
if [ ${MAESTRO_IP} = ${IP} ]; then
    # Deshabilita RDB
    /usr/bin/redis-cli -h ${IP} -p ${MAESTRO_PUERTO} config set save ""

    exit 0

# Si estoy en una réplica
else
    /usr/bin/redis-cli -h ${MYIP} -p ${REPLICA_PUERTO} config set save "900 1 300 10 60 10000"
    exit 0
fi

exit 1
