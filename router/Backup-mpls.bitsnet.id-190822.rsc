# aug/19/2022 11:29:02 by RouterOS 6.46.7
# software id = MWZY-EGK9
#
# model = CCR1016-12G
# serial number = 74300765558A
/interface bridge
add name=Bridge-ADS-ARJASARI
add mtu=1500 name=Bridge-AGTI-SURYALAYA-CIREBON
add name=Bridge-BTN-CIANJUR
add name=Bridge-BTN-CIJERAH
add name=Bridge-BTN-CIKAMPEK
add disabled=yes name=Bridge-BTN-INDRAMAYU protocol-mode=none
add comment=Dismantle disabled=yes name=Bridge-BTN-KC-BENGKULU protocol-mode=\
    none
add mtu=1500 name=Bridge-BTN-KC-CIREBON
add name=Bridge-BTN-KC-PALEMBANG-SUDIRMAN protocol-mode=none
add name=Bridge-BTN-KCS-BENGKULU
add name=Bridge-BTN-MADIUN protocol-mode=none
add name=Bridge-BTN-MEDAN-IM protocol-mode=none
add name=Bridge-BTN-MEDAN-PEMUDA
add name=Bridge-BTN-PALEMBANG-AHMAD-RIFAI
add name=Bridge-BTN-PALEMBANG-VETERAN protocol-mode=none
add name=Bridge-BTN-PURWAKARTA
add name=Bridge-BTN-SUBANG
add name=Bridge-BTN-Tasik
add name=Bridge-KGX-CIREBON
add name=Bridge-Rujie-Lab
add mtu=1500 name=bridge-KGX-JATIBARANG
add mtu=1500 name=bridge-KGX-MAJALENGKA
add name=loopback
/interface ethernet
set [ find default-name=ether1 ] comment=TO-TENDA-CDC
set [ find default-name=ether9 ] comment="UPLINK TO DIST 3"
set [ find default-name=ether12 ] comment="TO SWITCH"
/interface eoip
add local-address=10.254.1.1 mac-address=02:AB:7A:FA:0F:77 name=\
    "EoIP-Aston Canggu Via Telkom" remote-address=10.254.1.51 tunnel-id=502
add local-address=10.254.1.1 mac-address=02:9A:21:69:52:C2 name=\
    EoIP-BACKUP-PTSELIM remote-address=10.254.1.19 tunnel-id=884
add mac-address=02:DB:02:53:E2:BB name=EoIP-BTN-CIANJUR remote-address=\
    120.89.90.106 tunnel-id=1115
add mac-address=02:1A:29:0E:92:AC name=EoIP-BTN-CIJERAH remote-address=\
    202.52.15.14 tunnel-id=1120
add mac-address=02:1A:AB:59:33:71 name=EoIP-BTN-CIKAMPEK remote-address=\
    114.141.49.60 tunnel-id=1118
add comment=Dismantle disabled=yes mac-address=02:2C:1D:05:D3:34 name=\
    EoIP-BTN-INDRAMAYU remote-address=10.254.1.30 tunnel-id=1114
add local-address=10.254.1.1 mac-address=02:5F:D0:E0:50:4E mtu=1500 name=\
    "EoIP-BTN-KC CIREBON" remote-address=10.254.1.43 tunnel-id=1125
add comment=DIsmantle disabled=yes local-address=10.254.1.1 mac-address=\
    02:8C:34:25:9F:BB name=EoIP-BTN-KC-BENGKULU remote-address=10.254.1.38 \
    tunnel-id=1111
add comment=Dismantle disabled=yes mac-address=02:E5:7A:17:62:00 name=\
    EoIP-BTN-KC-PALEMBANG-SUDIRMAN remote-address=117.74.115.7 tunnel-id=1117
add mac-address=02:98:CB:C0:72:72 name=EoIP-BTN-KCPS-PALEMBANG-VETERAN \
    remote-address=117.74.115.9 tunnel-id=1124
add local-address=10.254.1.1 mac-address=02:C6:61:E2:1F:8A name=\
    EoIP-BTN-KCS-BENGKULU remote-address=10.254.1.41 tunnel-id=1123
add mac-address=02:14:12:00:2B:3A name=EoIP-BTN-KCS-PALEMBANG-AHMAD-RIFAI \
    remote-address=117.74.115.132 tunnel-id=1119
add mac-address=02:2C:1D:05:D3:34 name=EoIP-BTN-MADIUN remote-address=\
    10.254.1.39 tunnel-id=1113
add mac-address=02:2C:1D:05:D3:34 name=EoIP-BTN-MEDAN-IM remote-address=\
    203.153.213.77 tunnel-id=1110
add mac-address=02:2C:1D:05:D3:34 name=EoIP-BTN-MEDAN-PEMUDA remote-address=\
    203.153.213.75 tunnel-id=1112
add mac-address=02:BF:43:49:6D:20 name=EoIP-BTN-PURWAKARTA remote-address=\
    202.43.64.150 tunnel-id=1122
