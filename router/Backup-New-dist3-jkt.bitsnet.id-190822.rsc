# aug/16/2022 03:43:26 by RouterOS 6.48.5
# software id = KWA6-EJES
#
# model = CCR1009-7G-1C-1S+
# serial number = 849A08501E90
/interface bridge
add mtu=1500 name=Bridge-ICON-SANTIKA-Bengkulu
add mtu=1500 name=Bridge-TELKOM-DIST-Bengkulu
add name=loopback
/interface ethernet
set [ find default-name=ether1 ] speed=100Mbps
set [ find default-name=ether2 ] speed=100Mbps
set [ find default-name=ether3 ] speed=100Mbps
set [ find default-name=ether4 ] speed=100Mbps
set [ find default-name=ether5 ] speed=100Mbps
set [ find default-name=ether6 ] speed=100Mbps
set [ find default-name=ether7 ] speed=100Mbps
set [ find default-name=sfp-sfpplus1 ] advertise=\
    10M-full,100M-full,1000M-full,10000M-full
/interface eoip
add local-address=103.19.56.253 mac-address=02:1E:E7:55:97:11 mtu=1500 name=\
    EOIP-MAIN-BENGKULU remote-address=103.19.56.238 tunnel-id=2203
/interface vlan
add interface=sfp-sfpplus1 name=95-IPVPN-ICON vlan-id=95
add interface=sfp-sfpplus1 name=500-MGT-SW-APJII vlan-id=500
add interface=sfp-sfpplus1 name=501-MGT-QUARTER-RACK vlan-id=501
add interface=sfp-sfpplus1 name=513-TO-MPLS vlan-id=513
add interface=sfp-sfpplus1 name=514-TO-DIST-1 vlan-id=514
add interface=sfp-sfpplus1 name=516-MGT-TO-CRB vlan-id=516
add interface=sfp-sfpplus1 name=579-LPSE vlan-id=579
add interface=sfp-sfpplus1 name=580-BIRMS vlan-id=580
add interface=sfp-sfpplus1 name=583-UNTANGLE vlan-id=583
add interface=sfp-sfpplus1 name=585-RB-MONITORING-CDC vlan-id=585
add interface=sfp-sfpplus1 name=587-LDP-CANGGU vlan-id=587
add interface=sfp-sfpplus1 name=588-FS-MADIUN vlan-id=588
add interface=sfp-sfpplus1 name=880-ICON-CILACAP vlan-id=880
add interface=sfp-sfpplus1 name=882-ICON-MADIUN vlan-id=882
add interface=sfp-sfpplus1 name=883-NURKHOLIS vlan-id=883
add interface=sfp-sfpplus1 name=885-ICON-TRENGGALEK vlan-id=885
add interface=sfp-sfpplus1 name=887-BERTEST-SRAGEN-ICON vlan-id=887
add interface=sfp-sfpplus1 name=888-BERTEST-SUJI-ICON vlan-id=888
add interface=sfp-sfpplus1 name=889-SELOREJO-DUMMY-TESTER vlan-id=889
add interface=sfp-sfpplus1 name=890-SAMPANG-MADURA vlan-id=890
add interface=sfp-sfpplus1 name=891-ICON-HARSO vlan-id=891
add interface=sfp-sfpplus1 name=1401-DUMMY-INTEGRASIA vlan-id=1401
add interface=sfp-sfpplus1 name=1506-DUMMY-SURGE vlan-id=1506
add disabled=yes interface=sfp-sfpplus1 name=1511-FS-TULNET vlan-id=1511
add interface=sfp-sfpplus1 name=1512-IFORTE-BANDUNG vlan-id=1512
add interface=sfp-sfpplus1 name=1577-JLM-BANDUNG vlan-id=1577
add interface=sfp-sfpplus1 name=1602-MGT-JUNOS-NTT vlan-id=1602
add interface=sfp-sfpplus1 name=1705-TO-FB-NTT vlan-id=1705
add interface=sfp-sfpplus1 name=1803-TO-OIXP vlan-id=1803
add interface=sfp-sfpplus1 name=1917-IFORTE-BWI vlan-id=1917
add interface=sfp-sfpplus1 name=3500-MGT-DIST-JUNOS vlan-id=3500
/ppp profile
add bridge=Bridge-TELKOM-DIST-Bengkulu name=BACKUP-BENGKULU
add bridge=Bridge-ICON-SANTIKA-Bengkulu name=MAIN-BENGKULU
/routing bgp instance
set default disabled=yes
add as=132637 client-to-client-reflection=no disabled=yes name=BITSNET \
    redistribute-connected=yes redistribute-static=yes router-id=\
    103.19.56.253
