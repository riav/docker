# docker
Docker

**Instalação CentOS 7**

`# yum install -y yum-utils device-mapper-persistent-data lvm2`

`# yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo`

`# yum install docker-ce -y && systemctl enable docker.service && systemctl start docker.service`

**Instalação CentOS 8**

`# dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo &&\`

`dnf install https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.6-3.3.el7.x86_64.rpm &&\`

`dnf install docker-ce --nobest -y &&\`

`dnf install docker-ce-3:19.03.9-3.el7 --nobest &&\`

`systemctl enable docker.service && systemctl start docker.service`

**Instalação Docker-Compose**

`# yum install -y epel-release && yum install -y python-pip && pip install docker-compose && yum upgrade python*`

`# docker-compose version`
