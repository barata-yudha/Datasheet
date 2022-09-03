# sep/03/2022 11:48:01 by RouterOS 6.47.9
# software id = YWWR-SKF6
#
# model = CCR1036-8G-2S+
# serial number = D8370CB2B0B2
/interface bridge
add fast-forward=no name=loopback
/interface ethernet
set [ find default-name=ether1 ] comment=TO-ROUTER-LAB-2011
set [ find default-name=ether2 ] comment=BACKBONE-GOESAR
set [ find default-name=ether6 ] comment="TO NEXUS TO VPS CRB"
set [ find default-name=ether7 ] comment="TO OFFICE"
set [ find default-name=sfp-sfpplus1 ] comment=TO-NEXUS
set [ find default-name=sfp-sfpplus2 ] comment=TRUNK-TO-NEXUS
/interface ipip
add !keepalive local-address=103.19.56.151 name="tun03-albahjah(backup)" \
    remote-address=10.5.2.50
add allow-fast-path=no !keepalive local-address=103.19.56.151 mtu=1500 name=\
    tun04-gronggong-backup-cambium remote-address=10.10.10.235
add !keepalive local-address=103.19.56.151 name=tun05-lebakngok \
    remote-address=10.4.3.2
/interface vlan
add interface=sfp-sfpplus2 name=40-AP-GRONGGONG vlan-id=40
add interface=sfp-sfpplus2 name=42-GRG-NIAM vlan-id=42
add interface=sfp-sfpplus2 name=43-GRG-CMW vlan-id=43
add interface=sfp-sfpplus2 name=44-GRG-SILIHASAH vlan-id=44
add interface=sfp-sfpplus2 name=45-GRG-DANALAMPAH vlan-id=45
add interface=sfp-sfpplus2 name=46-GRG-ALBAHJAHTV vlan-id=46
add interface=sfp-sfpplus2 name=47-GRG-SAPADIA vlan-id=47
add interface=sfp-sfpplus2 name=48-GRG-JASAMARGA vlan-id=48
add interface=sfp-sfpplus2 name=49-GRG-KBL vlan-id=49
add interface=sfp-sfpplus2 name=50-GRG-CEMPAKA vlan-id=50
add interface=sfp-sfpplus2 name=51-GRG-BAKUNG vlan-id=51
add interface=sfp-sfpplus2 name=52-GRG-ITB-AWN vlan-id=52
add interface=sfp-sfpplus2 name=53-GRG-CIRSEL vlan-id=53
add interface=sfp-sfpplus2 name=55-GRG-SUTAN-RAJA vlan-id=55
add interface=sfp-sfpplus2 name=56-GRG-BAHAMA vlan-id=56
add interface=sfp-sfpplus2 name=57-GRG-KARANTINA vlan-id=57
add interface=sfp-sfpplus2 name=58-GRG-RADIOQU vlan-id=58
add interface=sfp-sfpplus2 name=59-GRG-ASTON vlan-id=59
add interface=sfp-sfpplus2 name=60-MONITORING-LISTRIK vlan-id=60
add interface=sfp-sfpplus2 name=61-GRG-MITRA10 vlan-id=61
add interface=sfp-sfpplus2 name=62-GRG-CENDANA vlan-id=62
add interface=sfp-sfpplus2 name=63-GRG-AKPER vlan-id=63
add interface=sfp-sfpplus2 name=64-GRG-BALMON vlan-id=64
add interface=sfp-sfpplus2 name=65-MGT-CERAGON-PURI vlan-id=65
add interface=sfp-sfpplus2 name=90-MGT-SW-DKIS vlan-id=90
add interface=sfp-sfpplus2 name=91-MGT-SW-PURI vlan-id=91
add interface=sfp-sfpplus2 name=92-MGT-SW-HP-GRG vlan-id=92
add interface=sfp-sfpplus2 name=93-MGT-RO-IPTV vlan-id=93
add interface=sfp-sfpplus2 name=94-MGT-SW-SD-GUNTUR vlan-id=94
add interface=sfp-sfpplus2 name=98-MGT-SWITCH-MTH vlan-id=98
add interface=sfp-sfpplus2 name=99-MGT-SWITCH-CRS-BTS-OFFICE vlan-id=99
add interface=sfp-sfpplus2 name=100-MGT-SW-NEXUS vlan-id=100
add interface=ether6 name=101-MGT-VPS-CRB vlan-id=101
add interface=ether6 name=102-LOCAL-VPS-CRB vlan-id=102
add interface=sfp-sfpplus2 name=103-PT-KEJAR vlan-id=103
add interface=sfp-sfpplus2 name=104-KAPETAKAN vlan-id=104
add interface=sfp-sfpplus2 name=105-AP-PURI vlan-id=105
add interface=sfp-sfpplus2 name=106-RB-MON-PURI vlan-id=106
add interface=sfp-sfpplus2 name=107-MGT-SERVER-DELL vlan-id=107
add interface=sfp-sfpplus2 name=108-IP-PRIVATE-VPS-DELL vlan-id=108
add interface=sfp-sfpplus1 name=150-IP-MTIK-VPS-CRB vlan-id=150
add interface=sfp-sfpplus1 name=151-IP-PUBLIK-VPS-CRB vlan-id=151
add interface=sfp-sfpplus1 name=152-IP-PRIVATE-VPS-CRB vlan-id=152
add interface=sfp-sfpplus2 name=200-MGT-AP-OFFICE vlan-id=200
add interface=sfp-sfpplus2 name=202-OFFICE-BPR-BACKUP vlan-id=202
add interface=sfp-sfpplus2 name=208-OFFICE-CADASNGAMPAR vlan-id=208
add interface=sfp-sfpplus2 name=210-CDH-ALBAHJAH-AULA-BACKUP vlan-id=210
add comment=BMT interface=ether2 name=217-DIST-ALBAHJAH-FIX vlan-id=217
add interface=sfp-sfpplus2 name=222-OFFICE-AMARISHOTEL vlan-id=222
add interface=sfp-sfpplus2 name=232-OFFICE-BPR-BEBER vlan-id=232
add interface=sfp-sfpplus2 name=233-GRG-KARANTINA vlan-id=233
add interface=sfp-sfpplus2 name=235-OFFICE-TELERING vlan-id=235
add interface=sfp-sfpplus2 name=240-OFFICE-GRONGGONG vlan-id=240
add interface=ether2 name=242-GOESAR-AMARISHOTEL vlan-id=242
add interface=sfp-sfpplus2 name=244-OFFICE-SUMURWUNI vlan-id=244
add interface=sfp-sfpplus2 name=245-MGT-OLT-BITSNET vlan-id=245
add interface=sfp-sfpplus2 name=246-MGT-C300 vlan-id=246
add interface=sfp-sfpplus2 name=248-OFFICE-TSM vlan-id=248
add interface=ether2 name=250-GOESAR-AL-BAHJAH-TV vlan-id=250
add interface=ether2 name=251-GOESAR-AKPER vlan-id=251
add interface=ether2 name=252-GOESAR-BENTANI vlan-id=252
add interface=ether2 name=259-GOESAR-METLANDHOTEL vlan-id=259
add interface=ether2 name=260-GOESAR-BTN-KC-CIREBON vlan-id=260
add interface=ether2 name=267-GOESAR-BOD-SUNYARAGI vlan-id=267
add interface=ether2 name=268-ITB-WATUBELAH vlan-id=268
add interface=sfp-sfpplus2 name=269-SURYALAYA vlan-id=269
add interface=sfp-sfpplus2 name=401-ASTON-CRB vlan-id=401
add interface=sfp-sfpplus2 name=402-TELERING vlan-id=402
add interface=sfp-sfpplus2 name=403-TIKI vlan-id=403
add interface=sfp-sfpplus2 name=404-OMAN vlan-id=404
add interface=sfp-sfpplus2 name=405-IVAN-SUSANTO vlan-id=405
add interface=sfp-sfpplus2 name=406-BENTANI-BITS vlan-id=406
add interface=sfp-sfpplus2 name=407-METLAND-NEW vlan-id=407
add interface=sfp-sfpplus2 name=408-AMARIS-HOTEL-CRB vlan-id=408
add interface=sfp-sfpplus2 name=409-MITRA10 vlan-id=409
add interface=sfp-sfpplus2 name=410-BBWS-CRB vlan-id=410
add interface=sfp-sfpplus2 name="411-KELOLA-JASA-ARTHA(KEJAR)" vlan-id=411
add interface=sfp-sfpplus2 name=412-INTERNATIONAL-MITRA-FUTURES vlan-id=412
add disabled=yes interface=sfp-sfpplus2 name=516-MGT-DIST3-JKT vlan-id=516
add interface=sfp-sfpplus2 name=601-FNA-PSAT vlan-id=601
add interface=sfp-sfpplus2 name=615-TIS-TSM vlan-id=615
add interface=sfp-sfpplus2 name=616-TIS-JASAMARGA vlan-id=616
add interface=sfp-sfpplus2 name=710-KERTASMAYA vlan-id=710
add interface=sfp-sfpplus2 name=711-KERTASMAYA vlan-id=711
add interface=sfp-sfpplus2 name=793-MGT-IDU-CDH vlan-id=793
add interface=sfp-sfpplus2 name=796-MGT-CERA-IMY-RIONET vlan-id=796
add interface=sfp-sfpplus2 name=800-MW-GRG-HUAWEI vlan-id=800
add interface=sfp-sfpplus2 name=807-DIST-ASJAP vlan-id=807
add interface=sfp-sfpplus2 name=907-MGT-OLT-PURI vlan-id=907
add interface=sfp-sfpplus2 name=1200-AGENG-MTH vlan-id=1200
add interface=sfp-sfpplus2 name=1202-YOGI-MTH vlan-id=1202
add interface=sfp-sfpplus2 name="1203 - POS-SATPAM" vlan-id=1203
add interface=sfp-sfpplus2 name=1204-CCTV-MTH vlan-id=1204
add interface=sfp-sfpplus1 name=1510-UPLINK-FIBERSTAR vlan-id=1510
add interface=sfp-sfpplus1 name=1513-UPLINK-IFORTE vlan-id=1513
add interface=sfp-sfpplus2 name=2001-DKIS-BROADBAND vlan-id=2001
add interface=sfp-sfpplus2 name=2003-FNA-SBP vlan-id=2003
add interface=sfp-sfpplus2 name=2004-DKIS-SUDARSONO-LOCALLOOP vlan-id=2004
add interface=sfp-sfpplus2 name=2010-BYPASS-DEDICATED-IX-IIX vlan-id=2010
add interface=sfp-sfpplus1 name=3000-FNA-NODE-CIREBON vlan-id=3000
add interface=sfp-sfpplus2 name=3333-VLAN-BOD vlan-id=3333
add interface=sfp-sfpplus2 name=3334-VLAN-TEST-ONT vlan-id=3334
add interface=sfp-sfpplus2 name=3335-REMOTE-ONU vlan-id=3335
add interface=sfp-sfpplus1 name=3503-DIST-CRB-TO-BROADBAND vlan-id=3503
add interface=sfp-sfpplus1 name=3705-UPLINK-IFORTE-FBC vlan-id=3705
add interface=sfp-sfpplus1 name=3706-UPLINK-FIBERSTAR-FBC vlan-id=3706
add interface=sfp-sfpplus2 name=3801-UNIFI-PURI vlan-id=3801
add interface=sfp-sfpplus2 name=3802-CCTV-PURI vlan-id=3802
/interface list
add name=backbone
add name=BACKBONE-BAKCUP
/ip pool
add name=dhcp_pool0 ranges=10.10.10.50-10.10.10.54
add name=dhcp_pool1 ranges=10.253.5.2-10.253.5.254
add name=dhcp_pool2 ranges=10.203.0.131-10.203.0.254
add name=dhcp_pool3 ranges=10.203.0.131-10.203.0.254
add name=dhcp_pool4 ranges=10.202.0.130-10.202.0.254
/ip dhcp-server
add address-pool=dhcp_pool1 disabled=no interface=3801-UNIFI-PURI name=dhcp1
add address-pool=dhcp_pool3 disabled=no interface=108-IP-PRIVATE-VPS-DELL \
    name=dhcp2