/routing ospf instance
set [ find default=yes ] redistribute-connected=as-type-2 \
    redistribute-static=as-type-2 router-id=103.19.56.253
/snmp community
set [ find default=yes ] addresses=103.19.56.0/22
add addresses=103.19.56.0/22 name=jakarta
/system logging action
set 3 remote=103.19.56.12 src-address=103.19.56.185
/user group
set read policy="local,telnet,read,test,winbox,!ssh,!ftp,!reboot,!write,!polic\
    y,!password,!web,!sniff,!sensitive,!api,!romon,!dude,!tikapp"
set write policy="local,telnet,ssh,reboot,read,write,test,winbox,web,sensitive\
    ,!ftp,!policy,!password,!sniff,!api,!romon,!dude,!tikapp"
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
add name=NOC policy="local,telnet,ssh,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,!ftp,!api,!romon,!dude,!tikapp"
add name=SPVNOC policy="local,telnet,ssh,reboot,read,write,test,winbox,passwor\
    d,web,sniff,sensitive,api,romon,tikapp,!ftp,!policy,!dude"
add name=btest policy="test,winbox,!local,!telnet,!ssh,!ftp,!reboot,!read,!wri\
    te,!policy,!password,!web,!sniff,!sensitive,!api,!romon,!dude,!tikapp"
/interface bridge port
add bridge=Bridge-ICON-SANTIKA-Bengkulu interface=EOIP-MAIN-BENGKULU
/ip firewall connection tracking
set enabled=yes
/ip neighbor discovery-settings
set discover-interface-list=all
/interface l2tp-server server
set allow-fast-path=yes enabled=yes ipsec-secret=7895123ok max-mru=1500 \
    max-mtu=1500 mrru=1600 one-session-per-host=yes use-ipsec=yes
/interface pptp-server server
set default-profile=default enabled=yes max-mru=1500 max-mtu=1500 mrru=1600
/interface sstp-server server
set enabled=yes mrru=1600 port=3344
/ip address
add address=10.254.7.74/30 interface=514-TO-DIST-1 network=10.254.7.72
add address=103.19.56.253 interface=loopback network=103.19.56.253
add address=10.254.10.1/30 interface=95-IPVPN-ICON network=10.254.10.0
add address=10.254.7.5/30 interface=500-MGT-SW-APJII network=10.254.7.4
add address=10.254.7.21/30 interface=501-MGT-QUARTER-RACK network=10.254.7.20
add address=103.19.57.93/30 comment="Backup-LPSE (enable if untangle down)" \
    disabled=yes interface=579-LPSE network=103.19.57.92
add address=103.19.57.129/30 comment="Backup-LPSE (enable if untangle down)" \
    disabled=yes interface=580-BIRMS network=103.19.57.128
add address=103.19.56.93/30 interface=583-UNTANGLE network=103.19.56.92
add address=10.254.7.13/30 interface=585-RB-MONITORING-CDC network=\
    10.254.7.12
add address=10.254.223.1/30 interface=3500-MGT-DIST-JUNOS network=\
    10.254.223.0
add address=103.19.56.240 comment=BENGKULU interface=\
    Bridge-TELKOM-DIST-Bengkulu network=103.19.56.241
add address=103.19.56.185/30 interface=513-TO-MPLS network=103.19.56.184
add address=172.16.11.7/24 disabled=yes interface=1512-IFORTE-BANDUNG \
    network=172.16.11.0
add address=172.16.16.1/30 disabled=yes interface=1577-JLM-BANDUNG network=\
    172.16.16.0
add address=103.19.56.221/30 interface=588-FS-MADIUN network=103.19.56.220
add address=10.10.192.9/30 comment="TEST HARSO" disabled=yes interface=\
    891-ICON-HARSO network=10.10.192.8
add address=103.19.56.242 comment=BENGKULU interface=\
    Bridge-ICON-SANTIKA-Bengkulu network=103.19.56.243
add address=192.168.167.3/29 interface=587-LDP-CANGGU network=192.168.167.0
add address=172.16.222.1/29 disabled=yes interface=1401-DUMMY-INTEGRASIA \
    network=172.16.222.0
add address=10.10.10.1/29 comment="DUMMY SRAGEN" disabled=yes interface=\
    887-BERTEST-SRAGEN-ICON network=10.10.10.0
add address=10.222.3.1/29 disabled=yes interface=1917-IFORTE-BWI network=\
    10.222.3.0
