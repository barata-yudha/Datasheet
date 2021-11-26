# nov/26/2021 23:44:35 by RouterOS 6.48.5
# software id = 67HB-CLB7
#
# model = CCR1009-7G-1C-1S+
# serial number = 914F096703E4
/interface bridge
add mtu=1596 name=Bridge-Backup-Bengkulu
add mtu=1596 name=Bridge-Main-Bengkulu
add name=loopback
/interface ethernet
set [ find default-name=ether1 ] speed=100Mbps
set [ find default-name=ether2 ] speed=100Mbps
set [ find default-name=ether3 ] speed=100Mbps
set [ find default-name=ether4 ] advertise=\
    10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full comment=\
    "TO SANTIKA" speed=100Mbps
set [ find default-name=ether5 ] comment="IPVPN ICON+" speed=100Mbps
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
add interface=ether7 name=500-HS-RESTO-SAIMEN vlan-id=500
add interface=ether7 name="501-HS-OFFICE BENTIRING" vlan-id=501
add interface=ether7 name=507-HS-BTN-KC-KCS-BENGKULU vlan-id=507
add interface=ether7 name=509-HS-BTS-ENSEVAL vlan-id=509
add interface=ether7 name=512-HS-CORDELA vlan-id=512
add interface=ether7 name=513-HS-OFFICE-NEW vlan-id=513
add interface=ether7 name=514-HS-CCTV vlan-id=514
add interface=ether7 name=516-HS-BPKD-UBNT vlan-id=516
/interface list
add comment=upstream name=from-uplink
add comment=downstream exclude=from-uplink name=from-downlink
add name=list-client
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
add allow-fast-path=yes comment=BAKCUP_BENGKULU connect-to=103.19.56.185 \
    disabled=no ipsec-secret=7895123ok max-mru=1500 max-mtu=1500 mrru=1600 \
    name=L2TP-BACKUP-BENGKULU password=7895123ok33 profile=BACKUP-BENGKULU \
    use-ipsec=yes user=BITSNETBENGKULU-2
add allow-fast-path=yes comment=ICON_BENGKULU connect-to=103.19.56.253 \
    disabled=no ipsec-secret=7895123ok max-mru=1500 max-mtu=1500 mrru=1600 \
    name=L2TP-MAIN-BENGKULU password=7895123ok33 profile=MAIN-BENGKULU \
    use-ipsec=yes user=BITSNETBENGKULU-1
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
add comment="Layanan 70M Lagi Tes Di Buka 100M" disabled=yes max-limit=\
    100M/100M name="HOTEL SANTIKA BENGKULU" parent="1. TOTAL BANDWIDTH" \
    target=103.19.57.64/29
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
    103.19.58.132/32
add max-limit=20M/20M name="OFFICE - BENTIRING" parent="SOHO - GROUP 1" \
    queue=pcq-upload-default/pcq-download-default target=103.19.58.135/32
add max-limit=30M/30M name="HOTEL CORDELA BENGKULU" parent=\
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
add disabled=yes interface=Bridge-Backup-Bengkulu list=from-uplink
add disabled=yes interface=L2TP-BACKUP-BENGKULU list=from-uplink
add disabled=yes list=from-uplink
add disabled=yes interface=ether5 list=from-uplink
add disabled=yes interface=ether6 list=from-uplink
add interface=ether4 list=list-client
add disabled=yes list=list-client
add disabled=yes interface="501-HS-OFFICE BENTIRING" list=list-client
add disabled=yes interface=507-HS-BTN-KC-KCS-BENGKULU list=list-client
add disabled=yes interface=509-HS-BTS-ENSEVAL list=list-client
add disabled=yes interface=512-HS-CORDELA list=list-client
add disabled=yes interface=tun01-OFFICE-NEW list=list-client
add disabled=yes interface=516-HS-BPKD-UBNT list=list-client
add disabled=yes interface=513-HS-OFFICE-NEW list=list-client
/interface pppoe-server server
add default-profile=SAIMEN disabled=no interface=500-HS-RESTO-SAIMEN max-mru=\
    1480 max-mtu=1480 one-session-per-host=yes service-name=PPOe-PT-SAIMEN
/interface pptp-server server
set authentication=pap,chap,mschap1,mschap2
/interface sstp-server server
set default-profile=default-encryption
/ip address
add address=172.16.100.9/30 interface=tun01-OFFICE-NEW network=172.16.100.8
add address=103.19.56.238/30 comment="IPVPN ICON+" interface=ether5 network=\
    103.19.56.236
add address=10.100.100.1/24 comment="IP AP RADIO" interface=ether7 network=\
    10.100.100.0
add address=10.0.100.97/30 interface=514-HS-CCTV network=10.0.100.96
add address=10.0.100.57/29 comment="VLAN BTN-KCS-BENGKULU" interface=\
    507-HS-BTN-KC-KCS-BENGKULU network=10.0.100.56
add address=10.0.100.17/29 comment="VLAN OFFICE BENTIRING" interface=\
    513-HS-OFFICE-NEW network=10.0.100.16
add address=10.0.100.1/29 comment="VLAN RESTO SAIMEN" interface=\
    500-HS-RESTO-SAIMEN network=10.0.100.0
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
add address=103.19.57.65/29 comment="PTP TO SANTIKA" interface=ether4 \
    network=103.19.57.64
add address=103.19.56.171 comment=Loopback interface=loopback network=\
    103.19.56.171
add address=10.0.100.129/29 comment="BTS ENSEVAL" interface=\
    509-HS-BTS-ENSEVAL network=10.0.100.128
add address=103.19.56.243 comment=MAIN-ICON interface=Bridge-Main-Bengkulu \
    network=103.19.56.242
