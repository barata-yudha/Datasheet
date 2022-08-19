# aug/19/2022 11:22:15 by RouterOS 6.48.6
# software id = NIM0-V4HT
#
# model = CCR1036-8G-2S+
# serial number = C6CC0B623F40
/interface ethernet
set [ find default-name=sfp-sfpplus1 ] comment="TO-SWITCH NEXUS"
set [ find default-name=sfp-sfpplus2 ] auto-negotiation=no comment=TO-CDN
/interface vlan
add comment=NEW-OPEN-IXP interface=sfp-sfpplus2 name=59-NEW-BITS-OIXP \
    vlan-id=59
add comment="ABHINAWA EXCHANGE" interface=sfp-sfpplus2 name=551-BITS-ABHINAWA \
    vlan-id=551
add comment=CDIX interface=sfp-sfpplus2 name=1100-BITS-CDIX vlan-id=1100
add interface=sfp-sfpplus1 name=1115-DST-2-JUNOS vlan-id=1115
add interface=sfp-sfpplus1 name=1116-DST-1-JUNOS vlan-id=1116
add comment=JKT-IX interface=sfp-sfpplus2 name=1601-BITS-JKT-IX vlan-id=1601
add comment=IIX-APJII interface=sfp-sfpplus2 name=2100-BITS-IIX vlan-id=2100
/ip pool
add name=dhcp_pool0 ranges=192.168.1.2-192.168.1.254
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=no name=dhcp1
/port
set 2 baud-rate=115200 data-bits=8 flow-control=none name=usb3 parity=none \
    stop-bits=1
/routing bgp instance
set default disabled=yes
add as=132637 name=BITSNET redistribute-static=yes router-id=103.19.56.212
/snmp community
set [ find default=yes ] addresses=103.19.56.0/22
add addresses=103.19.56.0/22,103.174.115.53/32 name=jakarta
/system logging action
set 3 remote=103.19.56.12
/user group
set read policy="local,telnet,read,test,winbox,!ssh,!ftp,!reboot,!write,!polic\
    y,!password,!web,!sniff,!sensitive,!api,!romon,!dude,!tikapp"
set write policy="local,telnet,ssh,ftp,read,write,policy,test,winbox,password,\
    web,sniff,sensitive,romon,!reboot,!api,!dude,!tikapp"
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
add name=NOC policy="local,telnet,ssh,reboot,read,write,test,winbox,web,sensit\
    ive,!ftp,!policy,!password,!sniff,!api,!romon,!dude,!tikapp"
add name=SPVNOC policy="local,telnet,ssh,reboot,read,write,test,winbox,passwor\
    d,web,sniff,sensitive,api,romon,tikapp,!ftp,!policy,!dude"
/ip firewall connection tracking
set enabled=no loose-tcp-tracking=no
/ip neighbor discovery-settings
set discover-interface-list=all
/interface l2tp-server server
set allow-fast-path=yes ipsec-secret=7895123ok max-mru=1500 max-mtu=1500 \
    mrru=1600 use-ipsec=yes
/interface sstp-server server
set keepalive-timeout=300 mrru=1600
/ip address
add address=103.30.172.55/23 comment=CDCIX interface=1100-BITS-CDIX network=\
    103.30.172.0
add address=119.11.184.34/23 comment=JKT-IX interface=1601-BITS-JKT-IX \
    network=119.11.184.0
add address=103.28.74.154/23 comment=IIX-APJII interface=2100-BITS-IIX \
    network=103.28.74.0
add address=103.19.56.214 comment="TO DST-2 JUNOS" interface=1115-DST-2-JUNOS \
    network=103.19.56.215
add address=103.19.56.212 comment="TO DST-1 JUNOS" interface=1116-DST-1-JUNOS \
    network=103.19.56.213
add address=218.100.27.229/24 comment=OIXP-10G interface=59-NEW-BITS-OIXP \
    network=218.100.27.0
add address=10.100.126.2/30 comment="ABHINAWA EXCHANGE" interface=\
    551-BITS-ABHINAWA network=10.100.126.0
add address=10.10.10.1/29 comment=DUMMY disabled=yes interface=\
    1601-BITS-JKT-IX network=10.10.10.0
/ip dhcp-server network
add address=192.168.1.0/24 gateway=192.168.1.1
/ip dns
set servers=103.19.56.10,103.19.56.11
/ip route
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=1.0.0.0/24 \
    gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=1.1.1.0/24 \
    gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.6.112.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.6.144.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.6.145.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.6.146.0/24 gateway=119.11.184.14
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=8.8.4.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=8.8.8.0/24 gateway=\
    119.11.184.21
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.9.230.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.9.231.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.10.148.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.14.199.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.14.201.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.14.202.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.14.203.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.14.204.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.17.205.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.17.206.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.18.50.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.18.113.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.18.194.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.18.195.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.18.196.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.20.100.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.20.101.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.20.103.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.20.123.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.20.124.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.20.125.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.20.126.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.20.127.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.20.253.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=8.21.8.0/24 \
    gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=8.21.9.0/24 \
    gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.21.10.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.21.11.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.21.13.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.21.110.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.21.111.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.21.238.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.21.239.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.23.240.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.24.87.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.24.242.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.24.243.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.24.244.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.25.96.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.25.97.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.25.249.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.26.176.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.26.180.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.26.182.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.27.64.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.27.66.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.27.67.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.27.68.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.27.69.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.27.70.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.27.79.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.28.20.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.28.82.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.28.126.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.28.127.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.28.213.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.29.105.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.29.109.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.29.228.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.29.230.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.29.231.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.30.234.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=8.31.2.0/24 \
    gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.31.160.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.31.161.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.31.163.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.34.69.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.34.70.0/24 gateway=119.11.184.14
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=8.34.208.0/21 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=8.34.216.0/21 gateway=\
    119.11.184.21
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.35.57.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.35.58.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.35.59.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.35.149.0/24 gateway=119.11.184.14
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=8.35.192.0/21 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=8.35.200.0/21 gateway=\
    119.11.184.21
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.35.211.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.36.216.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.36.217.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.36.218.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.36.220.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.37.41.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.37.43.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.38.147.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.38.148.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.38.149.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.38.172.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=8.39.6.0/24 \
    gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.39.18.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.39.125.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.39.126.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.39.127.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.39.201.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.39.202.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.39.203.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.39.204.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.39.205.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.39.206.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.39.207.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.39.212.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.39.213.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.39.214.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.39.215.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.40.26.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.40.27.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.40.28.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.40.29.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.40.30.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.40.31.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.40.107.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.40.111.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.40.140.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=8.41.5.0/24 \
    gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=8.41.6.0/24 \
    gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=8.41.7.0/24 \
    gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.41.36.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.41.37.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.41.39.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.42.51.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.42.52.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.42.54.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.42.55.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.42.161.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.42.164.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.42.172.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.42.245.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.43.121.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.43.122.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.43.123.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.43.224.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.43.225.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.43.226.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=8.44.0.0/24 \
    gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=8.44.1.0/24 \
    gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=8.44.2.0/24 \
    gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=8.44.3.0/24 \
    gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=8.44.6.0/24 \
    gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.44.58.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.44.59.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.44.60.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.44.61.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.44.62.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.44.63.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.45.41.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.45.42.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.45.43.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.45.44.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.45.45.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.45.46.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.45.47.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.45.97.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.45.100.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.45.101.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.45.102.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.45.108.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.45.111.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.45.144.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.45.145.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.45.146.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.45.147.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.45.151.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.46.113.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.46.114.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.46.115.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.46.116.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.46.117.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.46.118.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.46.119.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=8.47.9.0/24 \
    gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.47.12.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.47.13.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.47.14.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.47.71.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.48.130.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.48.132.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.48.133.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    8.48.134.0/24 gateway=119.11.184.14
