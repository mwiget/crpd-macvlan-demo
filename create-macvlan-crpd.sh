#!/bin/bash
ETH=enp0s25
# passthru blocked access to the main ip address: -o macvlan_mode=passthru \

docker kill crpd1 
docker kill crpd2

docker network rm net-macvlan || true
docker network create -d macvlan -o parent=$ETH \
  --subnet 192.168.0.0/24 \
  --gateway 192.168.0.1 \
  --ip-range 192.168.0.192/26 net-macvlan

docker network ls

docker run -d --rm --privileged --name crpd1 --net net-macvlan crpd:latest
docker run -d --rm --privileged --name crpd2 --net net-macvlan crpd:latest

docker ps |grep crpd

sleep 5

docker exec -ti crpd1 cli show interfaces routing
docker exec -ti crpd2 cli show interfaces routing