/ip dhcp-server network
add address=172.16.100.0/30 gateway=172.16.100.1
/ip dns
set cache-max-ttl=1d servers=103.19.56.10,103.19.56.11,110.110.110.1
/ip firewall address-list
add address=39.192.0.0/10 list=nice
add address=120.160.0.0/11 list=nice
add address=182.0.0.0/12 list=nice
add address=114.120.0.0/13 list=nice
add address=114.56.0.0/14 list=nice
add address=182.28.0.0/14 list=nice
add address=139.192.0.0/14 list=nice
add address=111.94.0.0/15 list=nice
add address=118.136.0.0/15 list=nice
add address=182.24.0.0/15 list=nice
add address=182.26.0.0/15 list=nice
add address=140.0.0.0/16 list=nice
add address=169.254.0.0/16 list=nice
add address=222.124.0.0/16 list=nice
add address=61.94.0.0/16 list=nice
add address=36.75.0.0/16 list=nice
add address=36.74.0.0/16 list=nice
add address=36.73.0.0/16 list=nice
add address=36.72.0.0/16 list=nice
add address=36.79.0.0/16 list=nice
add address=36.78.0.0/16 list=nice
add address=36.77.0.0/16 list=nice
add address=36.76.0.0/16 list=nice
add address=36.67.0.0/16 list=nice
add address=36.66.0.0/16 list=nice
add address=36.65.0.0/16 list=nice
add address=36.64.0.0/16 list=nice
add address=36.71.0.0/16 list=nice
add address=36.70.0.0/16 list=nice
add address=36.69.0.0/16 list=nice
add address=36.68.0.0/16 list=nice
add address=180.251.0.0/16 list=nice
add address=180.250.0.0/16 list=nice
add address=180.249.0.0/16 list=nice
add address=180.248.0.0/16 list=nice
add address=36.88.0.0/16 list=nice
add address=180.254.0.0/16 list=nice
add address=180.253.0.0/16 list=nice
add address=180.252.0.0/16 list=nice
add address=180.243.0.0/16 list=nice
add address=36.83.0.0/16 list=nice
add address=180.242.0.0/16 list=nice
add address=36.82.0.0/16 list=nice
add address=180.241.0.0/16 list=nice
add address=36.81.0.0/16 list=nice
add address=36.80.0.0/16 list=nice
add address=180.247.0.0/16 list=nice
add address=36.87.0.0/16 list=nice
add address=180.246.0.0/16 list=nice
add address=36.86.0.0/16 list=nice
add address=180.245.0.0/16 list=nice
add address=36.85.0.0/16 list=nice
add address=180.244.0.0/16 list=nice
add address=36.84.0.0/16 list=nice
add address=114.4.0.0/16 list=nice
add address=114.6.0.0/16 list=nice
add address=118.96.0.0/16 list=nice
add address=118.97.0.0/16 list=nice
add address=110.139.0.0/16 list=nice
add address=110.138.0.0/16 list=nice
add address=110.137.0.0/16 list=nice
add address=110.136.0.0/16 list=nice
add address=125.162.0.0/16 list=nice
add address=125.160.0.0/16 list=nice
add address=125.167.0.0/16 list=nice
add address=125.164.0.0/16 list=nice
add address=125.165.0.0/16 list=nice
add address=117.54.0.0/16 list=nice
add address=101.255.0.0/16 list=nice
add address=182.253.0.0/16 list=nice
add address=139.255.0.0/16 list=nice
add address=139.228.0.0/16 list=nice
add address=124.81.0.0/16 list=nice
add address=119.11.128.0/17 list=nice
add address=167.205.0.0/17 list=nice
add address=61.5.0.0/17 list=nice
add address=202.158.0.0/17 list=nice
add address=202.155.0.0/17 list=nice
add address=223.164.0.0/17 list=nice
add address=180.240.128.0/17 list=nice
add address=118.98.0.0/17 list=nice
add address=61.247.0.0/18 list=nice
add address=125.208.128.0/18 list=nice
add address=125.163.0.0/18 list=nice
add address=125.161.128.0/18 list=nice
add address=125.161.192.0/18 list=nice
add address=125.161.0.0/18 list=nice
add address=124.153.0.0/18 list=nice
add address=222.165.192.0/18 list=nice
add address=223.164.192.0/18 list=nice
add address=210.210.128.0/18 list=nice
add address=152.118.128.0/18 list=nice
add address=152.118.192.0/18 list=nice
add address=152.118.0.0/18 list=nice
add address=152.118.64.0/18 list=nice
add address=101.128.64.0/18 list=nice
add address=118.99.64.0/18 list=nice
add address=112.78.128.0/18 list=nice
add address=117.102.64.0/18 list=nice
add address=202.159.0.0/18 list=nice
add address=202.152.128.0/19 list=nice
add address=111.67.64.0/19 list=nice
add address=115.178.192.0/19 list=nice
add address=115.178.224.0/19 list=nice
add address=124.195.0.0/19 list=nice
add address=114.199.96.0/19 list=nice
add address=125.163.64.0/19 list=nice
add address=125.161.96.0/19 list=nice
add address=139.0.192.0/19 list=nice
add address=139.0.224.0/19 list=nice
add address=139.0.128.0/19 list=nice
add address=139.0.160.0/19 list=nice
add address=139.0.64.0/19 list=nice
add address=139.0.96.0/19 list=nice
add address=139.0.32.0/19 list=nice
add address=202.173.64.0/19 list=nice
add address=202.171.0.0/19 list=nice
add address=202.169.32.0/19 list=nice
add address=117.102.224.0/19 list=nice
add address=115.85.64.0/19 list=nice
add address=203.130.224.0/19 list=nice
add address=203.130.192.0/19 list=nice
add address=202.149.64.0/19 list=nice
add address=202.146.224.0/19 list=nice
add address=202.159.96.0/19 list=nice
add address=115.124.64.0/19 list=nice
add address=202.155.128.0/19 list=nice
add address=202.153.224.0/19 list=nice
add address=60.253.96.0/19 list=nice
add address=104.68.32.0/19 list=nice
add address=110.232.64.0/19 list=nice
add address=114.79.0.0/19 list=nice
add address=114.79.32.0/19 list=nice
add address=118.98.160.0/19 list=nice
add address=118.98.192.0/19 list=nice
add address=124.158.128.0/19 list=nice
add address=124.195.96.0/19 list=nice
add address=125.163.96.0/19 list=nice
add address=125.163.160.0/19 list=nice
add address=125.163.224.0/19 list=nice
add address=125.166.224.0/19 list=nice
add address=139.0.0.0/19 list=nice
add address=202.10.32.0/19 list=nice
add address=202.46.64.0/19 list=nice
add address=202.51.96.0/19 list=nice
add address=202.53.224.0/19 list=nice
add address=202.77.96.0/19 list=nice
add address=202.137.0.0/19 list=nice
add address=202.138.224.0/19 list=nice
add address=202.148.0.0/19 list=nice
add address=202.150.128.0/19 list=nice
add address=202.154.32.0/19 list=nice
add address=202.159.64.0/19 list=nice
add address=202.162.192.0/19 list=nice
add address=202.169.224.0/19 list=nice
add address=203.123.224.0/19 list=nice
add address=203.128.64.0/19 list=nice
add address=219.83.32.0/19 list=nice
add address=219.83.64.0/19 list=nice
add address=23.5.192.0/20 list=nice
add address=23.13.0.0/20 list=nice
add address=23.192.192.0/20 list=nice
add address=23.200.176.0/20 list=nice
add address=23.212.112.0/20 list=nice
add address=23.212.128.0/20 list=nice
add address=27.50.16.0/20 list=nice
add address=27.111.32.0/20 list=nice
add address=49.128.176.0/20 list=nice
add address=110.5.96.0/20 list=nice
add address=111.68.112.0/20 list=nice
add address=112.78.32.0/20 list=nice
add address=113.11.128.0/20 list=nice
add address=113.212.112.0/20 list=nice
add address=114.5.0.0/20 list=nice
add address=114.199.80.0/20 list=nice
add address=115.166.112.0/20 list=nice
add address=116.213.48.0/20 list=nice
add address=117.20.48.0/20 list=nice
add address=117.104.208.0/20 list=nice
add address=119.2.80.0/20 list=nice
add address=119.82.224.0/20 list=nice
add address=119.110.64.0/20 list=nice
add address=119.235.16.0/20 list=nice
add address=119.235.208.0/20 list=nice
add address=119.252.160.0/20 list=nice
add address=122.200.0.0/20 list=nice
add address=122.248.32.0/20 list=nice
add address=124.195.48.0/20 list=nice
add address=125.161.64.0/20 list=nice
add address=125.163.144.0/20 list=nice
add address=125.163.192.0/20 list=nice
add address=125.166.64.0/20 list=nice
add address=125.166.144.0/20 list=nice
add address=125.166.192.0/20 list=nice
add address=175.103.48.0/20 list=nice
add address=175.158.32.0/20 list=nice
add address=180.178.96.0/20 list=nice
add address=182.16.240.0/20 list=nice
add address=182.50.240.0/20 list=nice
add address=202.3.208.0/20 list=nice
add address=202.6.224.0/20 list=nice
add address=202.43.160.0/20 list=nice
add address=202.46.144.0/20 list=nice
add address=202.47.64.0/20 list=nice
add address=202.47.192.0/20 list=nice
add address=202.51.208.0/20 list=nice
add address=202.51.224.0/20 list=nice
add address=202.55.160.0/20 list=nice
add address=202.58.64.0/20 list=nice
add address=202.58.160.0/20 list=nice
add address=202.62.16.0/20 list=nice
add address=202.65.112.0/20 list=nice
add address=202.69.96.0/20 list=nice
add address=202.70.48.0/20 list=nice
add address=202.72.208.0/20 list=nice
add address=202.73.112.0/20 list=nice
add address=202.73.224.0/20 list=nice
add address=202.75.96.0/20 list=nice
add address=202.78.192.0/20 list=nice
add address=202.80.112.0/20 list=nice
add address=202.87.176.0/20 list=nice
add address=202.92.192.0/20 list=nice
add address=202.93.16.0/20 list=nice
add address=202.93.32.0/20 list=nice
add address=202.93.128.0/20 list=nice
add address=202.95.128.0/20 list=nice
add address=202.123.224.0/20 list=nice
add address=202.127.96.0/20 list=nice
add address=202.143.32.0/20 list=nice
add address=202.145.0.0/20 list=nice
add address=202.150.160.0/20 list=nice
add address=202.152.160.0/20 list=nice
add address=202.153.16.0/20 list=nice
add address=202.154.0.0/20 list=nice
add address=202.158.128.0/20 list=nice
add address=202.165.32.0/20 list=nice
add address=202.182.48.0/20 list=nice
add address=203.77.208.0/20 list=nice
add address=203.77.224.0/20 list=nice
add address=203.83.32.0/20 list=nice
add address=203.142.64.0/20 list=nice
add address=203.153.96.0/20 list=nice
add address=203.161.16.0/20 list=nice
add address=203.166.192.0/20 list=nice
add address=203.201.160.0/20 list=nice
add address=210.57.208.0/20 list=nice
add address=210.79.208.0/20 list=nice
add address=219.83.16.0/20 list=nice
add address=219.83.96.0/20 list=nice
add address=220.157.96.0/20 list=nice
add address=223.27.144.0/20 list=nice
add address=27.112.64.0/21 list=nice
add address=27.123.0.0/21 list=nice
add address=27.124.88.0/21 list=nice
add address=27.131.0.0/21 list=nice
add address=27.131.248.0/21 list=nice
add address=45.64.0.0/21 list=nice
add address=45.64.96.0/21 list=nice
add address=49.156.56.0/21 list=nice
add address=49.236.216.0/21 list=nice
add address=58.65.240.0/21 list=nice
add address=101.100.200.0/21 list=nice
add address=103.3.208.0/21 list=nice
add address=103.6.200.0/21 list=nice
add address=103.10.144.0/21 list=nice
add address=103.26.208.0/21 list=nice
add address=103.28.112.0/21 list=nice
add address=103.31.224.0/21 list=nice
add address=103.229.160.0/21 list=nice
add address=110.35.80.0/21 list=nice
add address=110.76.144.0/21 list=nice
add address=111.68.24.0/21 list=nice
add address=111.92.168.0/21 list=nice
add address=112.109.16.0/21 list=nice
add address=112.140.160.0/21 list=nice
add address=113.11.144.0/21 list=nice
add address=113.20.136.0/21 list=nice
add address=113.212.160.0/21 list=nice
add address=114.31.240.0/21 list=nice
add address=114.110.16.0/21 list=nice
add address=114.129.16.0/21 list=nice
add address=114.134.64.0/21 list=nice
add address=114.141.48.0/21 list=nice
add address=114.141.88.0/21 list=nice
add address=114.198.240.0/21 list=nice
add address=115.69.216.0/21 list=nice
add address=115.166.104.0/21 list=nice
add address=115.178.48.0/21 list=nice
add address=115.178.160.0/21 list=nice
add address=116.0.0.0/21 list=nice
add address=116.50.24.0/21 list=nice
add address=116.68.248.0/21 list=nice
add address=116.197.128.0/21 list=nice
add address=116.254.96.0/21 list=nice
add address=116.254.112.0/21 list=nice
add address=117.74.120.0/21 list=nice
add address=117.102.160.0/21 list=nice
add address=117.103.0.0/21 list=nice
add address=117.103.48.0/21 list=nice
add address=117.103.64.0/21 list=nice
add address=117.103.168.0/21 list=nice
add address=117.104.192.0/21 list=nice
add address=117.121.200.0/21 list=nice
add address=118.82.8.0/21 list=nice
add address=118.82.24.0/21 list=nice
add address=118.91.128.0/21 list=nice
add address=119.2.40.0/21 list=nice
add address=119.2.48.0/21 list=nice
add address=119.10.176.0/21 list=nice
add address=119.15.128.0/21 list=nice
add address=119.18.152.0/21 list=nice
add address=119.31.232.0/21 list=nice
add address=119.82.240.0/21 list=nice
add address=119.110.80.0/21 list=nice
add address=119.235.248.0/21 list=nice
add address=120.29.152.0/21 list=nice
add address=120.29.224.0/21 list=nice
add address=120.89.88.0/21 list=nice
add address=121.50.32.0/21 list=nice
add address=121.52.48.0/21 list=nice
add address=121.52.72.0/21 list=nice
add address=121.100.24.0/21 list=nice
add address=121.101.128.0/21 list=nice
add address=121.101.184.0/21 list=nice
add address=122.128.24.0/21 list=nice
add address=122.144.0.0/21 list=nice
add address=122.200.48.0/21 list=nice
add address=122.200.144.0/21 list=nice
add address=123.108.8.0/21 list=nice
add address=123.108.96.0/21 list=nice
add address=123.176.120.0/21 list=nice
add address=123.255.200.0/21 list=nice
add address=124.40.248.0/21 list=nice
add address=124.195.40.0/21 list=nice
add address=125.161.88.0/21 list=nice
add address=125.163.208.0/21 list=nice
add address=125.166.8.0/21 list=nice
add address=125.166.24.0/21 list=nice
add address=125.166.32.0/21 list=nice
add address=125.166.48.0/21 list=nice
add address=125.166.88.0/21 list=nice
add address=125.166.104.0/21 list=nice
add address=125.166.120.0/21 list=nice
add address=125.166.208.0/21 list=nice
add address=150.107.136.0/21 list=nice
add address=175.45.184.0/21 list=nice
add address=175.103.32.0/21 list=nice
add address=175.106.8.0/21 list=nice
add address=175.111.112.0/21 list=nice
add address=175.176.160.0/21 list=nice
add address=175.184.224.0/21 list=nice
add address=180.211.88.0/21 list=nice
add address=180.214.248.0/21 list=nice
add address=183.81.152.0/21 list=nice
add address=202.43.248.0/21 list=nice
add address=202.46.0.0/21 list=nice
add address=202.46.24.0/21 list=nice
add address=202.51.16.0/21 list=nice
add address=202.51.56.0/21 list=nice
add address=202.51.192.0/21 list=nice
add address=202.52.8.0/21 list=nice
add address=202.56.160.0/21 list=nice
add address=202.57.0.0/21 list=nice
add address=202.57.16.0/21 list=nice
add address=202.58.176.0/21 list=nice
add address=202.58.200.0/21 list=nice
add address=202.58.216.0/21 list=nice
add address=202.59.160.0/21 list=nice
add address=202.62.8.0/21 list=nice
add address=202.67.8.0/21 list=nice
add address=202.67.32.0/21 list=nice
add address=202.73.24.0/21 list=nice
add address=202.73.104.0/21 list=nice
add address=202.74.72.0/21 list=nice
add address=202.80.208.0/21 list=nice
add address=202.91.8.0/21 list=nice
add address=202.91.24.0/21 list=nice
add address=202.129.184.0/21 list=nice
add address=202.133.0.0/21 list=nice
add address=202.134.0.0/21 list=nice
add address=202.146.128.0/21 list=nice
add address=202.146.176.0/21 list=nice
add address=202.147.200.0/21 list=nice
add address=202.151.8.0/21 list=nice
add address=202.152.200.0/21 list=nice
add address=202.153.128.0/21 list=nice
add address=202.153.144.0/21 list=nice
add address=202.154.16.0/21 list=nice
add address=202.154.184.0/21 list=nice
add address=202.162.32.0/21 list=nice
add address=202.173.16.0/21 list=nice
add address=202.182.168.0/21 list=nice
add address=203.77.248.0/21 list=nice
add address=203.80.8.0/21 list=nice
add address=203.84.136.0/21 list=nice
add address=203.84.152.0/21 list=nice
add address=203.89.24.0/21 list=nice
add address=203.134.232.0/21 list=nice
add address=203.135.176.0/21 list=nice
add address=203.142.80.0/21 list=nice
add address=203.153.24.0/21 list=nice
add address=203.153.112.0/21 list=nice
add address=203.160.56.0/21 list=nice
add address=203.173.88.0/21 list=nice
add address=203.174.8.0/21 list=nice
add address=203.190.40.0/21 list=nice
add address=203.190.48.0/21 list=nice
add address=203.190.112.0/21 list=nice
add address=203.190.240.0/21 list=nice
add address=210.211.16.0/21 list=nice
add address=219.83.0.0/21 list=nice
add address=219.83.112.0/21 list=nice
add address=222.229.80.0/21 list=nice
add address=223.25.96.0/21 list=nice
add address=14.102.152.0/22 list=nice
add address=23.3.76.0/22 list=nice
add address=23.60.152.0/22 list=nice
add address=23.195.156.0/22 list=nice
add address=23.212.104.0/22 list=nice
add address=27.112.76.0/22 list=nice
add address=27.121.80.0/22 list=nice
add address=27.123.220.0/22 list=nice
add address=27.124.84.0/22 list=nice
add address=42.62.176.0/22 list=nice
add address=43.225.64.0/22 list=nice
add address=43.229.204.0/22 list=nice
add address=43.229.252.0/22 list=nice
add address=43.230.152.0/22 list=nice
add address=43.240.148.0/22 list=nice
add address=43.240.224.0/22 list=nice
add address=43.243.152.0/22 list=nice
add address=43.243.184.0/22 list=nice
add address=43.245.180.0/22 list=nice
add address=43.245.184.0/22 list=nice
add address=43.245.248.0/22 list=nice
add address=43.247.20.0/22 list=nice
add address=43.249.140.0/22 list=nice
add address=43.252.8.0/22 list=nice
add address=43.252.104.0/22 list=nice
add address=43.252.156.0/22 list=nice
add address=43.252.184.0/22 list=nice
add address=43.252.236.0/22 list=nice
add address=43.255.196.0/22 list=nice
add address=45.64.44.0/22 list=nice
add address=45.112.124.0/22 list=nice
add address=45.115.64.0/22 list=nice
add address=45.118.112.0/22 list=nice
add address=49.0.0.0/22 list=nice
add address=49.50.4.0/22 list=nice
add address=49.50.8.0/22 list=nice
add address=79.140.192.0/22 list=nice
add address=101.0.4.0/22 list=nice
add address=101.50.0.0/22 list=nice
add address=101.50.16.0/22 list=nice
add address=101.100.196.0/22 list=nice
add address=101.203.168.0/22 list=nice
add address=103.3.44.0/22 list=nice
add address=103.3.68.0/22 list=nice
add address=103.3.76.0/22 list=nice
add address=103.4.0.0/22 list=nice
add address=103.4.52.0/22 list=nice
add address=103.4.164.0/22 list=nice
add address=103.5.48.0/22 list=nice
add address=103.7.84.0/22 list=nice
add address=103.7.228.0/22 list=nice
add address=103.8.76.0/22 list=nice
add address=103.9.100.0/22 list=nice
add address=103.9.124.0/22 list=nice
add address=103.9.144.0/22 list=nice
add address=103.10.60.0/22 list=nice
add address=103.10.64.0/22 list=nice
add address=103.10.96.0/22 list=nice
add address=103.10.104.0/22 list=nice
add address=103.10.120.0/22 list=nice
add address=103.10.128.0/22 list=nice
add address=103.10.184.0/22 list=nice
add address=103.11.96.0/22 list=nice
add address=103.11.132.0/22 list=nice
add address=103.11.188.0/22 list=nice
add address=103.11.252.0/22 list=nice
add address=103.12.28.0/22 list=nice
add address=103.12.112.0/22 list=nice
add address=103.12.220.0/22 list=nice
add address=103.14.16.0/22 list=nice
add address=103.15.232.0/22 list=nice
add address=103.15.240.0/22 list=nice
add address=103.16.112.0/22 list=nice
add address=103.16.136.0/22 list=nice
add address=103.17.244.0/22 list=nice
add address=103.18.16.0/22 list=nice
add address=103.18.28.0/22 list=nice
add address=103.18.32.0/22 list=nice
add address=103.18.132.0/22 list=nice
add address=103.19.56.0/22 list=nice
add address=103.19.76.0/22 list=nice
add address=103.19.108.0/22 list=nice
add address=103.19.180.0/22 list=nice
add address=103.20.184.0/22 list=nice
add address=103.21.84.0/22 list=nice
add address=103.21.204.0/22 list=nice
add address=103.21.216.0/22 list=nice
add address=103.21.224.0/22 list=nice
add address=103.22.132.0/22 list=nice
add address=103.22.168.0/22 list=nice
add address=103.22.248.0/22 list=nice
add address=103.23.20.0/22 list=nice
add address=103.23.32.0/22 list=nice
add address=103.23.100.0/22 list=nice
add address=103.23.200.0/22 list=nice
add address=103.23.224.0/22 list=nice
add address=103.23.232.0/22 list=nice
add address=103.24.48.0/22 list=nice
add address=103.24.56.0/22 list=nice
add address=103.24.72.0/22 list=nice
add address=103.24.104.0/22 list=nice
add address=103.25.108.0/22 list=nice
add address=103.25.192.0/22 list=nice
add address=103.25.208.0/22 list=nice
add address=103.26.4.0/22 list=nice
add address=103.26.12.0/22 list=nice
add address=103.26.128.0/22 list=nice
add address=103.27.248.0/22 list=nice
add address=103.28.12.0/22 list=nice
add address=103.28.56.0/22 list=nice
add address=103.28.176.0/22 list=nice
add address=103.28.188.0/22 list=nice
add address=103.28.192.0/22 list=nice
add address=103.28.220.0/22 list=nice
add address=103.28.224.0/22 list=nice
add address=103.29.4.0/22 list=nice
add address=103.29.148.0/22 list=nice
add address=103.29.212.0/22 list=nice
add address=103.30.0.0/22 list=nice
add address=103.30.84.0/22 list=nice
add address=103.30.88.0/22 list=nice
add address=103.30.112.0/22 list=nice
add address=103.30.144.0/22 list=nice
add address=103.30.180.0/22 list=nice
add address=103.30.244.0/22 list=nice
add address=103.31.36.0/22 list=nice
add address=103.31.44.0/22 list=nice
add address=103.31.132.0/22 list=nice
add address=103.31.204.0/22 list=nice
add address=103.31.248.0/22 list=nice
add address=103.36.8.0/22 list=nice
add address=103.36.156.0/22 list=nice
add address=103.37.168.0/22 list=nice
add address=103.37.224.0/22 list=nice
add address=103.38.100.0/22 list=nice
add address=103.39.12.0/22 list=nice
add address=103.39.48.0/22 list=nice
add address=103.40.120.0/22 list=nice
add address=103.41.120.0/22 list=nice
add address=103.41.188.0/22 list=nice
add address=103.41.192.0/22 list=nice
add address=103.41.204.0/22 list=nice
add address=103.41.208.0/22 list=nice
add address=103.42.40.0/22 list=nice
add address=103.42.116.0/22 list=nice
add address=103.42.252.0/22 list=nice
add address=103.43.44.0/22 list=nice
add address=103.43.128.0/22 list=nice
add address=103.48.128.0/22 list=nice
add address=103.49.188.0/22 list=nice
add address=103.49.220.0/22 list=nice
add address=103.49.228.0/22 list=nice
add address=103.50.24.0/22 list=nice
add address=103.50.128.0/22 list=nice
add address=103.52.64.0/22 list=nice
add address=103.52.144.0/22 list=nice
add address=103.53.0.0/22 list=nice
add address=103.53.76.0/22 list=nice
add address=103.53.192.0/22 list=nice
add address=103.55.36.0/22 list=nice
add address=103.56.204.0/22 list=nice
add address=103.58.104.0/22 list=nice
add address=103.61.248.0/22 list=nice
add address=103.224.64.0/22 list=nice
add address=103.224.100.0/22 list=nice
add address=103.224.176.0/22 list=nice
add address=103.225.148.0/22 list=nice
add address=103.226.48.0/22 list=nice
add address=103.226.136.0/22 list=nice
add address=103.227.144.0/22 list=nice
add address=103.227.240.0/22 list=nice
add address=103.227.252.0/22 list=nice
add address=103.228.24.0/22 list=nice
add address=103.228.236.0/22 list=nice
add address=103.228.244.0/22 list=nice
add address=103.229.72.0/22 list=nice
add address=103.229.200.0/22 list=nice
add address=103.230.188.0/22 list=nice
add address=103.231.200.0/22 list=nice
add address=103.232.64.0/22 list=nice
add address=103.233.108.0/22 list=nice
add address=103.233.144.0/22 list=nice
add address=103.233.156.0/22 list=nice
add address=103.234.120.0/22 list=nice
add address=103.234.252.0/22 list=nice
add address=103.235.32.0/22 list=nice
add address=103.237.32.0/22 list=nice
add address=103.238.136.0/22 list=nice
add address=103.239.188.0/22 list=nice
add address=103.240.108.0/22 list=nice
add address=103.241.204.0/22 list=nice
add address=103.242.104.0/22 list=nice
add address=103.242.204.0/22 list=nice
add address=103.244.96.0/22 list=nice
add address=103.244.204.0/22 list=nice
add address=103.245.136.0/22 list=nice
add address=103.245.180.0/22 list=nice
add address=103.246.0.0/22 list=nice
add address=103.247.12.0/22 list=nice
add address=103.247.20.0/22 list=nice
add address=103.247.24.0/22 list=nice
add address=103.247.100.0/22 list=nice
add address=103.247.120.0/22 list=nice
add address=103.247.216.0/22 list=nice
add address=103.248.56.0/22 list=nice
add address=103.248.216.0/22 list=nice
add address=103.251.180.0/22 list=nice
add address=103.253.0.0/22 list=nice
add address=103.253.112.0/22 list=nice
add address=103.254.104.0/22 list=nice
add address=103.254.168.0/22 list=nice
add address=103.255.120.0/22 list=nice
add address=103.255.240.0/22 list=nice
add address=110.44.172.0/22 list=nice
add address=110.93.12.0/22 list=nice
add address=111.221.40.0/22 list=nice
add address=111.223.252.0/22 list=nice
add address=111.235.136.0/22 list=nice
add address=112.215.64.0/22 list=nice
add address=113.11.156.0/22 list=nice
add address=113.52.148.0/22 list=nice
add address=113.197.108.0/22 list=nice
add address=114.0.32.0/22 list=nice
add address=114.30.80.0/22 list=nice
add address=114.141.60.0/22 list=nice
add address=115.166.96.0/22 list=nice
add address=115.178.172.0/22 list=nice
add address=115.178.176.0/22 list=nice
add address=116.68.164.0/22 list=nice
add address=116.68.168.0/22 list=nice
add address=116.90.164.0/22 list=nice
add address=116.90.176.0/22 list=nice
add address=116.212.96.0/22 list=nice
add address=117.103.32.0/22 list=nice
add address=117.103.56.0/22 list=nice
add address=117.104.200.0/22 list=nice
add address=118.82.4.0/22 list=nice
add address=118.98.232.0/22 list=nice
add address=118.151.220.0/22 list=nice
add address=119.2.64.0/22 list=nice
add address=121.52.64.0/22 list=nice
add address=121.52.80.0/22 list=nice
add address=121.52.92.0/22 list=nice
add address=121.58.188.0/22 list=nice
add address=122.102.48.0/22 list=nice
add address=122.129.104.0/22 list=nice
add address=122.129.116.0/22 list=nice
add address=122.129.196.0/22 list=nice
add address=124.195.32.0/22 list=nice
add address=125.161.84.0/22 list=nice
add address=125.163.220.0/22 list=nice
add address=125.166.20.0/22 list=nice
add address=125.166.40.0/22 list=nice
add address=125.166.96.0/22 list=nice
add address=125.166.116.0/22 list=nice
add address=125.166.216.0/22 list=nice
add address=138.32.236.0/22 list=nice
add address=146.23.252.0/22 list=nice
add address=150.107.148.0/22 list=nice
add address=150.107.244.0/22 list=nice
add address=150.107.248.0/22 list=nice
add address=150.129.188.0/22 list=nice
add address=150.242.108.0/22 list=nice
add address=163.53.184.0/22 list=nice
add address=175.103.40.0/22 list=nice
add address=175.106.16.0/22 list=nice
add address=175.111.88.0/22 list=nice
add address=175.184.236.0/22 list=nice
add address=180.214.244.0/22 list=nice
add address=180.233.156.0/22 list=nice
add address=182.16.160.0/22 list=nice
add address=183.182.92.0/22 list=nice
add address=195.135.204.0/22 list=nice
add address=202.43.72.0/22 list=nice
add address=202.43.92.0/22 list=nice
add address=202.43.112.0/22 list=nice
add address=202.43.180.0/22 list=nice
add address=202.43.188.0/22 list=nice
add address=202.46.8.0/22 list=nice
add address=202.46.240.0/22 list=nice
add address=202.50.200.0/22 list=nice
add address=202.51.28.0/22 list=nice
add address=202.51.204.0/22 list=nice
add address=202.51.252.0/22 list=nice
add address=202.57.8.0/22 list=nice
add address=202.59.172.0/22 list=nice
add address=202.67.40.0/22 list=nice
add address=202.70.132.0/22 list=nice
add address=202.72.192.0/22 list=nice
add address=202.73.20.0/22 list=nice
add address=202.73.96.0/22 list=nice
add address=202.80.216.0/22 list=nice
add address=202.87.240.0/22 list=nice
add address=202.87.248.0/22 list=nice
add address=202.95.152.0/22 list=nice
add address=202.122.8.0/22 list=nice
add address=202.124.196.0/22 list=nice
add address=202.125.80.0/22 list=nice
add address=202.129.224.0/22 list=nice
add address=202.130.52.0/22 list=nice
add address=202.146.0.0/22 list=nice
add address=202.146.60.0/22 list=nice
add address=202.146.140.0/22 list=nice
add address=202.147.196.0/22 list=nice
add address=202.147.224.0/22 list=nice
add address=202.147.244.0/22 list=nice
add address=202.147.252.0/22 list=nice
add address=202.152.248.0/22 list=nice
add address=202.153.136.0/22 list=nice
add address=202.154.24.0/22 list=nice
add address=202.154.176.0/22 list=nice
add address=202.162.40.0/22 list=nice
add address=202.164.220.0/22 list=nice
add address=202.179.188.0/22 list=nice
add address=202.180.12.0/22 list=nice
add address=202.180.48.0/22 list=nice
add address=202.182.164.0/22 list=nice
add address=202.182.184.0/22 list=nice
add address=203.77.244.0/22 list=nice
add address=203.99.104.0/22 list=nice
add address=203.114.224.0/22 list=nice
add address=203.153.120.0/22 list=nice
add address=203.153.212.0/22 list=nice
add address=203.153.216.0/22 list=nice
add address=203.176.180.0/22 list=nice
add address=203.189.120.0/22 list=nice
add address=203.217.188.0/22 list=nice
add address=210.247.240.0/22 list=nice
add address=210.247.252.0/22 list=nice
add address=219.83.12.0/22 list=nice
add address=219.83.120.0/22 list=nice
add address=223.25.104.0/22 list=nice
add address=223.165.4.0/22 list=nice
add address=223.255.228.0/22 list=nice
add address=23.0.166.0/23 list=nice
add address=23.62.110.0/23 list=nice
add address=23.192.114.0/23 list=nice
add address=23.212.102.0/23 list=nice
add address=27.121.84.0/23 list=nice
add address=27.124.80.0/23 list=nice
add address=43.224.170.0/23 list=nice
add address=43.230.4.0/23 list=nice
add address=43.231.128.0/23 list=nice
add address=43.240.80.0/23 list=nice
add address=43.243.140.0/23 list=nice
add address=43.252.72.0/23 list=nice
add address=43.252.136.0/23 list=nice
add address=43.252.144.0/23 list=nice
add address=43.254.124.0/23 list=nice
add address=45.64.254.0/23 list=nice
add address=58.145.168.0/23 list=nice
add address=58.147.184.0/23 list=nice
add address=101.50.24.0/23 list=nice
add address=103.2.146.0/23 list=nice
add address=103.3.58.0/23 list=nice
add address=103.4.174.0/23 list=nice
add address=103.4.206.0/23 list=nice
add address=103.6.0.0/23 list=nice
add address=103.6.40.0/23 list=nice
add address=103.7.0.0/23 list=nice
add address=103.7.14.0/23 list=nice
add address=103.7.178.0/23 list=nice
add address=103.7.226.0/23 list=nice
add address=103.8.58.0/23 list=nice
add address=103.8.74.0/23 list=nice
add address=103.8.224.0/23 list=nice
add address=103.10.58.0/23 list=nice
add address=103.10.80.0/23 list=nice
add address=103.10.136.0/23 list=nice
add address=103.10.170.0/23 list=nice
add address=103.11.22.0/23 list=nice
add address=103.11.74.0/23 list=nice
add address=103.11.148.0/23 list=nice
add address=103.11.186.0/23 list=nice
add address=103.11.222.0/23 list=nice
add address=103.12.20.0/23 list=nice
add address=103.12.80.0/23 list=nice
add address=103.12.242.0/23 list=nice
add address=103.14.20.0/23 list=nice
add address=103.14.44.0/23 list=nice
add address=103.14.110.0/23 list=nice
add address=103.15.36.0/23 list=nice
add address=103.16.48.0/23 list=nice
add address=103.16.78.0/23 list=nice
add address=103.16.132.0/23 list=nice
add address=103.16.198.0/23 list=nice
add address=103.17.54.0/23 list=nice
add address=103.17.76.0/23 list=nice
add address=103.18.190.0/23 list=nice
add address=103.18.236.0/23 list=nice
add address=103.19.178.0/23 list=nice
add address=103.19.210.0/23 list=nice
add address=103.20.90.0/23 list=nice
add address=103.20.106.0/23 list=nice
add address=103.20.166.0/23 list=nice
add address=103.20.188.0/23 list=nice
add address=103.20.196.0/23 list=nice
add address=103.21.228.0/23 list=nice
add address=103.22.136.0/23 list=nice
add address=103.22.242.0/23 list=nice
add address=103.24.6.0/23 list=nice
add address=103.24.12.0/23 list=nice
add address=103.24.212.0/23 list=nice
add address=103.25.54.0/23 list=nice
add address=103.25.166.0/23 list=nice
add address=103.25.222.0/23 list=nice
add address=103.26.100.0/23 list=nice
add address=103.27.206.0/23 list=nice
add address=103.28.22.0/23 list=nice
add address=103.28.54.0/23 list=nice
add address=103.28.106.0/23 list=nice
add address=103.28.148.0/23 list=nice
add address=103.29.184.0/23 list=nice
add address=103.30.92.0/23 list=nice
add address=103.30.222.0/23 list=nice
add address=103.31.32.0/23 list=nice
add address=103.31.110.0/23 list=nice
add address=103.31.232.0/23 list=nice
add address=103.36.34.0/23 list=nice
add address=103.40.54.0/23 list=nice
add address=103.43.66.0/23 list=nice
add address=103.44.26.0/23 list=nice
add address=103.49.30.0/23 list=nice
add address=103.49.104.0/23 list=nice
add address=103.50.216.0/23 list=nice
add address=103.52.2.0/23 list=nice
add address=103.52.60.0/23 list=nice
add address=103.52.170.0/23 list=nice
add address=103.53.184.0/23 list=nice
add address=103.54.94.0/23 list=nice
add address=103.54.226.0/23 list=nice
add address=103.55.56.0/23 list=nice
add address=103.56.148.0/23 list=nice
add address=103.58.100.0/23 list=nice
add address=103.58.146.0/23 list=nice
add address=103.59.234.0/23 list=nice
add address=103.61.116.0/23 list=nice
add address=103.224.140.0/23 list=nice
add address=103.224.172.0/23 list=nice
add address=103.225.88.0/23 list=nice
add address=103.225.184.0/23 list=nice
add address=103.225.208.0/23 list=nice
add address=103.226.232.0/23 list=nice
add address=103.227.142.0/23 list=nice
add address=103.227.148.0/23 list=nice
add address=103.227.220.0/23 list=nice
add address=103.228.116.0/23 list=nice
add address=103.230.48.0/23 list=nice
add address=103.231.82.0/23 list=nice
add address=103.231.114.0/23 list=nice
add address=103.232.32.0/23 list=nice
add address=103.233.88.0/23 list=nice
add address=103.233.102.0/23 list=nice
add address=103.235.66.0/23 list=nice
add address=103.235.152.0/23 list=nice
add address=103.237.168.0/23 list=nice
add address=103.238.202.0/23 list=nice
add address=103.241.4.0/23 list=nice
add address=103.242.124.0/23 list=nice
add address=103.242.180.0/23 list=nice
add address=103.242.208.0/23 list=nice
add address=103.244.36.0/23 list=nice
add address=103.244.160.0/23 list=nice
add address=103.245.72.0/23 list=nice
add address=103.245.94.0/23 list=nice
add address=103.245.122.0/23 list=nice
add address=103.246.184.0/23 list=nice
add address=103.247.42.0/23 list=nice
add address=103.247.126.0/23 list=nice
add address=103.247.182.0/23 list=nice
add address=103.247.196.0/23 list=nice
add address=103.247.226.0/23 list=nice
add address=103.247.244.0/23 list=nice
add address=103.249.58.0/23 list=nice
add address=103.251.44.0/23 list=nice
add address=103.252.12.0/23 list=nice
add address=103.252.22.0/23 list=nice
add address=103.252.50.0/23 list=nice
add address=103.252.100.0/23 list=nice
add address=103.252.188.0/23 list=nice
add address=103.253.68.0/23 list=nice
add address=103.253.86.0/23 list=nice
add address=103.254.48.0/23 list=nice
add address=103.254.126.0/23 list=nice
add address=103.255.14.0/23 list=nice
add address=103.255.52.0/23 list=nice
add address=103.255.156.0/23 list=nice
add address=110.44.168.0/23 list=nice
add address=110.50.82.0/23 list=nice
add address=111.92.160.0/23 list=nice
add address=112.215.6.0/23 list=nice
add address=112.215.10.0/23 list=nice
add address=112.215.22.0/23 list=nice
add address=112.215.40.0/23 list=nice
add address=112.215.46.0/23 list=nice
add address=112.215.62.0/23 list=nice
add address=112.215.68.0/23 list=nice
add address=112.215.78.0/23 list=nice
add address=112.215.96.0/23 list=nice
add address=112.215.106.0/23 list=nice
add address=112.215.112.0/23 list=nice
add address=112.215.118.0/23 list=nice
add address=112.215.124.0/23 list=nice
add address=113.11.154.0/23 list=nice
add address=113.208.64.0/23 list=nice
add address=114.30.86.0/23 list=nice
add address=115.166.100.0/23 list=nice
add address=116.12.40.0/23 list=nice
add address=116.12.46.0/23 list=nice
add address=116.66.200.0/23 list=nice
add address=116.66.206.0/23 list=nice
add address=116.68.160.0/23 list=nice
add address=116.90.162.0/23 list=nice
add address=116.90.168.0/23 list=nice
add address=116.90.172.0/23 list=nice
add address=116.212.100.0/23 list=nice
add address=116.213.26.0/23 list=nice
add address=116.213.28.0/23 list=nice
add address=117.18.18.0/23 list=nice
add address=117.74.112.0/23 list=nice
add address=117.103.36.0/23 list=nice
add address=117.103.60.0/23 list=nice
add address=117.104.206.0/23 list=nice
add address=118.82.0.0/23 list=nice
add address=118.82.18.0/23 list=nice
add address=118.82.20.0/23 list=nice
add address=118.98.226.0/23 list=nice
add address=119.2.70.0/23 list=nice
add address=119.2.74.0/23 list=nice
add address=119.47.90.0/23 list=nice
add address=119.47.94.0/23 list=nice
add address=121.52.40.0/23 list=nice
add address=121.52.60.0/23 list=nice
add address=121.52.70.0/23 list=nice
add address=121.52.86.0/23 list=nice
add address=121.52.88.0/23 list=nice
add address=121.58.184.0/23 list=nice
add address=121.100.16.0/23 list=nice
add address=122.49.230.0/23 list=nice
add address=122.102.40.0/23 list=nice
add address=122.102.44.0/23 list=nice
add address=122.102.52.0/23 list=nice
add address=122.129.108.0/23 list=nice
add address=122.129.200.0/23 list=nice
add address=124.66.160.0/23 list=nice
add address=124.195.36.0/23 list=nice
add address=124.195.64.0/23 list=nice
add address=124.195.86.0/23 list=nice
add address=125.161.82.0/23 list=nice
add address=125.163.216.0/23 list=nice
add address=125.166.58.0/23 list=nice
add address=125.166.62.0/23 list=nice
add address=125.166.86.0/23 list=nice
add address=125.166.102.0/23 list=nice
add address=125.166.112.0/23 list=nice
add address=125.166.220.0/23 list=nice
add address=175.103.46.0/23 list=nice
add address=175.106.20.0/23 list=nice
add address=175.184.248.0/23 list=nice
add address=180.131.144.0/23 list=nice
add address=180.150.244.0/23 list=nice
add address=180.214.232.0/23 list=nice
add address=180.222.216.0/23 list=nice
add address=180.233.154.0/23 list=nice
add address=182.23.122.0/23 list=nice
add address=182.23.124.0/23 list=nice
add address=202.0.88.0/23 list=nice
add address=202.0.92.0/23 list=nice
add address=202.4.160.0/23 list=nice
add address=202.4.170.0/23 list=nice
add address=202.8.28.0/23 list=nice
add address=202.9.72.0/23 list=nice
add address=202.20.106.0/23 list=nice
add address=202.43.64.0/23 list=nice
add address=202.43.88.0/23 list=nice
add address=202.43.116.0/23 list=nice
add address=202.43.178.0/23 list=nice
add address=202.43.186.0/23 list=nice
add address=202.46.14.0/23 list=nice
add address=202.46.130.0/23 list=nice
add address=202.47.90.0/23 list=nice
add address=202.47.92.0/23 list=nice
add address=202.51.200.0/23 list=nice
add address=202.52.48.0/23 list=nice
add address=202.52.58.0/23 list=nice
add address=202.52.140.0/23 list=nice
add address=202.52.146.0/23 list=nice
add address=202.57.24.0/23 list=nice
add address=202.58.192.0/23 list=nice
add address=202.58.198.0/23 list=nice
add address=202.58.238.0/23 list=nice
add address=202.58.242.0/23 list=nice
add address=202.59.168.0/23 list=nice
add address=202.61.98.0/23 list=nice
add address=202.61.100.0/23 list=nice
add address=202.61.104.0/23 list=nice
add address=202.61.112.0/23 list=nice
add address=202.61.124.0/23 list=nice
add address=202.67.44.0/23 list=nice
add address=202.73.100.0/23 list=nice
add address=202.75.18.0/23 list=nice
add address=202.75.20.0/23 list=nice
add address=202.80.220.0/23 list=nice
add address=202.81.34.0/23 list=nice
add address=202.81.36.0/23 list=nice
add address=202.81.48.0/23 list=nice
add address=202.87.246.0/23 list=nice
add address=202.89.116.0/23 list=nice
add address=202.90.194.0/23 list=nice
add address=202.90.198.0/23 list=nice
add address=202.93.246.0/23 list=nice
add address=202.94.84.0/23 list=nice
add address=202.95.144.0/23 list=nice
add address=202.95.148.0/23 list=nice
add address=202.122.14.0/23 list=nice
add address=202.125.88.0/23 list=nice
add address=202.125.94.0/23 list=nice
add address=202.129.216.0/23 list=nice
add address=202.146.4.0/23 list=nice
add address=202.146.36.0/23 list=nice
add address=202.146.138.0/23 list=nice
add address=202.146.144.0/23 list=nice
add address=202.147.192.0/23 list=nice
add address=202.147.232.0/23 list=nice
add address=202.147.240.0/23 list=nice
add address=202.147.250.0/23 list=nice
add address=202.149.130.0/23 list=nice
add address=202.149.132.0/23 list=nice
add address=202.149.148.0/23 list=nice
add address=202.152.194.0/23 list=nice
add address=202.152.196.0/23 list=nice
add address=202.152.224.0/23 list=nice
add address=202.152.230.0/23 list=nice
add address=202.152.240.0/23 list=nice
add address=202.152.252.0/23 list=nice
add address=202.153.152.0/23 list=nice
add address=202.153.158.0/23 list=nice
add address=202.154.30.0/23 list=nice
add address=202.162.46.0/23 list=nice
add address=202.164.216.0/23 list=nice
add address=202.179.184.0/23 list=nice
add address=202.180.54.0/23 list=nice
add address=202.182.176.0/23 list=nice
add address=202.182.182.0/23 list=nice
add address=202.191.2.0/23 list=nice
add address=203.6.148.0/23 list=nice
add address=203.12.20.0/23 list=nice
add address=203.21.74.0/23 list=nice
add address=203.24.50.0/23 list=nice
add address=203.24.76.0/23 list=nice
add address=203.27.6.0/23 list=nice
add address=203.29.26.0/23 list=nice
add address=203.30.236.0/23 list=nice
add address=203.30.254.0/23 list=nice
add address=203.31.164.0/23 list=nice
add address=203.34.118.0/23 list=nice
add address=203.57.24.0/23 list=nice
add address=203.77.240.0/23 list=nice
add address=203.79.26.0/23 list=nice
add address=203.81.186.0/23 list=nice
add address=203.81.188.0/23 list=nice
add address=203.81.248.0/23 list=nice
add address=203.89.146.0/23 list=nice
add address=203.99.96.0/23 list=nice
add address=203.99.102.0/23 list=nice
add address=203.99.108.0/23 list=nice
add address=203.99.130.0/23 list=nice
add address=203.148.84.0/23 list=nice
add address=203.153.124.0/23 list=nice
add address=203.189.88.0/23 list=nice
add address=203.190.36.0/23 list=nice
add address=203.210.80.0/23 list=nice
add address=203.217.132.0/23 list=nice
add address=203.223.90.0/23 list=nice
add address=210.23.68.0/23 list=nice
add address=210.247.246.0/23 list=nice
add address=210.247.248.0/23 list=nice
add address=219.83.10.0/23 list=nice
add address=219.83.124.0/23 list=nice
add address=220.247.168.0/23 list=nice
add address=220.247.174.0/23 list=nice
add address=223.25.108.0/23 list=nice
add address=223.255.224.0/23 list=nice
add address=14.102.146.0/24 list=nice
add address=27.121.87.0/24 list=nice
add address=27.124.83.0/24 list=nice
add address=36.37.66.0/24 list=nice
add address=43.224.19.0/24 list=nice
add address=43.224.169.0/24 list=nice
add address=43.230.7.0/24 list=nice
add address=43.243.142.0/24 list=nice
add address=43.245.108.0/24 list=nice
add address=43.247.32.0/24 list=nice
add address=43.248.24.0/24 list=nice
add address=43.251.96.0/24 list=nice
add address=43.252.75.0/24 list=nice
add address=43.252.138.0/24 list=nice
add address=43.252.222.0/24 list=nice
add address=43.254.127.0/24 list=nice
add address=45.64.253.0/24 list=nice
add address=58.147.187.0/24 list=nice
add address=58.147.188.0/24 list=nice
add address=101.50.21.0/24 list=nice
add address=101.50.22.0/24 list=nice
add address=101.50.28.0/24 list=nice
add address=101.100.192.0/24 list=nice
add address=101.100.195.0/24 list=nice
add address=103.5.107.0/24 list=nice
add address=103.5.148.0/24 list=nice
add address=103.5.215.0/24 list=nice
add address=103.6.43.0/24 list=nice
add address=103.6.117.0/24 list=nice
add address=103.6.214.0/24 list=nice
add address=103.7.12.0/24 list=nice
add address=103.7.176.0/24 list=nice
add address=103.7.225.0/24 list=nice
add address=103.8.12.0/24 list=nice
add address=103.8.56.0/24 list=nice
add address=103.8.122.0/24 list=nice
add address=103.8.226.0/24 list=nice
add address=103.8.228.0/24 list=nice
add address=103.9.22.0/24 list=nice
add address=103.9.36.0/24 list=nice
add address=103.10.56.0/24 list=nice
add address=103.10.110.0/24 list=nice
add address=103.10.124.0/24 list=nice
add address=103.10.169.0/24 list=nice
add address=103.10.223.0/24 list=nice
add address=103.10.253.0/24 list=nice
add address=103.11.29.0/24 list=nice
add address=103.11.179.0/24 list=nice
add address=103.12.164.0/24 list=nice
add address=103.13.36.0/24 list=nice
add address=103.13.38.0/24 list=nice
add address=103.13.181.0/24 list=nice
add address=103.14.195.0/24 list=nice
add address=103.15.251.0/24 list=nice
add address=103.16.220.0/24 list=nice
add address=103.16.223.0/24 list=nice
add address=103.17.58.0/24 list=nice
add address=103.18.239.0/24 list=nice
add address=103.19.37.0/24 list=nice
add address=103.19.177.0/24 list=nice
add address=103.19.209.0/24 list=nice
add address=103.19.231.0/24 list=nice
add address=103.20.21.0/24 list=nice
add address=103.20.191.0/24 list=nice
add address=103.21.95.0/24 list=nice
add address=103.22.138.0/24 list=nice
add address=103.22.166.0/24 list=nice
add address=103.22.232.0/24 list=nice
add address=103.22.240.0/24 list=nice
add address=103.23.30.0/24 list=nice
add address=103.23.117.0/24 list=nice
add address=103.23.141.0/24 list=nice
add address=103.23.151.0/24 list=nice
add address=103.23.244.0/24 list=nice
add address=103.24.4.0/24 list=nice
add address=103.24.76.0/24 list=nice
add address=103.24.214.0/24 list=nice
add address=103.25.165.0/24 list=nice
add address=103.26.95.0/24 list=nice
add address=103.27.163.0/24 list=nice
add address=103.28.21.0/24 list=nice
add address=103.28.80.0/24 list=nice
add address=103.28.95.0/24 list=nice
add address=103.28.104.0/24 list=nice
add address=103.28.161.0/24 list=nice
add address=103.28.163.0/24 list=nice
add address=103.28.219.0/24 list=nice
add address=103.29.167.0/24 list=nice
add address=103.29.186.0/24 list=nice
add address=103.29.229.0/24 list=nice
add address=103.29.230.0/24 list=nice
add address=103.30.95.0/24 list=nice
add address=103.30.123.0/24 list=nice
add address=103.30.171.0/24 list=nice
add address=103.30.173.0/24 list=nice
add address=103.30.175.0/24 list=nice
add address=103.30.221.0/24 list=nice
add address=103.31.109.0/24 list=nice
add address=103.31.157.0/24 list=nice
add address=103.31.159.0/24 list=nice
add address=103.31.234.0/24 list=nice
add address=103.36.32.0/24 list=nice
add address=103.36.68.0/24 list=nice
add address=103.37.98.0/24 list=nice
add address=103.37.229.0/24 list=nice
add address=103.39.52.0/24 list=nice
add address=103.41.109.0/24 list=nice
add address=103.41.110.0/24 list=nice
add address=103.41.169.0/24 list=nice
add address=103.41.247.0/24 list=nice
add address=103.42.205.0/24 list=nice
add address=103.44.100.0/24 list=nice
add address=103.44.149.0/24 list=nice
add address=103.48.13.0/24 list=nice
add address=103.48.27.0/24 list=nice
add address=103.49.28.0/24 list=nice
add address=103.51.103.0/24 list=nice
add address=103.51.131.0/24 list=nice
add address=103.52.7.0/24 list=nice
add address=103.52.68.0/24 list=nice
add address=103.52.71.0/24 list=nice
add address=103.53.20.0/24 list=nice
add address=103.54.0.0/24 list=nice
add address=103.54.93.0/24 list=nice
add address=103.57.8.0/24 list=nice
add address=103.58.33.0/24 list=nice
add address=103.58.103.0/24 list=nice
add address=103.61.71.0/24 list=nice
add address=103.224.174.0/24 list=nice
add address=103.224.180.0/24 list=nice
add address=103.225.66.0/24 list=nice
add address=103.225.98.0/24 list=nice
add address=103.225.170.0/24 list=nice
add address=103.225.172.0/24 list=nice
add address=103.225.175.0/24 list=nice
add address=103.226.55.0/24 list=nice
add address=103.226.174.0/24 list=nice
add address=103.226.218.0/24 list=nice
add address=103.226.234.0/24 list=nice
add address=103.227.14.0/24 list=nice
add address=103.227.141.0/24 list=nice
add address=103.227.222.0/24 list=nice
add address=103.228.17.0/24 list=nice
add address=103.228.248.0/24 list=nice
add address=103.229.76.0/24 list=nice
add address=103.229.128.0/24 list=nice
add address=103.230.83.0/24 list=nice
add address=103.231.108.0/24 list=nice
add address=103.231.113.0/24 list=nice
add address=103.231.123.0/24 list=nice
add address=103.231.170.0/24 list=nice
add address=103.232.30.0/24 list=nice
add address=103.232.242.0/24 list=nice
add address=103.233.100.0/24 list=nice
add address=103.234.195.0/24 list=nice
add address=103.235.109.0/24 list=nice
add address=103.237.143.0/24 list=nice
add address=103.238.201.0/24 list=nice
add address=103.241.24.0/24 list=nice
add address=103.241.179.0/24 list=nice
add address=103.242.233.0/24 list=nice
add address=103.243.177.0/24 list=nice
add address=103.243.178.0/24 list=nice
add address=103.244.38.0/24 list=nice
add address=103.244.51.0/24 list=nice
add address=103.244.245.0/24 list=nice
add address=103.245.93.0/24 list=nice
add address=103.245.225.0/24 list=nice
add address=103.245.226.0/24 list=nice
add address=103.246.76.0/24 list=nice
add address=103.246.107.0/24 list=nice
add address=103.246.129.0/24 list=nice
add address=103.246.169.0/24 list=nice
add address=103.247.18.0/24 list=nice
add address=103.247.41.0/24 list=nice
add address=103.247.117.0/24 list=nice
add address=103.247.211.0/24 list=nice
add address=103.248.146.0/24 list=nice
add address=103.248.248.0/24 list=nice
add address=103.249.65.0/24 list=nice
add address=103.249.227.0/24 list=nice
add address=103.250.199.0/24 list=nice
add address=103.251.14.0/24 list=nice
add address=103.252.85.0/24 list=nice
add address=103.252.163.0/24 list=nice
add address=103.253.124.0/24 list=nice
add address=103.254.25.0/24 list=nice
add address=103.254.51.0/24 list=nice
add address=103.255.12.0/24 list=nice
add address=103.255.29.0/24 list=nice
add address=110.50.80.0/24 list=nice
add address=110.50.84.0/24 list=nice
add address=111.92.162.0/24 list=nice
add address=111.92.164.0/24 list=nice
add address=111.92.166.0/24 list=nice
add address=112.215.5.0/24 list=nice
add address=112.215.16.0/24 list=nice
add address=112.215.18.0/24 list=nice
add address=112.215.21.0/24 list=nice
add address=112.215.27.0/24 list=nice
add address=112.215.30.0/24 list=nice
add address=112.215.33.0/24 list=nice
add address=112.215.34.0/24 list=nice
add address=112.215.42.0/24 list=nice
add address=112.215.44.0/24 list=nice
add address=112.215.49.0/24 list=nice
add address=112.215.50.0/24 list=nice
add address=112.215.77.0/24 list=nice
add address=112.215.81.0/24 list=nice
add address=112.215.87.0/24 list=nice
add address=112.215.89.0/24 list=nice
add address=112.215.94.0/24 list=nice
add address=112.215.98.0/24 list=nice
add address=112.215.100.0/24 list=nice
add address=112.215.105.0/24 list=nice
add address=112.215.108.0/24 list=nice
add address=112.215.114.0/24 list=nice
add address=112.215.116.0/24 list=nice
add address=112.215.121.0/24 list=nice
add address=112.215.123.0/24 list=nice
add address=112.215.131.0/24 list=nice
add address=112.215.132.0/24 list=nice
add address=112.215.141.0/24 list=nice
add address=112.215.143.0/24 list=nice
add address=113.11.153.0/24 list=nice
add address=114.0.10.0/24 list=nice
add address=114.0.17.0/24 list=nice
add address=114.1.0.0/24 list=nice
add address=114.1.3.0/24 list=nice
add address=114.30.84.0/24 list=nice
add address=114.141.57.0/24 list=nice
add address=114.141.58.0/24 list=nice
add address=115.166.102.0/24 list=nice
add address=115.178.129.0/24 list=nice
add address=115.178.132.0/24 list=nice
add address=116.12.42.0/24 list=nice
add address=116.66.203.0/24 list=nice
add address=116.66.204.0/24 list=nice
add address=116.68.172.0/24 list=nice
add address=116.68.175.0/24 list=nice
add address=116.90.161.0/24 list=nice
add address=116.90.170.0/24 list=nice
add address=116.90.211.0/24 list=nice
add address=116.193.189.0/24 list=nice
add address=116.213.30.0/24 list=nice
add address=116.254.120.0/24 list=nice
add address=116.254.126.0/24 list=nice
add address=117.18.16.0/24 list=nice
add address=117.18.20.0/24 list=nice
add address=117.18.232.0/24 list=nice
add address=117.74.115.0/24 list=nice
add address=117.74.117.0/24 list=nice
add address=117.74.119.0/24 list=nice
add address=117.103.62.0/24 list=nice
add address=117.104.204.0/24 list=nice
add address=118.82.17.0/24 list=nice
add address=118.82.23.0/24 list=nice
add address=118.98.224.0/24 list=nice
add address=118.98.236.0/24 list=nice
add address=118.98.238.0/24 list=nice
add address=119.2.69.0/24 list=nice
add address=119.2.73.0/24 list=nice
add address=119.2.77.0/24 list=nice
add address=119.2.79.0/24 list=nice
add address=119.47.88.0/24 list=nice
add address=119.47.92.0/24 list=nice
add address=121.52.25.0/24 list=nice
add address=121.52.29.0/24 list=nice
add address=121.52.35.0/24 list=nice
add address=121.52.42.0/24 list=nice
add address=121.52.45.0/24 list=nice
add address=121.52.59.0/24 list=nice
add address=121.52.68.0/24 list=nice
add address=121.52.84.0/24 list=nice
add address=121.52.91.0/24 list=nice
add address=121.58.186.0/24 list=nice
add address=121.100.20.0/24 list=nice
add address=121.100.23.0/24 list=nice
add address=122.49.225.0/24 list=nice
add address=122.102.43.0/24 list=nice
add address=122.102.47.0/24 list=nice
add address=122.102.54.0/24 list=nice
add address=122.129.96.0/24 list=nice
add address=122.129.102.0/24 list=nice
add address=122.129.111.0/24 list=nice
add address=122.129.112.0/24 list=nice
add address=122.129.115.0/24 list=nice
add address=122.129.193.0/24 list=nice
add address=122.129.194.0/24 list=nice
add address=122.129.203.0/24 list=nice
add address=122.129.205.0/24 list=nice
add address=124.158.160.0/24 list=nice
add address=125.163.218.0/24 list=nice
add address=125.166.61.0/24 list=nice
add address=125.166.222.0/24 list=nice
add address=134.159.216.0/24 list=nice
add address=150.129.18.0/24 list=nice
add address=150.129.56.0/24 list=nice
add address=163.53.194.0/24 list=nice
add address=175.103.44.0/24 list=nice
add address=175.184.250.0/24 list=nice
add address=180.150.232.0/24 list=nice
add address=180.150.247.0/24 list=nice
add address=180.214.234.0/24 list=nice
add address=180.214.240.0/24 list=nice
add address=180.214.243.0/24 list=nice
add address=180.222.219.0/24 list=nice
add address=180.233.119.0/24 list=nice
add address=180.233.153.0/24 list=nice
add address=182.16.170.0/24 list=nice
add address=182.23.119.0/24 list=nice
add address=182.23.127.0/24 list=nice
add address=182.48.183.0/24 list=nice
add address=182.255.2.0/24 list=nice
add address=182.255.5.0/24 list=nice
add address=182.255.6.0/24 list=nice
add address=192.5.5.0/24 list=nice
add address=192.23.186.0/24 list=nice
add address=192.229.238.0/24 list=nice
add address=193.194.194.0/24 list=nice
add address=194.0.1.0/24 list=nice
add address=194.0.2.0/24 list=nice
add address=202.0.107.0/24 list=nice
add address=202.1.236.0/24 list=nice
add address=202.3.14.0/24 list=nice
add address=202.4.179.0/24 list=nice
add address=202.4.186.0/24 list=nice
add address=202.9.69.0/24 list=nice
add address=202.9.85.0/24 list=nice
add address=202.12.75.0/24 list=nice
add address=202.14.92.0/24 list=nice
add address=202.14.255.0/24 list=nice
add address=202.20.109.0/24 list=nice
add address=202.43.177.0/24 list=nice
add address=202.43.184.0/24 list=nice
add address=202.45.149.0/24 list=nice
add address=202.46.12.0/24 list=nice
add address=202.46.129.0/24 list=nice
add address=202.46.252.0/24 list=nice
add address=202.47.80.0/24 list=nice
add address=202.47.88.0/24 list=nice
add address=202.51.24.0/24 list=nice
add address=202.51.203.0/24 list=nice
add address=202.52.50.0/24 list=nice
add address=202.52.52.0/24 list=nice
add address=202.52.131.0/24 list=nice
add address=202.52.132.0/24 list=nice
add address=202.52.137.0/24 list=nice
add address=202.56.172.0/24 list=nice
add address=202.57.13.0/24 list=nice
add address=202.57.14.0/24 list=nice
add address=202.57.29.0/24 list=nice
add address=202.57.31.0/24 list=nice
add address=202.58.124.0/24 list=nice
add address=202.58.194.0/24 list=nice
add address=202.58.197.0/24 list=nice
add address=202.59.171.0/24 list=nice
add address=202.61.96.0/24 list=nice
add address=202.61.126.0/24 list=nice
add address=202.67.46.0/24 list=nice
add address=202.70.136.0/24 list=nice
add address=202.72.196.0/24 list=nice
add address=202.72.201.0/24 list=nice
add address=202.72.202.0/24 list=nice
add address=202.72.206.0/24 list=nice
add address=202.74.43.0/24 list=nice
add address=202.75.17.0/24 list=nice
add address=202.75.23.0/24 list=nice
add address=202.75.28.0/24 list=nice
add address=202.75.30.0/24 list=nice
add address=202.80.222.0/24 list=nice
add address=202.81.32.0/24 list=nice
add address=202.81.52.0/24 list=nice
add address=202.81.63.0/24 list=nice
add address=202.87.245.0/24 list=nice
add address=202.87.252.0/24 list=nice
add address=202.87.254.0/24 list=nice
add address=202.93.240.0/24 list=nice
add address=202.93.243.0/24 list=nice
add address=202.94.83.0/24 list=nice
add address=202.95.147.0/24 list=nice
add address=202.95.156.0/24 list=nice
add address=202.95.159.0/24 list=nice
add address=202.122.12.0/24 list=nice
add address=202.124.203.0/24 list=nice
add address=202.124.205.0/24 list=nice
add address=202.137.225.0/24 list=nice
add address=202.137.230.0/24 list=nice
add address=202.146.33.0/24 list=nice
add address=202.146.34.0/24 list=nice
add address=202.146.136.0/24 list=nice
add address=202.147.194.0/24 list=nice
add address=202.147.229.0/24 list=nice
add address=202.147.230.0/24 list=nice
add address=202.147.234.0/24 list=nice
add address=202.147.242.0/24 list=nice
add address=202.147.248.0/24 list=nice
add address=202.149.128.0/24 list=nice
add address=202.152.192.0/24 list=nice
add address=202.152.198.0/24 list=nice
add address=202.152.228.0/24 list=nice
add address=202.152.233.0/24 list=nice
add address=202.152.235.0/24 list=nice
add address=202.152.237.0/24 list=nice
add address=202.152.243.0/24 list=nice
add address=202.152.244.0/24 list=nice
add address=202.152.254.0/24 list=nice
add address=202.154.28.0/24 list=nice
add address=202.154.183.0/24 list=nice
add address=202.158.252.0/24 list=nice
add address=202.160.254.0/24 list=nice
add address=202.162.44.0/24 list=nice
add address=202.164.218.0/24 list=nice
add address=202.167.97.0/24 list=nice
add address=202.171.236.0/24 list=nice
add address=202.176.13.0/24 list=nice
add address=202.179.186.0/24 list=nice
add address=202.180.53.0/24 list=nice
add address=202.182.163.0/24 list=nice
add address=202.182.189.0/24 list=nice
add address=203.7.171.0/24 list=nice
add address=203.14.176.0/24 list=nice
add address=203.14.183.0/24 list=nice
add address=203.77.242.0/24 list=nice
add address=203.79.29.0/24 list=nice
add address=203.81.184.0/24 list=nice
add address=203.81.190.0/24 list=nice
add address=203.81.250.0/24 list=nice
add address=203.89.18.0/24 list=nice
add address=203.89.148.0/24 list=nice
add address=203.99.98.0/24 list=nice
add address=203.99.101.0/24 list=nice
add address=203.99.110.0/24 list=nice
add address=203.99.123.0/24 list=nice
add address=203.99.127.0/24 list=nice
add address=203.119.17.0/24 list=nice
add address=203.119.112.0/24 list=nice
add address=203.123.61.0/24 list=nice
add address=203.123.63.0/24 list=nice
add address=203.153.49.0/24 list=nice
add address=203.153.126.0/24 list=nice
add address=203.160.128.0/24 list=nice
add address=203.171.221.0/24 list=nice
add address=203.176.176.0/24 list=nice
add address=203.176.179.0/24 list=nice
add address=203.196.90.0/24 list=nice
add address=203.207.59.0/24 list=nice
add address=203.209.190.0/24 list=nice
add address=203.210.83.0/24 list=nice
add address=203.215.48.0/24 list=nice
add address=203.215.50.0/24 list=nice
add address=203.217.140.0/24 list=nice
add address=203.217.172.0/24 list=nice
add address=207.179.10.0/24 list=nice
add address=210.5.47.0/24 list=nice
add address=210.23.64.0/24 list=nice
add address=210.23.66.0/24 list=nice
add address=210.176.128.0/24 list=nice
add address=210.247.245.0/24 list=nice
add address=210.247.250.0/24 list=nice
add address=216.244.94.0/24 list=nice
add address=218.100.36.0/24 list=nice
add address=219.83.126.0/24 list=nice
add address=223.25.110.0/24 list=nice
add address=223.255.227.0/24 list=nice
add address=8.8.8.0/24 list=google-llc
add address=8.34.208.0/21 list=google-llc
add address=8.34.216.0/21 list=google-llc
add address=8.35.192.0/21 list=google-llc
add address=8.35.200.0/21 list=google-llc
add address=23.236.48.0/20 list=google-llc
add address=23.251.128.0/19 list=google-llc
add address=35.184.0.0/13 list=google-llc
add address=35.192.0.0/13 list=google-llc
add address=35.200.0.0/14 list=google-llc
add address=35.204.0.0/15 list=google-llc
add address=35.224.0.0/14 list=google-llc
add address=35.228.0.0/14 list=google-llc
add address=35.232.0.0/14 list=google-llc
add address=35.236.0.0/14 list=google-llc
add address=35.240.0.0/14 list=google-llc
add address=35.244.0.0/14 list=google-llc
add address=64.233.160.0/19 list=google-llc
add address=64.233.160.0/24 list=google-llc
add address=64.233.161.0/24 list=google-llc
add address=64.233.162.0/24 list=google-llc
add address=64.233.163.0/24 list=google-llc
add address=64.233.164.0/24 list=google-llc
add address=64.233.165.0/24 list=google-llc
add address=64.233.166.0/24 list=google-llc
add address=64.233.167.0/24 list=google-llc
add address=64.233.168.0/24 list=google-llc
add address=64.233.169.0/24 list=google-llc
add address=64.233.170.0/24 list=google-llc
add address=64.233.171.0/24 list=google-llc
add address=64.233.176.0/24 list=google-llc
add address=64.233.177.0/24 list=google-llc
add address=64.233.178.0/24 list=google-llc
add address=64.233.179.0/24 list=google-llc
add address=64.233.180.0/24 list=google-llc
add address=64.233.181.0/24 list=google-llc
add address=64.233.182.0/24 list=google-llc
add address=64.233.183.0/24 list=google-llc
add address=64.233.184.0/24 list=google-llc
add address=64.233.185.0/24 list=google-llc
add address=64.233.186.0/24 list=google-llc
add address=64.233.187.0/24 list=google-llc
add address=64.233.188.0/24 list=google-llc
add address=64.233.189.0/24 list=google-llc
add address=64.233.190.0/24 list=google-llc
add address=64.233.191.0/24 list=google-llc
add address=66.102.0.0/20 list=google-llc
add address=66.102.1.0/24 list=google-llc
add address=66.102.2.0/24 list=google-llc
add address=66.102.3.0/24 list=google-llc
add address=66.102.4.0/24 list=google-llc
add address=66.102.12.0/24 list=google-llc
add address=66.249.64.0/19 list=google-llc
add address=70.32.128.0/19 list=google-llc
add address=70.32.131.0/24 list=google-llc
add address=70.32.145.0/24 list=google-llc
add address=70.32.146.0/23 list=google-llc
add address=70.32.151.0/24 list=google-llc
add address=72.14.192.0/18 list=google-llc
add address=74.114.24.0/21 list=google-llc
add address=74.125.0.0/16 list=google-llc
add address=74.125.0.0/18 list=google-llc
add address=74.125.6.0/24 list=google-llc
add address=74.125.21.0/24 list=google-llc
add address=74.125.22.0/24 list=google-llc
add address=74.125.23.0/24 list=google-llc
add address=74.125.24.0/24 list=google-llc
add address=74.125.26.0/24 list=google-llc
add address=74.125.27.0/24 list=google-llc
add address=74.125.28.0/24 list=google-llc
add address=74.125.29.0/24 list=google-llc
add address=74.125.30.0/24 list=google-llc
add address=74.125.31.0/24 list=google-llc
add address=74.125.39.0/24 list=google-llc
add address=74.125.68.0/24 list=google-llc
add address=74.125.69.0/24 list=google-llc
add address=74.125.70.0/24 list=google-llc
add address=74.125.71.0/24 list=google-llc
add address=74.125.124.0/24 list=google-llc
add address=74.125.126.0/24 list=google-llc
add address=74.125.127.0/24 list=google-llc
add address=74.125.128.0/24 list=google-llc
add address=74.125.129.0/24 list=google-llc
add address=74.125.130.0/24 list=google-llc
add address=74.125.131.0/24 list=google-llc
add address=74.125.132.0/24 list=google-llc
add address=74.125.133.0/24 list=google-llc
add address=74.125.134.0/24 list=google-llc
add address=74.125.135.0/24 list=google-llc
add address=74.125.136.0/24 list=google-llc
add address=74.125.138.0/24 list=google-llc
add address=74.125.139.0/24 list=google-llc
add address=74.125.140.0/24 list=google-llc
add address=74.125.141.0/24 list=google-llc
add address=74.125.143.0/24 list=google-llc
add address=74.125.192.0/24 list=google-llc
add address=74.125.196.0/24 list=google-llc
add address=74.125.197.0/24 list=google-llc
add address=74.125.198.0/24 list=google-llc
add address=74.125.199.0/24 list=google-llc
add address=74.125.200.0/24 list=google-llc
add address=74.125.201.0/24 list=google-llc
add address=74.125.202.0/24 list=google-llc
add address=74.125.203.0/24 list=google-llc
add address=74.125.204.0/24 list=google-llc
add address=74.125.206.0/24 list=google-llc
add address=74.125.225.0/24 list=google-llc
add address=74.125.226.0/24 list=google-llc
add address=74.125.227.0/24 list=google-llc
add address=74.125.228.0/24 list=google-llc
add address=74.125.230.0/24 list=google-llc
add address=74.125.232.0/24 list=google-llc
add address=74.125.234.0/24 list=google-llc
add address=74.125.235.0/24 list=google-llc
add address=74.125.236.0/24 list=google-llc
add address=74.125.238.0/24 list=google-llc
add address=104.132.0.0/23 list=google-llc
add address=104.132.5.0/24 list=google-llc
add address=104.132.7.0/24 list=google-llc
add address=104.132.8.0/24 list=google-llc
add address=104.132.11.0/24 list=google-llc
add address=104.132.34.0/24 list=google-llc
add address=104.132.51.0/24 list=google-llc
add address=104.132.141.0/24 list=google-llc
add address=104.133.0.0/24 list=google-llc
add address=104.154.0.0/15 list=google-llc
add address=104.196.0.0/14 list=google-llc
add address=107.167.160.0/19 list=google-llc
add address=107.178.192.0/18 list=google-llc
add address=108.59.80.0/20 list=google-llc
add address=108.170.192.0/18 list=google-llc
add address=108.177.0.0/17 list=google-llc
add address=108.177.8.0/24 list=google-llc
add address=108.177.9.0/24 list=google-llc
add address=108.177.10.0/24 list=google-llc
add address=108.177.11.0/24 list=google-llc
add address=108.177.12.0/24 list=google-llc
add address=108.177.13.0/24 list=google-llc
add address=108.177.14.0/24 list=google-llc
add address=108.177.15.0/24 list=google-llc
add address=108.177.28.0/24 list=google-llc
add address=108.177.30.0/24 list=google-llc
add address=108.177.96.0/24 list=google-llc
add address=108.177.97.0/24 list=google-llc
add address=108.177.98.0/24 list=google-llc
add address=108.177.103.0/24 list=google-llc
add address=108.177.104.0/24 list=google-llc
add address=108.177.112.0/24 list=google-llc
add address=108.177.119.0/24 list=google-llc
add address=108.177.120.0/24 list=google-llc
add address=108.177.121.0/24 list=google-llc
add address=108.177.125.0/24 list=google-llc
add address=108.177.126.0/24 list=google-llc
add address=108.177.127.0/24 list=google-llc
add address=130.211.0.0/16 list=google-llc
add address=142.250.0.0/15 list=google-llc
add address=146.148.0.0/17 list=google-llc
add address=162.216.148.0/22 list=google-llc
add address=162.222.176.0/21 list=google-llc
add address=172.102.8.0/21 list=google-llc
add address=172.102.8.0/24 list=google-llc
add address=172.102.11.0/24 list=google-llc
add address=172.102.12.0/23 list=google-llc
add address=172.102.14.0/23 list=google-llc
add address=172.110.32.0/21 list=google-llc
add address=172.217.0.0/16 list=google-llc
add address=172.217.0.0/24 list=google-llc
add address=172.217.1.0/24 list=google-llc
add address=172.217.2.0/24 list=google-llc
add address=172.217.3.0/24 list=google-llc
add address=172.217.4.0/24 list=google-llc
add address=172.217.5.0/24 list=google-llc
add address=172.217.6.0/24 list=google-llc
add address=172.217.7.0/24 list=google-llc
add address=172.217.8.0/24 list=google-llc
add address=172.217.9.0/24 list=google-llc
add address=172.217.10.0/24 list=google-llc
add address=172.217.11.0/24 list=google-llc
add address=172.217.12.0/24 list=google-llc
add address=172.217.13.0/24 list=google-llc
add address=172.217.14.0/24 list=google-llc
add address=172.217.15.0/24 list=google-llc
add address=172.217.16.0/24 list=google-llc
add address=172.217.17.0/24 list=google-llc
add address=172.217.18.0/24 list=google-llc
add address=172.217.19.0/24 list=google-llc
add address=172.217.20.0/24 list=google-llc
add address=172.217.21.0/24 list=google-llc
add address=172.217.22.0/24 list=google-llc
add address=172.217.23.0/24 list=google-llc
add address=172.217.24.0/24 list=google-llc
add address=172.217.25.0/24 list=google-llc
add address=172.217.26.0/24 list=google-llc
add address=172.217.27.0/24 list=google-llc
add address=172.217.28.0/24 list=google-llc
add address=172.217.29.0/24 list=google-llc
add address=172.217.30.0/24 list=google-llc
add address=172.217.31.0/24 list=google-llc
add address=172.253.0.0/16 list=google-llc
add address=173.194.0.0/16 list=google-llc
add address=173.194.7.0/24 list=google-llc
add address=173.194.32.0/24 list=google-llc
add address=173.194.35.0/24 list=google-llc
add address=173.194.40.0/24 list=google-llc
add address=173.194.36.0/24 list=google-llc
add address=173.194.42.0/24 list=google-llc
add address=173.194.44.0/24 list=google-llc
add address=173.194.39.0/24 list=google-llc
add address=173.194.46.0/24 list=google-llc
add address=173.194.53.0/24 list=google-llc
add address=173.194.63.0/24 list=google-llc
add address=173.194.66.0/24 list=google-llc
add address=173.194.67.0/24 list=google-llc
add address=173.194.68.0/24 list=google-llc
add address=173.194.69.0/24 list=google-llc
add address=173.194.73.0/24 list=google-llc
add address=173.194.124.0/24 list=google-llc
add address=173.194.113.0/24 list=google-llc
add address=173.194.117.0/24 list=google-llc
add address=173.194.136.0/24 list=google-llc
add address=173.194.140.0/24 list=google-llc
add address=173.194.118.0/24 list=google-llc
add address=173.194.141.0/24 list=google-llc
add address=173.194.76.0/24 list=google-llc
add address=173.194.78.0/24 list=google-llc
add address=173.194.112.0/24 list=google-llc
add address=173.194.119.0/24 list=google-llc
add address=173.194.79.0/24 list=google-llc
add address=173.194.175.0/24 list=google-llc
add address=173.194.142.0/24 list=google-llc
add address=173.194.192.0/24 list=google-llc
add address=173.194.193.0/24 list=google-llc
add address=173.194.121.0/24 list=google-llc
add address=173.194.194.0/24 list=google-llc
add address=173.194.195.0/24 list=google-llc
add address=173.194.198.0/24 list=google-llc
add address=173.194.199.0/24 list=google-llc
add address=173.194.196.0/24 list=google-llc
add address=173.194.203.0/24 list=google-llc
add address=173.194.202.0/24 list=google-llc
add address=173.194.204.0/24 list=google-llc
add address=173.194.205.0/24 list=google-llc
add address=173.194.200.0/24 list=google-llc
add address=173.194.206.0/24 list=google-llc
add address=173.194.207.0/24 list=google-llc
add address=173.194.208.0/24 list=google-llc
add address=173.194.209.0/24 list=google-llc
add address=173.194.210.0/24 list=google-llc
add address=173.194.201.0/24 list=google-llc
add address=173.194.211.0/24 list=google-llc
add address=173.194.212.0/24 list=google-llc
add address=173.194.213.0/24 list=google-llc
add address=173.194.214.0/24 list=google-llc
add address=173.194.216.0/24 list=google-llc
add address=173.194.217.0/24 list=google-llc
add address=173.194.218.0/24 list=google-llc
add address=173.194.220.0/24 list=google-llc
add address=173.194.219.0/24 list=google-llc
add address=173.194.222.0/24 list=google-llc
add address=173.194.223.0/24 list=google-llc
add address=173.255.112.0/20 list=google-llc
add address=185.25.28.0/23 list=google-llc
add address=185.150.148.0/22 list=google-llc
add address=192.104.160.0/23 list=google-llc
add address=192.158.28.0/22 list=google-llc
add address=192.178.0.0/15 list=google-llc
add address=199.192.112.0/22 list=google-llc
add address=199.223.232.0/21 list=google-llc
add address=207.223.160.0/20 list=google-llc
add address=208.68.108.0/22 list=google-llc
add address=208.81.188.0/22 list=google-llc
add address=209.85.128.0/17 list=google-llc
add address=209.85.144.0/24 list=google-llc
add address=209.85.145.0/24 list=google-llc
add address=209.85.147.0/24 list=google-llc
add address=209.85.200.0/24 list=google-llc
add address=209.85.201.0/24 list=google-llc
add address=209.85.202.0/24 list=google-llc
add address=209.85.203.0/24 list=google-llc
add address=209.85.232.0/24 list=google-llc
add address=209.85.233.0/24 list=google-llc
add address=209.85.234.0/24 list=google-llc
add address=209.85.235.0/24 list=google-llc
add address=209.107.176.0/23 list=google-llc
add address=209.107.182.0/23 list=google-llc
add address=209.107.185.0/24 list=google-llc
add address=216.58.192.0/19 list=google-llc
add address=216.58.200.0/24 list=google-llc
add address=216.58.208.0/24 list=google-llc
add address=216.58.209.0/24 list=google-llc
add address=216.58.210.0/24 list=google-llc
add address=216.58.211.0/24 list=google-llc
add address=216.58.212.0/24 list=google-llc
add address=216.58.213.0/24 list=google-llc
add address=216.58.214.0/24 list=google-llc
add address=216.58.215.0/24 list=google-llc
add address=216.58.216.0/24 list=google-llc
add address=216.58.217.0/24 list=google-llc
add address=216.58.218.0/24 list=google-llc
add address=216.58.220.0/24 list=google-llc
add address=216.58.221.0/24 list=google-llc
add address=216.58.223.0/24 list=google-llc
add address=216.73.80.0/20 list=google-llc
add address=216.239.32.0/19 list=google-llc
add address=216.239.32.0/24 list=google-llc
add address=216.239.34.0/24 list=google-llc
add address=216.239.35.0/24 list=google-llc
add address=216.239.36.0/24 list=google-llc
add address=216.239.38.0/24 list=google-llc
add address=216.239.39.0/24 list=google-llc
add address=216.252.220.0/22 list=google-llc
add address=216.252.222.0/24 list=google-llc
add address=10.0.100.0/24 list=radio
add address=10.100.100.0/24 list=radio
add address=speedtest.net list=ip-gue
add address=speedtest.cbn.net.id list=ip-gue
add address=www.ookla.com list=ip-gue
add address=indosatooredoo.com list=ip-gue
add address=speedtest.telin.co.id list=ip-gue
add address=103.13.181.0/24 comment=sirup.lkpp.go.id list=ip-gue
add address=222.124.0.0/16 comment=lpse.bengkuluprov.go.id list=ip-gue
add address=222.124.184.0/22 list=ip-gue
add address=222.124.186.0/23 list=ip-gue
add address=103.13.181.213 list=ip-gue
add address=bengkuluprov.go.id list=ip-gue
add address=lpse.bengkuluprov.go.id list=ip-gue
add address=lkpp.go.id list=ip-gue
add address=sirup.lkpp.go.id list=ip-gue
add address=unbk.kemdikbud.go.id list=ip-gue
add address=ubk.co.id list=ip-gue
add address=118.98.227.121 comment=unbk list=nice
add address=118.98.227.121 comment=unbk.kemdikbud.go.id list=ip-gue
add address=www.pajak.go.id list=ip-gue
add address=sse3.pajak.go.id list=ip-gue
add address=192.168.0.0/16 list=local
add address=10.0.0.0/8 list=local
add address=172.16.0.0/16 list=local
add address=151.101.192.0/24 comment=speedtest.net list=ip-gue
add address=151.101.128.0/24 list=ip-gue
add address=151.101.0.230 list=ip-gue
add address=151.101.64.230 list=ip-gue
add address=110.232.178.82 list=ip-gue
add address=104.27.192.92 comment=whatismyip.com list=ip-gue
add address=104.27.193.92 list=ip-gue
add address=23.200.184.133 comment=whatismyipaddress.com list=ip-gue
add address=202.158.8.14 comment=speedtest.cbn.net.id list=ip-gue
add address=114.4.41.5 comment="speedtest indosat" list=ip-gue
add address=184.29.23.122 comment=whatismyipaddress.com list=ip-gue
add address=175.103.59.91 comment=ipgue.com list=ip-gue
add address=62.212.95.68 list=ip-gue
add address=23.239.16.110 list=ip-gue
add address=103.19.56.2 list=ns-bitsnet
add address=103.19.56.3 list=ns-bitsnet
add address=103.19.56.10 list=ns-bitsnet
add address=103.40.55.251 comment="Website ditpsmk.net" list=ip-gue
add address=151.101.192.230 list=ip-gue
add address=151.101.128.230 list=ip-gue
add address=151.101.8.166 list=ip-gue
add address=151.101.0.0/16 list=ip-gue
add address=202.158.0.0/17 list=ip-gue
add address=72.21.92.0/24 list=ip-gue
add address=72.52.94.234 list=ip-gue
add address=103.73.235.12 comment=sipp.ketenagakerjaan.go.id list=ip-gue
add address=103.73.235.12 comment=sipp.ketenagakerjaan.go.id list=nice
add address=118.98.234.110 comment=psmk.kemdikbud.go.id list=ip-gue
add address=dapo.dikdasmen.kemdikbud.go.id list=ip-gue
add address=nisn.data.kemdikbud.go.id list=ip-gue
add address=118.98.233.157 list=nice
add address=118.98.166.68 list=nice
add address=118.98.233.157 disabled=yes list=nice
add address=10.0.100.27 comment=ARGAMAKMUR list=SOHO-PERSONAL
add address=10.0.0.0/8 list=my-network
add address=103.19.56.0/22 list=my-network
add address=118.98.227.0/24 list=UNBK
add address=ubk.kemdikbud.go.id list=UNBK
add address=biounpaketabc.kemdikbud.go.id list=UNBK
add address=10.0.100.115 comment=BPKD-BACKUP-VIA-WIRELESS list=SOHO-TO-ICON
add address=172.16.200.28/30 comment=Hotel-Cordela list=SOHO-PERSONAL
add address=tpp.bengkuluprov.go.id list=ip-gue
add address=103.94.120.115 list=nice
add address=172.16.200.0/24 list=akses
add address=10.100.100.0/24 list=akses
add address=103.19.56.0/22 list=akses
add address=10.0.100.0/24 list=akses
add address=10.0.100.51 comment="BTS PAGER DEWA" list=SOHO-PERSONAL
add address=103.19.56.11 list=ns-bitsnet
add address=172.16.200.28/30 comment="SOHO CORDELA" list=SOHO-TO-ICON
add address=10.0.100.51 comment="BTS PAGER DEWA" list=SOHO-TO-ICON
add address=103.19.57.188/30 list=CLIENT-VIA-TELKOM
add address=172.16.100.0/30 comment="TEST INET VIA TELKOM" list=SOHO-PERSONAL
add address=52.163.56.203 list=HOTEL-SANTIKA
add address=bo.hospitality.mykg.id list=HOTEL-SANTIKA
add address=45.60.158.31 list=HOTEL-SANTIKA
add address=mib.bankmandiri.co.id list=HOTEL-SANTIKA
add address=202.6.208.46 list=HOTEL-SANTIKA
add address=vpn.klikbca.com list=HOTEL-SANTIKA
add address=54.255.29.10 list=sekolah.mu
add address=18.138.94.111 list=sekolah.mu
add address=13.250.92.108 list=sekolah.mu
add address=172.172.172.3 comment="VPN TES SAHRUL" list=SOHO-TO-ICON
add address=172.16.200.8/30 comment="HOTEL SANTIKA" list=SOHO-TO-ICON
add address=10.110.201.19 comment="HOTEL SANTIKA" list=SOHO-TO-ICON
add address=10.0.100.3 comment="BLK BENGKULU" list=SOHO-TO-ICON
add address=10.0.100.131 comment=RO-BTS-ENSEVAL list=SOHO-TO-ICON
add address=103.19.56.0/22 list=network-bitsnet
add address=103.143.244.0/23 list=network-bitsnet
add address=103.19.56.10 list=dns-bitsnet
add address=103.19.56.11 list=dns-bitsnet
add address=103.19.56.2 list=dns-bitsnet
add address=103.19.56.3 list=dns-bitsnet
add address=172.16.0.0/30 comment=TEST list=SOHO-TO-ICON
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
    in-interface=Bridge-Main-Bengkulu new-connection-mark=ICON_CONN \
    passthrough=yes