add comment="TEST AKAMAI" distance=1 dst-address=23.48.107.34/32 gateway=\
    119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    23.227.37.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    23.227.38.0/23 gateway=119.11.184.14
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=23.236.48.0/20 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=23.251.128.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.64.0.0/11 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.64.0.0/14 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.68.0.0/14 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.72.0.0/14 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.76.0.0/14 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.80.0.0/14 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.84.0.0/14 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.88.0.0/14 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.92.0.0/14 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.96.0.0/12 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.96.0.0/14 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.96.0.0/17 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.96.0.0/20 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.96.128.0/17 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.97.0.0/17 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.97.128.0/17 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.100.0.0/14 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.104.0.0/14 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.108.0.0/14 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.116.0.0/14 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.120.0.0/13 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.120.0.0/14 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.124.0.0/14 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.127.192.0/18 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.128.0.0/13 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.128.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.129.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.130.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.131.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.132.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.133.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.134.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.135.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.136.0.0/13 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.136.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.137.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.138.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.139.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.140.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.141.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.142.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.143.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.144.0.0/13 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.144.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.145.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.146.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.147.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.148.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.149.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.150.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.151.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.152.0.0/13 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.152.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.153.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.154.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.155.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.156.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.157.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.158.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.159.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.160.0.0/13 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.160.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.161.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.162.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.163.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.164.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.165.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.166.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.167.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.168.0.0/13 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.168.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.169.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.170.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.171.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.172.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.173.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.174.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.175.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.176.0.0/13 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.176.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.177.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.178.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.179.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.180.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.181.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.182.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.183.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.184.0.0/14 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.184.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.185.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.186.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=34.187.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.184.0.0/13 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.184.0.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.184.32.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.184.64.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.184.96.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.184.128.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.184.160.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.184.192.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.184.224.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.185.0.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.185.32.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.185.64.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.185.96.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.185.128.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.185.160.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.185.192.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.185.224.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.186.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.186.0.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.186.32.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.186.64.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.186.96.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.186.128.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.186.160.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.187.0.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.187.32.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.187.64.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.187.96.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.187.128.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.187.160.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.187.192.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.187.224.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.188.0.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.188.32.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.188.64.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.188.96.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.188.128.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.188.160.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.188.192.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.188.224.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.189.0.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.189.32.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.189.64.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.189.96.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.189.128.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.189.160.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.189.192.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.189.224.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.190.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.190.128.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.190.160.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.190.192.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.190.224.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.192.0.0/14 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.196.0.0/15 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.198.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.199.0.0/17 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.199.128.0/18 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.200.0.0/14 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.203.224.0/23 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.204.0.0/15 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.206.0.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.206.1.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.206.2.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.206.3.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.206.4.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.206.5.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.206.6.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.206.9.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.206.12.0/22 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.206.32.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.206.64.0/18 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.206.128.0/18 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.206.192.0/18 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.207.0.0/18 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.207.64.0/18 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.207.128.0/18 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.207.192.0/18 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.208.0.0/15 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.210.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.211.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.212.0.0/17 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.212.128.0/17 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.213.0.0/17 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.213.128.0/18 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.213.192.0/18 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.214.0.0/17 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.214.128.0/17 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.215.0.0/18 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.215.64.0/18 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.215.128.0/18 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.215.192.0/18 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.216.0.0/17 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.216.128.0/17 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.217.0.0/18 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.217.64.0/18 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.217.128.0/17 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.219.0.0/17 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.219.128.0/18 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.220.0.0/14 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.224.0.0/14 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.228.0.0/14 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.232.0.0/14 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.236.0.0/14 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.240.0.0/14 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=35.244.0.0/14 gateway=\
    119.11.184.21
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    64.68.192.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    64.179.227.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    64.179.228.0/24 gateway=119.11.184.14
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=64.233.160.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=64.233.160.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=64.233.161.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=64.233.162.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=64.233.163.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=64.233.164.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=64.233.165.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=64.233.166.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=64.233.167.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=64.233.168.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=64.233.169.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=64.233.171.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=64.233.172.0/23 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=64.233.176.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=64.233.177.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=64.233.178.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=64.233.179.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=64.233.180.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=64.233.181.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=64.233.182.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=64.233.183.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=64.233.184.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=64.233.185.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=64.233.186.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=64.233.187.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=64.233.188.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=64.233.189.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=64.233.190.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=64.233.191.0/24 gateway=\
    119.11.184.21
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    65.110.63.0/24 gateway=119.11.184.14
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=66.102.0.0/20 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=66.102.0.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=66.102.1.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=66.102.2.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=66.102.3.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=66.102.4.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=66.102.8.0/23 gateway=\
    119.11.184.21
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    66.235.200.0/24 gateway=119.11.184.14
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=66.249.64.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=66.249.64.0/20 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=66.249.80.0/22 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=66.249.84.0/23 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=66.249.88.0/24 gateway=\
    119.11.184.21
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    68.67.65.0/24 gateway=119.11.184.14
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=70.32.128.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=70.32.128.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=70.32.131.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=70.32.145.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=70.32.146.0/23 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=70.32.148.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=70.32.149.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=70.32.151.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=70.32.158.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=72.14.192.0/18 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.114.24.0/21 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.0.0/20 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.6.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.20.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.21.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.22.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.23.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.24.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.25.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.26.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.28.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.29.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.31.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.38.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.39.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.44.0/22 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.68.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.69.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.70.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.71.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.72.0/22 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.124.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.125.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.126.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.127.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.128.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.129.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.130.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.131.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.132.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.133.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.134.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.135.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.136.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.137.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.138.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.139.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.140.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.141.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.142.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.143.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.152.0/21 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.176.0/20 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.192.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.193.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.194.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.195.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.197.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.198.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.199.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.200.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.201.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.202.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.203.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.204.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.205.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.206.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.207.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.225.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.226.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.227.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.228.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.230.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.232.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.234.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.235.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.236.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.238.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=74.125.250.0/24 gateway=\
    119.11.184.21
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    91.234.214.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    103.21.244.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    103.22.200.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    103.22.203.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    103.81.228.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.16.0.0/12 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.16.0.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.16.16.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.16.32.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.16.48.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.16.64.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.16.80.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.16.96.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.16.112.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.16.128.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.16.144.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.16.160.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.16.176.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.16.192.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.16.208.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.16.224.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.16.240.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.17.0.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.17.16.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.17.32.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.17.48.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.17.64.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.17.80.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.17.96.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.17.112.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.17.128.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.17.144.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.17.160.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.17.176.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.17.192.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.17.208.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.17.224.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.17.240.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.18.0.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.18.16.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.18.32.0/19 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.18.32.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.18.32.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.18.33.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.18.34.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.18.35.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.18.36.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.18.37.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.18.38.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.18.39.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.18.40.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.18.41.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.18.42.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.18.43.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.18.44.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.18.45.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.18.46.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.18.47.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.18.64.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.18.80.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.18.96.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.18.112.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.18.128.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.18.144.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.18.160.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.18.176.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.18.192.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.18.208.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.18.224.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.18.240.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.19.0.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.19.16.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.19.32.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.19.48.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.19.64.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.19.80.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.19.96.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.19.112.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.19.128.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.19.144.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.19.160.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.19.176.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.19.192.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.19.208.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.19.224.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.19.240.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.20.0.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.20.16.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.20.32.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.20.48.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.20.64.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.20.80.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.20.96.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.20.112.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.20.128.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.20.144.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.20.160.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.20.176.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.20.192.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.20.208.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.20.224.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.20.240.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.21.0.0/19 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.21.0.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.21.16.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.21.32.0/19 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.21.32.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.21.48.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.21.64.0/19 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.21.64.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.21.80.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.21.96.0/19 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.21.96.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.21.112.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.21.192.0/19 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.21.192.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.21.208.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.21.224.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.22.0.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.22.16.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.22.32.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.22.48.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.22.64.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.23.96.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.23.112.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.23.128.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.24.0.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.24.16.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.24.32.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.24.48.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.24.64.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.24.80.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.24.128.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.24.144.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.24.160.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.24.176.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.24.192.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.24.208.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.24.224.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.24.240.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.25.0.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.25.16.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.25.32.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.25.48.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.25.64.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.25.80.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.25.96.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.25.112.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.25.128.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.25.144.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.25.160.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.25.176.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.25.192.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.25.208.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.25.224.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.25.240.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.26.0.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.27.0.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.27.16.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.27.32.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.27.48.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.27.64.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.27.80.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.27.96.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.27.112.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.27.192.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.0.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.4.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.10.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.11.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.12.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.13.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.14.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.15.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.16.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.17.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.18.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.19.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.21.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.22.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.23.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.24.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.26.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.27.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.28.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.29.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.30.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.31.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.32.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.33.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.34.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.35.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.36.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.37.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.38.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.39.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.40.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.41.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.42.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.43.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.44.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.45.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.46.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.47.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.48.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.49.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.50.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.51.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.52.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.53.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.54.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.55.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.56.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.57.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.58.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.59.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.60.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.61.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.62.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.63.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.64.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.65.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.66.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.67.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.68.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.69.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.70.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.71.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.72.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.73.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.74.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.75.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.76.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.77.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.78.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.79.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.80.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.81.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.82.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.83.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.84.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.85.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.86.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.87.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.88.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.89.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.90.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.91.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.92.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.93.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.94.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.95.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.96.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.97.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.98.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.99.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.100.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.101.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.102.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.103.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.104.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.105.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.106.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.107.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.108.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.109.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.110.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.111.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.112.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.113.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.114.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.115.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.116.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.117.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.118.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.119.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.120.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.121.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.122.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.123.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.124.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.125.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.126.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.127.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.128.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.129.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.130.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.131.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.132.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.133.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.134.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.28.135.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.30.1.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.30.2.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.30.3.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.30.4.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.30.5.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    104.31.16.0/23 gateway=119.11.184.14
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.154.0.0/15 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.154.0.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.154.32.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.154.64.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.154.96.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.154.128.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.154.160.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.154.192.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.154.224.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.155.0.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.155.32.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.155.64.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.155.96.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.155.128.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.155.160.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.155.192.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.155.224.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.196.0.0/14 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.196.0.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.196.32.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.196.64.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.196.96.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.196.128.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.196.160.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.196.192.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.196.224.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.197.0.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.197.32.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.197.64.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.197.96.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.197.128.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.197.160.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.197.192.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.197.224.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.198.0.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.198.32.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.198.64.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.198.96.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.198.128.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.198.160.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.198.192.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.198.224.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.199.0.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.199.32.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.199.64.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.199.96.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.199.128.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.199.160.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.199.192.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=104.199.224.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=107.167.160.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=107.178.192.0/18 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=108.59.80.0/20 gateway=\
    119.11.184.21
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    108.162.192.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    108.162.192.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    108.162.193.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    108.162.194.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    108.162.195.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    108.162.196.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    108.162.208.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    108.162.210.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    108.162.211.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    108.162.212.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    108.162.213.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    108.162.216.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    108.162.217.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    108.162.218.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    108.162.219.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    108.162.220.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    108.162.221.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    108.162.223.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    108.162.228.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    108.162.229.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    108.162.235.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    108.162.236.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    108.162.237.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    108.162.238.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    108.162.239.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    108.162.240.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    108.162.241.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    108.162.242.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    108.162.243.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    108.162.244.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    108.162.245.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    108.162.246.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    108.162.247.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    108.162.248.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    108.162.249.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    108.162.250.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    108.162.252.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    108.162.253.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    108.162.254.0/24 gateway=119.11.184.14
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=108.170.192.0/18 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=108.177.0.0/17 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=108.177.8.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=108.177.9.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=108.177.10.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=108.177.11.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=108.177.12.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=108.177.13.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=108.177.14.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=108.177.15.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=108.177.96.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=108.177.97.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=108.177.98.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=108.177.99.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=108.177.100.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=108.177.101.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=108.177.102.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=108.177.103.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=108.177.104.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=108.177.108.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=108.177.109.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=108.177.110.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=108.177.111.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=108.177.112.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=108.177.113.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=108.177.114.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=108.177.115.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=108.177.116.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=108.177.117.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=108.177.118.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=108.177.119.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=108.177.120.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=108.177.121.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=108.177.122.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=108.177.125.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=108.177.126.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=108.177.127.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=130.211.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=136.112.0.0/12 gateway=\
    119.11.184.21
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    141.101.64.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    141.101.65.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    141.101.66.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    141.101.67.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    141.101.68.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    141.101.69.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    141.101.70.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    141.101.71.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    141.101.72.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    141.101.73.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    141.101.74.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    141.101.75.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    141.101.76.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    141.101.82.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    141.101.83.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    141.101.84.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    141.101.85.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    141.101.94.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    141.101.95.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    141.101.96.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    141.101.97.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    141.101.98.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    141.101.99.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    141.101.100.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    141.101.104.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    141.101.105.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    141.101.106.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    141.101.107.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    141.101.108.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    141.101.109.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    141.101.110.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    141.101.112.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    141.101.112.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    141.101.114.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    141.101.120.0/22 gateway=119.11.184.14
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.0.0/15 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.0.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.1.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.2.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.3.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.4.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.5.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.6.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.8.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.9.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.10.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.11.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.12.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.13.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.14.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.15.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.16.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.17.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.18.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.19.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.20.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.21.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.22.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.23.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.24.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.25.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.26.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.27.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.28.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.29.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.30.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.31.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.82.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.92.0/23 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.96.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.97.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.98.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.99.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.100.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.101.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.102.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.103.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.105.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.106.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.107.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.109.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.110.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.111.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.112.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.113.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.114.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.115.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.116.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.118.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.119.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.120.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.122.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.123.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.124.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.125.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.126.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.128.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.130.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.131.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.132.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.133.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.134.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.135.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.136.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.137.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.138.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.139.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.141.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.142.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.145.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.147.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.148.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.149.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.150.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.151.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.152.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.153.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.154.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.157.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.158.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.159.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.250.216.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.251.0.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.251.1.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.251.2.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.251.4.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.251.5.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.251.6.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.251.8.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.251.9.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.251.10.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.251.12.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.251.15.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.251.16.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.251.18.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.251.20.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.251.31.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.251.107.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.251.109.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.251.111.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.251.112.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.251.116.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.251.117.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=142.251.120.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=146.148.0.0/17 gateway=\
    119.11.184.21
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.0.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.4.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.5.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.8.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.9.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.10.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.11.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.12.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.16.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.20.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.24.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.25.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.26.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.27.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.28.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.29.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.30.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.31.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.32.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.36.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.37.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.38.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.40.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.41.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.42.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.43.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.44.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.48.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.50.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.51.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.52.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.56.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.57.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.58.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.59.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.60.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.72.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.76.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.80.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.81.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.82.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.84.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.88.0/21 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.96.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.97.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.98.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.99.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.100.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.101.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.102.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.103.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.104.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.105.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.106.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.107.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.108.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.112.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.113.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.114.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.116.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.120.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.121.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.122.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.123.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.124.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.128.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.132.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.133.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.134.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.135.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.136.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.140.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.141.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.142.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.143.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.144.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.145.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.146.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.147.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.148.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.149.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.150.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.151.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.152.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.156.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.160.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.161.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.162.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.163.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.165.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.166.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.167.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.176.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.177.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.178.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.179.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.180.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.184.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.185.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.186.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.187.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.188.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.189.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.190.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.191.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.192.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.193.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.194.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.195.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.196.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.197.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.198.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.199.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.200.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.204.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.206.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.207.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.208.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.212.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.214.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.215.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.216.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.218.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.220.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.224.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.225.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.226.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.228.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.232.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.234.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.236.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.240.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.244.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.248.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.250.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.158.252.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.0.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.0.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.1.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.2.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.3.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.4.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.5.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.6.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.7.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.8.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.9.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.10.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.11.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.12.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.13.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.14.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.15.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.16.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.16.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.17.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.18.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.19.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.20.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.21.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.22.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.23.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.24.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.25.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.26.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.27.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.28.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.29.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.30.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.31.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.32.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.32.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.34.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.36.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.40.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.42.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.46.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.48.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.58.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.64.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.128.0/17 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.128.0/19 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.132.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.160.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.192.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.192.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.193.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.194.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.195.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.196.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.200.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.201.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.204.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.208.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.212.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.216.0/21 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.224.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.159.240.0/20 gateway=119.11.184.14
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=162.216.148.0/22 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=162.222.176.0/21 gateway=\
    119.11.184.21
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.247.243.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    162.251.82.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.64.0.0/16 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.64.32.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.64.32.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.64.33.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.64.34.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.64.35.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.64.36.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.64.38.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.64.48.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.64.64.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.64.68.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.64.69.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.64.80.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.64.96.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.64.128.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.64.144.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.64.145.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.64.146.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.64.147.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.64.148.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.64.149.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.64.150.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.64.151.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.64.152.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.64.153.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.64.154.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.64.155.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.64.156.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.64.157.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.64.158.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.64.159.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.64.160.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.64.192.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.64.228.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.64.240.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.65.0.0/19 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.65.0.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.65.16.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.65.32.0/19 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.65.32.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.65.48.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.65.64.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.65.80.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.65.96.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.65.112.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.65.128.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.65.144.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.65.160.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.65.176.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.65.192.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.65.208.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.65.224.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.65.240.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.66.40.0/21 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.67.0.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.67.16.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.67.32.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.67.48.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.67.64.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.67.80.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.67.96.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.67.112.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.67.128.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.67.144.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.67.160.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.67.176.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.67.192.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.67.208.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.67.224.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.67.240.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.0.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.4.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.8.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.12.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.16.0/21 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.24.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.28.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.29.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.30.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.31.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.32.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.36.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.38.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.39.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.40.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.48.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.52.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.56.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.57.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.58.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.59.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.60.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.68.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.72.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.74.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.75.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.76.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.78.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.79.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.80.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.84.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.88.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.89.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.90.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.91.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.92.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.96.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.97.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.98.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.99.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.100.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.104.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.104.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.108.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.112.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.113.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.114.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.116.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.117.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.118.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.119.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.120.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.124.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.126.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.127.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.128.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.129.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.130.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.131.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.132.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.136.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.140.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.148.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.152.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.153.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.154.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.155.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.164.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.166.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.168.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.169.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.170.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.171.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.172.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.176.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.177.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.179.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.180.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.184.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.188.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.196.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.200.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.201.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.202.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.203.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.204.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.206.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.207.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.212.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.220.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.222.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.223.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.224.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.228.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.230.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.231.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.232.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.236.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.240.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.244.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.68.248.0/21 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.0.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.2.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.3.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.4.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.8.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.12.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.13.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.14.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.15.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.16.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.18.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.19.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.20.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.32.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.32.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.33.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.34.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.36.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.38.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.40.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.44.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.45.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.46.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.47.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.48.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.52.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.56.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.64.0/21 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.72.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.76.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.78.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.79.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.80.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.84.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.88.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.92.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.96.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.100.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.101.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.102.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.103.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.108.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.110.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.111.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.112.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.116.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.124.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.128.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.133.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.134.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.135.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.136.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.140.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.144.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.148.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.156.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.157.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.158.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.159.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.160.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.161.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.162.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.163.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.164.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.168.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.172.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.176.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.180.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.181.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.182.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.183.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.184.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.188.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.192.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.196.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.197.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.198.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.199.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.200.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.204.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.208.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.210.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.211.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.212.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.216.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.217.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.218.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.219.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.220.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.224.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.226.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.227.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.228.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.232.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.234.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.235.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.236.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.237.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.238.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.239.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.240.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.244.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.246.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.248.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.252.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.253.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.254.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.69.255.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.32.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.33.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.34.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.35.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.36.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.37.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.38.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.39.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.40.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.41.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.42.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.43.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.44.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.45.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.48.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.49.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.50.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.51.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.52.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.53.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.54.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.55.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.56.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.57.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.58.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.59.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.60.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.61.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.80.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.81.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.82.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.83.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.84.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.85.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.86.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.87.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.88.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.89.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.90.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.91.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.92.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.93.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.94.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.95.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.96.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.97.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.98.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.99.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.100.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.101.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.102.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.103.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.104.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.105.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.106.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.107.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.108.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.109.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.110.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.111.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.112.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.113.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.114.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.115.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.120.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.121.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.122.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.123.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.124.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.125.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.126.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.127.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.128.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.129.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.130.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.131.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.132.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.133.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.134.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.135.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.136.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.138.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.139.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.140.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.141.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.142.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.143.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.144.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.145.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.146.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.147.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.148.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.149.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.150.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.151.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.152.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.153.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.154.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.155.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.156.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.157.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.158.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.159.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.160.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.161.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.162.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.163.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.172.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.173.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.174.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.175.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.176.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.177.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.178.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.179.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.180.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.181.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.182.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.183.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.184.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.186.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.187.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.188.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.189.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.190.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.191.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.192.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.193.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.194.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.195.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.196.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.197.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.198.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.200.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.201.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.202.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.203.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.204.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.205.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.206.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.207.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.208.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.209.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.210.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.211.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.212.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.213.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.214.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.215.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.216.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.217.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.218.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.219.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.220.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.221.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.222.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.223.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.224.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.227.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.228.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.229.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.230.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.231.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.232.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.233.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.234.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.235.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.236.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.237.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.238.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.239.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.240.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.241.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.242.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.243.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.244.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.245.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.246.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.247.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.248.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.249.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.250.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.251.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.252.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.253.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.254.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.70.255.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.71.1.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    172.71.2.0/24 gateway=119.11.184.14
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.110.32.0/21 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.0.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.1.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.2.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.3.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.4.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.5.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.6.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.7.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.8.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.9.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.10.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.11.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.12.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.13.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.14.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.15.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.16.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.17.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.18.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.19.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.20.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.21.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.22.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.23.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.24.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.25.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.26.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.27.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.28.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.29.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.30.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.31.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.56.0/21 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.128.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.176.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.177.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.178.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.179.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.192.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.193.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.194.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.195.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.196.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.197.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.198.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.199.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.200.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.201.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.202.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.203.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.204.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.205.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.206.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.207.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.208.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.209.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.210.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.211.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.212.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.213.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.214.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.215.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.216.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.217.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.218.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.219.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.220.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.221.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.222.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.223.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.217.224.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.253.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.253.56.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.253.57.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.253.58.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.253.59.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.253.60.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.253.62.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.253.63.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.253.112.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.253.113.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.253.114.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.253.115.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.253.116.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.253.117.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.253.118.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.253.119.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.253.120.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.253.121.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.253.122.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.253.123.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.253.124.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.253.125.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.253.126.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=172.253.127.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.0.0/16 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.0.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.7.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.32.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.34.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.35.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.36.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.37.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.38.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.39.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.40.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.41.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.42.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.44.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.46.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.48.0/20 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.53.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.63.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.64.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.66.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.67.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.68.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.69.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.70.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.71.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.72.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.73.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.74.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.75.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.76.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.77.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.78.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.79.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.96.0/21 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.112.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.113.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.117.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.118.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.119.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.120.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.121.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.124.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.128.0/20 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.132.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.136.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.140.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.141.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.142.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.144.0/20 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.160.0/21 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.172.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.173.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.174.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.175.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.176.0/20 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.192.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.193.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.194.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.195.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.196.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.197.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.198.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.199.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.200.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.201.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.202.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.203.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.204.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.205.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.206.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.207.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.208.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.209.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.210.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.211.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.212.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.213.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.214.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.215.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.216.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.217.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.218.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.219.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.220.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.221.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.222.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.194.223.0/24 gateway=\
    119.11.184.21
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    173.245.49.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    173.245.52.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    173.245.58.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    173.245.59.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    173.245.63.0/24 gateway=119.11.184.14
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=173.255.112.0/20 gateway=\
    119.11.184.21
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    185.146.172.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    188.114.96.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    188.114.97.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    188.114.100.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    188.114.101.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    188.114.102.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    188.114.103.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    188.114.106.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    188.114.108.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    188.114.109.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    188.114.110.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    188.114.111.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    190.93.240.0/20 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    190.93.244.0/22 gateway=119.11.184.14
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=192.158.28.0/22 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=192.178.0.0/15 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=193.186.4.0/24 gateway=\
    119.11.184.21
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    195.242.122.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    197.234.240.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    197.234.240.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    197.234.241.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    197.234.242.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    198.41.128.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    198.41.129.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    198.41.192.0/21 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    198.41.200.0/21 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    198.41.208.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    198.41.211.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    198.41.212.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    198.41.214.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    198.41.216.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    198.41.217.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    198.41.218.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    198.41.219.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    198.41.220.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    198.41.222.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    198.41.223.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    198.41.224.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    198.41.228.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    198.41.232.0/23 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    198.41.235.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    198.41.236.0/22 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    198.41.240.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    198.41.241.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    198.41.242.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    198.217.251.0/24 gateway=119.11.184.14
add bgp-as-path=13335 bgp-communities=65534:13335 bgp-origin=igp comment=\
    "AS 13335 CLOUDFLARE INC" disabled=yes distance=1 dst-address=\
    199.27.132.0/24 gateway=119.11.184.14
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=199.36.154.0/23 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=199.36.156.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=199.36.157.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=199.192.112.0/22 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=199.223.232.0/21 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=207.223.160.0/20 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=208.68.108.0/22 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=208.81.188.0/22 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=209.85.128.0/17 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=209.85.144.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=209.85.145.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=209.85.146.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=209.85.147.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=209.85.164.0/23 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=209.85.200.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=209.85.201.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=209.85.202.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=209.85.203.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=209.85.232.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=209.85.233.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=209.85.234.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=209.85.235.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=216.58.192.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=216.58.192.0/22 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=216.58.196.0/23 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=216.58.198.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=216.58.199.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=216.58.200.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=216.58.201.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=216.58.202.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=216.58.203.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=216.58.204.0/23 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=216.58.206.0/23 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=216.58.208.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=216.58.209.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=216.58.210.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=216.58.211.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=216.58.212.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=216.58.213.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=216.58.214.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=216.58.215.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=216.58.216.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=216.58.217.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=216.58.218.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=216.58.219.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=216.58.220.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=216.58.221.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=216.58.222.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=216.58.223.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=216.73.80.0/20 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=216.239.32.0/19 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=216.239.32.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=216.239.33.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=216.239.34.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=216.239.35.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=216.239.36.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=216.239.38.0/24 gateway=\
    119.11.184.21