add address-pool=dhcp_pool4 disabled=no interface=102-LOCAL-VPS-CRB name=\
    dhcp3
/queue simple
add disabled=yes max-limit=20M/20M name=\
    "DEDICATED - Corporate Akper Muhammadiyah" target=103.19.57.18/32
add disabled=yes max-limit=10M/10M name="DEDICATED - SURYALAYA" target=\
    103.19.57.36/32
add disabled=yes max-limit=10M/10M name="DEDICATED - Corporate Al Bahjah TV" \
    target=103.19.57.12/32
add disabled=yes max-limit=50M/50M name="DEDICATED - DISTRIBUSI-BPR" target=\
    103.19.57.15/32
add disabled=yes max-limit=10M/10M name=\
    "DEDICATED - Corporate Al Bahjah TV ( AULA )" target=103.19.57.13/32
add disabled=yes max-limit=50M/50M name="DEDICATED - Corporate BBWS" target=\
    103.19.56.200/29
add disabled=yes max-limit=50M/50M name=\
    "DEDICATED - Corporate BPR Astanajapura" target=103.19.57.6/32
add disabled=yes max-limit=20M/20M name=\
    "DEDICATED - Corporate Brantas Abipraya" priority=1/1 target=\
    103.19.57.80/30
add disabled=yes max-limit=10M/10M name="DEDICATED - Corporate Dirgantara" \
    target=103.19.57.140/30
add disabled=yes limit-at=5M/5M max-limit=10M/10M name=\
    "DEDICATED - Corporate Iwi Ltd, PT. Korindo" target=103.19.57.32/32
add disabled=yes max-limit=20M/20M name="DEDICATED - Corporate Jasamarga" \
    target=103.19.57.76/30
add disabled=yes max-limit=20M/20M name="DEDICATED - Corporate Karantina" \
    target=103.19.57.218/32
add max-limit=15M/15M name="DEDICATED - Corporate Kejar" target=\
    103.19.57.30/32
add disabled=yes max-limit=15M/15M name=\
    "DEDICATED - Corporate PT Anugrah Gerbang Emas" target=103.19.57.34/32
add disabled=yes max-limit=20M/20M name="DEDICATED - Corporate Telering" \
    target=103.19.57.116/30
add disabled=yes max-limit=5M/5M name="DEDICATED - Corporate Titipan Kilat" \
    target=103.19.57.26/32
add max-limit=60M/60M name=BOD-ASTON-ONYX-ROOM target=172.16.1.0/30
add disabled=yes max-limit=3M/3M name="Customer PDA " target=\
    172.16.3.16/30,172.16.3.20/30
add max-limit=50M/50M name="SOHO Customer Subagja" target=172.16.2.80/30
add disabled=yes max-limit=400M/400M name="DEDICATED - Goverment DKIS Bypass" \
    target=103.19.58.128/30
add comment="BOD 50 | Current BW 40" max-limit=50M/50M name=\
    "DEDICATED - Hotel Amaris Cirebon" target=103.19.57.240/30
add max-limit=20M/20M name=RB-MONITORING-LISTRIK-KERTASMAYA target=\
    172.16.1.36/30
add max-limit=105M/105M name=MITRA-FUTURES target=172.16.1.80/29
add disabled=yes max-limit=25M/25M name="DEDICATED - Corporate TSM" target=\
    103.19.57.22/32
add disabled=yes max-limit=2M/2M name="DEDICATED - ISP Cendana" target=\
    103.19.57.112/30
add disabled=yes dst=10.254.6.0/24 max-limit=1G/1G name="Office To GNS3" \
    target=103.19.57.146/32
add disabled=yes dst=10.202.0.10/32 max-limit=1G/1G name="Office To VPS CRB" \
    target=103.19.57.146/32
add disabled=yes dst=103.19.56.0/27 max-limit=1G/1G name="Office To VPS JKT" \
    priority=1/1 target=103.19.57.146/32 total-priority=1
add disabled=yes max-limit=100M/100M name="Office To INTERNET" target=\
    103.19.57.146/32
add max-limit=20M/20M name="SOHO 5M - PENDIDIKAN" target=\
    172.16.2.168/30,172.16.2.20/30,172.16.2.16/30,172.16.2.200/30
add burst-limit=50M/50M burst-threshold=19M/19M burst-time=1m30s/1m30s \
    disabled=yes max-limit=20M/20M name="DEDICATED - Radio Qu" target=\
    103.19.57.20/32
add max-limit=15M/15M name="SOHO 5M GROUP-1" target=\
    172.16.2.4/30,172.16.2.92/30,172.16.2.84/30
add max-limit=40M/40M name="SOHO 30M GROUP-1" target=172.16.1.212/30
add max-limit=150M/150M name="SOHO 10M GROUP-1" target=\
    103.19.57.25/32,103.19.57.16/32,103.19.57.23/32
add max-limit=30M/30M name="SOHO 10M GROUP-2" target=\
    172.16.2.96/30,172.16.2.8/30
add comment="Awal 3M" max-limit=10M/10M name="SOHO 3M - MITRA 10" target=\
    103.19.57.10/32 total-priority=1
add max-limit=3M/3M name="SOHO 5M - SDN SILIHASAH 1" parent=\
    "SOHO 5M - PENDIDIKAN" target=172.16.2.16/30
add max-limit=5M/5M name="SOHO 5M - SDN Cadasngampar" parent=\
    "SOHO 5M - PENDIDIKAN" target=172.16.2.200/30
add max-limit=3M/3M name="SOHO 5M - SDN Lebakngok" parent=\
    "SOHO 5M - PENDIDIKAN" target=172.16.2.20/30
add max-limit=10M/10M name="SOHO 5M - SDN Sumurwuni" parent=\
    "SOHO 5M - PENDIDIKAN" target=172.16.2.168/30
add max-limit=5M/5M name="SOHO 5M - Sarewu" parent="SOHO 5M GROUP-1" target=\
    172.16.2.92/30
add max-limit=5M/5M name="SOHO 5M - Danalampah" parent="SOHO 5M GROUP-1" \
    target=172.16.2.84/30
add disabled=yes max-limit=20M/20M name="SOHO 10M - Bahama Rotan" parent=\
    "SOHO 10M GROUP-1" target=103.19.57.16/32
add max-limit=10M/10M name="SOHO 10M - Ivan Sutanto" parent=\
    "SOHO 10M GROUP-2" target=172.16.2.8/30
add disabled=yes max-limit=30M/30M name="SOHO 10M - Hotel Sapadia" parent=\
    "SOHO 10M GROUP-1" target=103.19.57.25/32
add comment="AWAL 35M" max-limit=35M/35M name="SOHO 10M - Hotel Sutan Raja" \
    parent="SOHO 10M GROUP-1" target=103.19.57.23/32
add max-limit=10M/10M name="SOHO 10M - Sanawi" parent="SOHO 10M GROUP-2" \
    target=172.16.2.96/30
add disabled=yes max-limit=3M/3M name="DEDICATED - BTN KC Cirebon" target=\
    172.16.1.66/32
add disabled=yes max-limit=45M/45M name="DEDICATED - Hotel Metland Cirebon" \
    target=103.19.57.21/32
add disabled=yes max-limit=10M/10M name="DEDICATED - BMT Albahjah" target=\
    103.19.57.27/32
add disabled=yes max-limit=50M/50M name="Home - Ni'am" target=\
    103.19.57.255/32
add limit-at=15M/15M max-limit=30M/30M name="SOHO YOGI" parent=\
    "SOHO 30M GROUP-1" target=172.16.1.212/30
add max-limit=55M/55M name=BBWS target=103.19.57.56/29
add max-limit=30M/30M name="DEDICATED - Cecep Site Cempaka" target=\
    103.19.57.11/32
add disabled=yes max-limit=205M/205M name="DEDICATED - Hotel Aston" target=\
    103.19.57.36/30
add max-limit=5M/5M name=BALMON target=10.1.1.0/24
add max-limit=22M/22M name=CMW-TRIAL-20Mbps target=103.19.57.28/32
add max-limit=50M/50M name=BENTANI-GOESAR target=172.16.1.77/32
/queue type
add kind=pfifo name=Critical pfifo-limit=128
/queue simple
add disabled=yes max-limit=100M/100M name=1.ICMP packet-marks=\
    "ICMP DOWN,ICMP UP,dns" queue=Critical/Critical target=\
    103.19.56.0/22,10.0.0.0/16,172.16.0.0/16 total-queue=Critical
/routing bgp instance
set default disabled=yes
add as=132637 name=BITSNET redistribute-connected=yes redistribute-ospf=yes \
    redistribute-static=yes router-id=103.19.56.151
add as=142310 name=FIBERCONNECT redistribute-connected=yes \
    redistribute-static=yes router-id=103.168.46.45
/routing ospf instance
set [ find default=yes ] redistribute-bgp=as-type-2 redistribute-connected=\
    as-type-2 redistribute-static=as-type-2 router-id=103.19.56.151
/snmp community
set [ find default=yes ] addresses=103.19.56.0/22
add addresses=103.19.56.0/22,10.203.0.128/29 name=cirebon
/system logging action
set 0 memory-lines=10000
set 1 disk-lines-per-file=10000
set 3 remote=103.19.56.12 src-address=103.19.56.151
/user group
set read policy="local,telnet,ssh,read,test,winbox,web,sniff,tikapp,!ftp,!rebo\
    ot,!write,!policy,!password,!sensitive,!api,!romon,!dude"
add name=NOC policy="local,telnet,ssh,reboot,read,write,test,winbox,web,sensit\
    ive,!ftp,!policy,!password,!sniff,!api,!romon,!dude,!tikapp"
add name=SPVNOC policy="local,telnet,ssh,reboot,read,write,test,winbox,passwor\
    d,web,sniff,sensitive,api,romon,tikapp,!ftp,!policy,!dude"
add name=lg policy="telnet,read,test,sniff,!local,!ssh,!ftp,!reboot,!write,!po\
    licy,!winbox,!password,!web,!sensitive,!api,!romon,!dude,!tikapp"
/ip firewall connection tracking
set enabled=yes
/ip neighbor discovery-settings
set discover-interface-list=all
/interface list member
add interface=1510-UPLINK-FIBERSTAR list=backbone
add interface=1513-UPLINK-IFORTE list=backbone
add list=BACKBONE-BAKCUP
add list=BACKBONE-BAKCUP
/interface pptp-server server
set authentication=pap,chap,mschap1,mschap2
/ip address
add address=172.16.1.209/30 comment=TO-LEBAKNGOK interface=tun05-lebakngok \
    network=172.16.1.208
add address=10.10.10.33/29 comment=AP-OFFICE-TELERING interface=\
    235-OFFICE-TELERING network=10.10.10.32
add address=10.10.10.105/29 comment=AP-GRG-KARANTINA interface=\
    233-GRG-KARANTINA network=10.10.10.104
