#!/bin/sh
curl -sSL https://raw.githubusercontent.com/riav/docker/master/composectl/install-compose.sh | sh
curl -sSL https://raw.githubusercontent.com/riav/docker/master/composectl/composectl.sh -o /usr/local/bin/composectl
chmod +x /usr/local/bin/composectl
[ ! -d /docker/compose ] && mkdir /docker/compose -p || echo "/docker/compose já existe!!!"