add bgp-as-path=15169 bgp-communities=65534:15169 bgp-origin=igp comment=\
    "AS 15169 GOOGLE LLC" distance=1 dst-address=216.239.39.0/24 gateway=\
    119.11.184.21
/ip service
set telnet address=103.19.56.0/22,103.143.244.0/23 port=9989
set ftp address=103.19.56.0/22,103.143.244.0/23 disabled=yes port=9987
set www address=103.19.56.0/22,103.143.244.0/23 disabled=yes port=60080
set ssh address=103.19.56.0/22,103.143.244.0/23 disabled=yes port=9988
set api disabled=yes
set winbox port=9990
set api-ssl disabled=yes
/ip ssh
set allow-none-crypto=yes forwarding-enabled=remote
/lcd
set enabled=no
/routing bgp network
add disabled=yes network=103.19.56.0/24 synchronize=no
add disabled=yes network=103.19.57.0/24 synchronize=no
add disabled=yes network=103.19.58.0/24 synchronize=no
add disabled=yes network=103.19.59.0/24 synchronize=no
add disabled=yes network=103.143.244.0/24 synchronize=no
add disabled=yes network=103.143.245.0/24 synchronize=no
/routing bgp peer
add in-filter=eBGP-CD-IX-IN instance=BITSNET name=CD-IX out-filter=\
    eBGP-CD-IX-OUT remote-address=103.30.172.128 remote-as=9448 \
    remove-private-as=yes ttl=default
