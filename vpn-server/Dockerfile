FROM hwdsl2/ipsec-vpn-server
RUN sed -i '/\/usr\/local\/sbin\/ipsec start/i [ ! -z $NET_ROUTE ] && iptables -I FORWARD -d $NET_ROUTE -j ACCEPT || true' run.sh &&\
    sed -i '/\/usr\/local\/sbin\/ipsec start/i [ ! -z $NET_ROUTE ] && iptables -t nat -I POSTROUTING -d $NET_ROUTE -j MASQUERADE || true' run.sh &&\
    sed -i '/\/usr\/local\/sbin\/ipsec start/i /tmp/add_net_route &' run.sh &&\
    echo '#!/bin/sh' > /tmp/add_net_route &&\
    echo 'IF_PPP=0' >> /tmp/add_net_route &&\
    echo 'while [ $IF_PPP -eq 0 ]; do IF_PPP=$(ifconfig|grep ppp0|wc -l); [ $IF_PPP -eq 1 ] && route add -net $NET_ROUTE dev ppp0 || true; done' >> /tmp/add_net_route &&\
    chmod +x /tmp/add_net_route
