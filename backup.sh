#!/bin/sh
#Gdrive
#https://github.com/prasmussen/gdrive

#DATA=$(date +%Y%m%d-%H%M%S)
DATA=$(date +%Y%m%d)

#
#Verifica se o BD esta UP
if [ $(docker ps -a|grep zabbix-bd|grep Up| wc -l) -eq 1 ]; then

 #Start backup
 docker exec zabbix-bd psql -U zabbix -c "select pg_start_backup('hot_backup');"

 #Tar.gz
 tar czvf /root/docker-rural-bkp-$DATA.tar.gz /docker

 #Stop backup
 docker exec zabbix-bd psql -U zabbix -c "select pg_stop_backup();"

 #Enviando o arquivo pra gdrive
 [ -e /root/docker-rural-bkp-$DATA.tar.gz ] && /docker/bin/gdrive -c /docker/data/zabbix/server/gdrive upload /root/docker-rural-bkp-$DATA.tar.gz | true

fi