add in-filter=eBGP-CD-IX-IN instance=BITSNET name=CD-IX-2 out-filter=\
    eBGP-CD-IX-OUT remote-address=103.30.172.129 remote-as=9448 \
    remove-private-as=yes ttl=default
add in-filter=eBGP-APJI-IIX-in instance=BITSNET max-prefix-limit=20000 \
    max-prefix-restart-time=1h name=IIX-APJII-BrocadeMLXe-16CSF out-filter=\
    eBGP-APJI-IIX-out remote-address=103.28.74.255 remote-as=7597 \
    remove-private-as=yes ttl=default
add in-filter=eBGP-APJI-IIX-in instance=BITSNET max-prefix-limit=20000 \
    max-prefix-restart-time=1h name=IIX-APJII-RouterJuniper out-filter=\
    eBGP-APJI-IIX-out remote-address=103.28.74.129 remote-as=7597 \
    remove-private-as=yes ttl=default
add in-filter=eBGP-JKT-IIX-in instance=BITSNET name=JKT-IX out-filter=\
    eBGP-JKT-IIX-out remote-address=119.11.184.101 remote-as=137295 \
    remove-private-as=yes ttl=default
add in-filter=eBGP-JKT-IIX-in instance=BITSNET name=JKT-IX2 out-filter=\
    eBGP-JKT-IIX-out remote-address=119.11.184.102 remote-as=137295 \
    remove-private-as=yes ttl=default
