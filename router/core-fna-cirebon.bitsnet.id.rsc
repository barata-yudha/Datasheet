# jun/28/2021 10:58:27 by RouterOS 6.46.8
# software id = U3DJ-6EBC
#
# model = CCR1036-8G-2S+
# serial number = 968E0ACC4948
/interface ethernet
set [ find default-name=sfp-sfpplus1 ] advertise=\
    100M-half,100M-full,1000M-half,1000M-full,10000M-full
/interface vlan
add interface=sfp-sfpplus2 name=2003-FNA-SBP vlan-id=2003
add interface=sfp-sfpplus2 name=3000-FNA-NODE-CIREBON vlan-id=3000
add interface=sfp-sfpplus2 name=3504-CORE-FNA vlan-id=3504
/ip pool
add name=dhcp_pool0 ranges=192.168.100.2
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=ether2 name=dhcp1
/routing bgp instance
add as=132637 name=BITSNET router-id=103.143.244.124
/routing ospf instance
set [ find default=yes ] redistribute-connected=as-type-2 \
    redistribute-static=as-type-2 router-id=103.19.56.230
/snmp community
set [ find default=yes ] addresses=103.19.56.0/22 disabled=yes
add addresses=103.19.56.0/22 name=cirebon write-access=yes
/ip address
add address=103.19.56.230/30 interface=3504-CORE-FNA network=103.19.56.228
add address=103.143.244.124 interface=3000-FNA-NODE-CIREBON network=\
    103.143.244.125
add address=10.10.100.1/29 interface=2003-FNA-SBP network=10.10.100.0
/ip dhcp-client
add disabled=no interface=ether1
/ip dhcp-server network
add address=192.168.100.0/30 dns-server=103.19.56.10,103.19.56.11 gateway=\
    192.168.100.1
/ip firewall filter
add action=drop chain=forward comment=\
    "2. Dont disable/delete please, blok spammer" dst-port=25 protocol=tcp
add action=drop chain=forward comment=\
    "1. Dont disable/delete please, blok spammer" dst-port=25 protocol=tcp
add action=drop chain=forward comment="Malware Ransomware Type WannaCRY" \
    dst-port=137-139,445,3127,5678 protocol=tcp
add action=drop chain=forward comment="Malware Ransomware Type WannaCRY" \
    dst-port=137-139,445,3127,5678 protocol=udp
add action=drop chain=forward comment="Block Flooding Kejar" dst-port=\
    22,23,8728,8729 protocol=tcp src-address=103.19.57.28/30
add action=add-src-to-address-list address-list=port_scanners \
    address-list-timeout=4w2d chain=input comment=\
    "Add TCP Port Scanners to List" disabled=yes protocol=tcp psd=21,3s,3,1
add action=add-src-to-address-list address-list=port_scanners \
    address-list-timeout=4w2d chain=input comment="TCP FIN Stealth scan" \
    disabled=yes protocol=tcp tcp-flags=fin,!syn,!rst,!psh,!ack,!urg
add action=add-src-to-address-list address-list=port_scanners \
    address-list-timeout=4w2d chain=input comment="TCP FIN/PSH/URG scan" \
    disabled=yes protocol=tcp tcp-flags=fin,psh,urg,!syn,!rst,!ack
add action=add-src-to-address-list address-list=port_scanners \
    address-list-timeout=4w2d chain=input comment="ALL/ALL TCP Scan" \
    disabled=yes protocol=tcp tcp-flags=fin,syn,rst,psh,ack,urg
add action=add-src-to-address-list address-list=port_scanners \
    address-list-timeout=4w2d chain=input comment="TCP SYN/RST scan" \
    disabled=yes protocol=tcp tcp-flags=syn,rst
add action=add-src-to-address-list address-list=port_scanners \
    address-list-timeout=4w2d chain=input comment="TCP NULL scan" disabled=\
    yes protocol=tcp tcp-flags=!fin,!syn,!rst,!psh,!ack,!urg
add action=drop chain=input comment="Drop All Port Scanners" disabled=yes \
    src-address-list=port_scanners
add action=drop chain=forward comment="Drop ru-cn" src-address-list=ru-cn
/ip route
add comment="ROUTE TO NODE FNA" distance=1 dst-address=103.143.245.128/26 \
    gateway=103.143.244.125
