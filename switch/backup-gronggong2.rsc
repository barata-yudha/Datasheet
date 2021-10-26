# oct/26/2021 17:05:03 by RouterOS 6.47.9
# software id = RSZR-W8MI
#
# model = RB750Gr3
# serial number = 8AFF0A33D99E
/interface bridge
add name=loopback
/interface ethernet
set [ find default-name=ether1 ] comment=To_Radio
set [ find default-name=ether2 ] comment=To-Switch
set [ find default-name=ether3 ] comment=To-Microwave
set [ find default-name=ether4 ] comment=To-Rb-Monitoring
/interface ipip
add local-address=10.10.10.235 name=Bitsnet-Cambium remote-address=\
    103.19.56.151
add local-address=10.10.11.34 name=Bitsnet-Microwave remote-address=\
    103.19.56.151
/interface vlan
add interface=ether2 name=40-GRG-ITB-WATUBELAH vlan-id=40
add interface=ether2 name=41-GRG-TIKI vlan-id=41
add interface=ether2 name=42-GRG-NIAM vlan-id=42
add interface=ether2 name=43-GRG-SAMSAT-IVAN vlan-id=43
add interface=ether2 name=44-GRG-SILIHASAH vlan-id=44
add interface=ether2 name=45-GRG-DANALAMPAH vlan-id=45
add interface=ether2 name=46-GRG-ALBAHJAHTV vlan-id=46
add interface=ether2 name=47-GRG-SAREWU vlan-id=47
add interface=ether2 name=48-GRG-JASAMARGA vlan-id=48
add interface=ether2 name=49-GRG-KBL vlan-id=49
add interface=ether2 name=50-GRG-CEMPAKA vlan-id=50
add interface=ether2 name=51-GRG-BAKUNG vlan-id=51
add interface=ether1 name=240-BACKBONE vlan-id=240
add interface=ether3 name=800-GRG-Microwave vlan-id=800
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
add authentication-types=wpa-psk,wpa2-psk eap-methods="" mode=dynamic-keys \
    name=profile1 supplicant-identity="" wpa-pre-shared-key=!nyaSuperMario \
    wpa2-pre-shared-key=!nyaSuperMario
/ip hotspot profile
set [ find default=yes ] html-directory=flash/hotspot
/snmp community
set [ find default=yes ] addresses=103.19.56.0/22
add addresses=103.19.56.0/22 name=cirebon
/ip firewall connection tracking
set enabled=yes loose-tcp-tracking=no
/ip neighbor discovery-settings
set discover-interface-list=all
/ip address
add address=10.5.1.1/24 comment="MGT-AP SWICTH-GRG" interface=ether2 network=\
    10.5.1.0
add address=10.5.2.1/29 interface=40-GRG-ITB-WATUBELAH network=10.5.2.0
add address=10.5.2.9/29 interface=41-GRG-TIKI network=10.5.2.8
add address=10.5.2.25/29 interface=43-GRG-SAMSAT-IVAN network=10.5.2.24
add address=10.5.2.33/29 interface=45-GRG-DANALAMPAH network=10.5.2.32
add address=10.5.2.49/29 interface=46-GRG-ALBAHJAHTV network=10.5.2.48
add address=10.5.2.57/29 interface=47-GRG-SAREWU network=10.5.2.56
add address=10.5.2.65/29 interface=48-GRG-JASAMARGA network=10.5.2.64
add address=10.10.10.235/29 interface=240-BACKBONE network=10.10.10.232
add address=172.16.1.46/30 interface=Bitsnet-Cambium network=172.16.1.44
add address=172.16.2.89/30 interface=ether4 network=172.16.2.88
add address=10.10.11.34/29 interface=800-GRG-Microwave network=10.10.11.32
add address=172.16.1.58/30 interface=Bitsnet-Microwave network=172.16.1.56
add address=10.5.2.41/29 interface=44-GRG-SILIHASAH network=10.5.2.40
add address=10.5.2.73/29 interface=49-GRG-KBL network=10.5.2.72
add address=10.5.2.81/29 interface=50-GRG-CEMPAKA network=10.5.2.80
add address=10.5.2.17/29 interface=42-GRG-NIAM network=10.5.2.16
add address=10.11.12.1 interface=42-GRG-NIAM network=103.19.57.255
add address=10.5.2.89/29 comment=MGT_GRG_BAKUNG interface=51-GRG-BAKUNG \
    network=10.5.2.88
add address=172.16.11.5/30 comment=INET_BAKUNG interface=51-GRG-BAKUNG \
    network=172.16.11.4
add address=10.11.12.1 interface=50-GRG-CEMPAKA network=103.19.57.11
/ip dns
set servers=103.19.56.10,103.19.56.11
/ip firewall filter
add action=fasttrack-connection chain=forward connection-state=\
    established,related
add action=accept chain=forward connection-state=established,related
/ip firewall nat
add action=dst-nat chain=dstnat dst-address=172.16.1.58 dst-port=8080 \
    protocol=tcp to-addresses=10.10.10.234 to-ports=80
/ip route
add check-gateway=ping comment="Default Route MainLink Microwave" distance=1 \
    gateway=172.16.1.57
add check-gateway=ping comment="Default Route BackupLink Cambium" distance=2 \
    gateway=172.16.1.45
add check-gateway=ping comment=\
    "Default Route Backup To Main Microwave Ketika IPIP Down" distance=3 \
    gateway=10.10.11.33
add check-gateway=ping comment=\
    "Default Route Backup2 To Backup Cambium Ketika IPIP Down" distance=4 \
    gateway=10.10.10.233
add check-gateway=ping comment="Route IPIP TUN Via Microwave Main Link" \
    distance=1 dst-address=103.19.56.151/32 gateway=10.10.11.33
add check-gateway=ping comment="Route IPIP TUN Via Cambium Backup Link" \
    distance=2 dst-address=103.19.56.151/32 gateway=10.10.10.233
add comment="Route To Samsat #Disable Karena Tidak dipakai " disabled=yes \
    distance=1 dst-address=103.19.57.20/30 gateway=10.5.2.26
add comment="Router To Tiki" distance=1 dst-address=103.19.57.26/31 gateway=\
    10.5.2.10
add comment="Route To Jasamarga" distance=1 dst-address=103.19.57.76/30 \
    gateway=10.5.2.67
add comment="Route To Ivan Sutanto" distance=1 dst-address=172.16.2.8/30 \
    gateway=10.5.2.29
add comment="Route To Silihasah" distance=1 dst-address=172.16.2.16/30 \
    gateway=10.5.2.43
add comment="Route to Argasunya" distance=1 dst-address=172.16.2.24/30 \
    gateway=10.5.2.2
add comment="Route To Sarewu" distance=1 dst-address=172.16.2.92/30 gateway=\
    10.5.2.58
/ip service
set telnet address=103.19.56.0/22 port=9987
set ftp disabled=yes
set www disabled=yes
set ssh address=103.19.56.0/22 disabled=yes port=9988
set api disabled=yes
set winbox address=0.0.0.0/0
set api-ssl disabled=yes
/snmp
set contact=noc@bitsnet.id enabled=yes location=cirebon trap-community=\
    cirebon trap-version=2
/system clock
set time-zone-name=Asia/Jakarta
/system identity
set name=Distribusi-Bitsnet.id.Grongong
/system package update
set channel=long-term
/system scheduler
add disabled=yes interval=3d name=autobackup&autosend policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
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
    \n:delay 10s\r\
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
set enabled=yes secrets=7895123ok