add in-filter=eBGP-CONTENT-in instance=BITSNET name=AS42-PCH out-filter=\
    eBGP-CONTENT-out remote-address=103.28.74.235 remote-as=42 \
    remove-private-as=yes ttl=default
add in-filter=eBGP-CONTENT-in instance=BITSNET name=AS3856-PCH out-filter=\
    eBGP-CONTENT-out remote-address=103.28.74.236 remote-as=3856 \
    remove-private-as=yes ttl=default
add in-filter=eBGP-CONTENT-in instance=BITSNET name=EBGP-Akamai-IIX-APJII \
    out-filter=eBGP-CONTENT-out remote-address=103.28.74.121 remote-as=20940 \
    remove-private-as=yes ttl=default
add in-filter=eBGP-CONTENT-in instance=BITSNET name=EBGP-FB-APJII1 \
    out-filter=eBGP-CONTENT-out remote-address=103.28.75.88 remote-as=32934 \
    remove-private-as=yes ttl=default
add in-filter=eBGP-CONTENT-in instance=BITSNET name=EBGP-FB-APJII2 \
    out-filter=eBGP-CONTENT-out remote-address=103.28.75.89 remote-as=32934 \
    remove-private-as=yes ttl=default
add in-filter=iBGP-BITS-in-2 instance=BITSNET name=IBGP-Bitsnet-2-JUNOS \
    nexthop-choice=force-self out-filter=iBGP-BITS-out-2 remote-address=\
    103.19.56.215 remote-as=132637 remove-private-as=yes ttl=default
add disabled=yes in-filter=eBGP-CONTENT-in instance=BITSNET name=\
    EBGP-Cloudflare out-filter=eBGP-CONTENT-out remote-address=103.28.75.135 \
    remote-as=13335 remove-private-as=yes ttl=default
add disabled=yes in-filter=eBGP-CONTENT-in instance=BITSNET name=\
    EBGP-Cloudflare-2 out-filter=eBGP-CONTENT-out remote-address=\
    119.11.184.14 remote-as=13335 remove-private-as=yes ttl=default
add in-filter=eBGP-CONTENT-in instance=BITSNET name=EBGP-Zenlayer out-filter=\
    eBGP-CONTENT-out remote-address=103.28.75.126 remote-as=21859 \
    remove-private-as=yes ttl=default
add in-filter=eBGP-CONTENT-in instance=BITSNET name=EBGP-Alibaba-Cloud \
    out-filter=eBGP-CONTENT-out remote-address=103.28.75.18 remote-as=45102 \
    remove-private-as=yes ttl=default
add in-filter=eBGP-CONTENT-in instance=BITSNET name=EBGP-Alibaba-CDN \
    out-filter=eBGP-CONTENT-out remote-address=103.28.74.39 remote-as=24429 \
    remove-private-as=yes ttl=default
