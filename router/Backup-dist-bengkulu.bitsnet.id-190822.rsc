# aug/19/2022 11:33:18 by RouterOS 6.49.5
# software id = 67HB-CLB7
#
# model = CCR1009-7G-1C-1S+
# serial number = 914F096703E4
/interface bridge
add mtu=1500 name=Bridge-Backup-Bengkulu
add mtu=1500 name=Bridge-Main-Bengkulu
add name=loopback
/interface ethernet
set [ find default-name=ether1 ] comment="TO SANTIKA" speed=100Mbps
set [ find default-name=ether2 ] speed=100Mbps
set [ find default-name=ether3 ] comment=TO-RB450G speed=100Mbps
set [ find default-name=ether4 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full comment=\
    "IPVPN ICON+" speed=100Mbps
set [ find default-name=ether5 ] speed=100Mbps
set [ find default-name=ether6 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full comment=\
    TELKOM rx-flow-control=auto speed=100Mbps tx-flow-control=auto
set [ find default-name=ether7 ] comment="TRUNK TO SWITCH" speed=100Mbps
set [ find default-name=sfp-sfpplus1 ] advertise=\
    10M-full,100M-full,1000M-full
/interface ipip
add local-address=103.19.56.171 name=tun01-OFFICE-NEW remote-address=\
    10.0.100.18
/interface vlan
add interface=ether7 name=100-HS-MGT vlan-id=100
add interface=ether7 name=500-HS-RESTO-SAIMEN-EX vlan-id=500
add interface=ether7 name=501-HS-RESTO-SAIMEN vlan-id=501
add interface=ether7 name=507-HS-BTN-KC-KCS-BENGKULU vlan-id=507
add interface=ether7 name=509-HS-BTS-ENSEVAL-EX vlan-id=509
add interface=ether7 name=510-HS-COFFICE vlan-id=510
add interface=ether7 name=512-HS-CORDELA vlan-id=512
add interface=ether7 name=513-HS-BTS-ENSEVAL vlan-id=513
add interface=ether7 name=514-HS-CCTV vlan-id=514
add interface=ether7 name=516-HS-BPKD-UBNT vlan-id=516
add interface=ether7 name=517-CUST-NEW vlan-id=517
/interface list
add comment=upstream name=from-uplink
add comment=downstream exclude=from-uplink name=from-downlink
add name=list-client
add name=interface-client
/ip pool
add name=dhcp_pool0 ranges=172.16.100.2
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no interface=ether3 name=dhcp1
/ppp profile
set *0 use-encryption=no
add bridge=Bridge-Backup-Bengkulu name=BACKUP-BENGKULU use-encryption=no
add change-tcp-mss=yes comment="Request Customer" name=SAIMEN only-one=yes \
    use-encryption=yes
add bridge=Bridge-Main-Bengkulu name=MAIN-BENGKULU use-encryption=no
/interface l2tp-client
add allow-fast-path=yes comment=BACKUP_BENGKULU connect-to=103.19.56.185 \
    disabled=no ipsec-secret=7895123ok keepalive-timeout=3000 max-mru=1500 \
    max-mtu=1500 name=L2TP-BACKUP-BENGKULU password=7895123ok33 profile=\
    BACKUP-BENGKULU use-ipsec=yes user=BITSNETBENGKULU-2
add allow-fast-path=yes comment=BACKUP_BENGKULU connect-to=103.19.56.253 \
    disabled=no ipsec-secret=7895123ok keepalive-timeout=3000 max-mru=1500 \
    max-mtu=1500 name=L2TP-MAIN-BENGKULU password=7895123ok33 profile=\
    MAIN-BENGKULU use-ipsec=yes user=BITSNETBENGKULU-1
/queue tree
add disabled=yes max-limit=10M name=global-out parent=global
/queue type
add kind=pfifo name=Critical pfifo-limit=128
add kind=pcq name=ping_pkts_i_32K pcq-classifier=dst-address \
    pcq-dst-address6-mask=64 pcq-rate=32k pcq-src-address6-mask=64
add kind=pcq name=ping_pkts_o_32K pcq-classifier=src-address \
    pcq-dst-address6-mask=64 pcq-rate=32k pcq-src-address6-mask=64
/queue simple
add bucket-size=0/0 max-limit=1G/1G name="1. TOTAL BANDWIDTH" queue=\
    pcq-upload-default/pcq-download-default target=\
    103.19.56.0/22,172.16.0.0/16,10.0.100.0/24
add max-limit=2M/2M name="BTN KCS BENGKULU" parent="1. TOTAL BANDWIDTH" \
    priority=1/1 queue=pcq-upload-default/pcq-download-default target=\
    10.0.100.58/32 total-priority=1
add comment="Layanan 70M Lagi Tes Di Buka 100M" max-limit=100M/100M name=\
    "HOTEL SANTIKA BENGKULU" parent="1. TOTAL BANDWIDTH" target=\
    103.19.57.64/29
add burst-limit=12M/12M burst-threshold=2M/2M burst-time=1m/1m limit-at=7M/7M \
    max-limit=7M/7M name="PT ENSEVAL PUTRA MEGA TRAIDING" parent=\
    "1. TOTAL BANDWIDTH" queue=pcq-upload-default/pcq-download-default \
    target=103.19.58.133/32
add limit-at=10M/10M max-limit=10M/10M name="BPKD PROVINSI BENGKULU" parent=\
    "1. TOTAL BANDWIDTH" queue=pcq-upload-default/pcq-download-default \
    target=103.19.57.232/29
add max-limit=40M/40M name="SOHO - GROUP 1" parent="1. TOTAL BANDWIDTH" \
    queue=pcq-upload-default/pcq-download-default target=\
    103.19.58.132/32,103.19.58.135/32
add max-limit=20M/20M name="SOHO - RSKJ SOEPRAPTO BENGKULU" parent=\
    "SOHO - GROUP 1" queue=pcq-upload-default/pcq-download-default target=\
    103.19.58.132/32,10.110.201.20/32
add max-limit=20M/20M name="OFFICE - BENTIRING" parent="SOHO - GROUP 1" \
    queue=pcq-upload-default/pcq-download-default target=103.19.58.135/32
add disabled=yes max-limit=30M/30M name="HOTEL CORDELA BENGKULU" parent=\
    "1. TOTAL BANDWIDTH" priority=1/1 target=172.16.200.28/30
add max-limit=10M/10M name="PT SAIMEN" parent="1. TOTAL BANDWIDTH" target=\
    103.19.58.140/32
/queue tree
add disabled=yes name=ping_pkts_i packet-mark=ping_pkts_i parent=global-out \
    queue=ping_pkts_i_32K
add disabled=yes name=ping_pkts_o packet-mark=ping_pkts_o parent=global-out \
    queue=ping_pkts_o_32K
/routing ospf instance
set [ find default=yes ] redistribute-connected=as-type-2 \
    redistribute-static=as-type-2 router-id=103.19.56.171
/snmp community
set [ find default=yes ] addresses=103.19.56.0/22
add addresses=103.19.56.0/22 name=bengkulu
/system logging action
set 0 memory-lines=10000
set 3 remote=103.19.56.12 src-address=103.19.56.171
/user group
set read policy="local,telnet,ssh,read,test,winbox,web,sniff,sensitive,api,rom\
    on,tikapp,!ftp,!reboot,!write,!policy,!password,!dude"
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
add name=support policy="local,telnet,ssh,reboot,read,write,policy,test,winbox\
    ,password,sniff,sensitive,romon,tikapp,!ftp,!web,!api,!dude"
add name=NOC policy="local,telnet,ssh,reboot,read,write,test,winbox,web,sensit\
    ive,!ftp,!policy,!password,!sniff,!api,!romon,!dude,!tikapp"
add name=SPVNOC policy="local,telnet,ssh,reboot,read,write,test,winbox,passwor\
    d,web,sniff,sensitive,api,romon,tikapp,!ftp,!policy,!dude"
add name=lg policy="telnet,read,test,sniff,!local,!ssh,!ftp,!reboot,!write,!po\
    licy,!winbox,!password,!web,!sensitive,!api,!romon,!dude,!tikapp"
/interface bridge settings
set use-ip-firewall=yes use-ip-firewall-for-vlan=yes
/ip firewall connection tracking
set enabled=yes loose-tcp-tracking=no
/ip neighbor discovery-settings
set discover-interface-list=all
/interface list member
add interface=500-HS-RESTO-SAIMEN-EX list=interface-client
add interface=501-HS-RESTO-SAIMEN list=interface-client
add interface=507-HS-BTN-KC-KCS-BENGKULU list=interface-client
add interface=509-HS-BTS-ENSEVAL-EX list=interface-client
add interface=512-HS-CORDELA list=interface-client
add interface=513-HS-BTS-ENSEVAL list=interface-client
add interface=514-HS-CCTV list=interface-client
add interface=516-HS-BPKD-UBNT list=interface-client
add list=interface-client
add interface=tun01-OFFICE-NEW list=interface-client
/interface pppoe-server server
add default-profile=SAIMEN interface=501-HS-RESTO-SAIMEN max-mru=1480 \
    max-mtu=1480 one-session-per-host=yes service-name=PPOe-PT-SAIMEN
/interface pptp-server server
set authentication=pap,chap,mschap1,mschap2 enabled=yes
/interface sstp-server server
set default-profile=default-encryption
/ip address
add address=172.16.100.9/30 interface=tun01-OFFICE-NEW network=172.16.100.8
add address=10.100.100.1/24 comment="IP AP RADIO" interface=ether7 network=\
    10.100.100.0
add address=10.0.100.97/30 interface=514-HS-CCTV network=10.0.100.96
add address=10.0.100.57/29 comment="VLAN BTN-KCS-BENGKULU" interface=\
    507-HS-BTN-KC-KCS-BENGKULU network=10.0.100.56
add address=10.0.100.17/29 comment="VLAN OFFICE BENTIRING" interface=\
    510-HS-COFFICE network=10.0.100.16
add address=10.0.100.1/29 comment="VLAN RESTO SAIMEN" interface=\
    501-HS-RESTO-SAIMEN network=10.0.100.0
add address=10.0.101.1/30 comment="VLAN MANAGEMENT" interface=100-HS-MGT \
    network=10.0.101.0
add address=10.0.100.113/29 comment="VLAN BPKD" interface=516-HS-BPKD-UBNT \
    network=10.0.100.112
add address=103.19.56.241 comment=BACKUP-TELKOM interface=\
    Bridge-Backup-Bengkulu network=103.19.56.240
add address=10.0.100.121/29 comment="VLAN HS-COREDLA" interface=\
    512-HS-CORDELA network=10.0.100.120
add address=110.110.110.6/24 comment="Gateway Internet Telkom" interface=\
    ether6 network=110.110.110.0
add address=103.19.56.171 comment=Loopback interface=loopback network=\
    103.19.56.171
add address=10.0.100.129/29 comment="BTS ENSEVAL" interface=\
    513-HS-BTS-ENSEVAL network=10.0.100.128
add address=10.255.255.1/30 interface=ether3 network=10.255.255.0
add address=103.19.56.241 interface=loopback network=103.19.56.241
add address=103.19.56.238/30 interface=ether4 network=103.19.56.236
add address=103.19.56.243 comment=BACKUP-TELKOM interface=\
    Bridge-Main-Bengkulu network=103.19.56.242
add address=103.19.57.65/29 interface=ether1 network=103.19.57.64
add address=192.168.1.1/24 interface=ether7 network=192.168.1.0
add address=103.19.56.171 interface=501-HS-RESTO-SAIMEN network=103.19.58.140
/ip dhcp-server network
add address=172.16.100.0/30 gateway=172.16.100.1
/ip dns
set cache-max-ttl=1d servers=8.8.8.8,1.1.1.1,110.110.110.1
/ip firewall address-list
add address=103.19.56.2 list=dns-bitsnet
add address=103.19.56.3 list=dns-bitsnet
add address=103.19.56.10 list=dns-bitsnet
add address=103.19.56.11 list=dns-bitsnet
add address=103.19.56.0/22 list=network-bitsnet
add address=103.143.244.0/23 list=network-bitsnet
add address=103.19.58.132 disabled=yes list=client-telkom
add address=103.19.58.133 disabled=yes list=client-telkom
add address=103.19.58.140 disabled=yes list=client-telkom
add address=172.16.200.28/30 list=client
add address=172.16.200.28/30 comment=Cordela disabled=yes list=client-telkom
add address=103.19.58.135 disabled=yes list=client-telkom
add address=172.16.200.0/30 comment=Cordela list=client
add address=10.110.201.20 comment=RSKJ list=client
add address=172.172.172.0/29 comment="VPN REMOTE" list=client
add address=10.0.100.16/29 comment=OFFICE list=client
/ip firewall filter
add action=drop chain=input dst-port=53 protocol=tcp
add action=drop chain=input dst-port=53 protocol=udp
add action=drop chain=forward comment=\
    "1. Dont disable/delete please, blok spammer" dst-port=25 protocol=tcp
add action=drop chain=forward comment=\
    "2. Dont disable/delete please, blok spammer" dst-port=25 protocol=udp
add action=drop chain=forward disabled=yes dst-port=137-139,445,3389 \
    protocol=tcp
add action=drop chain=forward disabled=yes dst-port=137-139,445,3389 \
    protocol=udp
add action=drop chain=input disabled=yes src-address=37.49.231.0/24
add action=drop chain=input disabled=yes src-address=116.12.40.0/21
add action=drop chain=forward disabled=yes dst-address=116.12.40.0/21
/ip firewall mangle
add action=mark-connection chain=input connection-state=new disabled=yes \
    in-interface=Bridge-Backup-Bengkulu new-connection-mark=TELKOM_CONN \
    passthrough=yes
add action=mark-connection chain=input connection-state=new disabled=yes \
    in-interface=ether3 new-connection-mark=ICON_CONN passthrough=yes
add action=mark-routing chain=output connection-mark=TELKOM_CONN disabled=yes \
    new-routing-mark=TO_TELKOM passthrough=no
add action=mark-routing chain=output connection-mark=ICON_CONN disabled=yes \
    new-routing-mark=TO_ICON passthrough=no
add action=mark-connection chain=prerouting disabled=yes dst-address-type=\
    !local in-interface-list=interface-client new-connection-mark=TELKOM_CONN \
    passthrough=yes per-connection-classifier=both-addresses-and-ports:2/0
add action=mark-connection chain=prerouting disabled=yes dst-address-type=\
    !local in-interface-list=interface-client new-connection-mark=ICON_CONN \
    passthrough=yes per-connection-classifier=both-addresses-and-ports:2/1
add action=mark-routing chain=prerouting connection-mark=TELKOM_CONN \
    disabled=yes in-interface-list=interface-client new-routing-mark=\
    TO_TELKOM passthrough=yes
add action=mark-routing chain=prerouting connection-mark=ICON_CONN disabled=\
    yes in-interface-list=interface-client new-routing-mark=TO_ICON \
    passthrough=yes
/ip firewall nat
add action=dst-nat chain=dstnat comment="Redirect DNS" dst-address-list=\
    !dns-bitsnet dst-port=53,443,853 nth=2,1 protocol=udp src-address-list=\
    network-bitsnet to-addresses=103.19.56.10 to-ports=53
add action=dst-nat chain=dstnat comment="Redirect DNS" dst-address-list=\
    !dns-bitsnet dst-port=53,443,853 nth=1,1 protocol=udp src-address-list=\
    network-bitsnet to-addresses=103.19.56.11 to-ports=53
add action=dst-nat chain=dstnat comment="OPEN DNS" disabled=yes dst-port=53 \
    nth=2,1 protocol=udp to-addresses=1.1.1.1 to-ports=53
add action=dst-nat chain=dstnat disabled=yes dst-port=53 protocol=udp \
    to-addresses=1.0.0.1 to-ports=53
add action=src-nat chain=srcnat comment=NAT-GLOBAL-LOOPBACK src-address-list=\
    client to-addresses=103.19.56.171
add action=src-nat chain=srcnat comment="VIA TELKOM" src-address-list=client \
    to-addresses=103.19.56.241
add action=src-nat chain=srcnat comment="VIA ICON" src-address-list=client \
    to-addresses=103.19.56.243
add action=src-nat chain=srcnat disabled=yes src-address=172.16.200.28/30 \
    to-addresses=103.19.56.241
add action=dst-nat chain=dstnat disabled=yes dst-port=53 protocol=udp \
    to-addresses=8.8.8.8
add action=dst-nat chain=dstnat disabled=yes dst-port=53 protocol=udp \
    to-addresses=1.1.1.1
add action=dst-nat chain=dstnat comment="Switch HP" dst-address=103.19.56.238 \
    dst-port=6081 protocol=tcp to-addresses=10.0.101.2 to-ports=80
add action=src-nat chain=srcnat disabled=yes dst-address=202.146.0.252 \
    src-address=103.19.57.66 to-addresses=103.19.57.65
/ip route
add comment="ROUTE TO TELKOM" disabled=yes distance=1 gateway=103.19.56.240 \
    routing-mark=TO_TELKOM
add comment="ROUTE TO ICON" distance=111 gateway=103.19.56.242
add comment="ROUTE TO TELKOM" distance=111 gateway=103.19.56.240
add comment="ROUTE TO ICON" distance=112 gateway=103.19.56.240
add comment="ROUTE TO ICON" distance=113 gateway=103.19.56.237
add comment=TEST-INET-TELKOM disabled=yes distance=1 dst-address=8.8.8.8/32 \
    gateway=110.110.110.1
add comment="Route To RSKJ" distance=1 dst-address=10.99.1.0/30 gateway=\
    10.0.100.131
add check-gateway=ping comment="To BTS Enseval" distance=1 dst-address=\
    10.110.200.0/21 gateway=10.0.100.131
add distance=1 dst-address=10.254.14.64/30 gateway=10.0.100.58
add check-gateway=ping comment="L2TP Route To BACKUP BITSNET" distance=1 \
    dst-address=103.19.56.185/32 gateway=110.110.110.1
add comment="L2TP Route To MAIN BITSNET" distance=1 dst-address=\
    103.19.56.253/32 gateway=103.19.56.237
add comment="Backup wirelles Bpkd" distance=1 dst-address=103.19.57.232/29 \
    gateway=10.0.100.115
add comment="Route To RSKJ" distance=1 dst-address=103.19.58.132/32 gateway=\
    10.0.100.131
add comment="Route To Enseval" distance=1 dst-address=103.19.58.133/32 \
    gateway=10.0.100.131
add comment="Route To Office Bentiring" disabled=yes distance=1 dst-address=\
    103.19.58.176/32 gateway=10.0.100.18
add comment="Route To Cordela" distance=1 dst-address=172.16.200.28/30 \
    gateway=10.0.100.122
/ip route rule
add dst-address=1.1.1.1/32 table=routing-via-telkom
add dst-address=8.8.8.8/32 table=routing-via-telkom
add dst-address=8.8.4.4/32 table=routing-via-telkom
add dst-address=216.239.38.120/32 table=routing-via-telkom
/ip service
set telnet address=103.19.56.0/22,103.143.244.0/23 port=9989
set ftp address=103.19.56.0/22,103.143.244.0/23 disabled=yes port=9987
set www address=103.19.56.0/22,103.143.244.0/23 disabled=yes port=60080
set ssh address=103.19.56.0/22,103.143.244.0/23 disabled=yes port=9988
set api disabled=yes
set winbox address=0.0.0.0/0 port=9990
set api-ssl disabled=yes
/ip ssh
set allow-none-crypto=yes forwarding-enabled=remote
/lcd
set default-screen=stats-all touch-screen=disabled
/ppp secret
add local-address=172.16.200.33 name=bengkulu password=bengkulu profile=\
    default-encryption remote-address=172.16.200.34
add local-address=172.172.172.1 name=vpnbagus password=vpnbagus profile=\
    default-encryption remote-address=172.172.172.4
add comment="Request Customer " disabled=yes local-address=10.100.100.1 name=\
    PT-SAIMEN password=PT-SAIMEN profile=SAIMEN remote-address=103.19.58.140
add local-address=172.172.172.1 name=niam password=niam123 profile=\
    default-encryption remote-address=172.172.172.2
add local-address=172.172.172.1 name=sahrul password=sahrul profile=\
    default-encryption remote-address=172.172.172.3
/routing filter
add action=discard chain=Droplist comment=DROPLIST disabled=yes prefix=\
    10.0.0.0/8 prefix-length=8-32
add action=discard chain=Droplist disabled=yes prefix=172.16.0.0/12 \
    prefix-length=12-32
add action=discard chain=Droplist disabled=yes prefix=192.168.0.0/16 \
    prefix-length=16-32
add action=return chain=Droplist disabled=yes
add action=jump chain=ospf-in comment=OSPF-IN disabled=yes jump-target=\
    Droplist
add action=accept chain=ospf-in prefix=0.0.0.0/0
add action=accept chain=ospf-in prefix=10.0.0.0/8 prefix-length=8-32
add action=accept chain=ospf-in prefix=172.16.0.0/12 prefix-length=12-32
add action=accept chain=ospf-in prefix=103.19.56.0/24 prefix-length=24-32
add action=accept chain=ospf-in prefix=103.19.57.0/24 prefix-length=24-32
add action=accept chain=ospf-in prefix=103.19.58.0/24 prefix-length=24-32
add action=accept chain=ospf-in prefix=103.19.59.0/24 prefix-length=24-32
add action=accept chain=ospf-in prefix=103.143.244.0/24 prefix-length=24-32
add action=accept chain=ospf-in prefix=103.143.245.0/24 prefix-length=24-32
add action=discard chain=ospf-in
add action=accept chain=ospf-out comment=OSPF-OUT prefix=10.0.0.0/8 \
    prefix-length=8-32
add action=accept chain=ospf-out prefix=172.16.0.0/12 prefix-length=12-32
add action=accept chain=ospf-out prefix=103.19.56.0/24 prefix-length=24-32
add action=accept chain=ospf-out prefix=103.19.57.0/24 prefix-length=24-32
add action=accept chain=ospf-out prefix=103.19.58.0/24 prefix-length=24-32
add action=accept chain=ospf-out prefix=103.19.59.0/24 prefix-length=24-32
add action=discard chain=ospf-out
/routing ospf interface
add cost=150 interface=Bridge-Backup-Bengkulu network-type=point-to-point
add cost=200 disabled=yes interface=ether3 network-type=point-to-point
add interface=Bridge-Main-Bengkulu network-type=point-to-point
/routing ospf network
add area=backbone network=103.19.56.240/32
add area=backbone network=103.19.56.171/32
add area=backbone network=103.19.56.241/32
add area=backbone disabled=yes network=10.255.255.0/30
add area=backbone network=103.19.56.242/32
add area=backbone network=103.19.56.243/32
/snmp
set contact=noc@bits.net.id enabled=yes location="dist bengkulu" \
    trap-community=bengkulu trap-version=2
/system clock
set time-zone-name=Asia/Jakarta
/system identity
set name=DISTRIBUSI-BENGKULU.BITSNET.ID
/system logging
add action=remote topics=critical
add action=remote topics=error
add action=remote topics=info
add action=remote topics=warning
/system note
set note=\
    "Konfigurasi telah dicadangkan pada 10 October 2018 by Noc@bits.net.id" \
    show-at-login=no
/system ntp client
set enabled=yes primary-ntp=103.19.56.5 secondary-ntp=202.162.32.12
/system scheduler
add interval=1w name=autobackup&autosend on-event="/system backup save name=(\
    \"BACKUP\" . \"-\" . [/system identity get name] . \"-\" . \\\r\
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
    word=@ftp6789 src-path=\$backupname dst-path=\"backup/mikrotik/\$backupnam\
    e\" upload=yes\r\
    \n\r\
    \n/file remove \$backupname\r\
    \n\r\
    \n:global backupname (\"BACKUP\" . \"-\" . [/system identity get name] . \
    \"-\" . \\\r\
    \n[:pick [/system clock get date] 4 6] . [:pick [/system clock get date] 0\
    \_3] . [:pick [/system clock get date] 7 11] . \".rsc\");\r\
    \n/tool fetch address=103.19.56.6 mode=ftp port=21234 user=ftpbitsnet pass\
    word=@ftp6789 src-path=\$backupname dst-path=\"backup/mikrotik/\$backupnam\
    e\" upload=yes\r\
    \n\r\
    \n/file remove \$backupname" policy=\
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
    word=@ftp6789 src-path=\$backupname dst-path=\"backup/mikrotik/\$backupnam\
    e\" upload=yes\r\
    \n\r\
    \n/file remove \$backupname\r\
    \n\r\
    \n:global backupname (\"BACKUP\" . \"-\" . [/system identity get name] . \
    \"-\" . \\\r\
    \n[:pick [/system clock get date] 4 6] . [:pick [/system clock get date] 0\
    \_3] . [:pick [/system clock get date] 7 11] . \".rsc\");\r\
    \n/tool fetch address=103.19.56.6 mode=ftp port=21234 user=ftpbitsnet pass\
    word=@ftp6789 src-path=\$backupname dst-path=\"backup/mikrotik/\$backupnam\
    e\" upload=yes\r\
    \n\r\
    \n/file remove \$backupname"
/tool bandwidth-server
set authenticate=no
/tool romon
set enabled=yes secrets=bengkulu789ok