add address=10.10.10.225/29 comment="AP-OFFICE-BPR BEBER" interface=\
    232-OFFICE-BPR-BEBER network=10.10.10.224
add address=10.10.10.145/29 comment=AP-OFFICE-AMARIS interface=\
    222-OFFICE-AMARISHOTEL network=10.10.10.144
add address=10.202.0.5/30 comment="IP MGT-SW-NEXUS" interface=\
    100-MGT-SW-NEXUS network=10.202.0.4
add address=103.19.56.250/30 comment="IP FIBERSTAR" interface=\
    1510-UPLINK-FIBERSTAR network=103.19.56.248
add address=10.10.10.233/29 comment=AP-OFFICE-GRG interface=\
    240-OFFICE-GRONGGONG network=10.10.10.232
add address=10.200.0.1/24 comment="IP AP" interface=200-MGT-AP-OFFICE \
    network=10.200.0.0
add address=10.0.0.10 comment=LOOPBACK-PRTG interface=loopback network=\
    10.0.0.10
add address=10.202.0.1/30 comment=MGT-SW-MTH interface=98-MGT-SWITCH-MTH \
    network=10.202.0.0
add address=103.19.57.105/30 comment=TO-AGENG-MTH interface=1200-AGENG-MTH \
    network=103.19.57.104
add address=103.19.57.241/29 comment=TO-AMARIS-VIA-OFFICE interface=\
    408-AMARIS-HOTEL-CRB network=103.19.57.240
add address=10.10.10.153/29 comment=AP-OFFICE-SUMURWUNI interface=\
    244-OFFICE-SUMURWUNI network=10.10.10.152
add address=10.0.1.1/24 comment=IP-PRIVATE-VPS-PRTG interface=\
    152-IP-PRIVATE-VPS-CRB network=10.0.1.0
add address=10.202.0.9/30 comment=MGT-SW-VPS-CRB interface=101-MGT-VPS-CRB \
    network=10.202.0.8
add address=103.19.56.218/30 comment="IP IFORTE" interface=1513-UPLINK-IFORTE \
    network=103.19.56.216
add address=10.202.0.13/30 comment=MGT-SW-DKIS interface=90-MGT-SW-DKIS \
    network=10.202.0.12
add address=172.16.1.65/30 comment=TO-BTN-CIREBON-VIA-GOESAR interface=\
    260-GOESAR-BTN-KC-CIREBON network=172.16.1.64
add address=10.203.1.1/30 comment=IP-MGT-SW-GUNTUR interface=\
    94-MGT-SW-SD-GUNTUR network=10.203.1.0
add address=10.10.10.57/30 comment=AP-OFFICE-TSM interface=248-OFFICE-TSM \
    network=10.10.10.56
add address=172.16.1.72 comment=TO-TSM-VIA-TIS interface=615-TIS-TSM network=\
    172.16.1.73
add address=172.16.1.217/30 comment=TO-TIS-JASAMARGA interface=\
    616-TIS-JASAMARGA network=172.16.1.216
add address=10.202.0.45/30 comment=MGT-SW-PURI interface=91-MGT-SW-PURI \
    network=10.202.0.44
add address=10.10.10.241/30 comment=AP-OFFICE-CADASNGAMPAR interface=\
    208-OFFICE-CADASNGAMPAR network=10.10.10.240
add address=172.16.1.113/30 comment=TO-DIST-ALBAHJAH interface=\
    217-DIST-ALBAHJAH-FIX network=172.16.1.112
add address=10.0.100.1 comment="BMT-ALBAHJAH (ENABLE IF MAIN LINK DOWN)" \
    disabled=yes interface=202-OFFICE-BPR-BACKUP network=103.19.57.27
add address=103.19.56.151 comment=LOOPBACK interface=loopback network=\
    103.19.56.151
add address=172.16.1.125/29 comment=TO-CCTV-MTH interface=1204-CCTV-MTH \
    network=172.16.1.120
add address=10.204.1.1/30 comment=MGT-OLT-PURI interface=907-MGT-OLT-PURI \
    network=10.204.1.0
add address=172.16.3.5/30 comment=TO-ASTON-CIREBON interface=401-ASTON-CRB \
    network=172.16.3.4
add address=103.19.57.8 comment=DKIS-BROADBAND interface=2001-DKIS-BROADBAND \
    network=103.19.57.17
add address=10.10.192.1/30 comment=DKIS-IP-LOCALLOOP-SUDARSONO interface=\
    2004-DKIS-SUDARSONO-LOCALLOOP network=10.10.192.0
add address=10.10.192.5/30 comment=DKIS-IP-LOCALLOOP-BYPASS interface=\
    2001-DKIS-BROADBAND network=10.10.192.4
add address=103.19.57.8 comment=TO-RO-IPTV interface=93-MGT-RO-IPTV network=\
    103.19.57.9
add address=103.19.57.8 comment="ENABLE IF GOESAR UP" interface=\
    250-GOESAR-AL-BAHJAH-TV network=103.19.57.12
add address=103.19.57.8 comment="TO OFFICE" interface=ether7 network=\
    103.19.57.146
add address=103.19.57.8 comment="DISABLE IF FO GOESAR DOWN" interface=\
    251-GOESAR-AKPER network=103.19.57.18
add address=103.19.57.8 comment=TO-METLAND-VIA-BITS interface=407-METLAND-NEW \
    network=103.19.57.21
add address=172.16.1.53/30 comment=TO-BPR-BEBER-VIA-OFFICE interface=\
    232-OFFICE-BPR-BEBER network=172.16.1.52
add address=172.16.1.213/30 comment=TO-YOGI-MTH interface=1202-YOGI-MTH \
    network=172.16.1.212
add address=10.201.0.1/30 comment="[IP MTIK VPS CRB]" interface=\
    150-IP-MTIK-VPS-CRB network=10.201.0.0
add address=103.19.57.1/29 comment="[IP PUBLIC VPS CRB]" interface=\
    151-IP-PUBLIK-VPS-CRB network=103.19.57.0
add address=10.10.192.9/30 comment=DKIS-IP-LOCALLOOP-BYPASS interface=\
    2001-DKIS-BROADBAND network=10.10.192.8
add address=172.16.1.76 comment=TO-GOESAR-BENTANI interface=\
    252-GOESAR-BENTANI network=172.16.1.77
add address=10.202.0.129/25 comment="[IP PRIVATE VPS CRB]" interface=\
    102-LOCAL-VPS-CRB network=10.202.0.128
add address=103.19.57.8 comment=TO-SURYALAYA-VIA-GOESAR interface=\
    269-SURYALAYA network=103.19.57.36
add address=10.202.0.17/30 comment=MGT-SW-CRS-BTS-OFFICE interface=\
    99-MGT-SWITCH-CRS-BTS-OFFICE network=10.202.0.16
add address=103.19.57.8 comment=TO-TIKI-VIA-BITS interface=403-TIKI network=\
    103.19.57.26
add address=103.143.244.124 comment=FNA-NODE-CIREBON interface=\
    3000-FNA-NODE-CIREBON network=103.143.244.125
add address=10.10.100.1/29 comment=FNA-SBP interface=2003-FNA-SBP network=\
    10.10.100.0
add address=103.19.56.151 comment="PTP BROADBAND" interface=\
    3503-DIST-CRB-TO-BROADBAND network=103.19.56.152
add address=103.143.244.124 comment=LOOPBACK interface=loopback network=\
    103.143.244.124
add address=103.19.57.8 comment=LOOPBACK interface=loopback network=\
    103.19.57.8
add address=10.10.10.113/29 comment="AP-OFFICE-BPR BACKUP" interface=\
    202-OFFICE-BPR-BACKUP network=10.10.10.112
add address=172.16.2.213/30 comment=TO-CCTV-PURI interface=3802-CCTV-PURI \
    network=172.16.2.212
add address=10.253.5.1/24 comment=TO-UNIFI-PURI interface=3801-UNIFI-PURI \
    network=10.253.5.0
add address=10.2.3.1/28 comment=AP-PURI interface=105-AP-PURI network=\
    10.2.3.0
add address=10.2.5.1/29 comment=AP-SUBAGJA interface=105-AP-PURI network=\
    10.2.5.0
add address=10.2.5.9/29 comment=AP-BEDULAN interface=105-AP-PURI network=\
    10.2.5.8
add address=172.16.10.9/29 comment=BPR-KAPETAKAN interface=104-KAPETAKAN \
    network=172.16.10.8
add address=10.5.2.25/29 comment=AP-GRG-CMW interface=43-GRG-CMW network=\
    10.5.2.24
add address=10.5.2.33/29 comment=AP-GRG-DANALAMPAH interface=\
    45-GRG-DANALAMPAH network=10.5.2.32
add address=10.5.2.49/29 comment=AP-GRG-ALBAHJAHTV interface=\
    46-GRG-ALBAHJAHTV network=10.5.2.48
add address=10.5.2.57/29 comment=AP-GRG-SAPADIA interface=47-GRG-SAPADIA \
    network=10.5.2.56
add address=10.5.2.65/29 comment=AP-GRG-JASAMARGA interface=48-GRG-JASAMARGA \
    network=10.5.2.64
add address=172.16.2.89/30 comment="RB MONITORING" interface=\
    60-MONITORING-LISTRIK network=172.16.2.88
add address=10.5.2.41/29 comment=AP-GRG-SILIHASAH interface=44-GRG-SILIHASAH \
    network=10.5.2.40
add address=10.5.2.73/29 comment=AP-GRG-KBL interface=49-GRG-KBL network=\
    10.5.2.72
add address=10.5.2.81/29 comment=AP-GRG-CEMPAKA interface=50-GRG-CEMPAKA \
    network=10.5.2.80
add address=10.5.2.17/29 interface=42-GRG-NIAM network=10.5.2.16
add address=103.19.56.151 interface=42-GRG-NIAM network=103.19.57.255
add address=10.11.12.1 comment=TO-CEMPAKA-VIA-GRG interface=50-GRG-CEMPAKA \
    network=103.19.57.11
add address=10.5.2.97/29 comment=AP-GRG-KARANTINA interface=57-GRG-KARANTINA \
    network=10.5.2.96
add address=10.11.12.1 comment=INET-SAPADIA interface=47-GRG-SAPADIA network=\
    103.19.57.25
add address=10.5.2.105/29 comment=AP-GRG-CIRSEL interface=53-GRG-CIRSEL \
    network=10.5.2.104
add address=10.5.2.113/29 comment="AP-GRG-SUTAN RAJA" interface=\
    55-GRG-SUTAN-RAJA network=10.5.2.112
add address=10.5.2.121/29 comment=AP-GRG-BAHAMA interface=56-GRG-BAHAMA \
    network=10.5.2.120
add address=10.5.2.137/29 comment=AP-GRG-ASTON interface=59-GRG-ASTON \
    network=10.5.2.136
add address=10.5.2.153/29 comment=AP-GRG-RADIOQU interface=58-GRG-RADIOQU \
    network=10.5.2.152
add address=10.5.2.161/29 comment=AP-GRG-MITRA10 interface=61-GRG-MITRA10 \
    network=10.5.2.160
add address=10.5.2.177/29 comment=AP-GRG-AKPER interface=63-GRG-AKPER \
    network=10.5.2.176
add address=103.19.57.8 comment=TO-MITRA-10-VIA-GRG disabled=yes interface=\
    61-GRG-MITRA10 network=103.19.57.10
add address=10.0.10.1 comment=KBL-VIA-BTS-GRG interface=49-GRG-KBL network=\
    103.19.57.33