add comment=Dismantle disabled=yes mac-address=02:49:B2:6E:57:C7 name=\
    EoIP-BTN-SUBANG remote-address=202.43.64.254 tunnel-id=1121
add mac-address=02:DB:02:53:E2:BB name=EoIP-BTN-Tasik remote-address=\
    10.254.1.34 tunnel-id=1116
add local-address=10.254.1.1 mac-address=02:6E:91:12:28:A0 mtu=1500 name=\
    EoIP-CAMAT-ARJASARI remote-address=10.254.1.58 tunnel-id=5886
add local-address=10.254.1.1 mac-address=02:8C:34:25:9F:BB name=\
    EoIP-KGX-CIREBON remote-address=10.254.1.54 tunnel-id=54544
add local-address=103.19.56.186 mac-address=02:8C:34:25:9F:BB mtu=1500 name=\
    EoIP-KGX-JATIBARANG remote-address=103.19.58.82 tunnel-id=55445
add local-address=10.254.1.1 mac-address=02:8C:34:25:9F:BB mtu=1500 name=\
    EoIP-KGX-MAJALENGKA remote-address=10.254.1.55 tunnel-id=55656
add local-address=10.254.1.1 mac-address=02:6E:91:12:28:A0 mtu=1500 name=\
    EoIP-MPLS-CIREBON remote-address=10.254.1.100 tunnel-id=12626
/interface gre
add disabled=yes local-address=103.19.56.186 mtu=1500 name=\
    gre-tunnel1-RAPID-TELKOM remote-address=103.158.252.6
/interface vlan
add interface=ether12 name=95-IPVPN-ICON vlan-id=95
add interface=ether9 name=513-TO-DISTRIBUSI-1-JUNOS vlan-id=513
add interface=ether12 name=1246-TRIGATRA-BKL vlan-id=1246
add interface=ether12 name=1247-TRIGATRA-MEDAN-IM vlan-id=1247
add interface=ether12 name=1248-TRIGATRA-MEDAN-PEMUDA vlan-id=1248
add interface=ether12 name=1249-TRIGATRA-MADIUN vlan-id=1249
add interface=ether12 name=1250-TRIGATRA-INDRAMAYU vlan-id=1250
add interface=ether12 name=1251-TRIGATRA-CIANJUR vlan-id=1251
add interface=ether12 name=1252-TRIGATRA-TASIK vlan-id=1252
add disabled=yes interface=ether12 name=1253-TRIGATRA-KC-PALEMBANG-SUDIRMAN \
    vlan-id=1253
add interface=ether12 name=1254-TRIGATRA-CIKAMPEK vlan-id=1254
add interface=ether12 name=1255-TRIGATRA-KCS-PALEMBANG-AHMAD-RIFAI vlan-id=\
    1255
add interface=ether12 name="1256 -TRIGATRA-CIJERAH" vlan-id=1256
add interface=ether12 name=1257-TRIGATRA-SUBANG vlan-id=1257
add interface=ether12 name=1258-TRIGATRA-PURWAKARTA vlan-id=1258
add interface=ether12 name=1259-TRIGATRA-BENGKULU-SYARIAH vlan-id=1259
add interface=ether12 name=1260-TRIGATRA-PALEMBANG-VETERAN vlan-id=1260
add interface=ether12 name=1261-TRIGATRA-KC-CIREBON vlan-id=1261
add interface=ether12 name=1270-AGTI-SURYALAYA-CIREBON vlan-id=1270
add interface=EoIP-MPLS-CIREBON name=1270-AGTI-SURYALAYA-CIREBON-DIST \
    vlan-id=1270
add interface=ether12 name=1301-SIAP-KGX-CIREBON vlan-id=1301
add interface=ether12 name=1302-SIAP-KGX-MAJALENGKA vlan-id=1302
add interface=ether12 name=1303-SIAP-KGX-JATIBARANG vlan-id=1303
add interface=ether12 name=1311-ADS-CAMAT-ARJASARI vlan-id=1311
add disabled=yes interface=ether12 name=2433-vlan-test vlan-id=2433
/ppp profile
set *0 only-one=yes
add bridge=Bridge-Rujie-Lab name=sstp-rujie use-encryption=no
set *FFFFFFFE only-one=yes
/queue simple
add max-limit=1G/1G name=ICMP packet-marks=ICMP target=""
add disabled=yes limit-at=10M/10M max-limit=10M/10M name=aston-canggu-bali \
    target=103.19.56.208/30
add max-limit=155M/155M name=Intercon target=103.19.56.128/30,103.19.56.72/29
add max-limit=10M/10M name=AGTI target=10.254.1.100/32
/routing bgp instance
add as=132637 client-to-client-reflection=no name=BITSNET router-id=\
    103.19.56.186
