# oct/25/2021 15:36:27 by RouterOS 6.46.8
# software id = FMTK-GFB5
#
# model = CCR1036-8G-2S+
# serial number = D8370C94A417
/interface bridge
add name=bridge1-VPS-IP-PUBLIK
/interface ethernet
set [ find default-name=ether1 ] speed=100Mbps
set [ find default-name=ether2 ] auto-negotiation=no speed=100Mbps
set [ find default-name=ether3 ] auto-negotiation=no speed=100Mbps
set [ find default-name=ether4 ] auto-negotiation=no speed=100Mbps
set [ find default-name=ether7 ] comment=TO-VPS1
set [ find default-name=ether8 ] comment=TO-VPS2
set [ find default-name=sfp-sfpplus1 ] comment=TO-DISTRIBUSI
set [ find default-name=sfp-sfpplus2 ] comment=TO-MMR-NTT
/interface vlan
add interface=sfp-sfpplus2 name=502-MGMT-MMR-NTT vlan-id=502
add interface=sfp-sfpplus1 name=581-VPS-JKT vlan-id=581
add interface=sfp-sfpplus2 name=1600-FACEBOOK vlan-id=1600
add interface=sfp-sfpplus1 name=1703-FB-Distribusi-2-JUNOS vlan-id=1703
add interface=sfp-sfpplus1 name=1704-FB-Distribusi-1-JUNOS vlan-id=1704
add interface=sfp-sfpplus1 name=1705-FB-Distribusi-3-MIKRO vlan-id=1705
add interface=sfp-sfpplus1 name=4090-VPS-IP-PRIVATE vlan-id=4090
/routing bgp instance
set default disabled=yes
add as=132637 client-to-client-reflection=no name=BITSNET-FB router-id=\
    157.240.67.61
/snmp community
set [ find default=yes ] addresses=103.19.56.0/22,103.143.244.0/23 name=\
    jakarta
/user group
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
/interface bridge port
add bridge=bridge1-VPS-IP-PUBLIK disabled=yes interface=ether8
add bridge=bridge1-VPS-IP-PUBLIK disabled=yes interface=4090-VPS-IP-PRIVATE
add bridge=bridge1-VPS-IP-PUBLIK disabled=yes interface=ether7
add bridge=bridge1-VPS-IP-PUBLIK disabled=yes interface=581-VPS-JKT
/ip neighbor discovery-settings
set discover-interface-list=!dynamic
/ip address
add address=157.240.74.135 comment=\
    "RUNNING | AWARE IF U WANT TO EDIT OR DISABLED" interface=1600-FACEBOOK \
    network=157.240.74.134
add address=157.240.67.61 comment=\
    "RUNNING | AWARE IF U WANT TO EDIT OR DISABLED" interface=1600-FACEBOOK \
    network=157.240.67.60
add address=10.254.7.17/30 interface=502-MGMT-MMR-NTT network=10.254.7.16
add address=103.19.56.161/30 interface=1703-FB-Distribusi-2-JUNOS network=\
    103.19.56.160
add address=103.19.56.137/30 interface=1704-FB-Distribusi-1-JUNOS network=\
    103.19.56.136
add address=10.254.7.81/30 interface=ether8 network=10.254.7.80
add address=10.254.7.77/30 interface=ether7 network=10.254.7.76
/ip dns
set servers=103.19.56.10,103.19.56.11
/ip firewall filter
add action=drop chain=forward dst-port=25 protocol=tcp
add action=drop chain=forward dst-port=25 protocol=udp
/ip firewall nat
add action=dst-nat chain=dstnat comment="TO-VPS-1 VPS" dst-address=\
    103.19.56.137 dst-port=443 protocol=tcp to-addresses=10.254.7.82 \
    to-ports=443
add action=dst-nat chain=dstnat comment="TO-VPS-1 SSH" dst-address=\
    103.19.56.137 dst-port=8880 protocol=tcp to-addresses=10.254.7.82 \
    to-ports=22
add action=dst-nat chain=dstnat comment="TO-VPS-2 VPS" dst-address=\
    103.19.56.161 dst-port=443 protocol=tcp to-addresses=10.254.7.78 \
    to-ports=443