add address=10.5.2.185/29 comment=AP-GRG-BALMON interface=64-GRG-BALMON \
    network=10.5.2.184
add address=10.11.12.1 comment=TO-BALMON-VIA-GRG interface=64-GRG-BALMON \
    network=103.19.57.24
add address=172.16.10.1/30 comment=TO-RB-MON-PURI interface=106-RB-MON-PURI \
    network=172.16.10.0
add address=10.202.0.41/30 comment=MGT-SW-HP-GRG interface=92-MGT-SW-HP-GRG \
    network=10.202.0.40
add address=10.5.1.1/24 comment="[IP AP GRG]" interface=40-AP-GRONGGONG \
    network=10.5.1.0
add address=10.2.5.17/29 comment=KEJAR interface=103-PT-KEJAR network=\
    10.2.5.16
add address=10.2.2.1/28 comment=AP-PURI-KAPETAKAN interface=105-AP-PURI \
    network=10.2.2.0
add address=103.19.57.8 comment=TO-BAHAMA-VIA-GRG interface=56-GRG-BAHAMA \
    network=103.19.57.16
add address=172.16.2.9/30 comment=TO-IVAN-SUSANTO interface=405-IVAN-SUSANTO \
    network=172.16.2.8
add address=172.16.10.17/30 interface=404-OMAN network=172.16.10.16
add address=10.203.2.5/30 comment=MGT-C300 interface=246-MGT-C300 network=\
    10.203.2.4
add address=10.10.100.9/30 comment=FNA-PSAT interface=601-FNA-PSAT network=\
    10.10.100.8
add address=172.16.1.74 comment=TO-TSM-VIA-RADIO interface=248-OFFICE-TSM \
    network=172.16.1.75
add address=103.19.57.8 comment=TO-BENTANI-VIA-BITS interface=\
    406-BENTANI-BITS network=103.19.57.47
add address=10.203.0.9/30 comment=MGT-SERVER-DELL interface=\
    107-MGT-SERVER-DELL network=10.203.0.8
add address=10.203.0.129/25 comment="[IP PRIVATE VPS DELL]" interface=\
    108-IP-PRIVATE-VPS-DELL network=10.203.0.128
add address=172.16.11.1/30 comment="IP INET BEDULAN" interface=105-AP-PURI \
    network=172.16.11.0
add address=172.16.1.1/30 interface=3333-VLAN-BOD network=172.16.1.0
add address=172.16.1.221/30 interface="1203 - POS-SATPAM" network=\
    172.16.1.220
add address=103.19.57.8 comment=TO-Telering interface=402-TELERING network=\
    103.19.57.148
add address=103.168.46.45 interface=3705-UPLINK-IFORTE-FBC network=\
    103.168.46.44
add address=103.168.46.47 interface=3706-UPLINK-FIBERSTAR-FBC network=\
    103.168.46.46
add address=103.168.46.48 comment="TO OFFICE" disabled=yes interface=ether7 \
    network=103.168.46.49
add address=172.16.2.225/29 comment=VLAN-TEST-ONU interface=\
    3334-VLAN-TEST-ONT network=172.16.2.224
add address=10.10.11.1/24 comment=IP-REMOTE-ONU interface=3335-REMOTE-ONU \
    network=10.10.11.0
add address=103.19.57.8 comment=MITRA10 interface=409-MITRA10 network=\
    103.19.57.10
add address=103.19.57.57/29 comment=BBWS interface=410-BBWS-CRB network=\
    103.19.57.56
add address=103.19.57.8 comment="KEJAR NEW" interface=\
    "411-KELOLA-JASA-ARTHA(KEJAR)" network=103.19.57.30
add address=172.18.12.1/29 interface=1510-UPLINK-FIBERSTAR network=\
    172.18.12.0
add address=172.16.1.81/29 comment=TO-MITRA-FUTURES interface=\
    412-INTERNATIONAL-MITRA-FUTURES network=172.16.1.80