/routing ospf area
add area-id=0.0.0.6 disabled=yes name=area6
/routing ospf instance
set [ find default=yes ] redistribute-connected=as-type-2 \
    redistribute-static=as-type-2 router-id=10.0.0.13
/snmp community
set [ find default=yes ] addresses=103.19.56.0/22
add addresses=103.19.56.0/22 name=jakarta
/system logging action
set 3 remote=103.19.56.12
/user group
set read policy="local,telnet,ssh,read,test,winbox,web,sniff,sensitive,api,rom\
    on,tikapp,!ftp,!reboot,!write,!policy,!password,!dude"
set write policy="read,write,!local,!telnet,!ssh,!ftp,!reboot,!policy,!test,!w\
    inbox,!password,!web,!sniff,!sensitive,!api,!romon,!dude,!tikapp"
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
add name=NOC policy="local,telnet,ssh,reboot,read,test,winbox,password,web,sni\
    ff,sensitive,api,romon,tikapp,!ftp,!write,!policy,!dude"
add name=SPVNOC policy="local,telnet,ssh,reboot,read,write,test,winbox,passwor\
    d,web,sniff,sensitive,api,romon,tikapp,!ftp,!policy,!dude"
/interface bridge port
add bridge=Bridge-BTN-KC-BENGKULU interface=EoIP-BTN-KC-BENGKULU
add bridge=Bridge-BTN-KC-BENGKULU interface=1246-TRIGATRA-BKL
add bridge=Bridge-BTN-MEDAN-IM interface=EoIP-BTN-MEDAN-IM
add bridge=Bridge-BTN-MEDAN-IM interface=1247-TRIGATRA-MEDAN-IM
add bridge=Bridge-BTN-MEDAN-PEMUDA interface=1248-TRIGATRA-MEDAN-PEMUDA
add bridge=Bridge-BTN-MEDAN-PEMUDA interface=EoIP-BTN-MEDAN-PEMUDA
add bridge=Bridge-BTN-MADIUN interface=1249-TRIGATRA-MADIUN
add bridge=Bridge-BTN-MADIUN interface=EoIP-BTN-MADIUN
add bridge=Bridge-BTN-INDRAMAYU interface=EoIP-BTN-INDRAMAYU
add bridge=Bridge-BTN-INDRAMAYU interface=1250-TRIGATRA-INDRAMAYU
add bridge=Bridge-BTN-CIANJUR interface=1251-TRIGATRA-CIANJUR
add bridge=Bridge-BTN-CIANJUR interface=EoIP-BTN-CIANJUR
add bridge=Bridge-BTN-Tasik interface=EoIP-BTN-Tasik
add bridge=Bridge-BTN-Tasik interface=1252-TRIGATRA-TASIK
add bridge=Bridge-BTN-KC-PALEMBANG-SUDIRMAN interface=\
    EoIP-BTN-KC-PALEMBANG-SUDIRMAN
add bridge=Bridge-BTN-KC-PALEMBANG-SUDIRMAN interface=\
    1253-TRIGATRA-KC-PALEMBANG-SUDIRMAN
add bridge=Bridge-BTN-CIKAMPEK interface=EoIP-BTN-CIKAMPEK
add bridge=Bridge-BTN-CIKAMPEK interface=1254-TRIGATRA-CIKAMPEK
add bridge=Bridge-BTN-PALEMBANG-AHMAD-RIFAI interface=\
    1255-TRIGATRA-KCS-PALEMBANG-AHMAD-RIFAI
add bridge=Bridge-BTN-PALEMBANG-AHMAD-RIFAI interface=\
    EoIP-BTN-KCS-PALEMBANG-AHMAD-RIFAI
add bridge=Bridge-BTN-CIJERAH interface=EoIP-BTN-CIJERAH
add bridge=Bridge-BTN-CIJERAH interface="1256 -TRIGATRA-CIJERAH"
add bridge=Bridge-BTN-SUBANG interface=1257-TRIGATRA-SUBANG
add bridge=Bridge-BTN-SUBANG interface=EoIP-BTN-SUBANG
add bridge=Bridge-BTN-PURWAKARTA interface=1258-TRIGATRA-PURWAKARTA
add bridge=Bridge-BTN-PURWAKARTA interface=EoIP-BTN-PURWAKARTA
add bridge=Bridge-BTN-KCS-BENGKULU interface=EoIP-BTN-KCS-BENGKULU
add bridge=Bridge-BTN-KCS-BENGKULU interface=1259-TRIGATRA-BENGKULU-SYARIAH
add bridge=Bridge-BTN-PALEMBANG-VETERAN interface=\
    EoIP-BTN-KCPS-PALEMBANG-VETERAN
add bridge=Bridge-BTN-PALEMBANG-VETERAN interface=\
    1260-TRIGATRA-PALEMBANG-VETERAN
