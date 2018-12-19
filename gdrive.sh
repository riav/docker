#!/bin/bash

ZABBIX_HOME=/var/lib/zabbix

FILE_NAME="Equipamentos_monitorados"
FILE_ID=$(/bin/gdrive -c $ZABBIX_HOME/gdrive list|grep " $FILE_NAME "|awk '{print $1}')

JSON_BEGIN='{"data":['
JSON_END=']}'

/bin/gdrive -c $ZABBIX_HOME/gdrive export --force --mime text/csv $FILE_ID >&-
#cat $ZABBIX_HOME/Equipamentos_monitorados|grep ^[1-9]|sed 's/,$/,Default/g'
#cat $ZABBIX_HOME/Equipamentos_monitorados|grep ^[1-9]|awk -F',' '{print "{\"{#DEVICE.IP}\":\""$1"\",\"{#DEVICE.VLAN}\":\""$2"\",\"{#DEVICE.NAME}\":\""$3"\",\"{#DEVICE.TYPE}\":\""$3"\"},"}'
JSON_LIST=$(cat $ZABBIX_HOME/Equipamentos_monitorados|grep ^[1-9]|awk -F',' '{print "{\"{#DEVICE.IP}\":\""$1"\",\"{#DEVICE.VLAN}\":\""$2"\",\"{#DEVICE.NAME}\":\""$3"\"},"}')
JSON_LIST=${JSON_LIST%','}

#echo "${JSON_BEGIN}${JSON_LIST}${JSON_END}" >> /tmp/gdrive.log

echo "${JSON_BEGIN}${JSON_LIST}${JSON_END}"
