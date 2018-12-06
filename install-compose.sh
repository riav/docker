#!/bin/sh
#https://docs.docker.com/compose/install/#install-compose
COMPOSE_VERSION="1.21.2"
if [ ! -e /usr/local/bin/docker-compose ] || [ "$1" = "--update" ]; then
 [ "$2" != "" ] && COMPOSE_VERSION=$2
 [ -e /usr/local/bin/docker-compose ] && mv /usr/local/bin/docker-compose /usr/local/bin/docker-compose.old
 curl -L https://github.com/docker/compose/releases/download/$COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
 chmod +x /usr/local/bin/docker-compose
 docker-compose --version
else
 echo "/usr/local/bin/docker-compose already exists!!"
 echo "For update use: $0 --update | --update $COMPOSE_VERSION"
fi
