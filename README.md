Example use of macvlan with crpd

Adjust the script create-macvlan-crpd.sh with your physical interface and its IP subnet.


```
$ ./create-macvlan-crpd.sh
crpd1
crpd2
net-macvlan
e3423721424bf9ed429de1dfa047a37116dd8b6ef67377a5a37b0e0d7dcac854
NETWORK ID          NAME                DRIVER              SCOPE
f3ed6c23dd7e        bridge              bridge              local
0ce8a8247421        host                host                local
e3423721424b        net-macvlan         macvlan             local
0a1cff69ee1e        none                null                local
4bdf3eaee6d3e7f4eac58bdf1d22bd12985f9ee9ec36ae9ab28c307536d0aec6
e42fc70af6b0c61ba283abf31f4c10127f05af834db7980c0597bb7a19326132
e42fc70af6b0        crpd:latest         "/sbin/runit-init 0"   Less than a second ago   Up Less than a second                       crpd2
4bdf3eaee6d3        crpd:latest         "/sbin/runit-init 0"   1 second ago             Up Less than a second                       crpd1
Interface        State Addresses
eth0             Up    MPLS  enabled
                       ISO   enabled
                       INET  192.168.0.192
                       INET6 fe80::42:c0ff:fea8:c0
Example use of macvlan with crpd
lo.0             Up    MPLS  enabled
                       ISO   enabled
                       INET  127.0.0.1
                       INET6 ::1
Interface        State Addresses
eth0             Up    MPLS  enabled
                       ISO   enabled
                       INET  192.168.0.193
                       INET6 fe80::42:c0ff:fea8:c1
lo.0             Up    MPLS  enabled
                       ISO   enabled
                       INET  127.0.0.1
                       INET6 ::1
mwiget@xeon:~/Dropbox/git/crpd-macvlan$ docker exec -ti crpd1 ping 192.168.0.193
PING 192.168.0.193 (192.168.0.193) 56(84) bytes of data.
64 bytes from 192.168.0.193: icmp_seq=1 ttl=64 time=0.089 ms
^C
--- 192.168.0.193 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.089/0.089/0.089/0.000 ms
mwiget@xeon:~/Dropbox/git/crpd-macvlan$ docker exec -ti crpd1 ping 192.168.0.1
PING 192.168.0.1 (192.168.0.1) 56(84) bytes of data.
64 bytes from 192.168.0.1: icmp_seq=1 ttl=64 time=0.787 ms
^C
--- 192.168.0.1 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.787/0.787/0.787/0.000 ms
mwiget@xeon:~/Dropbox/git/crpd-macvlan$
```
