#!/bin/sh
DOCKER_COMPOSE=/docker/compose/$1/docker-compose.yml

if [ -e $DOCKER_COMPOSE ]; then
 CMD=$(echo $@|sed "s/$1 //")
 docker-compose -p $1 -f $DOCKER_COMPOSE $CMD
else
 echo "usage $0 project_name command"
fi
