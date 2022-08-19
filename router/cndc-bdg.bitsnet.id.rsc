# aug/19/2022 11:06:10 by RouterOS 6.48.6
# software id = 500N-8WFD
#
# model = CCR1036-12G-4S
# serial number = 916809D7823D
/interface bridge
add name=loopback protocol-mode=none vlan-filtering=yes
/interface ethernet
set [ find default-name=ether1 ] speed=100Mbps
set [ find default-name=ether2 ] speed=100Mbps
set [ find default-name=ether3 ] speed=100Mbps
set [ find default-name=ether4 ] speed=100Mbps
set [ find default-name=ether5 ] speed=100Mbps
set [ find default-name=ether6 ] comment=TO-SW-FBC-NEUCENTRIX-Eth21 disabled=\
    yes speed=100Mbps
set [ find default-name=ether7 ] comment=TO-SW-FBC-NEUCENTRIX-Eth22 disabled=\
    yes speed=100Mbps
set [ find default-name=ether8 ] comment=TO-SW-FBC-NEUCENTRIX-Eth23 disabled=\
    yes speed=100Mbps
set [ find default-name=ether9 ] comment=TO-SW-FBC-NEUCENTRIX-Eth24 speed=\
    100Mbps
set [ find default-name=ether10 ] comment=TO-NEUCENTRIX speed=100Mbps
set [ find default-name=ether11 ] comment="BONDING-TELKOM ( EX-CLIENT)" \
    disabled=yes speed=100Mbps
set [ find default-name=ether12 ] comment="BONDING-TELKOM ( EX-TO-BBU)" \
    disabled=yes mac-address=D4:CA:6D:89:21:32 speed=100Mbps
set [ find default-name=sfp1 ] advertise=10M-full,100M-full,1000M-full
set [ find default-name=sfp2 ] advertise=10M-full,100M-full,1000M-full
set [ find default-name=sfp3 ] advertise=10M-full,100M-full,1000M-full
set [ find default-name=sfp4 ] advertise=10M-full,100M-full,1000M-full
/interface vlan
add interface=ether9 name=20-MGT2-SW-FBC vlan-id=20
add interface=ether9 name=2003-NCIX-TRANSTECH vlan-id=2003
add interface=ether9 name=2093-NCIX-TO-JUNOS vlan-id=2093
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/routing bgp instance
set default disabled=yes
add as=132637 name=BITSNET redistribute-connected=yes redistribute-other-bgp=\
    yes router-id=103.19.56.194
add as=142310 name=FIBERCONNECT redistribute-other-bgp=yes router-id=\
    36.91.197.9
/routing ospf instance
set [ find default=yes ] redistribute-connected=as-type-2 redistribute-static=\
    as-type-2 router-id=103.19.56.156
/snmp community
add addresses=103.19.56.0/22,103.143.244.0/23 name=bandung
/system logging action
set 3 remote=103.19.56.12
/tool user-manager customer
set admin access=\
    own-routers,own-users,own-profiles,own-limits,config-payment-gw
/user group
set read policy="local,telnet,ssh,read,test,winbox,web,sniff,sensitive,api,romon\
    ,tikapp,!ftp,!reboot,!write,!policy,!password,!dude"
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,passw\
    ord,web,sniff,sensitive,api,romon,dude,tikapp"
/ip firewall connection tracking
set enabled=yes
/ip neighbor discovery-settings
set discover-interface-list=all
/ip address
add address=36.91.197.9/25 comment=TO-NEUCENTRIX interface=ether10 network=\
    36.91.197.0
add address=10.254.11.21/30 comment="MGT SWITCH CNDC ISCOM" interface=ether3 \
    network=10.254.11.20
add address=103.19.56.194/30 comment=UPLINK-BBU interface=2093-NCIX-TO-JUNOS \
    network=103.19.56.192
add address=103.19.56.156 disabled=yes interface=2003-NCIX-TRANSTECH network=\
    103.19.58.87
add address=103.19.56.156 interface=loopback network=103.19.56.156
/ip dns
set servers=103.19.56.10,103.19.56.11,9.9.9.9
/ip firewall address-list
add address=103.19.56.102 list=whitelist
add address=103.19.58.115 list=whitelist
/ip firewall filter
add action=accept chain=forward dst-port=25 protocol=tcp src-address-list=\
    whitelist
add action=accept chain=forward dst-address-list=whitelist dst-port=25 \
    protocol=tcp
add action=drop chain=forward dst-port=25 protocol=tcp
add action=drop chain=forward dst-port=25 protocol=udp
add action=drop chain=forward comment="Malware Ransomware Type WannaCRY" \
    dst-port=137-139,445,3127,5678 protocol=tcp
add action=drop chain=forward comment="Malware Ransomware Type WannaCRY" \
    dst-port=137-139,445,3127,5678 protocol=udp
/ip firewall nat
add action=dst-nat chain=dstnat comment=Switch-FBC disabled=yes dst-address=\
    103.19.56.194 dst-port=7877 protocol=tcp to-addresses=10.11.12.2 to-ports=\
    8291