/ip dhcp-client
add interface=sfp-sfpplus1
/ip dhcp-server network
add address=10.10.10.48/29 gateway=10.10.10.49
add address=10.203.0.128/25 gateway=10.203.0.129
add address=10.253.5.0/24 gateway=10.253.5.1
/ip dns
set servers=103.19.56.10,103.19.56.11
/ip firewall address-list
add address=103.19.56.2 list=ns-bitsnet
add address=103.19.56.3 list=ns-bitsnet
add address=103.19.56.10 list=ns-bitsnet
add address=103.19.56.0/22 list=Client
add address=10.0.0.0/8 list=Client
add address=172.16.0.0/16 list=Client
add address=172.16.2.80/30 comment=SUBAGJA list=ip-soho
add address=172.16.2.200/30 comment="SD CADASNGAMPAR" list=ip-soho
add address=172.16.2.168/30 comment="SD SUMURWUNI" list=ip-soho
add address=172.16.2.4/30 comment="AL MAUN PURI" list=ip-soho
add address=172.16.2.20/30 comment="SD LEBAKNGOK" list=ip-soho
add address=172.16.2.32/30 comment="PILANGSARI | MAKRUS MOTOR" list=ip-soho
add address=172.16.2.84/30 comment="DESA DANALAMPAH" list=ip-soho
add address=172.16.2.16/30 comment="SD SILIHASAH" list=ip-soho
add address=172.16.2.92/30 comment=Sarewu list=ip-soho
add address=103.19.56.11 list=ns-bitsnet
add address=10.202.0.128/25 comment=IP-VPS-CRB list=ip-vps-crb
add address=172.16.2.88/30 comment="RB-Monitoring GRG" list=ip-soho
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
add address=0.0.0.0/8 list=bogon
add address=127.0.0.0/8 list=bogon
add address=224.0.0.0/3 list=bogon
add address=172.16.1.192/30 comment=SUBAGJA list=ip-soho
add address=172.16.2.36/30 comment=BACKUP-ALBAHJAHTV list=ip-soho
add address=203.107.44.0/22 comment="EX DDOS ZIMBRA" list=ru-cn
add address=172.16.2.12/30 comment="PT. DIRGANTARA" list=ip-soho
add address=172.16.2.204/30 comment="UMC BACKUP" list=ip-soho
add address=172.16.2.208/30 comment="Backup Amaris Via wirelles" list=ip-soho
add address=172.16.2.96/30 comment=Sanawi list=ip-soho
add address=172.16.2.24/30 list=ip-gue
add address=10.5.2.2 comment="SD ARGASUNYA" disabled=yes list=ip-soho
add address=172.16.3.20/30 comment="Router Cust. PDA Net" list=ip-soho
add address=172.16.1.36/30 comment="RB Mon Kertasmaya" list=ip-soho
add address=172.16.1.66 comment="BTN KC CIREBON" list=ip-soho
add address=172.16.111.0/30 comment=TEST-INET-ASTON list=ip-soho
add address=172.16.1.68/30 comment="RB-Monitoring Terisi" list=ip-soho
add address=172.16.90.0/30 comment=TES-CLIENT-GNS3 list=ip-soho
add address=172.16.1.214 comment=YOGI-MTH list=ip-soho
add address=172.16.1.100/30 comment="Backup Jasamarga" list=ip-soho
add address=172.16.1.77 comment=BENTANI-GOESAR list=ip-soho
add address=172.16.2.212/30 comment="IP CCTV PURIMULYA" list=ip-soho
add address=172.16.3.8/30 comment=Farm2 list=farm-sumedang
add address=172.16.3.12/30 comment=Farm1 list=farm-sumedang
add address=172.16.3.8/30 comment=Farm2 list=ip-soho
add address=172.16.3.12/30 comment=BOD-ASTON list=ip-soho
add address=172.16.1.32/30 comment=CIRSEL list=ip-soho
add address=172.16.1.75 comment=TSM list=ip-soho
add address=31.13.24.0/21 list=fb-wa-ig
add address=31.13.64.0/18 list=fb-wa-ig
add address=45.64.40.0/22 list=fb-wa-ig
add address=45.120.124.0/22 list=fb-wa-ig
add address=66.111.48.0/22 list=fb-wa-ig
add address=66.220.144.0/20 list=fb-wa-ig
add address=66.220.152.0/21 list=fb-wa-ig
add address=69.63.176.0/20 list=fb-wa-ig
add address=69.171.224.0/19 list=fb-wa-ig
add address=69.171.240.0/20 list=fb-wa-ig
add address=69.171.250.0/24 list=fb-wa-ig
add address=74.119.76.0/22 list=fb-wa-ig
add address=102.132.96.0/20 list=fb-wa-ig
add address=103.4.96.0/22 list=fb-wa-ig
add address=103.65.28.0/22 list=fb-wa-ig
add address=103.68.206.0/23 list=fb-wa-ig
add address=103.126.169.0/24 list=fb-wa-ig
add address=103.139.180.0/24 list=fb-wa-ig
add address=103.141.78.0/23 list=fb-wa-ig
add address=103.199.120.0/22 list=fb-wa-ig
add address=103.215.98.0/23 list=fb-wa-ig
add address=103.237.156.0/22 list=fb-wa-ig
add address=129.134.0.0/17 list=fb-wa-ig
add address=157.240.0.0/17 list=fb-wa-ig
add address=157.240.192.0/19 list=fb-wa-ig
add address=157.240.208.0/21 list=fb-wa-ig
add address=157.240.216.0/22 list=fb-wa-ig
add address=157.240.220.0/22 list=fb-wa-ig
add address=163.114.128.0/20 list=fb-wa-ig
add address=173.252.64.0/19 list=fb-wa-ig
add address=173.252.88.0/21 list=fb-wa-ig
add address=173.252.96.0/19 list=fb-wa-ig
add address=179.60.192.0/22 list=fb-wa-ig
add address=185.60.216.0/22 list=fb-wa-ig
add address=199.201.64.0/22 list=fb-wa-ig
add address=204.15.20.0/22 list=fb-wa-ig
add address=157.240.192.0/18 list=fb-wa-ig
add address=216.239.32.0/19 list=YOUTUBE
add address=216.73.80.0/20 list=YOUTUBE
add address=216.58.192.0/19 list=YOUTUBE
add address=209.85.128.0/17 list=YOUTUBE
add address=208.81.188.0/22 list=YOUTUBE
add address=208.68.108.0/22 list=YOUTUBE
add address=207.223.160.0/20 list=YOUTUBE
add address=199.223.232.0/21 list=YOUTUBE
add address=199.192.112.0/22 list=YOUTUBE
add address=199.36.154.0/23 list=YOUTUBE
add address=199.36.156.0/24 list=YOUTUBE
add address=74.125.0.0/16 list=YOUTUBE
add address=66.249.64.0/19 list=YOUTUBE
add address=66.102.0.0/20 list=YOUTUBE
add address=64.233.160.0/19 list=YOUTUBE
add address=173.255.112.0/20 list=YOUTUBE
add address=173.194.0.0/16 list=YOUTUBE
add address=208.117.224.0/19 list=YOUTUBE
add address=3.7.35.0/25 list=IP-ZOOM
add address=3.21.137.128/25 list=IP-ZOOM
add address=3.22.11.0/24 list=IP-ZOOM
add address=3.23.93.0/24 list=IP-ZOOM
add address=3.25.41.128/25 list=IP-ZOOM
add address=3.25.42.0/25 list=IP-ZOOM
add address=3.25.49.0/24 list=IP-ZOOM
add address=3.80.20.128/25 list=IP-ZOOM
add address=3.96.19.0/24 list=IP-ZOOM
add address=3.101.32.128/25 list=IP-ZOOM
add address=3.101.52.0/25 list=IP-ZOOM
add address=3.104.34.128/25 list=IP-ZOOM
add address=3.120.121.0/25 list=IP-ZOOM
add address=3.127.194.128/25 list=IP-ZOOM
add address=3.208.72.0/25 list=IP-ZOOM
add address=3.211.241.0/25 list=IP-ZOOM
add address=3.235.69.0/25 list=IP-ZOOM
add address=3.235.82.0/23 list=IP-ZOOM
add address=3.235.71.128/25 list=IP-ZOOM
add address=3.235.72.128/25 list=IP-ZOOM
add address=3.235.73.0/25 list=IP-ZOOM
add address=3.235.96.0/23 list=IP-ZOOM
add address=4.34.125.128/25 list=IP-ZOOM
add address=4.35.64.128/25 list=IP-ZOOM
add address=8.5.128.0/23 list=IP-ZOOM
add address=13.52.6.128/25 list=IP-ZOOM
add address=13.52.146.0/25 list=IP-ZOOM
add address=13.114.106.166 list=IP-ZOOM
add address=18.157.88.0/24 list=IP-ZOOM
add address=18.205.93.128/25 list=IP-ZOOM
add address=50.239.202.0/23 list=IP-ZOOM
add address=50.239.204.0/24 list=IP-ZOOM
add address=52.61.100.128/25 list=IP-ZOOM
add address=52.81.151.128/25 list=IP-ZOOM
add address=52.81.215.0/24 list=IP-ZOOM
add address=52.197.97.21 list=IP-ZOOM
add address=52.202.62.192/26 list=IP-ZOOM
add address=52.215.168.0/25 list=IP-ZOOM
add address=64.69.74.0/24 list=IP-ZOOM
add address=64.125.62.0/24 list=IP-ZOOM
add address=64.211.144.0/24 list=IP-ZOOM
add address=65.39.152.0/24 list=IP-ZOOM
add address=69.174.57.0/24 list=IP-ZOOM
add address=69.174.108.0/22 list=IP-ZOOM
add address=99.79.20.0/25 list=IP-ZOOM
add address=103.122.166.0/23 list=IP-ZOOM
add address=109.94.160.0/22 list=IP-ZOOM
add address=109.244.18.0/25 list=IP-ZOOM
add address=109.244.19.0/24 list=IP-ZOOM
add address=111.33.181.0/25 list=IP-ZOOM
add address=115.110.154.192/26 list=IP-ZOOM
add address=115.114.56.192/26 list=IP-ZOOM
add address=115.114.115.0/26 list=IP-ZOOM
add address=115.114.131.0/26 list=IP-ZOOM
add address=120.29.148.0/24 list=IP-ZOOM
add address=140.238.128.0/24 list=IP-ZOOM
add address=147.124.96.0/19 list=IP-ZOOM
add address=149.137.0.0/17 list=IP-ZOOM
add address=152.67.20.0/24 list=IP-ZOOM
add address=152.67.118.0/24 list=IP-ZOOM
add address=152.67.180.0/24 list=IP-ZOOM
add address=158.101.64.0/24 list=IP-ZOOM
add address=160.1.56.128/25 list=IP-ZOOM
add address=161.189.199.0/25 list=IP-ZOOM
add address=161.199.136.0/22 list=IP-ZOOM
add address=162.12.232.0/22 list=IP-ZOOM
add address=162.255.36.0/22 list=IP-ZOOM
add address=165.254.88.0/23 list=IP-ZOOM
add address=168.138.16.0/24 list=IP-ZOOM
add address=168.138.48.0/24 list=IP-ZOOM
add address=168.138.72.0/24 list=IP-ZOOM
add address=168.138.244.0/24 list=IP-ZOOM
add address=173.231.80.0/20 list=IP-ZOOM
add address=192.204.12.0/22 list=IP-ZOOM
add address=193.122.32.0/22 list=IP-ZOOM
add address=193.123.0.0/19 list=IP-ZOOM
add address=193.123.40.0/22 list=IP-ZOOM
add address=193.123.128.0/19 list=IP-ZOOM
add address=198.251.128.0/17 list=IP-ZOOM
add address=202.177.207.128/27 list=IP-ZOOM
add address=202.177.213.96/27 list=IP-ZOOM
add address=204.80.104.0/21 list=IP-ZOOM
add address=204.141.28.0/22 list=IP-ZOOM
add address=207.226.132.0/24 list=IP-ZOOM
add address=209.9.211.0/24 list=IP-ZOOM
add address=209.9.215.0/24 list=IP-ZOOM
add address=210.57.55.0/24 list=IP-ZOOM
add address=213.19.144.0/24 list=IP-ZOOM
add address=213.19.153.0/24 list=IP-ZOOM
add address=213.244.140.0/24 list=IP-ZOOM
add address=221.122.88.64/27 list=IP-ZOOM
add address=221.122.88.128/25 list=IP-ZOOM
add address=221.122.89.128/25 list=IP-ZOOM
add address=221.123.139.192/27 list=IP-ZOOM
add address=8.5.128.0/24 list=IP-ZOOM
add address=172.16.1.40/30 comment="RB MONITORING PATROL" list=ip-soho
add address=66.163.53.0/24 list=IHG-Group
add address=114.29.192.0/19 list=IHG-Group
add address=114.29.200.0/23 list=IHG-Group
add address=114.29.202.0/23 list=IHG-Group
add address=114.29.204.0/22 list=IHG-Group
add address=114.29.208.0/21 list=IHG-Group
add address=150.253.128.0/18 list=IHG-Group
add address=66.163.52.0/24 list=IHG-Group
add address=150.253.192.0/19 list=IHG-Group
add address=150.253.216.0/23 list=IHG-Group
add address=66.163.46.0/23 list=IHG-Group
add address=150.253.224.0/20 list=IHG-Group
add address=150.253.240.0/20 list=IHG-Group
add address=66.163.32.0/19 list=IHG-Group
add address=66.114.168.0/21 list=IHG-Group
add address=66.114.160.0/21 list=IHG-Group
add address=170.133.128.0/19 list=IHG-Group
add address=66.114.160.0/20 list=IHG-Group
add address=170.133.160.0/20 list=IHG-Group
add address=170.133.176.0/20 list=IHG-Group
add address=64.68.96.0/19 list=IHG-Group
add address=170.133.176.0/23 list=IHG-Group
add address=64.68.120.0/21 list=IHG-Group
add address=170.133.178.0/23 list=IHG-Group
add address=170.133.190.0/23 list=IHG-Group
add address=64.68.104.0/21 list=IHG-Group
add address=170.72.0.0/19 list=IHG-Group
add address=62.109.192.0/18 list=IHG-Group
add address=170.72.0.0/20 list=IHG-Group
add address=170.72.128.0/18 list=IHG-Group
add address=41.209.215.0/24 list=IHG-Group
add address=210.4.206.0/23 list=IHG-Group
add address=170.72.192.0/19 list=IHG-Group
add address=170.72.224.0/23 list=IHG-Group
add address=210.4.198.0/24 list=IHG-Group
add address=170.72.228.0/23 list=IHG-Group
add address=210.4.192.0/20 list=IHG-Group
add address=170.72.32.0/20 list=IHG-Group
add address=170.72.64.0/19 list=IHG-Group
add address=209.197.192.0/21 list=IHG-Group
add address=173.243.0.0/20 list=IHG-Group
add address=173.39.224.0/19 list=IHG-Group
add address=209.197.192.0/19 list=IHG-Group
add address=207.182.172.0/22 list=IHG-Group
add address=207.182.160.0/19 list=IHG-Group
add address=179.42.146.0/23 list=IHG-Group
add address=179.42.144.0/22 list=IHG-Group
add address=179.42.144.0/23 list=IHG-Group
add address=ihgmerlin.com list=IHG-Group
add address=23.192.0.0/11 list=IHG-Group
add address=webmail.ihg.com list=IHG-Group
add address=myfederate.ihg.com list=IHG-Group
add address=172.16.1.73 comment=TSM list=ip-soho
add address=172.16.1.220/30 comment=POST-SATPAM-MTH list=ip-soho
add address=172.16.1.112/30 comment=dist-albahjah-test disabled=yes list=\
    ip-soho
add address=172.16.1.124/30 comment="CCTV SATPAM MTH" list=ip-soho
add address=172.16.1.224/30 comment="Tes Inet JTB" list=ip-soho
add address=172.16.11.0/30 comment=BEDULAN list=ip-soho
add address=172.16.3.4/30 comment=ASTON disabled=yes list=ip-soho
add address=172.16.1.120/30 comment="BOD ALBAHJAH" list=ip-soho
add address=103.19.56.2 list=dns-bitsnet
add address=103.19.56.3 list=dns-bitsnet
add address=103.19.56.10 list=dns-bitsnet
add address=103.19.56.11 list=dns-bitsnet
add address=10.10.192.0/30 comment=DKIS-SUDARSONO-LOCALLOOP list=ip-soho
add address=103.19.56.0/22 list=network-bitsnet
add address=103.143.244.0/23 list=network-bitsnet
add address=172.16.1.252/30 comment="Tes Inet JTB" list=ip-soho
add address=172.16.1.248/30 comment="Tes Inet JTB" list=ip-soho
add address=10.5.2.152/29 comment="Backup RadioQu" list=ip-soho
add address=172.16.11.4/30 comment=BAKUNG list=ip-soho
add address=172.16.1.218 comment=JASMAR list=ip-soho
add address=172.16.1.52/30 comment="BOD SUNYARAGI" list=ip-soho
add address=10.0.1.0/24 comment="IP PRIVATE VPS CIREBON" disabled=yes list=\
    ip-soho
add address=10.1.0.0/24 comment=IP-VPS-CRB list=ip-vps-crb
add address=172.16.1.204/30 comment="PPP OFFICE" list=ip-oo
add address=172.16.3.16/30 comment=BACKUP-ITB list=ip-soho
add address=172.16.1.30 comment=BOD-ASTON list=ip-soho
add address=172.16.1.210 comment="SD ARGASUNYA" disabled=yes list=ip-soho
add address=10.5.2.112/29 comment="RB Mon Kertasmaya" list=ip-soho
add address=10.5.1.18 comment="RB Mon Kertasmaya" list=ip-soho
add address=10.5.1.11 list=ip-soho
add address=10.200.0.100 comment=Sumurwuni list=ip-soho
add address=10.1.1.0/24 comment=BALMON list=ip-soho
add address=10.10.10.32/29 comment="TELERING RADIO" list=ip-soho
add address=172.16.4.32/30 comment=CIRSEL list=ip-soho
add address=172.16.4.0/30 comment=KAPETAKAN list=ip-soho
add address=10.10.10.234 comment="TELERING RADIO" list=ip-soho
add address=10.200.0.25 comment="TELERING RADIO" list=ip-soho
add address=10.5.1.20 comment="Router Cust. PDA Net" list=ip-soho
add address=172.16.10.16/29 list=ip-soho
add address=10.5.2.24/29 comment=CMW list=ip-soho
add address=172.16.2.40/30 comment=CMW list=ip-soho
add address=172.16.2.8/30 comment=IVAN list=ip-soho
add address=10.2.5.8/29 comment=BEDULAN disabled=yes list=ip-soho
add address=10.253.5.0/24 comment=UNIFI-PURIMULYA list=ip-soho
add address=10.203.0.128/25 comment=IP-VPS-CRB list=ip-vps-crb
add address=10.203.0.8/30 comment=IP-VPS-CRB list=ip-vps-crb
add address=172.16.1.206 comment=TEST-TUNNEL-REMOTE list=ip-soho
add address=172.16.1.2 comment=BOD-ASTON-ONYX-ROOM list=ip-soho
add address=172.16.1.222 comment=POS-SATPAM-MTH list=ip-soho
add address=103.19.57.3 list=dns-bitsnet
add address=103.19.57.2 list=dns-bitsnet
add address=103.19.57.2 list=ns-bitsnet
add address=103.19.57.3 list=ns-bitsnet
add address=172.16.2.224/29 comment=TEST-ONU list=ip-soho
add address=172.16.1.80/29 comment=MITRA-FUTURES list=ip-soho
/ip firewall filter
add action=accept chain=input comment="OSPF " protocol=ospf
add action=accept chain=forward comment=\
    "1. Dont disable/delete please, blok spammer" dst-port=25 protocol=tcp \
    src-address=103.105.142.0/24
