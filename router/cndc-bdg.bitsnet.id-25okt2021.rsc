# oct/25/2021 15:33:12 by RouterOS 6.46.7
# software id = 0429-SK8L
#
# model = CCR1016-12G
# serial number = 42D402F58ADD
/interface bridge
add name=loopback protocol-mode=none vlan-filtering=yes
/interface ethernet
set [ find default-name=ether10 ] comment=TO-NEUCENTRIX
set [ find default-name=ether11 ] comment=TO-CLIENT
set [ find default-name=ether12 ] comment=TO-BBU
/interface vlan
add interface=ether12 name=2088-BBU vlan-id=2088
/routing bgp instance
add as=132637 name=BITSNET router-id=103.19.56.194
/routing ospf instance
set [ find default=yes ] redistribute-connected=as-type-2 \
    redistribute-static=as-type-2 router-id=103.19.56.154
/snmp community
add addresses=103.19.56.0/22,103.143.244.0/23 name=bandung
/user group
set read policy="local,telnet,ssh,read,test,winbox,web,sniff,sensitive,api,rom\
    on,tikapp,!ftp,!reboot,!write,!policy,!password,!dude"
/ip firewall connection tracking
set enabled=yes
/ip neighbor discovery-settings
set discover-interface-list=all
/ip address
add address=10.0.0.19 interface=loopback network=10.0.0.19
add address=36.91.197.9/26 comment=TO-NEUCENTIX interface=ether10 network=\
    36.91.197.0
add address=103.19.56.101/30 comment=TO-SKINSOL-CIWARUGA interface=ether11 \
    network=103.19.56.100
add address=103.19.56.194/30 comment=TO-BBU interface=2088-BBU network=\
    103.19.56.192
add address=103.19.58.79 comment=TO-KARANTINA-KERTAJATI interface=ether11 \
    network=103.19.58.75
add address=103.19.58.79 comment=TO-KGX-CIREBON interface=ether11 network=\
    103.19.58.80
add address=103.19.56.154 interface=loopback network=103.19.56.254
add address=103.19.58.79 comment=TO-KGX-MAJALENGKA interface=ether11 network=\
    103.19.58.81
add address=103.19.58.79 comment=TO-KGX-JATIBARANG interface=ether11 network=\
    103.19.58.82
add address=192.168.192.1/30 comment=TO-KGX-JATIBARANG interface=ether11 \
    network=192.168.192.0
/ip dns
set servers=103.19.56.10,103.19.56.11,9.9.9.9
/ip route
add distance=111 gateway=103.19.56.193
/ip service
set telnet address=103.19.56.0/22,103.143.244.0/23 port=9989
set ftp address=103.19.56.0/22,103.143.244.0/23 disabled=yes port=9987
set www address=103.19.56.0/22,103.143.244.0/23 disabled=yes port=60080
set ssh address=103.19.56.0/22,103.143.244.0/23 disabled=yes port=9988
set api disabled=yes
set winbox address=103.19.56.0/22,103.143.244.0/23 port=9990
set api-ssl disabled=yes
/routing bgp network
add network=103.19.56.0/24
add network=103.19.57.0/24
add network=103.19.58.0/24
add network=103.19.59.0/24
add network=103.19.56.0/23
add network=103.19.58.0/23
add network=103.143.244.0/24
add network=103.143.245.0/24
add network=103.143.244.0/23
/routing bgp peer
add disabled=yes in-filter=eBGP-NCIX-in instance=BITSNET name=EBGP-NCIX-BDG \
    out-filter=eBGP-NCIX-out remote-address=36.91.197.1 remote-as=137019 \
    tcp-md5-key=ncix_132637 update-source=ether10
add disabled=yes in-filter=iBGP-BITSDIST-in instance=BITSNET name=IBGP-BBU \
    nexthop-choice=force-self out-filter=iBGP-BITSDIST-out remote-address=\
    103.19.56.198 remote-as=132637