add action=mark-routing chain=output connection-mark=TELKOM_CONN disabled=yes \
    new-routing-mark=TO_TELKOM passthrough=no
add action=mark-routing chain=output connection-mark=ICON_CONN disabled=yes \
    new-routing-mark=TO_ICON passthrough=no
add action=mark-connection chain=prerouting disabled=yes dst-address-type=\
    !local in-interface-list=list-client new-connection-mark=TELKOM_CONN \
    passthrough=yes per-connection-classifier=both-addresses-and-ports:2/0
add action=mark-connection chain=prerouting disabled=yes dst-address-type=\
    !local in-interface-list=list-client new-connection-mark=ICON_CONN \
    passthrough=yes per-connection-classifier=both-addresses-and-ports:2/1
add action=mark-routing chain=prerouting comment="LB GT" connection-mark=\
    TELKOM_CONN disabled=yes in-interface-list=list-client new-routing-mark=\
    TO_TELKOM passthrough=yes
add action=mark-routing chain=prerouting connection-mark=ICON_CONN disabled=\
    yes in-interface-list=list-client new-routing-mark=TO_ICON passthrough=\
    yes
add action=mark-packet chain=prerouting comment="Mark ICMP Input" disabled=\
    yes new-packet-mark=ping_pkts_i passthrough=yes protocol=icmp