add action=accept chain=forward comment=\
    "2. Dont disable/delete please, blok spammer" dst-address=\
    103.105.142.0/24 dst-port=25 protocol=tcp
add action=drop chain=forward comment=\
    "3. Dont disable/delete please, blok spammer" dst-port=25 protocol=tcp
add action=drop chain=forward comment="Malware Ransomware Type WannaCRY" \
    dst-port=137-139,445,3127,5678 protocol=tcp
add action=drop chain=forward comment="Malware Ransomware Type WannaCRY" \
    dst-port=137-139,445,3127,5678 protocol=udp
add action=drop chain=forward comment="Block Flooding Kejar" dst-port=\
    22,23,8728,8729 protocol=tcp src-address=103.19.57.28/30
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
add action=drop chain=forward comment="Drop ru-cn" src-address-list=ru-cn
/ip firewall nat
add action=dst-nat chain=dstnat comment="nat to cloudflare" disabled=yes \
    dst-port=53 nth=2,1 protocol=udp src-address-list=!dns-bitsnet \
    to-addresses=1.1.1.1 to-ports=53
add action=dst-nat chain=dstnat disabled=yes dst-port=53 protocol=udp \
    src-address-list=!dns-bitsnet to-addresses=1.0.0.1 to-ports=53
add action=dst-nat chain=dstnat comment="Redirect DNS" disabled=yes \
    dst-address-list=!ns-bitsnet dst-port=53,5353,5355,443,853 nth=2,1 \
    protocol=udp src-address-list=!dns-bitsnet to-addresses=103.19.56.10 \
    to-ports=53
add action=dst-nat chain=dstnat comment="Redirect DNS" disabled=yes \
    dst-address-list=!ns-bitsnet dst-port=53,5353,5355,443,853 nth=1,1 \
    protocol=udp src-address-list=!dns-bitsnet to-addresses=103.19.56.11 \
    to-ports=53
add action=src-nat chain=srcnat comment="nat soho via 57.1" src-address-list=\
    ip-soho to-addresses=103.19.56.218
add action=src-nat chain=srcnat comment=NAT-IMF disabled=yes src-address=\
    172.16.1.80/29 to-addresses=103.19.56.151
add action=src-nat chain=srcnat comment="nat vps via 57.1" src-address-list=\
    ip-vps-crb to-addresses=103.19.56.218
add action=dst-nat chain=dstnat comment=\
    "NAT HOTSPOT AMARIS - ENGINER REQUEST (SAAT FO CUT)" disabled=yes \
    dst-address=103.19.57.145 dst-port=8728 protocol=tcp to-addresses=\
    172.16.2.210 to-ports=8728
add action=dst-nat chain=dstnat comment="NAT CCTV PURIMULYA" dst-address=\
    103.19.56.218 dst-port=8000 protocol=tcp to-addresses=172.16.2.214 \
    to-ports=8000
add action=dst-nat chain=dstnat comment="NAT CCTV PURIMULYA" dst-address=\
    103.19.56.218 dst-port=8001 protocol=tcp to-addresses=172.16.1.126 \
    to-ports=7895
add action=dst-nat chain=dstnat comment="NAT CCTV PURIMULYA" dst-address=\
    103.19.56.218 dst-port=7001 protocol=tcp to-addresses=172.16.1.58 \
    to-ports=8291
add action=dst-nat chain=dstnat comment="FORDWARDING DKIS SUDARSONO" \
    dst-address=103.19.56.218 dst-port=8002 protocol=tcp to-addresses=\
    10.10.192.2 to-ports=8291
add action=dst-nat chain=dstnat comment="NAT CCTV PURIMULYA" disabled=yes \
    dst-address=103.19.56.218 dst-port=9898 protocol=tcp to-addresses=\
    172.16.1.114 to-ports=8291
add action=dst-nat chain=dstnat comment="NAT VPS CIREBON" dst-address=\
    103.19.56.218 dst-port=443 protocol=tcp to-addresses=10.202.0.10 \
    to-ports=443
add action=dst-nat chain=dstnat comment="Router Cust. PDA Net" dst-address=\
    103.19.56.218 dst-port=28291 protocol=tcp to-addresses=172.16.3.22 \
    to-ports=8291
add action=dst-nat chain=dstnat comment="Radio AP Cust. PDA Net" dst-address=\
    103.19.56.218 dst-port=28292 protocol=tcp to-addresses=172.16.3.17 \
    to-ports=443
add action=dst-nat chain=dstnat comment="Radio ST Cust. PDA Net" dst-address=\
    103.19.56.218 dst-port=28293 protocol=tcp to-addresses=172.16.3.18 \
    to-ports=80
add action=dst-nat chain=dstnat comment="CERAGON  ( WEB )" dst-address=\
    103.19.56.218 dst-port=8881 protocol=tcp to-addresses=10.10.11.82 \
    to-ports=80
add action=dst-nat chain=dstnat comment="CERAGON TRISI ( SSH )" dst-address=\
    103.19.56.218 dst-port=8882 protocol=tcp to-addresses=10.203.2.6 \
    to-ports=23
add action=dst-nat chain=dstnat comment="CERAGON TRISI ( SSH )" dst-address=\
    103.19.56.218 dst-port=7777 protocol=tcp to-addresses=10.5.1.12 to-ports=\
    8291
add action=dst-nat chain=dstnat comment=Nat-To-FARM1 disabled=yes \
    dst-address=103.19.56.218 dst-port=7879 protocol=tcp to-addresses=\
    172.16.3.14 to-ports=8291
add action=dst-nat chain=dstnat comment=Nat-To-FAMR2 disabled=yes \
    dst-address=103.19.56.218 dst-port=7880 protocol=tcp to-addresses=\
    172.16.3.10 to-ports=8291
add action=dst-nat chain=dstnat dst-address=103.19.56.218 dst-port=3123 \
    protocol=tcp to-addresses=10.5.1.13 to-ports=80
add action=dst-nat chain=dstnat dst-address=103.19.56.218 dst-port=3124 \
    protocol=tcp to-addresses=10.5.1.13 to-ports=443
add action=dst-nat chain=dstnat comment=ST-dirgantara dst-address=\
    103.19.56.218 dst-port=33221 protocol=tcp to-addresses=192.168.11.20 \
    to-ports=80
add action=dst-nat chain=dstnat comment=GRG-BAHAMA dst-address=103.19.56.218 \
    dst-port=11223 protocol=tcp to-addresses=10.5.1.20 to-ports=8291
add action=dst-nat chain=dstnat dst-address=103.19.56.218 dst-port=1111 \
    protocol=tcp to-addresses=10.200.0.19 to-ports=80
add action=dst-nat chain=dstnat dst-address=103.19.56.218 dst-port=1112 \
    protocol=tcp to-addresses=10.10.10.162 to-ports=80
add action=dst-nat chain=dstnat dst-address=103.19.56.218 dst-port=4569 \
    protocol=tcp to-addresses=172.16.1.222 to-ports=80
add action=dst-nat chain=dstnat comment=\
    "DST NAT ROUTER DKIS PUSAT (SUDARSONO)" dst-address=103.19.56.218 \
    dst-port=62761 protocol=tcp to-addresses=10.10.192.2 to-ports=62761
add action=dst-nat chain=dstnat dst-address=103.19.56.218 dst-port=9080 \
    protocol=tcp to-addresses=172.16.1.126 to-ports=8000
add action=dst-nat chain=dstnat comment=RO-BEDULAN dst-address=103.19.56.218 \
    dst-port=6969 protocol=tcp to-addresses=172.16.11.2 to-ports=8291
add action=dst-nat chain=dstnat comment="ap beduland" dst-address=\
    103.19.56.218 dst-port=6970 protocol=tcp to-addresses=10.10.10.170 \
    to-ports=8291
add action=dst-nat chain=dstnat dst-address=103.19.56.218 dst-port=9081 \
    protocol=tcp to-addresses=10.255.1.2 to-ports=8291
add action=dst-nat chain=dstnat comment="NAT SNMP OLT C320-1 CRB" \
    dst-address=103.19.57.8 dst-port=162 protocol=udp to-addresses=10.203.2.2 \
    to-ports=162
add action=src-nat chain=srcnat comment="NAT OLT" src-address=10.203.2.0/30 \
    to-addresses=103.19.57.8
add action=dst-nat chain=dstnat comment=TELERING dst-address=103.19.56.218 \
    dst-port=8888 protocol=tcp to-addresses=10.5.12.2 to-ports=80
add action=dst-nat chain=dstnat dst-address=103.19.56.218 dst-port=8003 \
    protocol=tcp to-addresses=10.203.1.10 to-ports=443
add action=dst-nat chain=dstnat dst-address=103.19.56.218 dst-port=8003 \
    protocol=tcp to-addresses=10.203.1.10 to-ports=80
add action=dst-nat chain=dstnat comment=PRTG dst-address=103.19.57.8 \
    dst-port=443 protocol=tcp to-addresses=10.203.0.133 to-ports=443
add action=src-nat chain=srcnat dst-address=122.248.43.68 src-address=\
    103.19.57.148 to-addresses=103.19.56.218
add action=src-nat chain=srcnat disabled=yes dst-address=122.248.43.68 \
    src-address=103.19.57.146 to-addresses=103.19.56.218
add action=same chain=srcnat comment=WEB-Portal-Telering disabled=yes \
    dst-address=202.80.119.253 same-not-by-dst=no src-address=103.19.57.148 \
    to-addresses=103.19.56.151
/ip firewall raw
add action=notrack chain=prerouting comment=OSPF protocol=ospf
add action=notrack chain=output protocol=ospf
/ip route
add comment="Backup Via Fiberstar" distance=111 gateway=\
    103.19.56.249,103.19.56.217
add comment="Route to Karantina" distance=1 dst-address=10.4.0.0/16 gateway=\
    10.5.2.99
add comment="ROUTE LOCALLOOP DKIS" disabled=yes distance=1 dst-address=\
    10.10.1.0/24 gateway=10.10.192.6
add comment="ROUTE DKIS LOCALLOOP" disabled=yes distance=1 dst-address=\
    10.10.74.0/24 gateway=10.10.192.6
add comment="ROUTE DKIS LOCALLOOP" disabled=yes distance=1 dst-address=\
    10.10.75.0/24 gateway=10.10.192.6
add distance=1 dst-address=10.203.0.0/30 gateway=103.143.244.2
add comment="RB MON LISTRIK KANTOR CRB" distance=1 dst-address=\
    10.253.1.236/32 gateway=103.19.57.146