add address=10.11.12.249/30 interface=891-ICON-HARSO network=10.11.12.248
add address=10.254.222.1/30 interface=1602-MGT-JUNOS-NTT network=10.254.222.0
/ip dns
set servers=103.19.56.10,103.19.56.11
/ip firewall address-list
add address=1.80.0.0/13 comment="ru and cn addresses" list=ru-cn
add address=1.202.0.0/15 list=ru-cn
add address=14.144.0.0/12 list=ru-cn
add address=14.208.0.0/12 list=ru-cn
add address=23.105.14.0/24 list=ru-cn
add address=27.8.0.0/13 list=ru-cn
add address=27.16.0.0/12 list=ru-cn
add address=27.36.0.0/14 list=ru-cn
add address=27.40.0.0/13 list=ru-cn
add address=27.50.128.0/17 list=ru-cn
add address=27.54.192.0/18 list=ru-cn
add address=27.106.128.0/18 list=ru-cn
add address=27.115.0.0/17 list=ru-cn
add address=27.148.0.0/14 list=ru-cn
add address=27.152.0.0/13 list=ru-cn
add address=27.184.0.0/13 list=ru-cn
add address=36.32.0.0/14 list=ru-cn
add address=36.248.0.0/14 list=ru-cn
add address=42.96.128.0/17 list=ru-cn
add address=42.120.0.0/15 list=ru-cn
add address=58.16.0.0/15 list=ru-cn
add address=58.20.0.0/16 list=ru-cn
add address=58.21.0.0/16 list=ru-cn
add address=58.22.0.0/15 list=ru-cn
add address=58.34.0.0/16 list=ru-cn
add address=58.37.0.0/16 list=ru-cn
add address=58.38.0.0/16 list=ru-cn
add address=58.40.0.0/16 list=ru-cn
add address=58.42.0.0/16 list=ru-cn
add address=58.44.0.0/14 list=ru-cn
add address=58.48.0.0/13 list=ru-cn
add address=58.56.0.0/15 list=ru-cn
add address=58.58.0.0/16 list=ru-cn
add address=58.59.0.0/17 list=ru-cn
add address=58.60.0.0/14 list=ru-cn
add address=58.68.128.0/17 list=ru-cn
add address=58.82.0.0/15 list=ru-cn
add address=58.100.0.0/15 list=ru-cn
add address=58.208.0.0/12 list=ru-cn
add address=58.242.0.0/15 list=ru-cn
add address=58.246.0.0/15 list=ru-cn
add address=58.248.0.0/13 list=ru-cn
add address=59.32.0.0/13 list=ru-cn
add address=59.40.0.0/15 list=ru-cn
add address=59.42.0.0/16 list=ru-cn
add address=59.44.0.0/14 list=ru-cn
add address=59.51.0.0/16 list=ru-cn
add address=59.52.0.0/14 list=ru-cn
add address=59.56.0.0/13 list=ru-cn
add address=59.72.0.0/16 list=ru-cn
add address=59.108.0.0/15 list=ru-cn
add address=59.172.0.0/14 list=ru-cn
add address=60.0.0.0/13 list=ru-cn
add address=60.11.0.0/16 list=ru-cn
add address=60.12.0.0/16 list=ru-cn
add address=60.24.0.0/13 list=ru-cn
add address=60.160.0.0/11 list=ru-cn
add address=60.194.0.0/15 list=ru-cn
add address=60.208.0.0/13 list=ru-cn
add address=60.216.0.0/15 list=ru-cn
add address=60.220.0.0/14 list=ru-cn
add address=61.4.64.0/20 list=ru-cn
add address=61.4.80.0/22 list=ru-cn
add address=61.4.176.0/20 list=ru-cn
add address=61.48.0.0/13 list=ru-cn
add address=61.128.0.0/10 list=ru-cn
add address=61.135.0.0/16 list=ru-cn
add address=61.136.0.0/18 list=ru-cn
add address=61.139.0.0/16 list=ru-cn
add address=61.145.73.208/28 list=ru-cn
add address=61.147.0.0/16 list=ru-cn
add address=61.152.0.0/16 list=ru-cn
add address=61.154.0.0/16 list=ru-cn
add address=61.160.0.0/16 list=ru-cn
add address=61.162.0.0/15 list=ru-cn
add address=61.164.0.0/16 list=ru-cn
add address=61.175.0.0/16 list=ru-cn
add address=61.177.0.0/16 list=ru-cn
add address=61.179.0.0/16 list=ru-cn
add address=61.183.0.0/16 list=ru-cn
add address=61.184.0.0/16 list=ru-cn
add address=61.185.219.232/29 list=ru-cn
add address=61.187.0.0/16 list=ru-cn
add address=61.188.0.0/16 list=ru-cn
add address=61.191.0.0/16 list=ru-cn
add address=61.232.0.0/14 list=ru-cn
add address=61.236.0.0/15 list=ru-cn
add address=61.240.0.0/14 list=ru-cn
add address=101.64.0.0/13 list=ru-cn
add address=106.112.0.0/13 list=ru-cn
add address=110.6.0.0/15 list=ru-cn
add address=110.51.0.0/16 list=ru-cn
add address=110.52.0.0/15 list=ru-cn
add address=110.80.0.0/13 list=ru-cn
add address=10.88.0.0/14 list=ru-cn
add address=110.96.0.0/11 list=ru-cn
add address=110.173.0.0/19 list=ru-cn
add address=110.173.32.0/20 list=ru-cn
add address=110.173.64.0/18 list=ru-cn
add address=110.192.0.0/11 list=ru-cn
add address=110.240.0.0/12 list=ru-cn
add address=111.0.0.0/10 list=ru-cn
add address=111.72.0.0/13 list=ru-cn
add address=111.121.0.0/16 list=ru-cn
add address=111.128.0.0/11 list=ru-cn
add address=111.160.0.0/13 list=ru-cn
add address=111.172.0.0/14 list=ru-cn
add address=111.176.0.0/13 list=ru-cn
add address=111.228.0.0/14 list=ru-cn
add address=112.0.0.0/10 list=ru-cn
add address=112.64.0.0/14 list=ru-cn
add address=112.80.0.0/12 list=ru-cn
add address=112.100.0.0/14 list=ru-cn
add address=112.111.0.0/16 list=ru-cn
add address=112.122.0.0/15 list=ru-cn
add address=112.224.0.0/11 list=ru-cn
add address=113.0.0.0/13 list=ru-cn
add address=113.8.0.0/15 list=ru-cn
add address=113.12.0.0/14 list=ru-cn
add address=113.16.0.0/15 list=ru-cn
add address=113.18.0.0/16 list=ru-cn
add address=113.62.0.0/15 list=ru-cn
add address=113.64.0.0/10 list=ru-cn
add address=113.128.0.0/15 list=ru-cn
add address=113.136.0.0/13 list=ru-cn
add address=113.194.0.0/15 list=ru-cn
add address=113.204.0.0/14 list=ru-cn
add address=114.28.0.0/16 list=ru-cn
add address=114.80.0.0/12 list=ru-cn
add address=114.104.0.0/14 list=ru-cn
add address=114.112.0.0/14 list=ru-cn
add address=114.216.0.0/13 list=ru-cn
add address=114.224.0.0/11 list=ru-cn
add address=115.24.0.0/15 list=ru-cn
add address=115.32.0.0/14 list=ru-cn
add address=115.48.0.0/12 list=ru-cn
add address=115.84.0.0/18 list=ru-cn
add address=115.100.0.0/15 list=ru-cn
add address=115.148.0.0/14 list=ru-cn
add address=115.152.0.0/15 list=ru-cn
add address=115.168.0.0/14 list=ru-cn
add address=115.212.0.0/16 list=ru-cn
add address=115.230.0.0/16 list=ru-cn
add address=115.236.96.0/23 list=ru-cn
add address=115.236.136.0/22 list=ru-cn
add address=115.239.228.0/22 list=ru-cn
add address=116.1.0.0/16 list=ru-cn
add address=116.2.0.0/15 list=ru-cn
add address=116.4.0.0/14 list=ru-cn
add address=116.8.0.0/14 list=ru-cn
add address=116.16.0.0/12 list=ru-cn
add address=116.52.0.0/14 list=ru-cn
add address=116.204.0.0/15 list=ru-cn
add address=116.90.80.0/20 list=ru-cn
add address=116.76.0.0/15 list=ru-cn
add address=116.112.0.0/14 list=ru-cn
add address=116.128.0.0/10 list=ru-cn
add address=116.208.0.0/14 list=ru-cn
add address=116.224.0.0/12 list=ru-cn
add address=116.254.128.0/18 list=ru-cn
add address=117.21.0.0/16 list=ru-cn
add address=117.22.0.0/15 list=ru-cn
add address=117.24.0.0/13 list=ru-cn
add address=117.32.0.0/13 list=ru-cn
add address=117.40.0.0/14 list=ru-cn
add address=117.44.0.0/15 list=ru-cn
add address=117.79.224.0/20 list=ru-cn
add address=117.80.0.0/12 list=ru-cn
add address=117.136.0.0/13 list=ru-cn
add address=118.26.0.0/16 list=ru-cn
add address=118.72.0.0/13 list=ru-cn
add address=118.112.0.0/13 list=ru-cn
add address=118.120.0.0/14 list=ru-cn
add address=118.132.0.0/14 list=ru-cn
add address=118.144.0.0/14 list=ru-cn
add address=118.180.0.0/14 list=ru-cn
add address=118.186.0.0/15 list=ru-cn
add address=118.192.0.0/16 list=ru-cn
add address=118.248.0.0/13 list=ru-cn
add address=119.0.0.0/15 list=ru-cn
add address=119.8.0.0/15 list=ru-cn
add address=119.10.0.0/17 list=ru-cn
add address=119.18.192.0/20 list=ru-cn
add address=119.36.0.0/16 list=ru-cn
add address=119.57.0.0/16 list=ru-cn
add address=119.60.0.0/16 list=ru-cn
add address=119.88.0.0/14 list=ru-cn
add address=119.96.0.0/13 list=ru-cn
add address=119.112.0.0/13 list=ru-cn
add address=119.120.0.0/13 list=ru-cn
add address=119.128.0.0/12 list=ru-cn
add address=119.144.0.0/14 list=ru-cn
add address=119.164.0.0/14 list=ru-cn
add address=119.176.0.0/12 list=ru-cn
add address=119.233.0.0/16 list=ru-cn
add address=120.0.0.0/12 list=ru-cn
add address=120.24.0.0/14 list=ru-cn
add address=120.32.0.0/13 list=ru-cn
add address=120.40.0.0/14 list=ru-cn
add address=120.68.0.0/14 list=ru-cn
add address=120.192.0.0/10 list=ru-cn
add address=121.0.16.0/20 list=ru-cn
add address=121.8.0.0/13 list=ru-cn
add address=121.16.0.0/12 list=ru-cn
add address=121.32.0.0/14 list=ru-cn
add address=121.60.0.0/14 list=ru-cn
add address=121.76.0.0/15 list=ru-cn
add address=121.204.0.0/14 list=ru-cn
add address=121.224.0.0/12 list=ru-cn
add address=122.51.128.0/17 list=ru-cn
add address=122.64.0.0/11 list=ru-cn
add address=122.119.0.0/16 list=ru-cn
add address=122.136.0.0/13 list=ru-cn
add address=122.156.0.0/14 list=ru-cn
add address=122.188.0.0/14 list=ru-cn
add address=122.192.0.0/14 list=ru-cn
add address=122.198.0.0/16 list=ru-cn
add address=122.200.64.0/18 list=ru-cn
add address=122.224.0.0/12 list=ru-cn
add address=123.4.0.0/14 list=ru-cn
add address=123.8.0.0/13 list=ru-cn
add address=123.52.0.0/14 list=ru-cn
add address=123.64.0.0/11 list=ru-cn
add address=123.97.128.0/17 list=ru-cn
add address=123.100.0.0/19 list=ru-cn
add address=123.112.0.0/12 list=ru-cn
add address=123.128.0.0/13 list=ru-cn
add address=123.138.0.0/15 list=ru-cn
add address=123.150.0.0/15 list=ru-cn
add address=123.152.0.0/13 list=ru-cn
add address=123.164.0.0/14 list=ru-cn
add address=123.180.0.0/14 list=ru-cn
add address=123.184.0.0/14 list=ru-cn
add address=123.196.0.0/15 list=ru-cn
add address=123.232.0.0/14 list=ru-cn
add address=123.249.0.0/16 list=ru-cn
add address=124.42.64.0/18 list=ru-cn
add address=124.64.0.0/15 list=ru-cn
add address=124.67.0.0/16 list=ru-cn
add address=124.73.0.0/16 list=ru-cn
add address=124.114.0.0/15 list=ru-cn
add address=124.126.0.0/15 list=ru-cn
add address=124.128.0.0/13 list=ru-cn
add address=124.160.0.0/16 list=ru-cn
add address=124.163.0.0/16 list=ru-cn
add address=124.192.0.0/15 list=ru-cn
add address=124.200.0.0/13 list=ru-cn
add address=124.226.0.0/15 list=ru-cn
add address=124.228.0.0/14 list=ru-cn
add address=124.236.0.0/14 list=ru-cn
add address=124.240.0.0/17 list=ru-cn
add address=124.240.128.0/18 list=ru-cn
add address=124.248.0.0/17 list=ru-cn
add address=125.36.0.0/14 list=ru-cn
add address=125.40.0.0/13 list=ru-cn
add address=125.64.0.0/12 list=ru-cn
add address=125.79.0.0/16 list=ru-cn
add address=125.80.0.0/13 list=ru-cn
add address=125.88.0.0/13 list=ru-cn
add address=125.104.0.0/13 list=ru-cn
add address=125.112.0.0/12 list=ru-cn
add address=140.224.0.0/16 list=ru-cn
add address=140.246.0.0/16 list=ru-cn
add address=159.226.0.0/16 list=ru-cn
add address=171.34.0.0/15 list=ru-cn
add address=171.36.0.0/14 list=ru-cn
add address=171.40.0.0/13 list=ru-cn
add address=175.0.0.0/12 list=ru-cn
add address=175.16.0.0/13 list=ru-cn
add address=175.24.0.0/14 list=ru-cn
add address=175.30.0.0/15 list=ru-cn
add address=175.42.0.0/15 list=ru-cn
add address=175.44.0.0/16 list=ru-cn
add address=175.46.0.0/15 list=ru-cn
add address=175.48.0.0/12 list=ru-cn
add address=175.64.0.0/11 list=ru-cn
add address=175.102.0.0/16 list=ru-cn
add address=175.106.128.0/17 list=ru-cn
add address=175.146.0.0/15 list=ru-cn
add address=175.148.0.0/14 list=ru-cn
add address=175.152.0.0/14 list=ru-cn
add address=175.160.0.0/12 list=ru-cn
add address=175.178.0.0/16 list=ru-cn
add address=175.184.128.0/18 list=ru-cn
add address=175.185.0.0/16 list=ru-cn
add address=175.186.0.0/15 list=ru-cn
add address=175.188.0.0/14 list=ru-cn
add address=180.76.0.0/16 list=ru-cn
add address=180.96.0.0/11 list=ru-cn
add address=180.136.0.0/13 list=ru-cn
add address=180.152.0.0/13 list=ru-cn
add address=180.208.0.0/15 list=ru-cn
add address=182.18.0.0/17 list=ru-cn
add address=182.88.0.0/14 list=ru-cn
add address=182.112.0.0/12 list=ru-cn
add address=183.0.0.0/10 list=ru-cn
add address=183.64.0.0/13 list=ru-cn
add address=183.129.0.0/16 list=ru-cn
add address=183.160.0.0/12 list=ru-cn
add address=183.184.0.0/13 list=ru-cn
add address=183.192.0.0/11 list=ru-cn
add address=192.74.224.0/19 list=ru-cn
add address=198.2.203.64/28 list=ru-cn
add address=198.2.212.160/28 list=ru-cn
add address=221.204.0.0/15 list=ru-cn
add address=202.43.144.0/22 list=ru-cn
add address=202.46.32.0/19 list=ru-cn
add address=202.66.0.0/16 list=ru-cn
add address=202.96.0.0/12 list=ru-cn
add address=202.111.160.0/19 list=ru-cn
add address=202.112.0.0/14 list=ru-cn
add address=202.117.0.0/16 list=ru-cn
add address=202.165.176.0/20 list=ru-cn
add address=202.196.80.0/20 list=ru-cn
add address=203.69.0.0/16 list=ru-cn
add address=203.86.0.0/18 list=ru-cn
add address=203.86.64.0/19 list=ru-cn
add address=203.93.0.0/16 list=ru-cn
add address=203.169.160.0/19 list=ru-cn
add address=210.5.0.0/19 list=ru-cn
add address=210.14.128.0/19 list=ru-cn
add address=210.21.0.0/16 list=ru-cn
add address=210.32.0.0/14 list=ru-cn
add address=210.51.0.0/16 list=ru-cn
add address=210.52.0.0/15 list=ru-cn
add address=210.77.0.0/16 list=ru-cn
add address=210.192.96.0/19 list=ru-cn
add address=211.76.96.0/20 list=ru-cn
add address=211.78.208.0/20 list=ru-cn
add address=211.86.144.0/20 list=ru-cn
add address=211.90.0.0/15 list=ru-cn
add address=211.92.0.0/14 list=ru-cn
add address=211.96.0.0/13 list=ru-cn
add address=211.136.0.0/13 list=ru-cn
add address=211.144.12.0/22 list=ru-cn
add address=211.144.96.0/19 list=ru-cn
add address=211.144.160.0/20 list=ru-cn
add address=211.147.208.0/20 list=ru-cn
add address=211.147.224.0/23 list=ru-cn
add address=211.152.14.0/24 list=ru-cn
add address=211.154.64.0/19 list=ru-cn
add address=211.154.128.0/19 list=ru-cn
add address=211.155.24.0/22 list=ru-cn
add address=211.157.32.0/19 list=ru-cn
add address=211.160.0.0/13 list=ru-cn
add address=211.233.70.0/24 list=ru-cn
add address=218.0.0.0/11 list=ru-cn
add address=218.56.0.0/13 list=ru-cn
add address=218.64.0.0/11 list=ru-cn
add address=218.88.0.0/13 list=ru-cn
add address=218.96.0.0/14 list=ru-cn
add address=218.102.0.0/16 list=ru-cn
add address=218.104.0.0/14 list=ru-cn
add address=218.108.0.0/15 list=ru-cn
add address=218.194.80.0/20 list=ru-cn
add address=218.200.0.0/13 list=ru-cn
add address=218.240.0.0/13 list=ru-cn
add address=219.128.0.0/11 list=ru-cn
add address=219.154.0.0/15 list=ru-cn
add address=219.223.192.0/18 list=ru-cn
add address=219.232.0.0/16 list=ru-cn
add address=219.234.80.0/20 list=ru-cn
add address=219.235.0.0/16 list=ru-cn
add address=220.154.0.0/15 list=ru-cn
add address=220.160.0.0/11 list=ru-cn
add address=220.181.0.0/16 list=ru-cn
add address=220.191.0.0/16 list=ru-cn
add address=220.192.0.0/12 list=ru-cn
add address=220.228.70.0/24 list=ru-cn
add address=220.248.0.0/14 list=ru-cn
add address=220.252.0.0/16 list=ru-cn
add address=221.0.0.0/12 list=ru-cn
add address=221.122.0.0/15 list=ru-cn
add address=221.176.0.0/13 list=ru-cn
add address=221.192.0.0/14 list=ru-cn
add address=221.200.0.0/14 list=ru-cn
add address=221.224.0.0/13 list=ru-cn
add address=5.45.48.0/20 comment=test1 list=ru-cn
add address=8.37.224.0/20 comment="test 2" list=ru-cn
add address=198.8.88.0/24 comment="flooding icmp" list=ru-cn
add address=198.20.70.0/24 list=ru-cn
add address=145.239.0.0/16 comment="OVA SAS" list=ru-cn
add address=195.22.0.0/19 list=ru-cn
add address=110.42.0.0/17 comment=mbuh list=ru-cn
add address=175.112.0.0/12 comment=junimch.com disabled=yes list=ru-cn
add address=203.107.44.0/22 comment="EX DDOS ZIMBRA" list=ru-cn
/ip firewall filter
add action=accept chain=forward disabled=yes dst-port=25 protocol=tcp
add action=accept chain=forward disabled=yes dst-port=25 protocol=tcp
add action=drop chain=input dst-port=53 protocol=tcp
add action=drop chain=input dst-port=53 protocol=udp
add action=drop chain=forward comment=\
    "1. Dont disable/delete please, blok spammer" dst-port=25 protocol=tcp