add action=mark-packet chain=postrouting comment="Mark ICMP Output" disabled=\
    yes new-packet-mark=ping_pkts_o passthrough=yes protocol=icmp
add action=mark-routing chain=prerouting disabled=yes new-routing-mark=\
    TO_TELKOM packet-mark=ping_pkts_i passthrough=no
add action=mark-routing chain=prerouting comment="Cordella Via Telkom" \
    disabled=yes new-routing-mark=routing-via-telkom passthrough=no \
    src-address=172.16.200.28/30
add action=mark-routing chain=prerouting comment="RSKJ Via Telkom" disabled=\
    yes new-routing-mark=routing-via-telkom passthrough=no src-address=\
    103.19.58.132
add action=mark-routing chain=prerouting comment="Santika Via Telkom" \
    disabled=yes new-routing-mark=routing-via-telkom passthrough=no \
    src-address=103.19.57.64/29
add action=mark-routing chain=prerouting comment="Santika Via Icon" disabled=\
    yes new-routing-mark=SOHO-TO-ICON passthrough=no src-address=\
    103.19.57.64/29
add action=mark-routing chain=prerouting comment="Gias Via Telkom" disabled=\
    yes new-routing-mark=routing-via-telkom passthrough=no src-address=\
    103.19.59.92/30