/routing filter
add action=accept chain=eBGP-NCIX-out prefix=103.19.56.0/24 prefix-length=24 \
    set-bgp-local-pref=600
add action=accept chain=eBGP-NCIX-out disabled=yes prefix=103.19.57.0/24 \
    prefix-length=24
add action=accept chain=eBGP-NCIX-out disabled=yes prefix=103.19.58.0/24 \
    prefix-length=24
add action=accept chain=eBGP-NCIX-out disabled=yes prefix=103.19.59.0/24 \
    prefix-length=24
add action=accept chain=eBGP-NCIX-out disabled=yes prefix=103.19.56.0/22 \
    prefix-length=22
add action=accept chain=eBGP-NCIX-out disabled=yes prefix=103.143.244.0/24 \
    prefix-length=24
add action=accept chain=eBGP-NCIX-out disabled=yes prefix=103.143.245.0/24 \
    prefix-length=24
add action=accept chain=eBGP-NCIX-out disabled=yes prefix=103.143.244.0/23 \
    prefix-length=23
add action=accept chain=eBGP-NCIX-out disabled=yes prefix=103.111.217.0/24 \
    prefix-length=24
add action=discard chain=eBGP-NCIX-out
add action=discard chain=eBGP-NCIX-in prefix=103.19.56.0/22 prefix-length=\
    22-24
add action=discard chain=eBGP-NCIX-in prefix=103.143.244.0/23 prefix-length=\
    23-24
add action=discard chain=Droplist comment=Droplist prefix=10.0.0.0/8 \
    prefix-length=8-32
add action=discard chain=Droplist prefix=172.16.0.0/12 prefix-length=12-32
add action=discard chain=Droplist prefix=192.168.0.0/16 prefix-length=12-32
add action=return chain=Droplist
add action=jump chain=ospf-in comment=OSPF-IN jump-target=Droplist
add action=accept chain=ospf-in prefix=0.0.0.0/0
add action=accept chain=ospf-in prefix=103.19.56.0/24 prefix-length=24-32
add action=accept chain=ospf-in prefix=103.19.57.0/24 prefix-length=24-32
add action=accept chain=ospf-in prefix=103.19.58.0/24 prefix-length=24-32
add action=accept chain=ospf-in prefix=103.19.59.0/24 prefix-length=24-32
add action=discard chain=ospf-in
add action=accept chain=ospf-out comment=OSPF-OUT prefix=10.0.0.0/8 \
    prefix-length=8-32
add action=accept chain=ospf-out prefix=172.16.4.0/29 prefix-length=29-32
add action=accept chain=ospf-out prefix=103.19.56.0/24 prefix-length=24-32
add action=accept chain=ospf-out prefix=103.19.57.0/24 prefix-length=24-32
add action=accept chain=ospf-out prefix=103.19.58.0/24 prefix-length=24-32
add action=accept chain=ospf-out prefix=103.19.59.0/24 prefix-length=24-32
add action=discard chain=ospf-out
add action=accept chain=iBGP-BITSDIST-out comment=INTERNAL prefix=\
    103.19.56.0/22 prefix-length=22-32
add action=accept chain=iBGP-BITSDIST-out prefix=103.143.244.0/23 \
    prefix-length=23-32
add action=discard chain=iBGP-BITSDIST-out
add action=accept chain=iBGP-BITSDIST-in prefix=0.0.0.0/0 prefix-length=0
add action=accept chain=iBGP-BITSDIST-in
/routing ospf interface
add cost=2000 interface=2088-BBU network-type=point-to-point
/routing ospf network
add area=backbone network=103.19.56.192/30
add area=backbone network=103.19.56.154/32
/snmp
set contact=noc@bitsnet.ic enabled=yes location="cndc bandung" \
    trap-community=bandung trap-version=2
/system clock
set time-zone-name=Asia/Jakarta
/system identity
set name=cndc-bdg.bitsnet.id
/system ntp client
set enabled=yes primary-ntp=103.19.56.5 secondary-ntp=202.162.32.12