add action=drop chain=forward comment=\
    "2. Dont disable/delete please, blok spammer" dst-port=25 protocol=udp
add action=drop chain=forward comment="Malware Ransomware Type WannaCRY" \
    dst-port=137-139,445 protocol=tcp
add action=drop chain=forward comment="Malware Ransomware Type WannaCRY" \
    dst-port=137-139,445 protocol=udp
add action=drop chain=forward comment="Drop ru-cn" src-address-list=ru-cn
/ip firewall nat
add action=dst-nat chain=dstnat comment="DSTNAT SWITCH QUARTER RACK NTT" \
    dst-address=103.19.56.185 dst-port=7778 protocol=tcp to-addresses=\
    10.254.7.18 to-ports=8291
add action=dst-nat chain=dstnat comment=JUNOS-NTT dst-address=103.19.56.185 \
    dst-port=9999 protocol=tcp to-addresses=10.254.222.2 to-ports=9989
add action=dst-nat chain=dstnat disabled=yes dst-address=103.19.56.10 \
    dst-port=53 nth=2,1 protocol=udp to-addresses=103.19.56.2
add action=dst-nat chain=dstnat disabled=yes dst-address=103.19.56.11 \
    dst-port=53 nth=1,1 protocol=udp to-addresses=103.19.56.3