add action=mark-routing chain=prerouting comment="Pagar Via Telkom" disabled=\
    yes new-routing-mark=routing-via-telkom passthrough=no src-address=\
    10.0.100.51
add action=mark-routing chain=prerouting comment="Test INET Via Telkom" \
    disabled=yes new-routing-mark=routing-via-telkom passthrough=no \
    src-address=172.16.100.0/30
add action=mark-routing chain=prerouting comment="Enseval Via Telkom" \
    disabled=yes new-routing-mark=routing-via-telkom passthrough=no \
    src-address=103.19.57.60/30
add action=mark-routing chain=prerouting comment="Cordella Via Telkom" \
    disabled=yes new-routing-mark=routing-via-telkom passthrough=no \
    src-address=172.16.200.28/30
add action=mark-routing chain=prerouting comment="Saimen Via Telkom" \
    disabled=yes new-routing-mark=routing-via-telkom passthrough=no \
    src-address=103.19.59.136/30
add action=mark-routing chain=prerouting comment=SOHO-TO-ICON disabled=yes \
    dst-address-list=!akses new-routing-mark=SOHO-TO-ICON passthrough=no \
    src-address-list=SOHO-TO-ICON
add action=mark-routing chain=prerouting comment=" Telkom " disabled=yes \
    dst-address-list=!akses new-routing-mark=routing-via-telkom passthrough=\
    no src-address-list=SOHO-PERSONAL