add in-filter=iBGP-BITS-in instance=BITSNET name=IBGP-Bitsnet-1-JUNOS \
    nexthop-choice=force-self out-filter=iBGP-BITS-out remote-address=\
    103.19.56.213 remote-as=132637 remove-private-as=yes ttl=default
add in-filter=eBGP-CONTENT-in instance=BITSNET name=EBGP-Alibaba-Cloud2-JKTIX \
    out-filter=eBGP-CONTENT-out remote-address=119.11.184.41 remote-as=45102 \
    remove-private-as=yes ttl=default
add in-filter=eBGP-CONTENT-in instance=BITSNET name=EBGP-Amazon-JKTIX \
    out-filter=eBGP-CONTENT-out remote-address=119.11.184.88 remote-as=16509 \
    remove-private-as=yes ttl=default
add in-filter=eBGP-NICE-IN instance=BITSNET max-prefix-limit=20000 \
    max-prefix-restart-time=1h name=OPENIXP out-filter=eBGP-NICE-OUT \
    remote-address=218.100.27.128 remote-as=7717 remove-private-as=yes ttl=\
    default
add disabled=yes in-filter=eBGP-CONTENT-in instance=BITSNET name=\
    EBGP-Tencent-OIXP out-filter=eBGP-CONTENT-out remote-address=\
    218.100.36.246 remote-as=132203 remove-private-as=yes ttl=default
add in-filter=eBGP-CONTENT-in instance=BITSNET name=EBGP-Akamai-JKTIX \
    out-filter=eBGP-CONTENT-out remote-address=119.11.184.37 remote-as=20940 \
    remove-private-as=yes ttl=default
add in-filter=eBGP-APJI-IIX-in instance=BITSNET max-prefix-limit=20000 \
    max-prefix-restart-time=1h name=IIX-APJII-Server-1 out-filter=\
    eBGP-APJI-IIX-out remote-address=103.28.74.222 remote-as=7597 \
    remove-private-as=yes ttl=default
add in-filter=eBGP-APJI-IIX-in instance=BITSNET max-prefix-limit=20000 \
    max-prefix-restart-time=1h name=IIX-APJII-Server-2 out-filter=\
    eBGP-APJI-IIX-out remote-address=103.28.75.222 remote-as=7597 \
    remove-private-as=yes ttl=default
add in-filter=eBGP-CONTENT-in instance=BITSNET name=EBGP-ABHINAWA out-filter=\
    eBGP-CONTENT-out remote-address=10.100.126.1 remote-as=138077 \
    remove-private-as=yes ttl=default
add in-filter=eBGP-CONTENT-in instance=BITSNET name=EBGP-Microsoft-JKT-IX \
    out-filter=eBGP-CONTENT-out remote-address=119.11.184.84 remote-as=8075 \
    remove-private-as=yes ttl=default
add in-filter=eBGP-CONTENT-in instance=BITSNET name=EBGP-Microsoft-JKT-IX-2 \
    out-filter=eBGP-CONTENT-out remote-address=119.11.184.85 remote-as=8075 \
    remove-private-as=yes ttl=default
add in-filter=eBGP-CONTENT-in instance=BITSNET name=EBGP-Solnet-IIX \
    out-filter=eBGP-CONTENT-out remote-address=103.28.74.150 remote-as=138128 \
    remove-private-as=yes tcp-md5-key=138128 ttl=default
add in-filter=eBGP-CONTENT-in instance=BITSNET name=EBGP-Solnet-JKTIX \
    out-filter=eBGP-CONTENT-out remote-address=119.11.184.71 remote-as=138128 \
    remove-private-as=yes tcp-md5-key=138128 ttl=default
add disabled=yes in-filter=eBGP-CONTENT-in instance=BITSNET name=\
    EBGP-Solnet-OIXP out-filter=eBGP-CONTENT-out remote-address=\
    218.100.36.224 remote-as=138128 remove-private-as=yes tcp-md5-key=138128 \
    ttl=default
add in-filter=eBGP-CONTENT-in instance=BITSNET max-prefix-limit=15 name=\
    EBGP-Netflix-JKT-IX out-filter=eBGP-CONTENT-out remote-address=\
    119.11.185.9 remote-as=147168 remove-private-as=yes ttl=default
add in-filter=eBGP-CONTENT-in instance=BITSNET max-prefix-limit=15 name=\
    EBGP-Netflix-JKT-IX-2 out-filter=eBGP-CONTENT-out remote-address=\
    119.11.185.10 remote-as=147168 remove-private-as=yes ttl=default
add disabled=yes in-filter=eBGP-CONTENT-in instance=BITSNET name=\
    EBGP-Tencent-IIX-APJII out-filter=eBGP-CONTENT-out remote-address=\
    103.28.74.204 remote-as=132203 remove-private-as=yes ttl=default
/routing filter
add action=accept chain=iBGP-BITS-in comment=iBGP-Distribusi-1-JunOS prefix=\
    103.19.56.0/22 prefix-length=22-32
add action=accept chain=iBGP-BITS-in prefix=103.143.244.0/23 prefix-length=\
    23-32
add action=accept chain=iBGP-BITS-in prefix=103.168.46.0/23 prefix-length=\
    23-24
add action=discard chain=iBGP-BITS-in
add action=accept bgp-as-path=_38165_ chain=iBGP-BITS-out comment=PT-ADS \
    set-bgp-local-pref=10
add action=accept bgp-as-path=_138847_ chain=iBGP-BITS-out comment=PT-ADS \
    set-bgp-local-pref=10
add action=accept bgp-as-path=_38142_ chain=iBGP-BITS-out comment=\
    "UNIV ERLANGGA" set-bgp-local-pref=10
add action=accept bgp-as-path=_38753_ chain=iBGP-BITS-out comment=PT-SBP \
    set-bgp-local-pref=10
add action=accept bgp-as-path=_139425_ chain=iBGP-BITS-out comment=PT-RPA \
    set-bgp-local-pref=10
add action=accept bgp-as-path=_139952_ chain=iBGP-BITS-out comment=PT-TRIDATA \
    set-bgp-local-pref=10
add action=accept bgp-as-path=_140429_ chain=iBGP-BITS-out comment=SOLVINDO \
    set-bgp-local-pref=10
add action=accept bgp-as-path=_4855_ chain=iBGP-BITS-out comment=PT-GOR-CITRA \
    set-bgp-local-pref=10
add action=accept bgp-as-path=_139421_ chain=iBGP-BITS-out comment=PT-PANDAWA \
    set-bgp-local-pref=10
add action=accept bgp-as-path=_139993_ chain=iBGP-BITS-out comment=PT-SIDNET \
    set-bgp-local-pref=10
add action=accept bgp-as-path=_136052_ chain=iBGP-BITS-out comment=PT-IDCLOUD \
    set-bgp-local-pref=10
add action=accept bgp-as-path=_138062_ chain=iBGP-BITS-out comment=PT-IDCLOUD \
    set-bgp-local-pref=10
add action=accept bgp-as-path=_15133_ chain=iBGP-BITS-out comment=\
    "EdgeCast Network" disabled=yes prefix-length=23-24 set-bgp-local-pref=3
add action=discard chain=iBGP-BITS-out prefix=0.0.0.0/0
add action=discard chain=iBGP-BITS-out prefix=10.0.0.0/8 prefix-length=8-32
add action=discard chain=iBGP-BITS-out prefix=172.16.0.0/12 prefix-length=\
    12-32
add action=discard chain=iBGP-BITS-out prefix=192.168.0.0/16 prefix-length=\
    16-32
add action=discard chain=iBGP-BITS-out prefix=103.19.56.0/22 prefix-length=\
    22-32
add action=discard chain=iBGP-BITS-out prefix=103.143.244.0/23 prefix-length=\
    23-32
add action=discard chain=iBGP-BITS-out prefix=103.168.46.0/23 prefix-length=\
    23-32
add action=discard chain=iBGP-BITS-out prefix=202.46.80.0/22 prefix-length=\
    22-24