/ip route
add disabled=yes distance=109 dst-address=10.0.100.120/29 gateway=\
    103.19.56.241 scope=20
add comment="Route Cordela Via ICON" disabled=yes distance=109 dst-address=\
    10.0.200.28/30 gateway=103.19.56.241 scope=20
add check-gateway=ping comment="Route IPVPN Icon+ Santika Bengkulu" distance=\
    1 dst-address=103.19.56.236/30 gateway=10.254.10.2
add comment=SANTIKA-VIA-ICON disabled=yes distance=111 dst-address=\
    103.19.57.64/29 gateway=103.19.56.243
add comment="LPSE BIRMS JAKARTA" distance=1 dst-address=103.19.57.92/30 \
    gateway=103.19.56.94
add comment=SERVER-UNTANGLE-TEST distance=1 dst-address=103.19.57.108/30 \
    gateway=103.19.56.94
add comment=SERVER-UNTANGLE-TEST distance=1 dst-address=103.19.57.120/30 \
    gateway=103.19.56.94
add comment="LPSE BIRMS JAKARTA" distance=1 dst-address=103.19.57.128/30 \
    gateway=103.19.56.94
add check-gateway=ping comment="Route To Icon+ IPVPN BPKD" distance=1 \
    dst-address=103.19.57.232/29 gateway=10.254.10.2