add action=dst-nat chain=dstnat comment="TO-VPS-2 SSH" dst-address=\
    103.19.56.161 dst-port=8881 protocol=tcp to-addresses=10.254.7.78 \
    to-ports=22
add action=dst-nat chain=dstnat comment="SWITCH MMR" dst-address=\
    103.19.56.137 dst-port=7779 protocol=tcp to-addresses=10.254.7.18 \
    to-ports=8291
/ip route
add distance=1 gateway=103.19.56.162,103.19.56.138
/ip service
set telnet port=9989
set ftp disabled=yes port=9987
set www port=60080
set ssh port=9988
set api disabled=yes
set winbox port=9990
set api-ssl disabled=yes
/routing bgp network
add network=103.19.56.0/22 synchronize=no
add network=103.19.56.0/24 synchronize=no
add network=103.19.57.0/24 synchronize=no
add network=103.19.58.0/24 synchronize=no
add network=103.19.59.0/24 synchronize=no
add network=103.19.56.0/23 synchronize=no
add network=103.19.58.0/23 synchronize=no
add network=103.143.244.0/23 synchronize=no
add network=103.143.244.0/24 synchronize=no
add network=103.143.245.0/24 synchronize=no
/routing bgp peer
add in-filter=eBGP-FB-IIX-in instance=BITSNET-FB max-prefix-limit=100 name=\
    EBGP-FACEBOOK nexthop-choice=force-self out-filter=eBGP-FB-IIX-out \
    remote-address=157.240.67.60 remote-as=32934 ttl=default update-source=\
    1600-FACEBOOK
add in-filter=iBGP-BITS-in-2 instance=BITSNET-FB name=IBGP-DISTRIBUSI-2-JUNOS \
    nexthop-choice=force-self out-filter=iBGP-BITS-out-2 remote-address=\
    103.19.56.162 remote-as=132637 ttl=default
add in-filter=iBGP-BITS-in instance=BITSNET-FB name=IBGP-DISTRIBUSI-1-JUNOS \
    nexthop-choice=force-self out-filter=iBGP-BITS-out remote-address=\
    103.19.56.138 remote-as=132637 ttl=default
add in-filter=eBGP-FB-IIX-in instance=BITSNET-FB max-prefix-limit=100 name=\
    EBGP-FACEBOOK-2 nexthop-choice=force-self out-filter=eBGP-FB-IIX-out \
    remote-address=157.240.74.134 remote-as=32934 ttl=default update-source=\
    1600-FACEBOOK
/routing filter
add action=discard chain=eBGP-FB-IIX-out prefix=202.46.80.0/22 prefix-length=\
    22-32
add action=discard chain=eBGP-FB-IIX-out prefix=103.105.142.0/24 \
    prefix-length=24-32
add action=accept chain=eBGP-FB-IIX-out prefix=103.19.56.0/24 prefix-length=\
    24
add action=accept chain=eBGP-FB-IIX-out prefix=103.19.57.0/24 prefix-length=\
    24
add action=accept chain=eBGP-FB-IIX-out prefix=103.19.58.0/24 prefix-length=\
    24
add action=accept chain=eBGP-FB-IIX-out prefix=103.19.59.0/24 prefix-length=\
    24
add action=accept chain=eBGP-FB-IIX-out prefix=103.19.56.0/22 prefix-length=\
    22
add action=accept chain=eBGP-FB-IIX-out prefix=103.143.244.0/24 \
    prefix-length=24
add action=accept chain=eBGP-FB-IIX-out prefix=103.143.245.0/24 \
    prefix-length=24
add action=accept chain=eBGP-FB-IIX-out prefix=103.143.244.0/23 \
    prefix-length=23
add action=discard chain=eBGP-FB-IIX-out
add action=discard chain=eBGP-FB-IIX-in prefix=103.19.56.0/22 prefix-length=\
    22-24
add action=discard chain=eBGP-FB-IIX-in prefix=103.143.244.0/23 \
    prefix-length=23
add action=accept chain=eBGP-FB-IIX-in
add action=accept chain=iBGP-BITS-out comment=iBGP-Distribusi prefix=\
    0.0.0.0/0 prefix-length=0