add action=discard chain=iBGP-BITS-out prefix=203.123.224.0/23 prefix-length=\
    23-24
add action=discard chain=iBGP-BITS-out prefix=103.108.201.0/24 prefix-length=\
    24
add action=accept append-bgp-communities=\
    65534:9448,65534:7597,65534:37295,65534:7717,65534:15169,65534:13335 \
    chain=iBGP-BITS-out set-bgp-communities="" set-bgp-local-pref=400
add action=accept chain=iBGP-BITS-in-2 comment=iBGP-Distribusi-2-JunOS \
    prefix=103.19.56.0/22 prefix-length=22-32
add action=accept chain=iBGP-BITS-in-2 prefix=103.143.244.0/23 prefix-length=\
    23-32
add action=accept chain=iBGP-BITS-in-2 prefix=103.168.46.0/23 prefix-length=\
    23-32
add action=accept chain=iBGP-BITS-in-2 prefix=103.108.201.0/24 prefix-length=\
    24
add action=accept bgp-as-path=_4855_ chain=iBGP-BITS-in-2 prefix-length=22-24
add action=discard chain=iBGP-BITS-in-2
add action=accept bgp-as-path=_38165_ chain=iBGP-BITS-out-2 comment=PT-ADS \
    set-bgp-local-pref=10
add action=accept bgp-as-path=_138847_ chain=iBGP-BITS-out-2 comment=PT-ADS \
    set-bgp-local-pref=10
add action=accept bgp-as-path=_38142_ chain=iBGP-BITS-out-2 comment=\
    "UNIV ERLANGGA" set-bgp-local-pref=10
add action=accept bgp-as-path=_38753_ chain=iBGP-BITS-out-2 comment=PT-SBP \
    set-bgp-local-pref=10
add action=accept bgp-as-path=_139425_ chain=iBGP-BITS-out-2 comment=PT-RPA \
    set-bgp-local-pref=10
add action=accept bgp-as-path=_139425_ chain=iBGP-BITS-out-2 comment=\
    PT-TRIDATA set-bgp-local-pref=10
add action=accept bgp-as-path=_140429_ chain=iBGP-BITS-out-2 comment=SOLVINDO \
    set-bgp-local-pref=10
add action=accept bgp-as-path=_4855_ chain=iBGP-BITS-out-2 comment=\
    PT-GOR-CITRA set-bgp-local-pref=10
add action=accept bgp-as-path=_139421_ chain=iBGP-BITS-out-2 comment=\
    PT-PANDAWA set-bgp-local-pref=10
add action=accept bgp-as-path=_139993_ chain=iBGP-BITS-out-2 comment=\
    PT-SIDNET set-bgp-local-pref=10
add action=accept bgp-as-path=_136052_ chain=iBGP-BITS-out-2 comment=\
    PT-IDCLOUD set-bgp-local-pref=10
add action=accept bgp-as-path=_138062_ chain=iBGP-BITS-out-2 comment=\
    PT-IDCLOUD set-bgp-local-pref=10
add action=accept bgp-as-path=_15133_ chain=iBGP-BITS-out-2 comment=\
    "EdgeCast Network" disabled=yes prefix-length=23-24 set-bgp-local-pref=3
add action=discard chain=iBGP-BITS-out-2 prefix=0.0.0.0/0
add action=discard chain=iBGP-BITS-out-2 prefix=10.0.0.0/8 prefix-length=8-32
add action=discard chain=iBGP-BITS-out-2 prefix=172.16.0.0/12 prefix-length=\
    12-32
add action=discard chain=iBGP-BITS-out-2 prefix=192.168.0.0/16 prefix-length=\
    16-32
add action=discard chain=iBGP-BITS-out-2 prefix=103.19.56.0/22 prefix-length=\
    22-32
add action=discard chain=iBGP-BITS-out-2 prefix=103.143.244.0/23 \
    prefix-length=23-32
add action=discard chain=iBGP-BITS-out-2 prefix=103.168.46.0/23 \
    prefix-length=23-32
add action=discard chain=iBGP-BITS-out-2 prefix=202.46.80.0/22 prefix-length=\
    22-24
add action=discard chain=iBGP-BITS-out-2 prefix=203.123.224.0/23 \
    prefix-length=23-24
add action=discard chain=iBGP-BITS-out-2 prefix=103.108.201.0/24 \
    prefix-length=24
add action=accept append-bgp-communities=\
    65534:9448,65534:7597,65534:37295,65534:7717,65534:15169,65534:13335 \
    chain=iBGP-BITS-out-2 set-bgp-communities="" set-bgp-local-pref=400
add action=discard chain=eBGP-CONTENT-in prefix=103.19.56.0/22 prefix-length=\
    22-24
add action=discard chain=eBGP-CONTENT-in prefix=103.143.244.0/23 \
    prefix-length=23-24
add action=accept chain=eBGP-CONTENT-in set-bgp-local-pref=1000
add action=accept chain=eBGP-CONTENT-out comment="EBGP CONTENT" prefix=\
    103.19.56.0/24 prefix-length=24 set-bgp-local-pref=1000
add action=accept chain=eBGP-CONTENT-out prefix=103.19.57.0/24 prefix-length=\
    24 set-bgp-local-pref=1000
add action=accept chain=eBGP-CONTENT-out prefix=103.19.58.0/24 prefix-length=\
    24 set-bgp-local-pref=1000
add action=accept chain=eBGP-CONTENT-out prefix=103.19.59.0/24 prefix-length=\
    24 set-bgp-local-pref=1000
add action=accept chain=eBGP-CONTENT-out prefix=103.143.244.0/24 \
    prefix-length=24 set-bgp-local-pref=1000
add action=accept chain=eBGP-CONTENT-out prefix=103.143.245.0/24 \
    prefix-length=24 set-bgp-local-pref=1000
add action=discard chain=eBGP-CONTENT-out
add action=discard chain=eBGP-CD-IX-IN prefix=103.19.56.0/22 prefix-length=\
    22-24
add action=discard chain=eBGP-CD-IX-IN prefix=103.143.244.0/23 prefix-length=\
    23-24
add action=discard bgp-as-path=_45146_ chain=eBGP-CD-IX-IN comment=SIMADE
add action=discard bgp-as-path=_45703_ chain=eBGP-CD-IX-IN comment=OSS \
    disabled=yes
add action=accept bgp-as-path=_24532_ chain=eBGP-CD-IX-IN comment=INETKU \
    set-bgp-local-pref=50
add action=accept bgp-as-path=_7713_ chain=eBGP-CD-IX-IN comment=LPSE-IMY \
    set-bgp-local-pref=50
add action=accept bgp-as-path=_46027_ chain=eBGP-CD-IX-IN comment=\
    POSTEL.GO.ID set-bgp-local-pref=50
add action=accept chain=eBGP-CD-IX-IN set-bgp-communities=65534:9448
add action=accept chain=eBGP-CD-IX-OUT comment="CDC IX" prefix=103.19.56.0/24 \
    prefix-length=24 set-bgp-prepend=6 set-bgp-prepend-path=\
    132637,132637,132637,132637,132637,132637
add action=accept chain=eBGP-CD-IX-OUT prefix=103.19.57.0/24 prefix-length=24 \
    set-bgp-prepend=6 set-bgp-prepend-path=\
    132637,132637,132637,132637,132637,132637
add action=accept chain=eBGP-CD-IX-OUT prefix=103.19.58.0/24 prefix-length=24 \
    set-bgp-prepend=6 set-bgp-prepend-path=\
    132637,132637,132637,132637,132637,132637
add action=accept chain=eBGP-CD-IX-OUT prefix=103.19.59.0/24 prefix-length=24 \
    set-bgp-prepend=6 set-bgp-prepend-path=\
    132637,132637,132637,132637,132637,132637
add action=accept chain=eBGP-CD-IX-OUT prefix=103.143.244.0/24 prefix-length=\
    24 set-bgp-prepend=6 set-bgp-prepend-path=\
    132637,132637,132637,132637,132637,132637
