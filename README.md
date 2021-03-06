# docker
Docker

**Instalação CentOS 7**

`# yum install -y yum-utils device-mapper-persistent-data lvm2`

`# yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo`

`# yum install docker-ce -y && systemctl enable docker.service && systemctl start docker.service`

**Instalação CentOS 8**

`# dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo &&\`

`CONTAINERD_IO=$(curl -sL https://download.docker.com/linux/centos/7/x86_64/stable/Packages | grep -o '>containerd.io.*<' | tail -1 | sed 's/>//;s/<//') &&\`

`dnf install -y https://download.docker.com/linux/centos/7/x86_64/stable/Packages/$CONTAINERD_IO &&\`

`dnf install docker-ce --nobest -y &&\`

`systemctl enable docker.service && systemctl start docker.service`

**Instalação Docker-Compose**

Opção 1:

`# yum install -y epel-release && yum install -y python-pip && pip install docker-compose && yum upgrade python* && docker-compose version`

Opção 2:

`curl -sSL https://raw.githubusercontent.com/riav/docker/master/composectl/install-compose.sh | sh`