add bridge=Bridge-BTN-KC-CIREBON interface=1261-TRIGATRA-KC-CIREBON
add bridge=Bridge-BTN-KC-CIREBON interface="EoIP-BTN-KC CIREBON"
add bridge=Bridge-KGX-CIREBON interface=EoIP-KGX-CIREBON
add bridge=Bridge-KGX-CIREBON interface=1301-SIAP-KGX-CIREBON
add bridge=bridge-KGX-MAJALENGKA interface=1302-SIAP-KGX-MAJALENGKA
add bridge=bridge-KGX-JATIBARANG interface=1303-SIAP-KGX-JATIBARANG
add bridge=bridge-KGX-MAJALENGKA interface=EoIP-KGX-MAJALENGKA
add bridge=bridge-KGX-JATIBARANG interface=EoIP-KGX-JATIBARANG
add bridge=Bridge-AGTI-SURYALAYA-CIREBON interface=\
    1270-AGTI-SURYALAYA-CIREBON
add bridge=Bridge-AGTI-SURYALAYA-CIREBON interface=\
    1270-AGTI-SURYALAYA-CIREBON-DIST
add bridge=Bridge-ADS-ARJASARI interface=EoIP-CAMAT-ARJASARI
add bridge=Bridge-ADS-ARJASARI interface=1311-ADS-CAMAT-ARJASARI
/ip firewall connection tracking
set enabled=yes
/ip neighbor discovery-settings
set discover-interface-list=all
/interface l2tp-server server
set enabled=yes ipsec-secret=7895123ok max-mru=1500 max-mtu=1500 mrru=1600 \
    use-ipsec=yes
/interface pptp-server server
set authentication=pap,chap,mschap1,mschap2 enabled=yes mrru=1600
/interface sstp-server server
set enabled=yes
/ip address
add address=103.19.56.186/30 interface=513-TO-DISTRIBUSI-1-JUNOS network=\
    103.19.56.184
add address=10.254.14.57/30 interface=EoIP-BTN-MEDAN-IM network=10.254.14.56
add address=10.254.14.5/30 disabled=yes interface=EoIP-BTN-KC-BENGKULU \
    network=10.254.14.4
add address=10.254.14.61/30 interface=EoIP-BTN-MEDAN-PEMUDA network=\
    10.254.14.60
add address=10.254.14.13/30 interface=EoIP-BTN-MADIUN network=10.254.14.12
add address=10.254.14.17/30 disabled=yes interface=EoIP-BTN-INDRAMAYU \
    network=10.254.14.16
add address=10.254.14.21/30 interface=EoIP-BTN-CIANJUR network=10.254.14.20
add address=10.254.14.37/30 interface=EoIP-BTN-KCS-PALEMBANG-AHMAD-RIFAI \
    network=10.254.14.36
add address=10.254.14.33/30 interface=EoIP-BTN-CIKAMPEK network=10.254.14.32
add address=10.254.14.29/30 disabled=yes interface=\
    EoIP-BTN-KC-PALEMBANG-SUDIRMAN network=10.254.14.28
add address=10.254.14.41/30 interface=EoIP-BTN-CIJERAH network=10.254.14.40
add address=10.254.14.45/30 interface="EoIP-BTN-KC CIREBON" network=\
    10.254.14.44
add address=10.254.14.49/30 interface=EoIP-BTN-PURWAKARTA network=\
    10.254.14.48
add address=10.0.0.13 interface=loopback network=10.0.0.13
add address=10.254.14.65/30 interface=EoIP-BTN-KCS-BENGKULU network=\
    10.254.14.64
add address=172.16.101.25/30 comment=BACKUP-PTSELIM interface=\
    EoIP-BACKUP-PTSELIM network=172.16.101.24
add address=10.254.14.69/30 interface=EoIP-BTN-KCPS-PALEMBANG-VETERAN \
    network=10.254.14.68
add address=172.16.101.41/30 interface="EoIP-Aston Canggu Via Telkom" \
    network=172.16.101.40
add address=192.192.192.1/30 comment="IP TENDA CDC" interface=ether1 network=\
    192.192.192.0
add address=10.254.7.9/30 comment=MGT-SW-CDC interface=ether2 network=\
    10.254.7.8
add address=10.210.1.119 disabled=yes interface=gre-tunnel1-RAPID-TELKOM \
    network=10.210.1.118
add address=10.195.11.4/29 interface=1302-SIAP-KGX-MAJALENGKA network=\
    10.195.11.0
add address=10.254.165.1/29 interface=1301-SIAP-KGX-CIREBON network=\
    10.254.165.0
add address=10.254.14.25/30 interface=EoIP-BTN-Tasik network=10.254.14.24
add address=192.168.192.1/29 interface=1303-SIAP-KGX-JATIBARANG network=\
    192.168.192.0
add address=10.100.150.1/29 interface=Bridge-BTN-Tasik network=10.100.150.0
add address=10.192.11.4 interface=1302-SIAP-KGX-MAJALENGKA network=\
    10.192.11.4