/ip service
set telnet port=9989
set ftp disabled=yes
set www disabled=yes
set ssh disabled=yes
set api disabled=yes
set winbox port=9990
set api-ssl disabled=yes
/routing bgp network
add network=103.19.56.0/24 synchronize=no
add network=103.19.57.0/24 synchronize=no
add network=103.19.58.0/24 synchronize=no
add network=103.19.59.0/24 synchronize=no
add network=103.143.244.0/24 synchronize=no
add network=103.143.245.0/24 synchronize=no
/routing bgp peer
add in-filter=EBGP-FNA-in instance=BITSNET multihop=yes name=EBGP-FNA \
    nexthop-choice=force-self out-filter=EBGP-FNA-out remote-address=\
    103.143.245.144 remote-as=63293 remove-private-as=yes ttl=default
add in-filter=EBGP-SBP-in instance=BITSNET name=EBGP-SBP nexthop-choice=\
    force-self out-filter=EBGP-SBP-out remote-address=10.10.100.3 remote-as=\
    38753 tcp-md5-key=38753 ttl=default
/routing filter
add action=accept chain=ospf-in prefix=0.0.0.0/0
add action=accept chain=ospf-in prefix=103.19.56.0/24 prefix-length=24-32
add action=accept chain=ospf-in prefix=103.19.57.0/24 prefix-length=24-32
add action=accept chain=ospf-in prefix=103.19.58.0/24 prefix-length=24-32
add action=accept chain=ospf-in prefix=103.19.59.0/24 prefix-length=24-32
add action=accept chain=ospf-in prefix=103.143.244.0/24 prefix-length=24-32
add action=accept chain=ospf-in prefix=103.143.245.0/24 prefix-length=24-32
add action=discard chain=ospf-in
add action=accept chain=ospf-out prefix=10.0.0.0/8 prefix-length=8-32
add action=accept chain=ospf-out prefix=172.16.0.0/12 prefix-length=12-32
add action=accept chain=ospf-out prefix=103.19.56.0/24 prefix-length=24-32
add action=accept chain=ospf-out prefix=103.19.57.0/24 prefix-length=24-32
add action=accept chain=ospf-out prefix=103.19.58.0/24 prefix-length=24-32
add action=accept chain=ospf-out prefix=103.19.59.0/24 prefix-length=24-32
add action=accept chain=ospf-out prefix=103.143.244.0/24 prefix-length=24-32
add action=accept chain=ospf-out prefix=103.143.245.0/24 prefix-length=24-32
add action=discard chain=ospf-out
add action=discard chain=EBGP-FNA-in comment=eBGP-FNA-START prefix=\
    103.19.56.0/24
add action=discard chain=EBGP-FNA-in prefix=103.19.57.0/24
add action=discard chain=EBGP-FNA-in prefix=103.19.58.0/24
add action=discard chain=EBGP-FNA-in prefix=103.19.59.0/24
add action=discard chain=EBGP-FNA-in prefix=103.143.244.0/24
add action=discard chain=EBGP-FNA-in prefix=103.143.245.0/24
add action=accept chain=EBGP-FNA-in prefix=103.143.245.128/26 prefix-length=\
    26-32
add action=accept chain=EBGP-FNA-out prefix=103.143.244.0/24
add action=accept chain=EBGP-FNA-out prefix=103.19.57.0/24
add action=accept chain=EBGP-FNA-out prefix=27.131.4.0/24 prefix-length=24
add action=discard chain=EBGP-FNA-out comment=eBGP-FNA-END
add action=accept chain=EBGP-SBP-in comment=eBGP-SBP-START prefix=\
    27.131.4.0/24 prefix-length=24
add action=discard chain=EBGP-SBP-in
add action=accept chain=EBGP-SBP-out prefix=103.143.245.0/24 prefix-length=24
add action=discard chain=EBGP-SBP-out comment=eBGP-SBP-END
/routing ospf interface
add interface=3504-CORE-FNA network-type=point-to-point
/routing ospf network
add area=backbone network=103.19.56.228/30
/snmp
set enabled=yes trap-community=cirebon trap-version=2
/system clock
set time-zone-name=Asia/Jakarta
/system identity
set name=core-fna-cirebon.bitsnet.id