add distance=1 dst-address=103.19.56.81/32 gateway=10.5.2.29
add disabled=yes distance=1 dst-address=103.19.57.10/32 gateway=10.5.2.162
add comment="Albahjah TV backup Via GRG" distance=1 dst-address=\
    103.19.57.12/32 gateway=10.5.2.50
add comment="Route to Albahjah Aula" distance=1 dst-address=103.19.57.13/32 \
    gateway=172.16.1.114
add comment="Route to Albahjah Aula" distance=1 dst-address=103.19.57.13/32 \
    gateway=10.5.2.154
add comment="Route to Albahjah Staiba" distance=1 dst-address=103.19.57.14/32 \
    gateway=172.16.1.114
add check-gateway=ping comment=MAINLINK-RADIOQU distance=1 dst-address=\
    103.19.57.20/32 gateway=172.16.1.114
add comment=BACKUP-RADIOQU distance=1 dst-address=103.19.57.20/32 gateway=\
    10.5.2.154
add check-gateway=ping comment="TSM Main" distance=1 dst-address=\
    103.19.57.22/32 gateway=172.16.1.73
add comment="TSM Backup" distance=2 dst-address=103.19.57.22/32 gateway=\
    172.16.1.75
add check-gateway=ping comment="SUTAN RAJA" distance=1 dst-address=\
    103.19.57.23/32 gateway=10.5.2.114
add check-gateway=ping comment="Route to BMT Albahjah" distance=1 \
    dst-address=103.19.57.27/32 gateway=172.16.1.114
add comment="Route to CMW" distance=1 dst-address=103.19.57.28/32 gateway=\
    10.5.2.29
add check-gateway=ping comment="Route to Kejar" distance=1 dst-address=\
    103.19.57.30/32 gateway=10.2.5.18
add comment="Route To Hotel Aston" distance=1 dst-address=103.19.57.48/29 \
    gateway=172.16.3.6
add check-gateway=ping comment="Route to Jasamarga Via TIS" distance=1 \
    dst-address=103.19.57.76/30 gateway=172.16.1.218
add check-gateway=ping comment="Route to Jasamarga / Backup Wireless" \
    distance=2 dst-address=103.19.57.76/30 gateway=10.5.2.67
add comment="Backup Telering" distance=1 dst-address=103.19.57.148/32 \
    gateway=10.10.10.35
add comment="Route to Karantina" distance=1 dst-address=103.19.57.218/32 \
    gateway=10.5.2.99
add distance=1 dst-address=103.19.57.240/29 gateway=10.10.10.146
add distance=1 dst-address=103.19.58.192/26 gateway=\
    103.19.56.249,103.19.56.217 scope=20
add comment="ROUTE TO NODE FNA" distance=1 dst-address=103.143.245.128/26 \
    gateway=103.143.244.125
add distance=1 dst-address=172.16.1.68/30 gateway=103.19.56.217
add check-gateway=ping distance=1 dst-address=172.16.1.120/30 gateway=\
    172.16.1.114
add check-gateway=ping comment="Route to Silih Asah1" distance=1 dst-address=\
    172.16.2.16/30 gateway=10.5.2.43
add comment="Route to Lebakngok" distance=1 dst-address=172.16.2.22/32 \
    gateway=172.16.1.210
add comment="Route to Argasunya" distance=2 dst-address=172.16.2.24/30 \
    gateway=10.10.10.235
add comment="Albahjah TV backup Via GRG" distance=1 dst-address=\
    172.16.2.36/30 gateway=10.5.2.50
add comment="Route To Ivan Sutanto" distance=1 dst-address=172.16.2.40/30 \
    gateway=10.5.2.29
add distance=1 dst-address=172.16.2.40/30 gateway=43-GRG-CMW pref-src=\
    10.5.2.25 scope=10
add comment="Route to Subagja" distance=1 dst-address=172.16.2.80/30 gateway=\
    10.2.5.2
add comment="Route to Desa danalampah" distance=1 dst-address=172.16.2.84/30 \
    gateway=10.5.2.34
add comment="Route to Sarewu" distance=2 dst-address=172.16.2.92/30 gateway=\
    10.10.10.235
add comment="Route To Sanawi" distance=1 dst-address=172.16.2.96/30 gateway=\
    10.2.3.3
add comment="Route to Sumurwuni" distance=1 dst-address=172.16.2.168/30 \
    gateway=10.10.10.154
add comment="Route to Cadas Ngampar" distance=1 dst-address=172.16.2.200/30 \
    gateway=10.10.10.242
add check-gateway=ping comment="Route To Amaris Wireless" distance=2 \
    dst-address=172.16.2.208/30 gateway=10.10.10.146
add distance=1 dst-address=172.16.4.32/30 gateway=10.5.2.106
add comment=BEDULAN distance=1 dst-address=172.16.11.0/30 gateway=10.2.5.11
/ip service
set telnet address=103.19.56.0/22,103.143.244.0/23 port=9989
set ftp address=103.19.56.0/22,103.143.244.0/23 disabled=yes port=9987
set www address=103.19.56.0/22,103.143.244.0/23 port=60080
set ssh address=103.19.56.0/22,103.143.244.0/23 disabled=yes port=9988
set api disabled=yes
set winbox address=0.0.0.0/0 port=9990
set api-ssl disabled=yes
/ip ssh
set forwarding-enabled=remote
/lcd
set touch-screen=disabled
/ppp aaa
set use-radius=yes
/ppp secret
add disabled=yes local-address=192.168.10.2 name=ppp1 remote-address=\
    192.168.10.1
add local-address=172.16.1.205 name=office password=office remote-address=\
    172.16.1.206
/radius
add address=103.19.56.9 secret=fibertrust2020 service=ppp,dhcp
/radius incoming
set accept=yes
/routing bgp network
add disabled=yes network=103.19.57.0/24 synchronize=no
add network=103.143.244.124/31 synchronize=no
/routing bgp peer
add in-filter=iBGP-INTERNAL-in instance=BITSNET multihop=yes name=\
    iBGP-TO-BROADBAND out-filter=iBGP-INTERNAL-out remote-address=\
    103.19.56.152 remote-as=132637
add in-filter=EBGP-FNA-in instance=BITSNET multihop=yes name=EBGP-FNA \
    nexthop-choice=force-self out-filter=EBGP-FNA-out remote-address=\
    103.143.245.144 remote-as=63293 remove-private-as=yes ttl=default
add in-filter=EBGP-SBP-in instance=BITSNET name=EBGP-SBP nexthop-choice=\
    force-self out-filter=EBGP-SBP-out remote-address=10.10.100.3 remote-as=\
    38753 remove-private-as=yes tcp-md5-key=38753 ttl=default
add in-filter=EBGP-PSAT-in instance=BITSNET name=EBGP-PSAT out-filter=\
    EBGP-PSAT-out remote-address=10.10.100.10 remote-as=139438 \
    remove-private-as=yes tcp-md5-key=139438 ttl=default
add disabled=yes in-filter=IBGP-BITS-in instance=BITSNET name=\
    iBGP-IFORTE-JAKARTA nexthop-choice=force-self out-filter=IBGP-BITS-out \
    remote-address=103.19.56.217 remote-as=132637 ttl=default
add disabled=yes in-filter=IBGP-BITS-in instance=BITSNET name=iBGP-FS-JAKARTA \
    nexthop-choice=force-self out-filter=IBGP-BITS-out remote-address=\
    103.19.56.249 remote-as=132637 ttl=default
add disabled=yes in-filter=IBGP-FBC-in instance=FIBERCONNECT name=\
    iBGP-IFORTE-JAKARTA-FBC nexthop-choice=force-self out-filter=IBGP-FBC-out \
    remote-address=103.168.46.44 remote-as=142310 ttl=default
add disabled=yes in-filter=IBGP-FBC-in instance=FIBERCONNECT name=\
    iBGP-FS-JAKARTA-FBC nexthop-choice=force-self out-filter=IBGP-FBC-out \
    remote-address=103.168.46.46 remote-as=142310 ttl=default
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
add action=discard chain=ospf-in prefix=103.19.56.154 prefix-length=32
add action=discard chain=ospf-in
add action=jump chain=ospf-out comment=OSPF-OUT disabled=yes jump-target=\
    Droplist
add action=accept chain=ospf-in prefix=103.19.56.0/24 prefix-length=24-32
add action=accept chain=ospf-in prefix=103.19.57.0/24 prefix-length=24-32
add action=accept chain=ospf-in prefix=103.19.58.0/24 prefix-length=24-32
add action=accept chain=ospf-in prefix=103.19.59.0/24 prefix-length=24-32
add action=accept chain=ospf-out prefix=10.0.0.0/8 prefix-length=8-32
add action=accept chain=ospf-out prefix=172.16.0.0/12 prefix-length=12-32
add action=accept chain=ospf-out prefix=103.19.56.0/24 prefix-length=24-32
add action=accept chain=ospf-out prefix=103.19.57.0/24 prefix-length=24-32
add action=accept chain=ospf-out prefix=103.19.58.0/24 prefix-length=24-32
add action=accept chain=ospf-out prefix=103.19.59.0/24 prefix-length=24-32
add action=accept chain=ospf-out prefix=103.143.244.0/24 prefix-length=24-32
add action=accept chain=ospf-out prefix=103.143.245.0/24 prefix-length=24-32
add action=accept chain=ospf-out prefix=103.105.142.0/24 prefix-length=24-32
add action=accept chain=ospf-out prefix=103.145.14.0/24 prefix-length=24
add action=accept chain=ospf-out prefix=103.145.15.0/24 prefix-length=24
add action=accept chain=ospf-out prefix=27.131.4.0/24 prefix-length=24
add action=discard chain=ospf-out
add action=accept chain=iBGP-INTERNAL-in prefix=103.19.56.154 prefix-length=\
    32
add action=accept chain=iBGP-INTERNAL-in prefix=103.143.244.0/24 \
    prefix-length=24-32
add action=accept chain=iBGP-INTERNAL-in prefix=103.143.245.0/24 \
    prefix-length=24-32
add action=accept chain=iBGP-INTERNAL-in prefix=100.64.0.0/16 prefix-length=\
    16-32
add action=accept chain=iBGP-INTERNAL-in prefix=100.127.0.0/16 prefix-length=\
    16-32
add action=discard chain=iBGP-INTERNAL-in
add action=accept chain=iBGP-INTERNAL-out prefix=103.19.57.0/24 \
    prefix-length=23-32
add action=accept chain=iBGP-INTERNAL-out prefix=103.143.245.128/26
add action=accept chain=iBGP-INTERNAL-out prefix=103.143.244.124/31 \
    prefix-length=31-32
add action=discard chain=iBGP-INTERNAL-out
add action=discard chain=EBGP-FNA-in prefix=103.19.56.0/24
add action=discard chain=EBGP-FNA-in prefix=103.19.57.0/24
add action=discard chain=EBGP-FNA-in prefix=103.19.58.0/24
add action=discard chain=EBGP-FNA-in prefix=103.19.59.0/24
add action=discard chain=EBGP-FNA-in prefix=103.143.244.0/24
add action=discard chain=EBGP-FNA-in prefix=103.143.245.0/24
add action=accept chain=EBGP-FNA-in prefix=103.143.245.128/26 prefix-length=\
    26-32
add action=accept chain=EBGP-FNA-out prefix=103.19.57.0/24
add action=accept chain=EBGP-FNA-out prefix=103.143.244.0/24
add action=accept chain=EBGP-FNA-out comment=SBP prefix=27.131.4.0/24
add action=accept chain=EBGP-FNA-out comment=PSAT prefix=103.145.14.0/23 \
    prefix-length=23-24