add action=mark-routing chain=prerouting comment=UNBK disabled=yes \
    dst-address-list=UNBK new-routing-mark=routing-via-telkom passthrough=no \
    src-address=103.19.57.112/30
/ip firewall nat
add action=src-nat chain=srcnat comment="Nat Telkom" src-address-list=\
    SOHO-PERSONAL to-addresses=103.19.56.171
add action=src-nat chain=srcnat comment="Nat Icon" src-address-list=\
    SOHO-TO-ICON to-addresses=103.19.56.171
add action=dst-nat chain=dstnat comment="Redirect DNS" disabled=yes \
    dst-address-list=!dns-bitsnet dst-port=53,443,853 nth=2,1 protocol=udp \
    src-address-list=network-bitsnet to-addresses=103.19.56.10 to-ports=53
add action=dst-nat chain=dstnat comment="Redirect DNS" disabled=yes \
    dst-address-list=!dns-bitsnet dst-port=53,443,853 nth=1,1 protocol=udp \
    src-address-list=network-bitsnet to-addresses=103.19.56.11 to-ports=53
add action=dst-nat chain=dstnat disabled=yes dst-port=53 protocol=udp \
    to-addresses=8.8.8.8
add action=dst-nat chain=dstnat disabled=yes dst-port=53 protocol=udp \
    to-addresses=1.1.1.1
