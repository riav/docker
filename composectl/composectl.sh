#!/bin/sh
YML=/docker/compose/$1/docker-compose.yml

if [ -e $YML ]; then
 CMD=$(echo $@|sed "s/$1 //")
 ACTION=$(echo $@|awk '{print $2}')
 if [ "$ACTION" = "update" ]; then
  CMD=$(echo $@|sed "s/$1 $2 //")
  docker-compose -p $1 -f $YML stop $CMD
  docker-compose -p $1 -f $YML rm -f $CMD
  docker-compose -p $1 -f $YML pull $CMD
  docker-compose -p $1 -f $YML up -d $CMD
 else
  docker-compose -p $1 -f $YML $CMD
 fi
else
 echo "usage $0 project_name command"
fi