add action=discard chain=EBGP-FNA-out
add action=accept chain=EBGP-SBP-in prefix=27.131.4.0/24 prefix-length=24
add action=discard chain=EBGP-SBP-in
add action=accept chain=EBGP-SBP-out prefix=103.19.58.192/26 prefix-length=26
add action=accept chain=EBGP-SBP-out prefix=103.143.245.128/26 prefix-length=\
    26
add action=discard chain=EBGP-SBP-out
add action=accept chain=EBGP-PSAT-in prefix=103.145.15.0/24 prefix-length=24
add action=accept chain=EBGP-PSAT-in prefix=103.145.14.0/24 prefix-length=24
add action=discard chain=EBGP-PSAT-in
add action=accept chain=EBGP-PSAT-out prefix=103.143.245.128/26 \
    prefix-length=26
add action=accept chain=EBGP-PSAT-out prefix=103.19.58.192/26 prefix-length=\
    26
add action=discard chain=EBGP-PSAT-out
add action=accept chain=IBGP-BITS-in prefix=103.19.56.0/24 prefix-length=\
    24-32
add action=accept chain=IBGP-BITS-in prefix=103.19.57.0/24 prefix-length=\
    24-32
add action=accept chain=IBGP-BITS-in prefix=103.19.58.0/24 prefix-length=\
    24-32
add action=accept chain=IBGP-BITS-in prefix=103.19.59.0/24 prefix-length=\
    24-32
add action=reject chain=IBGP-BITS-in
add action=accept chain=IBGP-BITS-out prefix=10.0.0.0/8 prefix-length=8-32
add action=accept chain=IBGP-BITS-out prefix=172.16.0.0/12 prefix-length=\
    12-32
add action=accept chain=IBGP-BITS-out prefix=103.19.56.151
add action=accept chain=IBGP-BITS-out prefix=103.19.56.0/24 prefix-length=\
    24-32
add action=accept chain=IBGP-BITS-out prefix=103.19.57.0/24 prefix-length=\
    24-32
add action=accept chain=IBGP-BITS-out prefix=103.143.244.124
add action=accept chain=IBGP-BITS-out prefix=103.143.244.125
add action=accept chain=IBGP-BITS-out prefix=103.143.245.128/26 \
    prefix-length=26
add action=accept chain=IBGP-BITS-out prefix=103.145.14.0/24 prefix-length=24
add action=accept chain=IBGP-BITS-out prefix=103.145.15.0/24 prefix-length=24
add action=discard chain=IBGP-BITS-out
add action=accept chain=IBGP-FBC-in
add action=accept chain=IBGP-FBC-out prefix=103.168.46.0/24 prefix-length=\
    24-32
add action=accept chain=IBGP-FBC-out prefix=103.168.47.0/24 prefix-length=\
    24-32
add action=discard chain=IBGP-FBC-out
/routing ospf interface
add interface=1510-UPLINK-FIBERSTAR network-type=point-to-point
add interface=1513-UPLINK-IFORTE network-type=point-to-point
/routing ospf network
add area=backbone network=103.19.56.248/30
add area=backbone network=103.19.56.216/30
add area=backbone network=103.19.56.151/32
/snmp
set contact=noc@bitsnet.id enabled=yes location="Office_Bitsnet " \
    trap-community=cirebon trap-version=2
/system clock
set time-zone-name=Asia/Jakarta
/system console
set [ find ] disabled=yes
/system identity
set name=dist-crb.bitsnet.id
/system logging
add action=remote topics=critical
add action=remote topics=error
add action=remote topics=info
add action=remote topics=warning
add action=remote topics=critical
add action=remote topics=error
add action=remote topics=info
add action=remote topics=warning
/system ntp client
set enabled=yes primary-ntp=103.19.56.5 secondary-ntp=202.162.32.12
/system package update
set channel=long-term
/system scheduler
add interval=1w name=schedule1 on-event="/system backup save name=(\"BACKUP\" \
    . \"-\" . [/system identity get name] . \"-\" . \\\r\
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
    start-date=may/23/2022 start-time=16:30:59
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
/tool graphing queue
add simple-queue=BOD-ASTON-ONYX-ROOM
add
/tool netwatch
add comment=DONT-DISABLE-UNTUK-FANDY disabled=yes down-script=":if ([/ip addre\
    ss get [/ip address find comment=\"IMY-FANDY\"] disabled]=yes) do={/ip add\
    ress enable [/ip address find comment=\"IMY-FANDY\"]}" host=10.254.7.58 \
    interval=30s up-script=":if ([/ip address get [/ip address find comment=\"\
    IMY-FANDY\"] disabled]=yes) do={/ip address enable [/ip address find comme\
    nt=\"IMY-FANDY\"]} else={/ip address disable [/ip address find comment=\"I\
    MY-FANDY\"]}"
add comment=DONT-DISABLE-UNTUK-CANDRA disabled=yes down-script=":if ([/ip addr\
    ess get [/ip address find comment=\"IMY-CANDRA\"] disabled]=yes) do={/ip a\
    ddress enable [/ip address find comment=\"IMY-CANDRA\"]}" host=\
    10.254.7.58 interval=30s up-script=":if ([/ip address get [/ip address fin\
    d comment=\"IMY-CANDRA\"] disabled]=yes) do={/ip address enable [/ip addre\
    ss find comment=\"IMY-CANDRA\"]} else={/ip address disable [/ip address fi\
    nd comment=\"IMY-CANDRA\"]}"
add comment=DONT-DISABLE-UNTUK-SUARDI disabled=yes down-script=":if ([/ip addr\
    ess get [/ip address find comment=\"IMY-SUARDI\"] disabled]=yes) do={/ip a\
    ddress enable [/ip address find comment=\"IMY-SUARDI\"]}" host=\
    10.254.7.58 interval=30s up-script=":if ([/ip address get [/ip address fin\
    d comment=\"IMY-SUARDI\"] disabled]=yes) do={/ip address enable [/ip addre\
    ss find comment=\"IMY-SUARDI\"]} else={/ip address disable [/ip address fi\
    nd comment=\"IMY-SUARDI\"]}"
add comment=DONT-DISABLE-UNTUK-BACKUP-BROADBAND disabled=yes down-script=":if \
    ([/ip address get [/ip address find comment=\"IP-MGT-SW-GUNTUR\"] disabled\
    ]=yes) do={/ip address enable [/ip address find comment=\"IP-MGT-SW-GUNTUR\
    \"]} else={/ip address disable [/ip address find comment=\"IP-MGT-SW-GUNTU\
    R\"]}" host=10.203.1.2 interval=30s up-script=":if ([/ip address get [/ip \
    address find comment=\"IP-MGT-SW-GUNTUR\"] disabled]=yes) do={/ip address \
    enable [/ip address find comment=\"IP-MGT-SW-GUNTUR\"]}"
add comment=DONT-DISABLE-UNTUK-FANDY disabled=yes down-script=":if ([/ip route\
    \_get [/ip route find comment=\"IMY-FANDY\"] disabled]=yes) do={/ip route \
    enable [/ip route find comment=\"IMY-FANDY\"]}" host=10.254.7.58 \
    interval=30s up-script=":if ([/ip route get [/ip route find comment=\"IMY-\
    FANDY\"] disabled]=yes) do={/ip route enable [/ip route find comment=\"IMY\
    -FANDY\"]} else={/ip route disable [/ip route find comment=\"IMY-FANDY\"]}\
    "
add comment=DONT-DISABLE-UNTUK-DNS-LOKAL-CRB-NAT-0 disabled=yes down-script=":\
    if ([/ip firewall nat get [/ip firewall nat find comment=\"nat ns crb, dis\
    able ketika dns local crb down\"] disabled]=yes) do={/ip firewall nat enab\
    le [/ip firewall nat find comment=\"nat ns crb, disable ketika dns local c\
    rb down\"]} else={/ip firewall nat disable [/ip firewall nat find comment=\
    \"nat ns crb, disable ketika dns local crb down\"]}" host=10.202.0.130 \
    interval=10s up-script=":if ([/ip firewall nat get [/ip firewall nat find \
    comment=\"nat ns crb, disable ketika dns local crb down\"] disabled]=yes) \
    do={/ip firewall nat enable [/ip firewall nat find comment=\"nat ns crb, d\
    isable ketika dns local crb down\"]}"
add comment=DONT-DISABLE-UNTUK-DNS-LOKAL-CRB-NAT-1 disabled=yes down-script=":\
    if ([/ip firewall nat get [/ip firewall nat find comment=\"nat ns crb, ena\
    ble ketika dns local crb down 1\"] disabled]=yes) do={/ip firewall nat ena\
    ble [/ip firewall nat find comment=\"nat ns crb, enable ketika dns local c\
    rb down 1\"]} else={/ip firewall nat disable [/ip firewall nat find commen\
    t=\"nat ns crb, enable ketika dns local crb down 1\"]}" host=10.202.0.130 \
    interval=10s up-script=":if ([/ip firewall nat get [/ip firewall nat find \
    comment=\"nat ns crb, enable ketika dns local crb down 1\"] disabled]=no) \
    do={/ip firewall nat disable [/ip firewall nat find comment=\"nat ns crb, \
    enable ketika dns local crb down 1\"]}"
add comment=DONT-DISABLE-UNTUK-DNS-LOKAL-CRB-NAT-2 disabled=yes down-script=":\
    if ([/ip firewall nat get [/ip firewall nat find comment=\"nat ns crb, ena\
    ble ketika dns local crb down 2\"] disabled]=yes) do={/ip firewall nat ena\
    ble [/ip firewall nat find comment=\"nat ns crb, enable ketika dns local c\
    rb down 2\"]} else={/ip firewall nat disable [/ip firewall nat find commen\
    t=\"nat ns crb, enable ketika dns local crb down 2\"]}" host=10.202.0.130 \
    interval=10s up-script=":if ([/ip firewall nat get [/ip firewall nat find \
    comment=\"nat ns crb, enable ketika dns local crb down 2\"] disabled]=no) \
    do={/ip firewall nat disable [/ip firewall nat find comment=\"nat ns crb, \
    enable ketika dns local crb down 2\"]}"
add comment=DONT-DISABLE-UNTUK-ALBAHJAH-AULA disabled=yes down-script=":if ([/\
    ip address get [/ip address find comment=\"ALBAHJAH-AULA\"] disabled]=yes)\
    \_do={/ip address enable [/ip address find comment=\"ALBAHJAH-AULA\"]}" \
    host=172.16.1.114 interval=30s up-script=":if ([/ip address get [/ip addre\
    ss find comment=\"ALBAHJAH-AULA\"] disabled]=yes) do={/ip address enable [\
    /ip address find comment=\"ALBAHJAH-AULA\"]} else={/ip address disable [/i\
    p address find comment=\"ALBAHJAH-AULA\"]}"
add comment=DONT-DISABLE-UNTUK-BMT-ALBAHJAH disabled=yes down-script=":if ([/i\
    p address get [/ip address find comment=\"BMT-ALBAHJAH\"] disabled]=yes) d\
    o={/ip address enable [/ip address find comment=\"BMT-ALBAHJAH\"]}" host=\
    172.16.1.114 interval=30s up-script=":if ([/ip address get [/ip address fi\
    nd comment=\"BMT-ALBAHJAH\"] disabled]=yes) do={/ip address enable [/ip ad\
    dress find comment=\"BMT-ALBAHJAH\"]} else={/ip address disable [/ip addre\
    ss find comment=\"BMT-ALBAHJAH\"]}"
/tool romon
set enabled=yes secrets=7895123ok