/ip dns
set servers=103.19.56.10,103.19.56.11
/ip firewall filter
add action=drop chain=input src-address=37.49.231.0/24
add action=drop chain=input src-address=180.254.36.192
add action=drop chain=forward comment=\
    "1. Dont disable/delete please, blok spammer" dst-port=25 protocol=tcp
add action=drop chain=forward comment=\
    "2. Dont disable/delete please, blok spammer" dst-port=25 protocol=udp
add action=drop chain=forward comment="Malware Ransomware Type WannaCRY" \
    dst-port=137-139,445 protocol=tcp
add action=drop chain=forward dst-port=137-139,445 protocol=udp
add action=drop chain=input comment="Drop Flooding DNS IN TO ROUTER" \
    dst-port=53,853,5353 protocol=tcp
add action=drop chain=input dst-port=53,853,5353 protocol=udp
add action=drop chain=forward comment=\
    "DROP FLOODING DNS DESTINATION IP MITRA" dst-address-list=ip-mitra \
    dst-port=53,853,5353,8080 protocol=tcp
add action=drop chain=forward dst-address-list=ip-mitra dst-port=\
    53,853,5353,8080 protocol=udp
add action=drop chain=forward comment="Drop ru-cn" src-address-list=ru-cn
add action=drop chain=forward comment=________ dst-port=593 protocol=tcp
add action=drop chain=forward comment=________ dst-port=1024-1030 protocol=\
    tcp
add action=drop chain=forward comment="Drop MyDoom" dst-port=1080 protocol=\
    tcp
add action=drop chain=forward comment=________ dst-port=1214 protocol=tcp
add action=drop chain=forward comment="ndm requester" dst-port=1363 protocol=\
    tcp
add action=drop chain=forward comment="ndm server" dst-port=1364 protocol=tcp
add action=drop chain=forward comment="screen cast" dst-port=1368 protocol=\
    tcp
add action=drop chain=forward comment=hromgrafx dst-port=1373 protocol=tcp
add action=drop chain=forward comment=cichlid dst-port=1377 protocol=tcp
add action=drop chain=forward comment="Bagle Virus" dst-port=2745 protocol=\
    tcp
add action=drop chain=forward comment=Dumaru.Y dst-port=2283 protocol=tcp
add action=drop chain=forward comment=Beagle dst-port=2535 protocol=tcp
add action=drop chain=forward comment=Beagle.C-K dst-port=2745 protocol=tcp
add action=drop chain=forward comment=MyDoom dst-port=3127-3128 protocol=tcp
add action=drop chain=forward comment="Backdoor OptixPro" dst-port=3410 \
    protocol=tcp
add action=drop chain=forward comment="Drop Sasser" dst-port=5554 protocol=\
    tcp
add action=drop chain=forward comment="Drop Beagle.B" dst-port=8866 protocol=\
    tcp
add action=drop chain=forward comment="Drop Dabber.A-B" dst-port=9898 \
    protocol=tcp
add action=drop chain=forward comment="Drop Dumaru.Y" dst-port=10000 \
    protocol=tcp
add action=drop chain=forward comment="Drop MyDoom.B" dst-port=10080 \
    protocol=tcp
add action=drop chain=forward comment="Drop NetBus" dst-port=12345 protocol=\
    tcp
add action=drop chain=forward comment="Drop Kuang2" dst-port=17300 protocol=\
    tcp
add action=drop chain=forward comment="Drop SubSeven" dst-port=27374 \
    protocol=tcp
add action=drop chain=forward comment="Drop PhatBot,Agobot, Gaobot" dst-port=\
    65506 protocol=tcp
add action=drop chain=forward comment=Trinoo dst-port=12667 protocol=udp
add action=drop chain=forward comment=Trinoo dst-port=27665 protocol=udp
add action=drop chain=forward comment=Trinoo dst-port=31335 protocol=udp
add action=drop chain=forward comment=Trinoo dst-port=27444 protocol=udp
add action=drop chain=forward comment=Trinoo dst-port=34555 protocol=udp
add action=drop chain=forward comment=Trinoo dst-port=35555 protocol=udp
add action=drop chain=forward comment=Trinoo dst-port=27444 protocol=tcp
add action=drop chain=forward comment=Trinoo dst-port=27665 protocol=tcp
add action=drop chain=forward comment=Trinoo dst-port=31335 protocol=tcp
add action=drop chain=forward comment=Trinoo dst-port=31846 protocol=tcp
add action=drop chain=forward comment=Trinoo dst-port=34555 protocol=tcp
add action=drop chain=forward comment=Trinoo dst-port=35555 protocol=tcp
add action=drop chain=forward comment=";;Block W32.Kido - Conficker" \
    protocol=udp src-port=135-139,445
add action=drop chain=forward dst-port=135-139,445 protocol=udp
add action=drop chain=forward protocol=tcp src-port=135-139,445,593
add action=drop chain=forward dst-port=135-139,445,593 protocol=tcp
add action=accept chain=input comment="Allow limited pings" limit=\
    50/5s,2:packet protocol=icmp