add comment=RSKJ-VIA-ICON disabled=yes distance=111 dst-address=\
    103.19.58.132/32 gateway=103.19.56.243
add check-gateway=ping comment="Route IPVPN Icon+ Enseval" disabled=yes \
    distance=1 dst-address=103.19.58.133/32 gateway=103.19.56.243
add disabled=yes distance=1 dst-address=103.19.58.135/32 gateway=\
    103.19.56.243 scope=20
add comment=SAIMEN-VIA-ICON disabled=yes distance=109 dst-address=\
    103.19.58.140/32 gateway=103.19.56.243
add comment=CORDELA-VIA-ICON disabled=yes distance=111 dst-address=\
    172.16.200.28/30 gateway=103.19.56.243
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
set default-screen=interfaces enabled=no touch-screen=disabled
/ppp secret
add name=BITSNETBENGKULU-2 password=7895123ok33 profile=BACKUP-BENGKULU
add name=BITSNETBENGKULU-1 password=7895123ok33 profile=MAIN-BENGKULU
add local-address=172.16.13.1 name=ppp1 password=ppp1 profile=\
    default-encryption remote-address=172.16.13.2
/routing bgp network
add disabled=yes network=103.19.56.0/24 synchronize=no
add disabled=yes network=103.19.57.0/24 synchronize=no
add disabled=yes network=103.19.58.0/24 synchronize=no
add disabled=yes network=103.19.59.0/24 synchronize=no
add disabled=yes network=103.143.244.0/24 synchronize=no
add disabled=yes network=103.143.245.0/24 synchronize=no
/routing filter
add action=accept chain=ospf-in comment=OSPF-IN prefix=0.0.0.0/0
add action=accept chain=ospf-in prefix=10.0.0.0/8 prefix-length=8-32
add action=accept chain=ospf-in prefix=172.16.0.0/12 prefix-length=12-32
add action=accept chain=ospf-in prefix=103.19.56.0/24 prefix-length=24-32
add action=accept chain=ospf-in prefix=103.19.57.60/30 prefix-length=30 \
    set-in-nexthop=10.254.14.54 set-out-nexthop=10.254.14.53
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
add cost=1 interface=514-TO-DIST-1 network-type=point-to-point
add cost=1000 interface=Bridge-ICON-SANTIKA-Bengkulu network-type=\
    point-to-point
