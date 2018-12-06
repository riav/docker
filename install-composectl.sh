#!/bin/sh
curl -sSL https://raw.githubusercontent.com/riav/docker/master/install-compose.sh | sh
curl -sSL https://raw.githubusercontent.com/riav/docker/master/composectl.sh -o /usr/local/bin/composectl
chmod +x /usr/local/bin/composectl