add action=accept chain=input limit=50/5s,2:packet protocol=icmp
add action=add-src-to-address-list address-list=port_scanners \
    address-list-timeout=4w2d chain=input comment=\
    "Add TCP Port Scanners to List" protocol=tcp psd=21,3s,3,1
add action=add-src-to-address-list address-list=port_scanners \
    address-list-timeout=4w2d chain=input comment="TCP FIN Stealth scan" \
    protocol=tcp tcp-flags=fin,!syn,!rst,!psh,!ack,!urg
add action=add-src-to-address-list address-list=port_scanners \
    address-list-timeout=4w2d chain=input comment="TCP FIN/PSH/URG scan" \
    protocol=tcp tcp-flags=fin,psh,urg,!syn,!rst,!ack
add action=add-src-to-address-list address-list=port_scanners \
    address-list-timeout=4w2d chain=input comment="ALL/ALL TCP Scan" \
    protocol=tcp tcp-flags=fin,syn,rst,psh,ack,urg
add action=add-src-to-address-list address-list=port_scanners \
    address-list-timeout=4w2d chain=input comment="TCP SYN/RST scan" \
    protocol=tcp tcp-flags=syn,rst
add action=add-src-to-address-list address-list=port_scanners \
    address-list-timeout=4w2d chain=input comment="TCP NULL scan" protocol=\
    tcp tcp-flags=!fin,!syn,!rst,!psh,!ack,!urg
add action=drop chain=input comment="Drop All Port Scanners" \
    src-address-list=port_scanners
/ip firewall mangle
add action=mark-packet chain=output new-packet-mark=ICMP passthrough=no \
    protocol=icmp
add action=mark-packet chain=prerouting new-packet-mark=ICMP passthrough=no \
    protocol=icmp
/ip firewall nat
add action=dst-nat chain=dstnat dst-address=103.19.56.186 dst-port=7420 \
    protocol=tcp to-addresses=10.254.1.200 to-ports=8291
add action=src-nat chain=srcnat comment="NAT dist-patrol Candra" src-address=\
    10.254.1.30 to-addresses=103.19.56.186
add action=src-nat chain=srcnat comment="NAT TGI BDG untuk akses remot" \
    src-address=10.254.1.44 to-addresses=103.19.56.186
add action=src-nat chain=srcnat comment="NAT BTN CIANJUR untuk akses remot" \
    src-address=10.254.14.20/30 to-addresses=103.19.56.186
add action=src-nat chain=srcnat comment="NAT TENDA CDC untuk wifi di cdc" \
    src-address=192.192.192.0/30 to-addresses=103.19.56.186
add action=dst-nat chain=dstnat comment="redirect dns 1 to dns 2" \
    dst-address=103.19.56.2 dst-port=53 nth=2,1 protocol=udp to-addresses=\
    9.9.9.9 to-ports=53
add action=dst-nat chain=dstnat comment="redirect dns 1 to dns 2" \
    dst-address=103.19.56.3 dst-port=53 protocol=udp to-addresses=\
    149.112.112.112 to-ports=53
add action=dst-nat chain=dstnat dst-address=103.19.56.186 dst-port=5555 \
    protocol=tcp to-addresses=103.19.59.173 to-ports=8291
/ip ipsec policy
set 0 dst-address=0.0.0.0/32 src-address=0.0.0.0/32
/ip route
add distance=1 gateway=103.19.56.185
add comment="Route to Aston Via Telkom" distance=111 dst-address=\
    103.19.56.208/30 gateway=172.16.101.42
add check-gateway=ping comment="Route Backup To Fengtay Bandung" distance=109 \
    dst-address=103.19.57.176/29 gateway=10.254.1.2
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
set enabled=no touch-screen=disabled
/ppp secret
add comment="AGUS WIYANTO - BKL" disabled=yes local-address=10.254.1.1 name=\
    10000000044 password=AGUS-WIYANTO remote-address=103.19.58.182
add comment="BAMBANG AGUSTIAWAN - BKL" local-address=10.254.1.1 name=\
    10000000045 password=BAMBANG-AGUSTIAWAN remote-address=103.19.58.136
add comment="CURUP - BKL" local-address=10.254.1.1 name=10000000058 password=\
    CURUP remote-address=103.19.58.131
add comment=dist-patrol local-address=10.254.1.1 name=dist-patrol password=\
    dist-patrol remote-address=10.254.1.30
add comment="HERI-SETIAWAN - BKL" local-address=10.254.1.1 name=10000000046 \
    password=HERI-SETIAWAN remote-address=103.19.58.137
add comment="BKL FERY" local-address=10.254.1.1 name=100000000149 password=\
    FERY-BKL remote-address=103.19.58.130
add comment="BKL TABATERET" disabled=yes local-address=10.254.1.1 name=\
    10000000050 password=TABATERET-BKL remote-address=103.19.58.128
