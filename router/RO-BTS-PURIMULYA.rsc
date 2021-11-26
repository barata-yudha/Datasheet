# nov/26/2021 23:26:30 by RouterOS 6.47.9
# software id = JUS2-S5QA
#
# model = CCR1016-12G
# serial number = 574A0541D0D6
/interface bridge
add name=bridge1
add name=fibertrust-mc
add name=loopback-ospf
add name=tunnel
/interface ethernet
set [ find default-name=ether3 ] comment="CCTV PURIMULYA"
set [ find default-name=ether4 ] advertise=10M-full,100M-full comment=\
    AP-SUBAGJA
set [ find default-name=ether5 ] comment=UPLINK-MICRO
set [ find default-name=ether6 ] comment=NETMETAL
set [ find default-name=ether7 ] comment=UNIFI
/interface vlan
add interface=ether6 name=100-AP-PURI vlan-id=100
add interface=ether6 name=101-AP-SUBAGJA vlan-id=101
add interface=ether5 name=102-BEDULAN vlan-id=102
add interface=ether5 name=906-FTTH-PURIMULYA vlan-id=906
add interface=ether5 name=DUMMY-TESTER-1100-IPTV vlan-id=1100
/ip pool
add name=dhcp_pool0 ranges=172.16.2.214
add name=dhcp_pool1 ranges=10.253.5.2-10.253.5.254
add name=dhcp_pool2 ranges=10.253.5.2-10.253.5.254
add name=dhcp_pool5 ranges=10.253.5.2-10.253.5.254
add name=POOL-CUSTOMER-PPPOE-EXPIRED ranges=100.127.192.1-100.127.255.254
add name=POOL-20MB-BITEK-RADS-CRB ranges=100.64.32.2-100.64.39.254
add name=POOL-10MB-BITEK-RADS-CRB ranges=100.64.16.2-100.64.23.254
add name=POOL-10MB-GOESAR-RADS-CRB ranges=100.64.24.2-100.64.25.254
add name=POOL-20MB-GOESAR-RADS-CRB ranges=100.64.40.2-100.64.43.254
add name=POOL-30MB-BITEK-RADS-CRB ranges=100.64.0.2-100.64.7.254
add name=POOL-30MB-GOESAR-RADS-CRB ranges=100.64.26.2-100.64.27.254
add name=POOL-50MB-BITEK-RADS-CRB ranges=100.64.8.2-100.64.15.254
add name=POOL-50MB-GOESAR-RADS-CRB ranges=100.64.28.2-100.64.29.254
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=ether3 lease-time=12w6d \
    name=dhcp1
add address-pool=dhcp_pool5 disabled=no interface=bridge1 name=dhcp3
/ppp profile
set *0 local-address=100.64.0.1
/queue simple
add disabled=yes max-limit=40M/40M name=RIYANA target=10.2.5.8/29
/snmp community
add addresses=103.19.56.0/22 name=cirebon
/interface bridge port
add bridge=fibertrust-mc disabled=yes interface=ether9
add bridge=fibertrust-mc disabled=yes interface=ether11
/ip neighbor discovery-settings
set discover-interface-list=all
/interface pppoe-server server
add disabled=no interface=fibertrust-mc max-mru=1480 max-mtu=1480 \
    service-name=20MB-PURI-RADS-CRB
add disabled=no max-mru=1480 max-mtu=1480 service-name=2100
/ip address
add address=10.2.2.1/24 comment=AP-PUR1 interface=ether6 network=10.2.2.0
add address=10.2.1.1 comment=tunnel interface=tunnel network=10.2.1.1
add address=10.2.3.1/28 comment=PTM-PURI interface=100-AP-PURI network=\
    10.2.3.0
add address=10.2.5.1/29 comment=PTM-SUBAGJA interface=101-AP-SUBAGJA network=\
    10.2.5.0
add address=172.16.2.213/30 comment="IP CCTV PURIMULYA" interface=ether3 \
    network=172.16.2.212
add address=10.253.5.1/24 comment=AP-UNIFI interface=ether7 network=\
    10.253.5.0
add address=136.1.1.1/24 comment="MGT - OLT" interface=ether12 network=\
    136.1.1.0
add address=172.16.10.1/30 comment=RO-MONITORING interface=ether10 network=\
    172.16.10.0
add address=103.19.57.15 comment=loopback interface=loopback-ospf network=\
    103.19.57.15
add address=10.2.5.9/29 comment=PTP-BEDULAND interface=102-BEDULAN network=\
    10.2.5.8
add address=103.19.57.14 comment=UPLINK-MICRO interface=906-FTTH-PURIMULYA \
    network=103.19.57.8