add action=dst-nat chain=dstnat comment=Switch-FBC-2 dst-address=103.19.56.194 \
    dst-port=7878 protocol=tcp to-addresses=10.11.12.6 to-ports=8291
/ip route
add check-gateway=ping distance=1 gateway=103.19.56.193
/ip service
set telnet address=103.19.56.0/22,103.143.244.0/23 port=9989
set ftp address=103.19.56.0/22,103.143.244.0/23 disabled=yes port=9987
set www address=103.19.56.0/22,103.143.244.0/23 disabled=yes port=60080
set ssh address=103.19.56.0/22,103.143.244.0/23 disabled=yes port=9988
set api disabled=yes
set winbox address=0.0.0.0/0 port=9990
set api-ssl disabled=yes
/ipv6 nd
set [ find default=yes ] advertise-dns=no
/routing bgp network
add disabled=yes network=103.19.56.0/24 synchronize=no
add disabled=yes network=103.19.57.0/24 synchronize=no
add disabled=yes network=103.19.58.0/24 synchronize=no
add disabled=yes network=103.19.59.0/24 synchronize=no
add disabled=yes network=103.143.244.0/24 synchronize=no
add disabled=yes network=103.143.245.0/24 synchronize=no
add disabled=yes network=103.168.46.0/24 synchronize=no
add disabled=yes network=103.168.47.0/24 synchronize=no
/routing bgp peer
add in-filter=eBGP-NCIX-in instance=FIBERCONNECT name=EBGP-NCIX-BDG out-filter=\
    eBGP-NCIX-out remote-address=36.91.197.1 remote-as=137019 tcp-md5-key=\
    ncix_142310 update-source=ether10
add disabled=yes in-filter=iBGP-DIST-BDG-in instance=BITSNET name=IBGP-BBU-MX80 \
    nexthop-choice=force-self out-filter=iBGP-DIST-BDG-out remote-address=\
    103.19.56.193 remote-as=132637 update-source=103.19.56.194
add disabled=yes in-filter=eBGP-ABW-in instance=BITSNET name=EBGP-ABW \
    nexthop-choice=force-self out-filter=eBGP-ABW-out remote-address=\
    10.100.210.1 remote-as=138077 update-source=*13
add disabled=yes in-filter=iBGP-DIST-BDG-in instance=BITSNET multihop=yes name=\
    IBGP-JKT-MX204 nexthop-choice=force-self out-filter=iBGP-DIST-BDG-out \
    remote-address=103.19.56.148 remote-as=132637 update-source=103.19.56.194
add disabled=yes in-filter=eBGP-Transtech-in instance=BITSNET name=\
    eBGP-Transtech out-filter=eBGP-Transtech-out remote-address=103.19.58.87 \
    remote-as=56255 remove-private-as=yes tcp-md5-key=56255 ttl=default
/routing filter
add action=accept chain=eBGP-NCIX-out comment=####START#### prefix=\
    103.168.46.0/24 prefix-length=24 set-bgp-local-pref=600
add action=accept chain=eBGP-NCIX-out prefix=103.168.47.0/24 prefix-length=24 \
    set-bgp-local-pref=600
add action=accept chain=eBGP-NCIX-out prefix=103.19.56.0/24 prefix-length=24 \
    set-bgp-local-pref=600
add action=accept chain=eBGP-NCIX-out prefix=103.19.57.0/24 prefix-length=24
add action=accept chain=eBGP-NCIX-out prefix=103.19.58.0/24 prefix-length=24
add action=accept chain=eBGP-NCIX-out prefix=103.19.59.0/24 prefix-length=24
add action=accept chain=eBGP-NCIX-out prefix=103.143.244.0/24 prefix-length=24
add action=accept chain=eBGP-NCIX-out prefix=103.143.245.0/24 prefix-length=24
add action=accept chain=eBGP-NCIX-out prefix=103.10.170.0/24 prefix-length=24
add action=accept chain=eBGP-NCIX-out prefix=103.10.171.0/24 prefix-length=24
add action=discard chain=eBGP-NCIX-out
add action=discard chain=eBGP-NCIX-in prefix=103.19.56.0/22 prefix-length=22-24
add action=discard chain=eBGP-NCIX-in prefix=103.143.244.0/23 prefix-length=\
    23-24
add action=discard chain=eBGP-NCIX-in prefix=103.168.46.0/23 prefix-length=\
    23-24
add action=discard bgp-as-path=_45703_ chain=eBGP-NCIX-in comment=\
    perizinan.oss.go.id
add action=discard bgp-as-path=_8075_ chain=eBGP-NCIX-in comment=\
    "Drop Microsoft Via NCIX"
add action=discard bgp-as-path=_24532_ chain=eBGP-NCIX-in comment=\
    "Drop Inetku Via NCIX"