add action=discard chain=iBGP-BITS-out prefix=103.19.56.0/22 prefix-length=\
    22-32
add action=discard chain=iBGP-BITS-out prefix=103.143.244.0/23 prefix-length=\
    23-32
add action=accept chain=iBGP-BITS-out set-bgp-local-pref=400
add action=accept chain=iBGP-BITS-in prefix=103.19.56.0/22 prefix-length=\
    22-32
add action=accept chain=iBGP-BITS-in prefix=103.143.244.0/23 prefix-length=\
    23-32
add action=discard chain=iBGP-BITS-in
add action=accept chain=iBGP-BITS-out-2 comment=iBGP-Distribusi-2-JunOS \
    prefix=0.0.0.0/0 prefix-length=0
add action=discard chain=iBGP-BITS-out-2 prefix=103.19.56.0/22 prefix-length=\
    22-32
add action=discard chain=iBGP-BITS-out-2 prefix=103.143.244.0/23 \
    prefix-length=23-32
add action=accept chain=iBGP-BITS-out-2 set-bgp-local-pref=400
add action=accept chain=iBGP-BITS-in-2 disabled=yes prefix=103.19.56.52/30 \
    prefix-length=30 set-bgp-weight=100
add action=accept chain=iBGP-BITS-in-2 disabled=yes prefix=103.19.56.208/30 \
    prefix-length=30 set-bgp-weight=100
add action=accept chain=iBGP-BITS-in-2 disabled=yes prefix=103.19.57.80/30 \
    prefix-length=30 set-bgp-weight=100
add action=accept chain=iBGP-BITS-in-2 disabled=yes prefix=103.19.57.96/29 \
    prefix-length=29 set-bgp-weight=100
add action=accept chain=iBGP-BITS-in-2 disabled=yes prefix=103.19.57.152/29 \
    prefix-length=29 set-bgp-weight=100
add action=accept chain=iBGP-BITS-in-2 disabled=yes prefix=103.19.57.168/30 \
    prefix-length=30 set-bgp-weight=100
add action=accept chain=iBGP-BITS-in-2 disabled=yes prefix=103.19.57.172/30 \
    prefix-length=30 set-bgp-weight=100
add action=accept chain=iBGP-BITS-in-2 disabled=yes prefix=103.19.57.224/30 \
    prefix-length=30 set-bgp-weight=100
add action=accept chain=iBGP-BITS-in-2 disabled=yes prefix=103.19.57.244/30 \
    prefix-length=30 set-bgp-weight=100
add action=accept chain=iBGP-BITS-in-2 disabled=yes prefix=103.19.58.0/27 \
    prefix-length=27 set-bgp-weight=100
add action=accept chain=iBGP-BITS-in-2 disabled=yes prefix=103.19.58.32/27 \
    prefix-length=27 set-bgp-weight=100
add action=accept chain=iBGP-BITS-in-2 disabled=yes prefix=103.19.58.132/30 \
    prefix-length=30 set-bgp-weight=100
add action=accept chain=iBGP-BITS-in-2 disabled=yes prefix=103.19.59.184/30 \
    prefix-length=30 set-bgp-weight=100
add action=accept chain=iBGP-BITS-in-2 disabled=yes prefix=103.19.59.188/30 \
    prefix-length=30 set-bgp-weight=100
add action=accept chain=iBGP-BITS-in-2 disabled=yes prefix=103.19.59.224/30 \
    prefix-length=30 set-bgp-weight=100
add action=accept chain=iBGP-BITS-in-2 prefix=103.19.56.0/22 prefix-length=\
    22-32 set-bgp-local-pref=399
add action=accept chain=iBGP-BITS-in-2 prefix=103.143.244.0/23 prefix-length=\
    23-32
add action=discard chain=iBGP-BITS-in-2
/snmp
set contact=noc@bitsnet.id enabled=yes location=\
    "Cyber Data Center Cyber1 Jakarta" trap-version=2
/system clock
set time-zone-name=Asia/Jakarta
/system clock manual
set dst-delta=+07:00 time-zone=+07:00
/system identity
set name=core-fb.bitsnet.id
/system ntp client
set enabled=yes primary-ntp=202.65.114.202