add action=dst-nat chain=dstnat comment="Switch HP" dst-address=103.19.56.238 \
    dst-port=6081 protocol=tcp to-addresses=10.0.101.2 to-ports=80
add action=dst-nat chain=dstnat comment="Kalo Mau nambah Rule Kordinasi " \
    dst-address=103.19.57.41 dst-port=888 protocol=tcp to-addresses=\
    10.100.100.8 to-ports=443
add action=dst-nat chain=dstnat dst-address=103.19.57.41 dst-port=8181 \
    protocol=tcp to-addresses=172.16.200.30 to-ports=8291
add action=dst-nat chain=dstnat dst-address=103.19.57.41 dst-port=8282 \
    protocol=tcp to-addresses=10.0.100.58 to-ports=8291
add action=dst-nat chain=dstnat dst-address=103.19.57.41 dst-port=8080 \
    protocol=tcp to-addresses=192.168.99.1 to-ports=8080
add action=dst-nat chain=dstnat comment=CCTV dst-address=103.19.57.41 \
    dst-port=6090 protocol=tcp to-addresses=10.0.100.98 to-ports=8000
add action=dst-nat chain=dstnat dst-address=103.19.57.41 dst-port=8023 \
    protocol=tcp to-addresses=103.19.57.126 to-ports=8291
