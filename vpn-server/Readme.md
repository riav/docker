# build vpn-server

docker build -t vpn-server .

# No Sistema Operacional

## Server:

Instalar o módulo af_key

modprobe af_key

## Client:

ip route add 10.100.0.0/16 via 192.168.254.1 dev ppp0