add comment="BKL AAN " local-address=10.254.1.1 name=100000000150 password=\
    AAN-VELAWZI remote-address=103.19.58.129
add comment="BTN-MEDAN IM" local-address=10.254.1.1 name=btn-medanim \
    password=btn-medanim remote-address=10.254.1.31
add comment=BTN-CIANJUR local-address=10.254.1.1 name=btn-cianjur password=\
    btn-cianjur remote-address=10.254.1.32
add comment=BTN-MEDAN-PEMUDA local-address=10.254.1.1 name=btn-medan-pemuda \
    password=btn-medan-pemuda remote-address=10.254.1.33
add comment=BTN-PALEMBANG-VETERAN disabled=yes local-address=10.254.1.1 name=\
    btn-palembang-veteran password=btn-palembang-veteran remote-address=\
    10.254.1.34
add comment=BTN-KC-PALEMBANG-SUDIRMAN disabled=yes local-address=10.254.1.1 \
    name=btn-palembang-sudirman password=btn-palembang-sudirman \
    remote-address=10.254.1.35
add comment="KN SIGMA KAMPUNG KALI" disabled=yes local-address=10.254.1.1 \
    name=knsigma-kampungkali password=knsigma-kampungkali remote-address=\
    10.254.1.36
add comment="KN SIGMA GUDANG" local-address=10.254.1.1 name=knsigma-gudang \
    password=knsigma-gudang remote-address=10.254.1.37
add comment="BTN BENGKULU" local-address=10.254.1.1 name=btn-kc_bengkulu \
    password=btn-kc_bengkulu remote-address=10.254.1.38
add comment="BTN MADIUN" local-address=10.254.1.1 name=btn-madiun password=\
    btn-madiun remote-address=10.254.1.39
add comment=CORDELLA local-address=10.254.1.1 name=mrtg-cordela password=\
    mrtg-cordela remote-address=10.254.1.40
add comment="BTN KCS BKL" local-address=10.254.1.1 name=btn-kcs-bkl password=\
    btn-kcs-bkl remote-address=10.254.1.41
add local-address=10.254.1.1 name=PTSELIM password=selim2020 remote-address=\
    10.254.1.19
add local-address=10.254.1.1 name=AMARISBEKASI password=7895123 \
    remote-address=10.254.1.7
add local-address=10.254.1.1 name=HOTEL-ASTON password=2019 remote-address=\
    10.254.1.20
add comment=BTN-PALEMBANG-VETERAN local-address=10.254.1.1 name=\
    btn-palembang-syariah password=btn-palembang-syariah remote-address=\
    10.254.1.42
add comment="Btn - Kc Cirebon" local-address=10.254.1.1 name=btn-cirebon \
    password=btn-cirebon remote-address=10.254.1.43
add comment="TGI - BANDUNG" local-address=10.254.1.1 name=telering-akses \
    password=tgibdg2020 remote-address=10.254.1.44
add comment="CANGGU-BALI / DISABLE JIKA LDP dan ICON AKTIF" local-address=\
    10.254.1.1 name=CANGGU-BALI password=ASTON-CANGGU-BALI remote-address=\
    10.254.1.51
add comment=BTN-PALEMBANG-AHMAD-RIFAI local-address=10.254.1.1 name=btn-rifai \
    password=btn-rifai remote-address=10.254.1.45
add comment="BACKUP FENGTAY VIA INTEGRASIA" local-address=10.254.1.1 name=\
    fengtay-bdg password=fengtay@bdg remote-address=10.254.1.2
add local-address=10.254.1.1 name=BTN-CIJERAH password=BTN-CIJERAH \
    remote-address=10.254.1.46
add comment=BTN-PURWAKARTA local-address=10.254.1.1 name=btn-purwakarta \
    password=btn-purwakarta remote-address=10.254.1.47
add local-address=10.254.1.1 name=btntasik password=btntasik remote-address=\
    10.254.1.52
add comment="BTN-MEDAN IM" local-address=10.254.1.1 name=btn-tasik password=\
    btn-tasik remote-address=10.254.1.34
add comment="KGX Cirebon" local-address=10.254.1.1 name=kgx-cirebon password=\
    kgx-cirebon remote-address=10.254.1.54
add local-address=10.254.1.1 name=mpls password=mpls remote-address=\
    10.254.1.100
add comment=NGANJUK local-address=10.254.1.1 name=Nganjuk password=7895123ok \
    remote-address=103.19.59.179
add comment="KGX Majalengka" local-address=10.254.1.1 name=kgx-majalengka \
    password=kgx-majalengka remote-address=10.254.1.55
add comment="KGX Jatibarang" local-address=10.254.1.1 name=kgx-jatibarang \
    password=kgx-jatibarang remote-address=10.254.1.56
add comment="KGX Jatibarang" local-address=10.254.1.1 name=bmt-backup \
    password=bmt-backup remote-address=10.254.1.57
