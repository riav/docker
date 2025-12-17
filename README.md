# Gerador de senhas:
    openssl rand -base64 32

# docker
Docker

**Instalação CentOS 7**

    # yum install -y yum-utils device-mapper-persistent-data lvm2
    # yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
    # yum install docker-ce -y && systemctl enable docker.service && systemctl start docker.service

**Instalação CentOS 8 / OL8**

    # dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo &&\
    CONTAINERD_IO=$(curl -sL https://download.docker.com/linux/centos/7/x86_64/stable/Packages | grep -o '>containerd.io.*<' | tail -1 | sed 's/>//;s/<//') &&\
    dnf install -y https://download.docker.com/linux/centos/7/x86_64/stable/Packages/$CONTAINERD_IO &&\
    dnf install docker-ce --nobest -y &&\
    systemctl enable docker.service && systemctl start docker.service
    
    dnf install -y yum-utils &&\
    yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo &&\
    dnf install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin &&\
    systemctl enable docker &&\
    systemctl start docker &&\
    echo -e 'alias docker-compose="docker compose"\nalias dcp="docker compose"' > /etc/profile.d/docker.sh &&\
    source /etc/profile.d/docker.sh

**Instalação Ubuntu**

    # sudo apt-get update &&\
    sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y &&\
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - &&\
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" &&\
    sudo apt-get update &&\
    sudo apt-get install docker-ce -y
    
**Instalação Debian**

    apt install ca-certificates curl gnupg lsb-release &&\
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg &&\
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null &&\
    apt update &&\
    apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
    
**Instalação AlmaLinux**

    sudo dnf install -y dnf-plugins-core &&\
    sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo &&\
    sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin


**Instalação Docker-Compose via repositório**

Opção 1:

    # yum install -y epel-release && yum install -y python-pip && pip install docker-compose &&\
    yum upgrade python* && docker-compose version

Opção 2:

    curl -sSL https://raw.githubusercontent.com/riav/docker/master/composectl/install-compose.sh | sh