add action=dst-nat chain=dstnat comment=CCTV disabled=yes dst-address=\
    103.19.57.41 dst-port=8008 protocol=tcp to-addresses=10.0.100.98 \
    to-ports=80
add action=dst-nat chain=dstnat comment="DNS BITSNET" disabled=yes \
    dst-address=8.8.8.8 dst-port=53 protocol=udp to-addresses=103.19.56.2 \
    to-ports=53
add action=dst-nat chain=dstnat disabled=yes dst-address=8.8.8.8 dst-port=53 \
    protocol=udp to-addresses=103.19.56.3 to-ports=53
add action=dst-nat chain=dstnat comment="REDIRECT DNS TO 9.9.9.9" disabled=\
    yes dst-port=53 protocol=udp to-addresses=9.9.9.9 to-ports=53
/ip route
add check-gateway=ping comment="LB TO ICON" disabled=yes distance=1 gateway=\
    103.19.56.242 routing-mark=TO_ICON
add check-gateway=ping comment="LB TO TELKOM" distance=1 gateway=\
    103.19.56.240 routing-mark=routing-via-telkom
add check-gateway=ping comment="Default Route" distance=111 gateway=\
    103.19.56.242
add comment="Default Route Backup Telkom" distance=112 gateway=110.110.110.1
add distance=109 dst-address=1.1.1.1/32 gateway=103.19.56.240 scope=20
add check-gateway=ping comment="To BTS Enseval" distance=1 dst-address=\
    10.110.200.0/21 gateway=10.0.100.131
add check-gateway=ping comment="Route To BACKUP BITSNET" distance=1 \
    dst-address=103.19.56.185/32 gateway=110.110.110.1
add comment="Route To BACKUP BITSNET" distance=2 dst-address=103.19.56.185/32 \
    gateway=103.19.56.237
add check-gateway=ping comment="Route To MAIN BITSNET" distance=1 \
    dst-address=103.19.56.253/32 gateway=103.19.56.237
add comment="Route To EoIP BitsNet" distance=2 dst-address=103.19.56.253/32 \
    gateway=110.110.110.1
add comment="Backup wirelles Bpkd" distance=1 dst-address=103.19.57.232/29 \
    gateway=10.0.100.115
add comment="Route To RSKJ" distance=1 dst-address=103.19.58.132/32 gateway=\
    10.0.100.131
add comment="Route To Enseval" distance=1 dst-address=103.19.58.133/32 \
    gateway=10.0.100.131
add comment="Route To Office Bentiring" distance=1 dst-address=\
    103.19.58.135/32 gateway=172.16.100.10
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
add local-address=20.20.20.1 name=vpnbagus password=vpnbagus remote-address=\
    20.20.20.20
add comment="Request Customer " local-address=10.100.100.1 name=PT-SAIMEN \
    password=PT-SAIMEN profile=SAIMEN remote-address=103.19.58.140
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
add cost=30 interface=Bridge-Backup-Bengkulu network-type=point-to-point
add cost=20 interface=Bridge-Main-Bengkulu network-type=point-to-point
/routing ospf network
add area=backbone network=103.19.56.240/32
add area=backbone network=103.19.56.171/32
add area=backbone network=103.19.56.241/32
add area=backbone network=103.19.56.242/32
add area=backbone network=103.19.56.243/32
/snmp
set contact=noc@bits.net.id enabled=yes location="dist bengkulu" \
    trap-community=bengkulu trap-version=2
/system clock
set time-zone-name=Asia/Jakarta
/system identity
set name=dist-bengkulu.bits.net.id
/system note
set note=\
    "Konfigurasi telah dicadangkan pada 10 October 2018 by Noc@bits.net.id" \
    show-at-login=no
/system ntp client
set enabled=yes primary-ntp=103.19.56.5 secondary-ntp=202.162.32.12
/system package update
set channel=long-term
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