add action=accept bgp-as-path=_45703_ chain=eBGP-NCIX-in comment=\
    "DROP Badan Koordinasi Penanaman Modal (BKPM)"
add action=accept chain=eBGP-NCIX-in set-bgp-local-pref=400
add action=accept chain=iBGP-DIST-BDG-in prefix=103.19.56.0/22 prefix-length=\
    22-32
add action=accept chain=iBGP-DIST-BDG-in prefix=103.143.244.0/23 prefix-length=\
    23-32
add action=accept chain=iBGP-DIST-BDG-in prefix=103.168.46.0/23 prefix-length=\
    23-32
add action=discard chain=iBGP-DIST-BDG-in
add action=discard chain=iBGP-DIST-BDG-out prefix=103.168.46.0/23 \
    prefix-length=23-32
add action=discard chain=iBGP-DIST-BDG-out prefix=103.143.244.0/23 \
    prefix-length=23-32
add action=discard chain=iBGP-DIST-BDG-out prefix=103.19.56.0/22 prefix-length=\
    22-32
add action=accept bgp-as-path=_38165_ chain=iBGP-DIST-BDG-out comment=PT-ADS \
    set-bgp-local-pref=10
add action=accept bgp-as-path=_138847_ chain=iBGP-DIST-BDG-out comment=PT-ADS \
    set-bgp-local-pref=10
add action=accept bgp-as-path=_38142_ chain=iBGP-DIST-BDG-out comment=\
    "UNIV ERLANGGA" set-bgp-local-pref=10
add action=accept bgp-as-path=_38753_ chain=iBGP-DIST-BDG-out comment=PT-SBP \
    set-bgp-local-pref=10
add action=accept bgp-as-path=_139425_ chain=iBGP-DIST-BDG-out comment=PT-RPA \
    set-bgp-local-pref=10
add action=accept bgp-as-path=_139952_ chain=iBGP-DIST-BDG-out comment=\
    PT-TRIDATA set-bgp-local-pref=10
add action=accept bgp-as-path=_140429_ chain=iBGP-DIST-BDG-out comment=SOLVINDO \
    set-bgp-local-pref=10
add action=accept bgp-as-path=_4855_ chain=iBGP-DIST-BDG-out comment=\
    PT-GOR-CITRA set-bgp-local-pref=10
add action=accept bgp-as-path=_139421_ chain=iBGP-DIST-BDG-out comment=\
    PT-PANDAWA set-bgp-local-pref=10
add action=accept bgp-as-path=_139993_ chain=iBGP-DIST-BDG-out comment=\
    PT-SIDNET set-bgp-local-pref=10
add action=accept chain=iBGP-DIST-BDG-out
add action=accept chain=iBGP-JKT-in comment="IBGP JKT" prefix=103.19.56.0/22 \
    prefix-length=22-24
add action=accept chain=iBGP-JKT-in prefix=103.143.244.0/23 prefix-length=23-24
add action=accept chain=iBGP-JKT-in prefix=103.168.46.0/23 prefix-length=23-24
add action=discard chain=iBGP-JKT-in
add action=discard chain=iBGP-JKT-out prefix=103.168.46.0/23 prefix-length=\
    23-24
add action=discard chain=iBGP-JKT-out prefix=103.143.244.0/23 prefix-length=\
    23-24
add action=discard chain=iBGP-JKT-out prefix=103.19.56.0/22 prefix-length=22-24
add action=accept chain=iBGP-JKT-out
add action=discard chain=eBGP-Transtech-out comment=eBGP-Transtech prefix=\
    103.10.170.0/24 prefix-length=24
add action=discard chain=eBGP-Transtech-out prefix=103.10.171.0/24 \
    prefix-length=24
add action=accept chain=eBGP-Transtech-out
add action=accept chain=eBGP-Transtech-in prefix=103.10.170.0/24 prefix-length=\
    24
add action=accept chain=eBGP-Transtech-in prefix=103.10.171.0/24 prefix-length=\
    24
add action=discard chain=eBGP-Transtech-in
/routing ospf interface
add interface=loopback network-type=broadcast passive=yes
add cost=1000 interface=2093-NCIX-TO-JUNOS network-type=point-to-point
/routing ospf network
add area=backbone network=103.19.56.156/32
add area=backbone network=103.19.56.192/30
/snmp
set contact=noc@bitsnet.ic enabled=yes location="cndc bandung" trap-community=\
    bandung trap-version=2
/system clock
set time-zone-name=Asia/Jakarta
/system clock manual
set dst-delta=+07:00 time-zone=+07:00
/system identity
set name=cndc-bdg.bitsnet.id
/system logging
add action=remote topics=critical
add action=remote topics=error
add action=remote topics=info
add action=remote topics=warning
/system ntp client
set enabled=yes primary-ntp=103.123.108.186 secondary-ntp=103.123.108.222
/system package update
set channel=long-term
/tool romon
set enabled=yes secrets="Pqs5CN*)8)"
/tool user-manager database
set db-path=user-manager