add action=accept chain=eBGP-CD-IX-OUT prefix=103.143.245.0/24 prefix-length=\
    24 set-bgp-prepend=6 set-bgp-prepend-path=\
    132637,132637,132637,132637,132637,132637
add action=discard chain=eBGP-CD-IX-OUT set-bgp-communities=""
add action=discard chain=eBGP-JKT-IIX-in prefix=103.19.56.0/22 prefix-length=\
    22-24
add action=discard chain=eBGP-JKT-IIX-in prefix=103.143.244.0/23 \
    prefix-length=23-24
add action=discard bgp-as-path=_45703_ chain=eBGP-JKT-IIX-in disabled=yes
add action=accept chain=eBGP-JKT-IIX-in set-bgp-communities=65534:37295
add action=accept chain=eBGP-JKT-IIX-out comment="EBGP JKT-IIX" prefix=\
    103.19.56.0/24 prefix-length=24
add action=accept chain=eBGP-JKT-IIX-out prefix=103.19.57.0/24 prefix-length=\
    24
add action=accept chain=eBGP-JKT-IIX-out prefix=103.19.58.0/24 prefix-length=\
    24
add action=accept chain=eBGP-JKT-IIX-out prefix=103.19.59.0/24 prefix-length=\
    24
add action=accept chain=eBGP-JKT-IIX-out prefix=103.143.244.0/24 \
    prefix-length=24
add action=accept chain=eBGP-JKT-IIX-out prefix=103.143.245.0/24 \
    prefix-length=24
add action=discard chain=eBGP-JKT-IIX-out
add action=discard chain=eBGP-APJI-IIX-in prefix=103.19.56.0/22 \
    prefix-length=22-24
add action=discard chain=eBGP-APJI-IIX-in prefix=103.143.244.0/23 \
    prefix-length=23-24
add action=discard bgp-as-path=_45703_ chain=eBGP-APJI-IIX-in comment=OSS \
    disabled=yes
add action=accept bgp-as-path=_46027_ chain=eBGP-APJI-IIX-in comment=\
    POSTEL.GO.ID set-bgp-local-pref=50
add action=accept bgp-as-path=_132644_ chain=eBGP-APJI-IIX-in comment=\
    SVR.INDOKARA.COM set-bgp-local-pref=50
add action=accept bgp-as-path=_141130_ chain=eBGP-APJI-IIX-in comment=GOESAR \
    set-bgp-local-pref=50
add action=accept bgp-as-path=_24211_ chain=eBGP-APJI-IIX-in comment=DETIK \
    set-bgp-local-pref=50
add action=accept chain=eBGP-APJI-IIX-in set-bgp-communities=65534:7597
add action=accept chain=eBGP-APJI-IIX-out comment="EBGP APJII" prefix=\
    103.19.56.0/24 prefix-length=24
add action=accept chain=eBGP-APJI-IIX-out prefix=103.19.57.0/24 \
    prefix-length=24
add action=accept chain=eBGP-APJI-IIX-out prefix=103.19.58.0/24 \
    prefix-length=24
add action=accept chain=eBGP-APJI-IIX-out prefix=103.19.59.0/24 \
    prefix-length=24
add action=accept chain=eBGP-APJI-IIX-out prefix=103.143.244.0/24 \
    prefix-length=24
add action=accept chain=eBGP-APJI-IIX-out prefix=103.143.245.0/24 \
    prefix-length=24
add action=accept chain=eBGP-APJI-IIX-out prefix=103.168.46.0/24 \
    prefix-length=24
add action=accept chain=eBGP-APJI-IIX-out prefix=103.168.47.0/24 \
    prefix-length=24
add action=accept chain=eBGP-APJI-IIX-out prefix=202.46.80.0/22 \
    prefix-length=22-24
add action=accept chain=eBGP-APJI-IIX-out prefix=203.123.224.0/23 \
    prefix-length=23-24
add action=accept chain=eBGP-APJI-IIX-out prefix=103.108.201.0/24 \
    prefix-length=24
add action=discard chain=eBGP-APJI-IIX-out
add action=accept bgp-as-path=_45325_ chain=eBGP-NICE-IN comment=\
    "PC24-Telkom ( Telering )" set-bgp-local-pref=101
add action=discard chain=eBGP-NICE-IN prefix=103.19.56.0/22 prefix-length=\
    22-24
add action=discard chain=eBGP-NICE-IN prefix=103.143.244.0/23 prefix-length=\
    23-24
add action=discard bgp-as-path=_45703_ chain=eBGP-NICE-IN comment=\
    "Badan Koordinasi Penanaman Modal (BKPM)" disabled=yes prefix-length=\
    23-24 set-bgp-prepend-path=0
add action=accept bgp-as-path=_15133_ chain=eBGP-NICE-IN comment=\
    "EdgeCast Network" disabled=yes prefix-length=23-24 set-bgp-local-pref=3
add action=accept chain=eBGP-NICE-IN set-bgp-communities=65534:7717
add action=accept chain=eBGP-NICE-OUT prefix=103.19.56.0/24 prefix-length=24
add action=accept chain=eBGP-NICE-OUT prefix=103.19.57.0/24 prefix-length=24
add action=accept chain=eBGP-NICE-OUT prefix=103.19.58.0/24 prefix-length=24
add action=accept chain=eBGP-NICE-OUT prefix=103.19.59.0/24 prefix-length=24
add action=accept chain=eBGP-NICE-OUT prefix=103.168.46.0/24 prefix-length=24
add action=accept chain=eBGP-NICE-OUT prefix=103.168.47.0/24 prefix-length=24
add action=accept chain=eBGP-NICE-OUT prefix=103.143.244.0/24 prefix-length=\
    24
add action=accept chain=eBGP-NICE-OUT prefix=103.143.245.0/24 prefix-length=\
    24
add action=accept chain=eBGP-NICE-OUT prefix=202.46.80.0/22 prefix-length=\
    22-24
add action=accept chain=eBGP-NICE-OUT prefix=203.123.224.0/23 prefix-length=\
    23-24
add action=discard chain=eBGP-NICE-OUT
/snmp
set contact=snmp@bits.net.id enabled=yes location=cdc.bits.net.id \
    trap-community=jakarta trap-generators="" trap-version=2
/system clock
set time-zone-name=Asia/Jakarta
/system console
add port=usb3
/system identity
set name=cdn.bitsnet.id
/system logging
add action=remote topics=critical
add action=remote topics=error
add action=remote topics=info
add action=remote topics=warning
/system note
set note="CONTENT\r\
    \n\r\
    \n-preferred first / diutamakan terlebih dahulu\r\
    \n\r\
    \n\r\
    \nCDIX 1G\r\
    \n\r\
    \n-routing filter prefix out = prepend 6x / prepend path 132637 132637 132\
    637 132637 132637 132637\r\
    \n\r\
    \n-add filter new if any as number want to best path to cdix, don't delete\
    \_prepend\r\
    \n\r\
    \n\r\
    \nOPENIXP 2G\r\
    \nnormal bestpath as\r\
    \n\r\
    \n\r\
    \nIIX-APJII 10G\r\
    \nnormal bestpath as\r\
    \n\r\
    \n\r\
    \nJKT-IX 10G\r\
    \nnormal bestpath as\r\
    \n\r\
    \n\r\
    \n\r\
    \n\r\
    \n#Konfigurasi Jangan Pakai BGP Weight, Pakai Local Pref saja"
/system ntp client
set enabled=yes primary-ntp=103.19.56.5 secondary-ntp=202.162.32.12
/system package update
set channel=testing
/system scheduler
add disabled=yes interval=15m name=BGP-SAFE-YET on-event=\
    "tool fetch https://postpi.org/asn0.rsc;\r\
    \nimport asn0.rsc" policy=reboot,read,write,test,sniff,sensitive \
    start-time=startup
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
add dont-require-permissions=no name=autobackup&autosend owner=niam policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/\
    system backup save name=(\"BACKUP\" . \"-\" . [/system identity get name] \
    . \"-\" . \\\r\
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
/tool romon
set enabled=yes secrets=7895123ok