add cost=2000 interface=Bridge-TELKOM-DIST-Bengkulu network-type=\
    point-to-point
add cost=3000 interface=513-TO-MPLS network-type=point-to-point
/routing ospf network
add area=backbone network=10.254.7.72/30
add area=backbone network=103.19.56.253/32
add area=backbone network=103.19.56.240/32
add area=backbone network=103.19.56.184/30
add area=backbone network=103.19.56.241/32
add area=backbone network=103.19.56.242/32
add area=backbone network=103.19.56.243/32
add area=backbone network=10.222.3.0/29
/snmp
set contact=noc@bitsnet.id enabled=yes location=Cyber1-jakarta \
    trap-community=jakarta trap-generators="" trap-version=2
/system clock
set time-zone-name=Asia/Jakarta
/system identity
set name=NEW-dist3-jkt.bitsnet.id
/system logging
add action=remote topics=critical
add action=remote topics=error
add action=remote topics=info
add action=remote topics=warning
/system note
set note="Konfigurasi telah dicadangkan pada 6 Maret 2019 by Noc@bits.net.id"
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
add disabled=yes interval=15m name=BGP-SAFE-YET on-event=\
    "tool fetch https://postpi.org/asn0.rsc;\r\
    \nimport asn0.rsc" policy=reboot,read,write,test,sniff,sensitive \
    start-time=startup
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
set authenticate=no max-sessions=10
/tool romon
set enabled=yes secrets=7895123ok