add comment="KGX Jatibarang" local-address=10.254.1.1 name=arjasari password=\
    arjasari remote-address=10.254.1.58
add local-address=10.254.1.1 name=BJB password=BJB remote-address=\
    10.254.1.200
add comment=BTN-PURWAKARTA local-address=10.254.1.1 name=balmon-p-kuda \
    password=balmon-p-kuda remote-address=10.254.1.48
/routing bgp network
add network=103.19.56.0/24 synchronize=no
add network=103.19.57.0/24 synchronize=no
add network=103.19.58.0/24 synchronize=no
add network=103.19.59.0/24 synchronize=no
add network=103.143.244.0/24 synchronize=no
add network=103.143.245.0/24 synchronize=no
/routing bgp peer
add disabled=yes instance=BITSNET name=RAPID-TELKOM remote-address=\
    10.210.1.118 remote-as=141137 remove-private-as=yes
/routing filter
add action=discard chain=ospf-in prefix=192.168.0.0/16 prefix-length=16-32
add action=discard chain=ospf-in prefix=103.80.236.0/22 prefix-length=22-32
add action=discard chain=ospf-in prefix=103.95.8.0/22 prefix-length=22-32
add action=discard chain=ospf-in prefix=103.119.228.0/22 prefix-length=22-32
add action=discard chain=ospf-in prefix=103.122.152.0/22 prefix-length=22-32
add action=discard chain=ospf-in prefix=103.227.144.0/22 prefix-length=22-32
add action=discard chain=ospf-in prefix=103.242.104.0/22 prefix-length=22-32
add action=discard chain=ospf-out prefix=192.168.0.0/16 prefix-length=16-32
add action=accept chain=eBGP-RAPID-OUT prefix=103.19.56.0/24 prefix-length=24
add action=accept chain=eBGP-RAPID-OUT prefix=103.19.57.0/24 prefix-length=24
add action=accept chain=eBGP-RAPID-OUT prefix=103.19.58.0/24 prefix-length=24
add action=accept chain=eBGP-RAPID-OUT prefix=103.19.59.0/24 prefix-length=24
add action=accept chain=eBGP-RAPID-OUT prefix=103.143.244.0/24 prefix-length=\
    24
add action=accept chain=eBGP-RAPID-OUT prefix=103.143.245.0/24 prefix-length=\
    24
add action=accept chain=eBGP-RAPID-OUT disabled=yes prefix=202.46.80.0/22 \
    prefix-length=22
add action=accept chain=eBGP-RAPID-OUT disabled=yes prefix=103.105.142.0/24 \
    prefix-length=24
add action=discard chain=eBGP-RAPID-OUT
add action=discard chain=eBGP-RAPID-IN prefix=103.19.56.0/22 prefix-length=\
    22-24
add action=discard chain=eBGP-RAPID-IN prefix=103.143.244.0/23 prefix-length=\
    23-24
add action=discard chain=eBGP-RAPID-IN disabled=yes prefix=202.158.8.0/22 \
    prefix-length=22-24
add action=accept chain=eBGP-RAPID-IN set-bgp-local-pref=250
/routing ospf interface
add cost=300 interface=513-TO-DISTRIBUSI-1-JUNOS network-type=point-to-point
/routing ospf network
add area=backbone network=103.19.56.184/30
add area=backbone network=10.0.0.13/32
/snmp
set contact=noc@bitsnet.id enabled=yes location="mpls jakarta" \
    trap-community=jakarta trap-generators="" trap-version=2
/system clock
set time-zone-name=Asia/Jakarta
/system identity
set name=mpls.bitsnet.id
/system logging
add action=remote topics=critical
add action=remote topics=error
add action=remote topics=info
add action=remote topics=warning
/system note
set note="Konfigurasi telah dicadangkan pada 6 Maret 2019 by Noc@bits.net.id"
/system ntp client
set enabled=yes primary-ntp=103.19.56.5 secondary-ntp=202.162.32.12 \
    server-dns-names=1.1.1.1
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
    start-date=jan/05/2022 start-time=01:00:00
/system script
add dont-require-permissions=yes name=intercon-backup-down owner=bitsnet \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source=":if ([/ip address get [/ip address find comment=\"backup-intercon\
    \"] disabled]=yes) do={/ip address enable [/ip address find comment=\"back\
    up-intercon\"]} else={/ip address disable [/ip address find comment=\"back\
    up-intercon\"]}"
add dont-require-permissions=yes name=intercon-backup-up owner=bitsnet \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    source=":if ([/ip address get [/ip address find comment=\"backup-intercon\
    \"] disabled]=yes) do={/ip address enable [/ip address find comment=\"back\
    up-intercon\"]}"
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
/tool netwatch
add comment="DON'T-EDIT/DISABLE-FOR-INTERCONTINENTAL" down-script=\
    intercon-backup-down host=8.8.8.8 interval=10s up-script=\
    intercon-backup-up
