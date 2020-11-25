#!/bin/sh
#https://docs.docker.com/compose/install/#install-compose
COMPOSE_VERSION=$(curl -sL https://github.com/docker/compose/releases/latest|grep 'docker%2Fcompose%2Freleases%2Ftag'|rev|awk -F'F2%' '{print $1}'|sed 's/"//g'|rev)
if [ ! -e /usr/local/bin/docker-compose ] || [ "$1" = "--update" ]; then
 [ "$2" != "" ] && COMPOSE_VERSION=$2
 [ -e /usr/local/bin/docker-compose ] && mv /usr/local/bin/docker-compose /usr/local/bin/docker-compose.old
 echo "Downloading docker-compose version: $COMPOSE_VERSION"
 curl -L'#' https://github.com/docker/compose/releases/download/$COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
 chmod +x /usr/local/bin/docker-compose
 ln -sf /usr/local/bin/docker-compose /usr/bin/
 ln -sf docker-compose /usr/local/bin/dc
 docker-compose --version
else
 echo "/usr/local/bin/docker-compose already exists!!"
 echo "For update use: $0 /dev/stdin '--update' | '--update [COMPOSE_VERSION]'"
fi