/ip dhcp-server lease
add address=10.253.5.206 client-id=1:24:a4:3c:c:8a:52 comment=UNIFI \
    mac-address=24:A4:3C:0C:8A:52 server=dhcp3
/ip dhcp-server network
add address=10.253.5.0/24 gateway=10.253.5.1
add address=172.16.2.212/30 dns-server=103.19.56.10,103.19.56.11 gateway=\
    172.16.2.213
/ip dns
set servers=10.202.0.130,103.19.56.10,103.19.56.11
/ip firewall address-list
add address=100.64.0.0/10 comment=FTTH list=client-nat-purimulya
add address=172.16.2.212/30 comment=CCTV list=client-nat-purimulya
add address=10.253.5.0/24 comment=LAN-PURI list=client-nat-purimulya
/ip firewall filter
add action=drop chain=forward comment=\
    "#BLOCK SPAMMER AND PROTECT IP PUBLIK FROM BLACKLIST" dst-port=25 \
    protocol=tcp
add action=drop chain=forward dst-port=25 protocol=udp
/ip firewall nat
add action=masquerade chain=srcnat comment=NAT-INTERNET-CUSTOMER-PURI \
    src-address-list=client-nat-purimulya
add action=dst-nat chain=dstnat dst-address=103.19.57.14 dst-port=5050 \
    protocol=tcp to-addresses=10.2.2.2 to-ports=8291
add action=dst-nat chain=dstnat dst-address=103.19.57.14 dst-port=8000 \
    protocol=tcp to-addresses=172.16.2.214 to-ports=8000
/ip route
add check-gateway=ping comment="Default Route BTS" distance=1 gateway=\
    103.19.57.8
/ip service
set telnet address=103.19.56.0/22,103.143.244.0/23 port=9989
set ftp disabled=yes
set www address=103.19.56.0/22,103.143.244.0/23 port=60080
set ssh address=103.19.56.0/22,103.143.244.0/23 port=9988
set api disabled=yes
set winbox address=0.0.0.0/0 port=9990
set api-ssl disabled=yes
/lcd
set time-interval=hour
/port firmware
set directory=v21
/ppp aaa
set interim-update=1m use-circuit-id-in-nas-port-id=yes use-radius=yes
/radius
add address=103.19.56.9 secret=bitsnet2020 service=ppp timeout=2s
/snmp
set contact=noc@bitsnet enabled=yes location=Purimulya trap-community=cirebon \
    trap-version=2
/system clock
set time-zone-name=Asia/Jakarta
/system console
set [ find ] disabled=yes
/system identity
set name=RO-BTS-PURIMULYA
/system ntp client
set enabled=yes
/system package update
set channel=long-term
/system scheduler
add interval=2w name=autobackup&autosend on-event=autobackup&autosend policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=apr/21/2019 start-time=01:00:00
/system script
add dont-require-permissions=no name=autobackup&autosend owner=bitsnet \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source="/system backup save name=(\"BACKUP\" . \"-\" . [/system identity g\
    et name] . \"-\" . \\\r\
    \n[:pick [/system clock get date] 4 6] . [:pick [/system clock get date] 0\
    \_3] . [:pick [/system clock get date] 7 11]);\r\
    \n/export file=(\"BACKUP\" . \"-\" . [/system identity get name] . \"-\" .\
    \_\\\r\
    \n[:pick [/system clock get date] 4 6] . [:pick [/system clock get date] 0\
    \_3] . [:pick [/system clock get date] 7 11]);\r\
    \n\r\
    \n:delay 15s\r\
    \n\r\
    \n:global backupname (\"BACKUP\" . \"-\" . [/system identity get name] . \
    \"-\" . \\\r\
    \n[:pick [/system clock get date] 4 6] . [:pick [/system clock get date] 0\
    \_3] . [:pick [/system clock get date] 7 11] . \".backup\");\r\
    \n/tool fetch address=103.19.56.6 mode=ftp port=21234 user=ftpbitsnet pass\
    word=PctnGHbKe3 src-path=\$backupname dst-path=\"backup/mikrotik/\$backupn\
    ame\" upload=yes\r\
    \n\r\
    \n/file remove \$backupname\r\
    \n\r\
    \n:global backupname (\"BACKUP\" . \"-\" . [/system identity get name] . \
    \"-\" . \\\r\
    \n[:pick [/system clock get date] 4 6] . [:pick [/system clock get date] 0\
    \_3] . [:pick [/system clock get date] 7 11] . \".rsc\");\r\
    \n/tool fetch address=103.19.56.6 mode=ftp port=21234 user=ftpbitsnet pass\
    word=PctnGHbKe3 src-path=\$backupname dst-path=\"backup/mikrotik/\$backupn\
    ame\" upload=yes\r\
    \n\r\
    \n/file remove \$backupname"
