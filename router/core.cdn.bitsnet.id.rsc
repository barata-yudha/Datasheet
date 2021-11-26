# nov/26/2021 23:20:43 by RouterOS 6.47.9
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
/routing bgp instance
set default disabled=yes
add as=132637 client-to-client-reflection=no name=BITSNET router-id=\
    103.19.56.212
add as=132637 client-to-client-reflection=no disabled=yes name=BITSNET-GGC \
    router-id=10.10.241.46
/snmp community
set [ find default=yes ] addresses=103.19.56.0/22
add addresses=103.19.56.0/22 name=jakarta
/user group
set read policy="local,telnet,read,test,winbox,!ssh,!ftp,!reboot,!write,!polic\
    y,!password,!web,!sniff,!sensitive,!api,!romon,!dude,!tikapp"
set write policy="read,write,!local,!telnet,!ssh,!ftp,!reboot,!policy,!test,!w\
    inbox,!password,!web,!sniff,!sensitive,!api,!romon,!dude,!tikapp"
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas\
    sword,web,sniff,sensitive,api,romon,dude,tikapp"
add name=NOC policy="local,telnet,ssh,reboot,read,write,test,winbox,web,sensit\
    ive,!ftp,!policy,!password,!sniff,!api,!romon,!dude,!tikapp"
add name=SPVNOC policy="local,telnet,ssh,reboot,read,write,test,winbox,passwor\
    d,web,sniff,sensitive,api,romon,tikapp,!ftp,!policy,!dude"
/ip firewall connection tracking
set enabled=yes
/ip neighbor discovery-settings
set discover-interface-list=all
/interface l2tp-server server
set allow-fast-path=yes enabled=yes ipsec-secret=7895123ok max-mru=1500 \
    max-mtu=1500 mrru=1600 use-ipsec=yes
/interface sstp-server server
set enabled=yes keepalive-timeout=300 mrru=1600
/ip address
add address=103.30.172.55/23 comment=CDCIX interface=1100-BITS-CDIX network=\
    103.30.172.0
add address=119.11.184.34/24 comment=JKT-IX interface=1601-BITS-JKT-IX \
    network=119.11.184.0
add address=103.28.74.154/23 comment="TO APJII" interface=2100-BITS-IIX \
    network=103.28.74.0
add address=103.19.56.214 comment="TO DST-2 JUNOS" interface=1115-DST-2-JUNOS \
    network=103.19.56.215
add address=103.19.56.212 comment="TO DST-1 JUNOS" interface=1116-DST-1-JUNOS \
    network=103.19.56.213
add address=218.100.27.229/24 comment=OIXP-10G interface=59-NEW-BITS-OIXP \
    network=218.100.27.0
add address=10.100.126.2/30 comment="ABHINAWA EXCHANGE" interface=\
    551-BITS-ABHINAWA network=10.100.126.0
/ip dhcp-server network
add address=192.168.1.0/24 gateway=192.168.1.1
/ip dns
set servers=103.19.56.10,103.19.56.11
/ip firewall address-list
add address=101.97.43.0/24 list=asn0v4
add address=103.10.112.0/22 list=asn0v4
add address=103.105.218.0/24 list=asn0v4
add address=103.114.191.0/24 list=asn0v4
add address=103.115.193.0/24 list=asn0v4
add address=103.116.194.0/24 list=asn0v4
add address=103.138.210.0/24 list=asn0v4
add address=103.209.125.0/24 list=asn0v4
add address=103.209.127.0/24 list=asn0v4
add address=103.21.244.0/23 list=asn0v4
add address=109.122.240.0/22 list=asn0v4
add address=109.122.244.0/22 list=asn0v4
add address=109.122.248.0/22 list=asn0v4
add address=115.69.232.0/21 list=asn0v4
add address=123.255.88.0/21 list=asn0v4
add address=157.17.128.0/17 list=asn0v4
add address=160.14.0.0/16 list=asn0v4
add address=178.218.148.0/22 list=asn0v4
add address=185.1.105.0/24 list=asn0v4
add address=185.112.44.0/22 list=asn0v4
add address=185.1.131.0/24 list=asn0v4
add address=185.1.163.0/24 list=asn0v4
add address=185.1.170.0/23 list=asn0v4
add address=185.1.172.0/24 list=asn0v4
add address=185.1.2.0/24 list=asn0v4
add address=185.121.148.0/22 list=asn0v4
add address=185.1.46.0/24 list=asn0v4
add address=185.1.47.0/24 list=asn0v4
add address=185.1.48.0/24 list=asn0v4
add address=185.1.61.0/24 list=asn0v4
add address=185.166.106.0/24 list=asn0v4
add address=185.1.68.0/24 list=asn0v4
add address=185.177.26.0/24 list=asn0v4
add address=185.177.27.0/24 list=asn0v4
add address=185.1.8.0/24 list=asn0v4
add address=185.1.86.0/24 list=asn0v4
add address=185.1.94.0/24 list=asn0v4
add address=185.201.20.0/22 list=asn0v4
add address=185.222.116.0/22 list=asn0v4
add address=185.224.104.0/22 list=asn0v4
add address=185.224.60.0/22 list=asn0v4
add address=185.230.192.0/22 list=asn0v4
add address=185.230.232.0/22 list=asn0v4
add address=185.230.92.0/22 list=asn0v4
add address=185.234.164.0/22 list=asn0v4
add address=185.54.240.0/22 list=asn0v4
add address=185.55.220.0/22 list=asn0v4
add address=185.90.119.0/24 list=asn0v4
add address=187.16.192.0/19 list=asn0v4
add address=193.104.15.0/24 list=asn0v4
add address=193.105.232.0/24 list=asn0v4
add address=193.138.31.0/24 list=asn0v4
add address=193.178.185.0/24 list=asn0v4
add address=193.20.0.0/15 list=asn0v4
add address=193.201.28.0/23 list=asn0v4
add address=193.232.135.0/24 list=asn0v4
add address=193.232.136.0/24 list=asn0v4
add address=193.232.140.0/24 list=asn0v4
add address=193.232.244.0/24 list=asn0v4
add address=193.232.87.0/24 list=asn0v4
add address=193.253.149.0/24 list=asn0v4
add address=193.5.16.0/23 list=asn0v4
add address=193.5.18.0/23 list=asn0v4
add address=194.116.188.0/23 list=asn0v4
add address=194.116.96.0/24 list=asn0v4
add address=194.153.168.0/23 list=asn0v4
add address=194.190.119.0/24 list=asn0v4
add address=194.226.100.0/22 list=asn0v4
add address=194.32.71.0/24 list=asn0v4
add address=194.34.163.0/24 list=asn0v4
add address=194.42.48.0/24 list=asn0v4
add address=194.50.165.0/24 list=asn0v4
add address=194.68.123.0/24 list=asn0v4
add address=194.68.128.0/24 list=asn0v4
add address=194.68.130.0/23 list=asn0v4
add address=194.68.133.0/24 list=asn0v4
add address=194.68.135.0/24 list=asn0v4
add address=194.85.107.0/24 list=asn0v4
add address=194.85.177.0/24 list=asn0v4
add address=195.182.218.0/23 list=asn0v4
add address=195.189.158.0/23 list=asn0v4
add address=195.208.208.0/21 list=asn0v4
add address=195.238.94.0/23 list=asn0v4
add address=195.245.240.0/24 list=asn0v4
add address=195.42.144.0/23 list=asn0v4
add address=195.69.116.0/24 list=asn0v4
add address=195.69.117.0/24 list=asn0v4
add address=195.69.118.0/24 list=asn0v4
add address=195.69.119.0/24 list=asn0v4
add address=196.10.141.0/24 list=asn0v4
add address=196.223.0.0/24 list=asn0v4
add address=196.223.14.0/23 list=asn0v4
add address=196.223.22.0/23 list=asn0v4
add address=196.223.30.0/23 list=asn0v4
add address=196.223.5.0/24 list=asn0v4
add address=196.223.6.0/24 list=asn0v4
add address=196.251.160.0/19 list=asn0v4
add address=196.50.128.0/18 list=asn0v4
add address=196.60.0.0/24 list=asn0v4
add address=196.60.10.0/23 list=asn0v4
add address=196.60.44.0/24 list=asn0v4
add address=196.60.48.0/24 list=asn0v4
add address=196.60.50.0/24 list=asn0v4
add address=196.60.52.0/24 list=asn0v4
add address=196.60.70.0/23 list=asn0v4
add address=196.60.8.0/23 list=asn0v4
add address=198.179.18.0/24 list=asn0v4
add address=200.192.108.0/22 list=asn0v4
add address=200.219.130.0/23 list=asn0v4
add address=200.219.138.0/23 list=asn0v4
add address=200.219.140.0/23 list=asn0v4
add address=200.219.143.0/24 list=asn0v4
add address=200.219.144.0/22 list=asn0v4
add address=202.93.245.0/24 list=asn0v4
add address=203.159.68.0/23 list=asn0v4
add address=206.130.10.0/24 list=asn0v4
add address=206.130.15.0/24 list=asn0v4
add address=206.195.32.0/19 list=asn0v4
add address=206.197.187.0/24 list=asn0v4
add address=206.41.109.0/24 list=asn0v4
add address=206.53.202.0/24 list=asn0v4
add address=206.72.208.0/24 list=asn0v4
add address=206.80.234.0/24 list=asn0v4
add address=206.80.238.0/24 list=asn0v4
add address=206.80.239.0/24 list=asn0v4
add address=206.81.80.0/22 list=asn0v4
add address=206.82.104.0/22 list=asn0v4
add address=206.83.15.0/24 list=asn0v4
add address=209.24.0.0/24 list=asn0v4
add address=210.184.200.0/22 list=asn0v4
add address=217.29.66.0/23 list=asn0v4
add address=217.29.68.0/23 list=asn0v4
add address=218.100.52.0/23 list=asn0v4
add address=218.100.54.0/24 list=asn0v4
add address=218.100.76.0/24 list=asn0v4
add address=218.100.78.0/24 list=asn0v4
add address=23.211.114.0/23 list=asn0v4
add address=23.4.85.0/24 list=asn0v4
add address=37.49.232.0/23 list=asn0v4
add address=37.49.236.0/22 list=asn0v4
add address=45.12.200.0/22 list=asn0v4
add address=45.158.64.0/22 list=asn0v4
add address=45.158.64.0/24 list=asn0v4
add address=45.158.65.0/24 list=asn0v4
add address=45.158.66.0/24 list=asn0v4
add address=45.158.67.0/24 list=asn0v4
add address=45.184.144.0/22 list=asn0v4
add address=45.227.0.0/22 list=asn0v4
add address=45.6.52.0/22 list=asn0v4
add address=45.90.160.0/22 list=asn0v4
add address=46.143.204.0/22 list=asn0v4
add address=46.143.204.0/24 list=asn0v4
add address=46.143.205.0/24 list=asn0v4
add address=46.143.206.0/24 list=asn0v4
add address=46.17.152.0/21 list=asn0v4
add address=5.172.64.0/18 list=asn0v4
add address=5.57.80.0/22 list=asn0v4
add address=58.181.75.0/24 list=asn0v4
add address=72.52.1.0/24 list=asn0v4
add address=77.83.236.0/22 list=asn0v4
add address=77.95.71.0/24 list=asn0v4
add address=80.128.0.0/11 list=asn0v4
add address=80.238.32.0/19 list=asn0v4
add address=80.73.136.0/21 list=asn0v4
add address=80.81.192.0/21 list=asn0v4
add address=80.81.202.0/24 list=asn0v4
add address=80.81.203.0/24 list=asn0v4
add address=81.173.100.0/22 list=asn0v4
add address=84.38.32.0/20 list=asn0v4
add address=85.188.192.0/18 list=asn0v4
add address=87.237.216.0/21 list=asn0v4
add address=89.200.128.0/21 list=asn0v4
add address=91.204.83.0/24 list=asn0v4
add address=91.232.229.0/24 list=asn0v4
add address=93.191.173.0/24 list=asn0v4
add address=93.95.48.0/21 list=asn0v4
add address=95.214.128.0/22 list=asn0v4
add address=95.214.128.0/24 list=asn0v4
add address=95.214.129.0/24 list=asn0v4
add address=95.214.130.0/24 list=asn0v4
add address=95.214.131.0/24 list=asn0v4
/ip firewall filter
add action=drop chain=input disabled=yes dst-port=53 protocol=udp
add action=drop chain=input disabled=yes dst-port=53 protocol=tcp
/ip firewall raw
add action=drop chain=prerouting comment="drop asn0v4" disabled=yes \
    dst-address-list=asn0v4 log-prefix="asn0v4 : "
add action=drop chain=prerouting comment="drop asn0v4" disabled=yes \
    log-prefix="asn0v4 : " src-address-list=asn0v4
/ip route
add distance=1 gateway=103.19.56.213
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
    max-prefix-restart-time=1h name=IIX-APJII-BrocadeMLXe-16CSF \
    nexthop-choice=force-self out-filter=eBGP-APJI-IIX-out remote-address=\
    103.28.74.255 remote-as=7597 remove-private-as=yes ttl=default
add disabled=yes in-filter=eBGP-APJI-IIX-in instance=BITSNET \
    max-prefix-limit=20000 max-prefix-restart-time=1h name=\
    IIX-APJII-BrocadeMLXe-16Cyber nexthop-choice=force-self out-filter=\
    eBGP-APJI-IIX-out remote-address=103.28.75.0 remote-as=7597 \
    remove-private-as=yes ttl=default
add in-filter=eBGP-APJI-IIX-in instance=BITSNET max-prefix-limit=20000 \
    max-prefix-restart-time=1h name=IIX-APJII-RouterJuniper nexthop-choice=\
    force-self out-filter=eBGP-APJI-IIX-out remote-address=103.28.74.129 \
    remote-as=7597 remove-private-as=yes ttl=default
add in-filter=eBGP-JKT-IIX-in instance=BITSNET name=JKT-IX out-filter=\
    eBGP-JKT-IIX-out remote-address=119.11.184.101 remote-as=137295 \
    remove-private-as=yes ttl=default
add in-filter=eBGP-JKT-IIX-in instance=BITSNET name=JKT-IX2 out-filter=\
    eBGP-JKT-IIX-out remote-address=119.11.184.102 remote-as=137295 \
    remove-private-as=yes ttl=default
add in-filter=eBGP-ALIBABA-in instance=BITSNET name=AS42-PCH nexthop-choice=\
    force-self out-filter=eBGP-ALIBABA-out remote-address=103.28.74.235 \
    remote-as=42 remove-private-as=yes ttl=default
add in-filter=eBGP-ALIBABA-in instance=BITSNET name=AS3856-PCH \
    nexthop-choice=force-self out-filter=eBGP-ALIBABA-out remote-address=\
    103.28.74.236 remote-as=3856 remove-private-as=yes ttl=default
add in-filter=eBGP-ALIBABA-in instance=BITSNET name=EBGP-Akamai-IIX-APJII \
    nexthop-choice=force-self out-filter=eBGP-ALIBABA-out remote-address=\
    103.28.74.121 remote-as=20940 remove-private-as=yes ttl=default
add in-filter=eBGP-ALIBABA-in instance=BITSNET name=EBGP-FB-APJII1 \
    out-filter=eBGP-ALIBABA-out remote-address=103.28.75.88 remote-as=32934 \
    remove-private-as=yes ttl=default
add in-filter=eBGP-ALIBABA-in instance=BITSNET name=EBGP-FB-APJII2 \
    out-filter=eBGP-ALIBABA-out remote-address=103.28.75.89 remote-as=32934 \
    remove-private-as=yes ttl=default
add in-filter=iBGP-BITS-in-2 instance=BITSNET name=IBGP-Bitsnet-2-JUNOS \
    nexthop-choice=force-self out-filter=iBGP-BITS-out-2 remote-address=\
    103.19.56.215 remote-as=132637 remove-private-as=yes ttl=default
add comment="JANGAN DIENABLE" disabled=yes in-filter=eBGP-APJI-IIX-in \
    instance=BITSNET name=EBGP-Cloudflare nexthop-choice=force-self \
    out-filter=eBGP-APJI-IIX-out remote-address=103.28.75.135 remote-as=13335 \
    remove-private-as=yes ttl=default update-source=2100-BITS-IIX
add comment="JANGAN DIENABLE" disabled=yes in-filter=eBGP-JKT-IIX-in \
    instance=BITSNET name=EBGP-Cloudflare-2 nexthop-choice=force-self \
    out-filter=eBGP-JKT-IIX-out remote-address=119.11.184.14 remote-as=13335 \
    ttl=default update-source=1601-BITS-JKT-IX
add in-filter=eBGP-ALIBABA-in instance=BITSNET name=EBGP-Zenlayer \
    nexthop-choice=force-self out-filter=eBGP-ALIBABA-out remote-address=\
    103.28.75.126 remote-as=21859 remove-private-as=yes ttl=default
add in-filter=eBGP-ALIBABA-in instance=BITSNET name=EBGP-Alibaba-Cloud \
    nexthop-choice=force-self out-filter=eBGP-ALIBABA-out remote-address=\
    103.28.75.18 remote-as=45102 remove-private-as=yes ttl=default \
    update-source=2100-BITS-IIX
add in-filter=eBGP-ALIBABA-in instance=BITSNET name=EBGP-Alibaba-CDN \
    nexthop-choice=force-self out-filter=eBGP-ALIBABA-out remote-address=\
    103.28.74.39 remote-as=24429 remove-private-as=yes ttl=default \
    update-source=2100-BITS-IIX
add in-filter=iBGP-BITS-in instance=BITSNET name=IBGP-Bitsnet-1-JUNOS \
    nexthop-choice=force-self out-filter=iBGP-BITS-out remote-address=\
    103.19.56.213 remote-as=132637 remove-private-as=yes ttl=default
add in-filter=eBGP-ALIBABA-in instance=BITSNET name=EBGP-Alibaba-Cloud2-JKTIX \
    nexthop-choice=force-self out-filter=eBGP-ALIBABA-out remote-address=\
    119.11.184.41 remote-as=45102 remove-private-as=yes ttl=default \
    update-source=1601-BITS-JKT-IX
add in-filter=eBGP-ALIBABA-in instance=BITSNET name=EBGP-Amazon-JKTIX \
    out-filter=eBGP-ALIBABA-out remote-address=119.11.184.88 remote-as=16509 \
    remove-private-as=yes ttl=default
add in-filter=eBGP-NICE-IN instance=BITSNET max-prefix-limit=20000 \
    max-prefix-restart-time=1h name=OPENIXP nexthop-choice=force-self \
    out-filter=eBGP-NICE-OUT remote-address=218.100.27.128 remote-as=7717 \
    remove-private-as=yes ttl=default
add disabled=yes in-filter=eBGP-ALIBABA-in instance=BITSNET name=\
    EBGP-Tencent-OIXP out-filter=eBGP-ALIBABA-out remote-address=\
    218.100.36.246 remote-as=132203 remove-private-as=yes ttl=default \
    update-source=*1B
add in-filter=eBGP-ALIBABA-in instance=BITSNET name=EBGP-Akamai-JKTIX \
    out-filter=eBGP-ALIBABA-out remote-address=119.11.184.37 remote-as=20940 \
    remove-private-as=yes ttl=default
add in-filter=eBGP-APJI-IIX-in instance=BITSNET max-prefix-limit=20000 \
    max-prefix-restart-time=1h name=IIX-APJII-Server-1 nexthop-choice=\
    force-self out-filter=eBGP-APJI-IIX-out remote-address=103.28.74.222 \
    remote-as=7597 remove-private-as=yes ttl=default
add in-filter=eBGP-APJI-IIX-in instance=BITSNET max-prefix-limit=20000 \
    max-prefix-restart-time=1h name=IIX-APJII-Server-2 nexthop-choice=\
    force-self out-filter=eBGP-APJI-IIX-out remote-address=103.28.75.222 \
    remote-as=7597 remove-private-as=yes ttl=default
add disabled=yes in-filter=eBGP-ALIBABA-in instance=BITSNET name=\
    EBGP-Tencent-IIX out-filter=eBGP-ALIBABA-out remote-address=103.28.74.204 \
    remote-as=132203 remove-private-as=yes ttl=default update-source=*1B
add in-filter=eBGP-ABHINAWA-in instance=BITSNET name=EBGP-ABHINAWA \
    nexthop-choice=force-self out-filter=eBGP-ABHINAWA-out remote-address=\
    10.100.126.1 remote-as=138077 ttl=default
/routing filter
add action=accept chain=iBGP-BITS-out comment=iBGP-Distribusi-1-JunOS prefix=\
    0.0.0.0/0 prefix-length=0
add action=discard chain=iBGP-BITS-out prefix=103.19.56.0/22 prefix-length=\
    22-32
add action=discard chain=iBGP-BITS-out prefix=103.143.244.0/23 prefix-length=\
    23-32
add action=accept chain=iBGP-BITS-in prefix=103.19.56.0/22 prefix-length=\
    22-32
add action=accept chain=iBGP-BITS-out set-bgp-local-pref=500
add action=accept chain=iBGP-BITS-in prefix=103.143.244.0/23 prefix-length=\
    23-32
add action=discard chain=iBGP-BITS-in
add action=accept chain=iBGP-BITS-out-2 comment=iBGP-Distribusi-2-JunOS \
    prefix=0.0.0.0/0 prefix-length=0
add action=discard chain=iBGP-BITS-out-2 prefix=103.19.56.0/22 prefix-length=\
    22-32
add action=discard chain=iBGP-BITS-out-2 prefix=103.143.244.0/23 \
    prefix-length=23-32
add action=accept chain=iBGP-BITS-out-2 set-bgp-local-pref=500
add action=accept chain=iBGP-BITS-in-2 prefix=103.19.56.52/30 prefix-length=\
    30 set-bgp-weight=100
add action=accept chain=iBGP-BITS-in-2 prefix=103.19.56.208/30 prefix-length=\
    30 set-bgp-weight=100
add action=accept chain=iBGP-BITS-in-2 prefix=103.19.57.80/30 prefix-length=\
    30 set-bgp-weight=100
add action=accept chain=iBGP-BITS-in-2 prefix=103.19.57.96/29 prefix-length=\
    29 set-bgp-weight=100
add action=accept chain=iBGP-BITS-in-2 prefix=103.19.57.152/29 prefix-length=\
    29 set-bgp-weight=100
add action=accept chain=iBGP-BITS-in-2 prefix=103.19.57.168/30 prefix-length=\
    30 set-bgp-weight=100
add action=accept chain=iBGP-BITS-in-2 prefix=103.19.57.172/30 prefix-length=\
    30 set-bgp-weight=100
add action=accept chain=iBGP-BITS-in-2 prefix=103.19.57.224/30 prefix-length=\
    30 set-bgp-weight=100
add action=accept chain=iBGP-BITS-in-2 prefix=103.19.57.244/30 prefix-length=\
    30 set-bgp-weight=100
add action=accept chain=iBGP-BITS-in-2 prefix=103.19.58.0/27 prefix-length=27 \
    set-bgp-weight=100
add action=accept chain=iBGP-BITS-in-2 prefix=103.19.58.32/27 prefix-length=\
    27 set-bgp-weight=100
add action=accept chain=iBGP-BITS-in-2 prefix=103.19.58.132/30 prefix-length=\
    30 set-bgp-weight=100
add action=accept chain=iBGP-BITS-in-2 prefix=103.19.59.184/30 prefix-length=\
    30 set-bgp-weight=100
add action=accept chain=iBGP-BITS-in-2 prefix=103.19.59.188/30 prefix-length=\
    30 set-bgp-weight=100
add action=accept chain=iBGP-BITS-in-2 prefix=103.19.59.224/30 prefix-length=\
    30 set-bgp-weight=100
add action=accept chain=iBGP-BITS-in-2 prefix=103.19.56.0/22 prefix-length=\
    22-32
add action=accept chain=iBGP-BITS-in-2 prefix=103.143.244.0/23 prefix-length=\
    23-32
add action=accept chain=iBGP-BITS-in-2 prefix=103.105.142.0/24 prefix-length=\
    24
add action=discard chain=iBGP-BITS-in-2
add action=accept chain=eBGP-CD-IX-OUT comment="CDC IX" prefix=103.19.56.0/24 \
    prefix-length=24
add action=accept chain=eBGP-CD-IX-OUT prefix=103.19.57.0/24 prefix-length=24
add action=accept chain=eBGP-CD-IX-OUT prefix=103.19.58.0/24 prefix-length=24
add action=accept chain=eBGP-CD-IX-OUT prefix=103.19.59.0/24 prefix-length=24
add action=accept chain=eBGP-CD-IX-OUT prefix=103.143.244.0/24 prefix-length=\
    24
add action=accept chain=eBGP-CD-IX-OUT prefix=103.143.245.0/24 prefix-length=\
    24
add action=accept chain=eBGP-CD-IX-OUT prefix=103.143.244.0/23 prefix-length=\
    23
add action=accept chain=eBGP-CD-IX-OUT prefix=103.111.217.0/24 prefix-length=\
    24
add action=accept chain=eBGP-CD-IX-OUT prefix=202.46.80.0/22 prefix-length=22
add action=accept chain=eBGP-CD-IX-OUT prefix=103.19.56.0/22 prefix-length=22
add action=discard chain=eBGP-CD-IX-OUT set-bgp-communities=""
add action=discard chain=eBGP-CD-IX-IN disabled=yes prefix=103.247.8.0/23 \
    prefix-length=23-24
add action=discard chain=eBGP-CD-IX-IN disabled=yes prefix=202.6.208.0/20 \
    prefix-length=20-24
add action=discard chain=eBGP-CD-IX-IN prefix=101.255.0.0/17 prefix-length=\
    17-24
add action=discard chain=eBGP-CD-IX-IN prefix=103.50.129.0/24 prefix-length=\
    24
add action=discard chain=eBGP-CD-IX-IN prefix=103.19.56.0/22 prefix-length=\
    22-24
add action=discard chain=eBGP-CD-IX-IN prefix=103.143.244.0/23 prefix-length=\
    23-24
add action=discard append-bgp-communities="" chain=eBGP-CD-IX-IN prefix=\
    203.207.55.0/24 prefix-length=24 set-bgp-communities=""
add action=discard append-bgp-communities="" chain=eBGP-CD-IX-IN prefix=\
    124.158.128.0/23 prefix-length=23-24 set-bgp-communities=""
add action=discard append-bgp-communities="" chain=eBGP-CD-IX-IN prefix=\
    47.89.92.0/22 prefix-length=22-24 set-bgp-communities=""
add action=discard append-bgp-communities="" chain=eBGP-CD-IX-IN disabled=yes \
    prefix=103.115.228.0/24 prefix-length=24 set-bgp-communities=""
add action=discard chain=eBGP-CD-IX-IN comment=Kemendagri prefix=\
    103.77.185.0/24 prefix-length=24-32
add action=discard bgp-as-path=15133 chain=eBGP-CD-IX-IN set-bgp-communities=\
    ""
add action=discard bgp-as-path=32934 chain=eBGP-CD-IX-IN set-bgp-communities=\
    ""
add action=discard bgp-as-path=55666 chain=eBGP-CD-IX-IN set-bgp-communities=\
    ""
add action=discard bgp-as-path=135445 chain=eBGP-CD-IX-IN \
    set-bgp-communities=""
add action=discard bgp-as-path=38758 chain=eBGP-CD-IX-IN set-bgp-communities=\
    ""
add action=discard bgp-as-path=133343 chain=eBGP-CD-IX-IN \
    set-bgp-communities=""
add action=accept bgp-as-path=18051 chain=eBGP-CD-IX-IN comment=\
    "Prefix Dapodik" disabled=yes set-bgp-local-pref=700
add action=accept chain=eBGP-CD-IX-IN
add action=accept chain=eBGP-RAPID-OUT comment="EBGP RAPID TELKOM" prefix=\
    103.19.56.0/24 prefix-length=24
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
add action=discard chain=eBGP-RAPID-IN comment=Hipernet prefix=\
    202.93.229.0/24 prefix-length=24
add action=discard chain=eBGP-RAPID-IN comment=Kemendagri prefix=\
    103.77.185.0/24 prefix-length=24
add action=discard chain=eBGP-RAPID-IN prefix=103.143.244.0/23 prefix-length=\
    23-24
add action=discard chain=eBGP-RAPID-IN disabled=yes prefix=202.158.8.0/22 \
    prefix-length=22-24
add action=discard chain=eBGP-RAPID-IN prefix=103.19.56.0/22 prefix-length=\
    22-24
add action=accept bgp-as-path=17974 chain=eBGP-RAPID-IN comment=\
    "Prefix Telkom Ceklis Hijau" disabled=yes set-bgp-local-pref=700
add action=accept bgp-as-path=7713 chain=eBGP-RAPID-IN comment=\
    "Prefix Telkom Ceklis Merah" disabled=yes set-bgp-local-pref=700
add action=accept bgp-as-path=65282 chain=eBGP-RAPID-IN comment=\
    "Prefix Telkom Ceklis Merah" disabled=yes set-bgp-local-pref=700
add action=accept chain=eBGP-RAPID-IN
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
add action=accept chain=eBGP-JKT-IIX-out prefix=103.143.244.0/23 \
    prefix-length=23
add action=accept chain=eBGP-JKT-IIX-out prefix=103.19.56.0/22 prefix-length=\
    22
add action=accept chain=eBGP-JKT-IIX-out prefix=103.111.217.0/24 \
    prefix-length=24
add action=discard chain=eBGP-JKT-IIX-out
add action=discard chain=eBGP-JKT-IIX-in prefix=103.144.103.0/24 \
    prefix-length=24
add action=discard chain=eBGP-JKT-IIX-in prefix=103.120.244.0/24 \
    prefix-length=24
add action=discard chain=eBGP-JKT-IIX-in prefix=103.158.96.0/24 \
    prefix-length=24
add action=discard chain=eBGP-JKT-IIX-in prefix=103.143.244.0/23 \
    prefix-length=23-24
add action=discard chain=eBGP-JKT-IIX-in prefix=103.19.56.0/22 prefix-length=\
    22-24
add action=discard chain=eBGP-JKT-IIX-in prefix=202.46.80.0/22 prefix-length=\
    22-24
add action=discard chain=eBGP-JKT-IIX-in prefix=113.197.108.0/22 \
    prefix-length=22
add action=discard bgp-as-path=32934 chain=eBGP-JKT-IIX-in
add action=discard bgp-as-path=135445 chain=eBGP-JKT-IIX-in \
    set-bgp-communities=""
add action=discard bgp-as-path=55666 chain=eBGP-JKT-IIX-in \
    set-bgp-communities=""
add action=discard bgp-as-path=38524 chain=eBGP-JKT-IIX-in comment=\
    "Prefix Cannot Run Via JKT-IX" disabled=yes set-bgp-communities=""
add action=accept chain=eBGP-JKT-IIX-in
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
add action=accept chain=eBGP-APJI-IIX-out prefix=103.111.217.0/24 \
    prefix-length=24
add action=accept chain=eBGP-APJI-IIX-out prefix=103.105.142.0/24 \
    prefix-length=24
add action=discard chain=eBGP-APJI-IIX-out
add action=discard chain=eBGP-APJI-IIX-in disabled=yes prefix=103.247.8.0/23 \
    prefix-length=23-24
add action=discard chain=eBGP-APJI-IIX-in disabled=yes prefix=202.6.208.0/20 \
    prefix-length=20-24
add action=discard chain=eBGP-APJI-IIX-in comment=Hipernet prefix=\
    202.93.229.0/24 prefix-length=24
add action=discard chain=eBGP-APJI-IIX-in comment="Remala Abadi" prefix=\
    101.255.0.0/17 prefix-length=17-32
add action=discard chain=eBGP-APJI-IIX-in comment="Skyline BTN Cijerah" \
    prefix=202.52.12.0/22 prefix-length=22-24
add action=discard chain=eBGP-APJI-IIX-in comment="JDN BTN Cianjur" prefix=\
    120.89.90.0/24 prefix-length=24-32
add action=discard chain=eBGP-APJI-IIX-in prefix=103.50.129.0/24 \
    prefix-length=24
add action=discard chain=eBGP-APJI-IIX-in prefix=103.158.96.0/24 \
    prefix-length=24
add action=discard chain=eBGP-APJI-IIX-in prefix=103.19.56.0/22 \
    prefix-length=22-24
add action=discard chain=eBGP-APJI-IIX-in prefix=103.143.244.0/23 \
    prefix-length=23-24
add action=discard chain=eBGP-APJI-IIX-in prefix=202.46.80.0/22 \
    prefix-length=22-24
add action=discard chain=eBGP-APJI-IIX-in prefix=103.105.142.0/24 \
    prefix-length=24
add action=discard chain=eBGP-APJI-IIX-in prefix=103.234.210.0/24 \
    prefix-length=24
add action=discard bgp-as-path=38524 chain=eBGP-APJI-IIX-in comment=\
    "Prefix Cannot Run Via IIX"
add action=accept chain=eBGP-APJI-IIX-in
add action=accept chain=eBGP-FB-APJII-out comment="FB VIA APJII" prefix=\
    103.19.56.0/24 prefix-length=24
add action=accept chain=eBGP-FB-APJII-out prefix=103.19.57.0/24 \
    prefix-length=24
add action=accept chain=eBGP-FB-APJII-out prefix=103.19.58.0/24 \
    prefix-length=24
add action=accept chain=eBGP-FB-APJII-out prefix=103.19.59.0/24 \
    prefix-length=24
add action=accept chain=eBGP-FB-APJII-out prefix=103.143.244.0/24 \
    prefix-length=24
add action=accept chain=eBGP-FB-APJII-out prefix=103.143.245.0/24 \
    prefix-length=24
add action=accept chain=eBGP-FB-APJII-out prefix=103.111.217.0/24 \
    prefix-length=24
add action=discard chain=eBGP-FB-APJII-out
add action=discard chain=eBGP-FB-APJII-in prefix=103.19.56.0/22 \
    prefix-length=22-24
add action=discard chain=eBGP-FB-APJII-in prefix=103.143.244.0/23 \
    prefix-length=22-24
add action=discard chain=eBGP-FB-APJII-in prefix=202.46.80.0/22 \
    prefix-length=22-24
add action=accept chain=eBGP-FB-APJII-in
add action=accept chain=eBGP-GGC-MVNET-out comment=GGC prefix=103.19.56.0/24 \
    prefix-length=24
add action=accept chain=eBGP-GGC-MVNET-out prefix=103.19.57.0/24 \
    prefix-length=24
add action=accept chain=eBGP-GGC-MVNET-out prefix=103.19.58.0/24 \
    prefix-length=24
add action=accept chain=eBGP-GGC-MVNET-out prefix=103.19.59.0/24 \
    prefix-length=24
add action=accept chain=eBGP-GGC-MVNET-out prefix=103.143.244.0/24 \
    prefix-length=24
add action=accept chain=eBGP-GGC-MVNET-out prefix=103.143.245.0/24 \
    prefix-length=24
add action=accept chain=eBGP-GGC-MVNET-out prefix=103.111.217.0/24 \
    prefix-length=24
add action=discard chain=eBGP-GGC-MVNET-out
add action=discard chain=eBGP-GGC-MVNET-in prefix=103.19.56.0/22 \
    prefix-length=22-24
add action=discard chain=eBGP-GGC-MVNET-in prefix=103.143.244.0/23 \
    prefix-length=23-24
add action=discard chain=eBGP-GGC-MVNET-in disabled=yes prefix=\
    103.158.252.0/23 prefix-length=23-24
add action=discard chain=eBGP-GGC-MVNET-in comment=\
    "Prefix JDN ( Java Digital Nusantara )" prefix=120.89.90.0/23 \
    prefix-length=23-24
add action=discard bgp-as-path=_32934_ chain=eBGP-GGC-MVNET-in disabled=yes
add action=discard bgp-as-path=_55655_ chain=eBGP-GGC-MVNET-in disabled=yes
add action=discard bgp-as-path=_17974_ chain=eBGP-GGC-MVNET-in disabled=yes
add action=discard bgp-as-path=_7713_ chain=eBGP-GGC-MVNET-in disabled=yes
add action=discard bgp-as-path=_63859_ chain=eBGP-GGC-MVNET-in disabled=yes
add action=accept chain=eBGP-GGC-MVNET-in
add action=accept chain=eBGP-ALIBABA-out comment="EBGP ALIBABA" prefix=\
    103.19.56.0/24 prefix-length=24
add action=accept chain=eBGP-ABHINAWA-out comment="EBGP ABHINAWA" prefix=\
    103.19.56.0/24 prefix-length=24
add action=accept chain=eBGP-ALIBABA-out prefix=103.19.57.0/24 prefix-length=\
    24
add action=accept chain=eBGP-ABHINAWA-out prefix=103.19.57.0/24 \
    prefix-length=24
add action=accept chain=eBGP-ALIBABA-out prefix=103.19.58.0/24 prefix-length=\
    24
add action=accept chain=eBGP-ABHINAWA-out prefix=103.19.58.0/24 \
    prefix-length=24
add action=accept chain=eBGP-ALIBABA-out prefix=103.19.59.0/24 prefix-length=\
    24
add action=accept chain=eBGP-ABHINAWA-out prefix=103.19.59.0/24 \
    prefix-length=24
add action=accept chain=eBGP-ALIBABA-out prefix=103.143.244.0/24 \
    prefix-length=24
add action=accept chain=eBGP-ABHINAWA-out prefix=103.143.244.0/24 \
    prefix-length=24
add action=accept chain=eBGP-ALIBABA-out prefix=103.143.245.0/24 \
    prefix-length=24
add action=accept chain=eBGP-ABHINAWA-out prefix=103.143.245.0/24 \
    prefix-length=24
add action=accept chain=eBGP-ALIBABA-out prefix=103.111.217.0/24 \
    prefix-length=24
add action=discard chain=eBGP-ALIBABA-out
add action=discard chain=eBGP-ABHINAWA-out
add action=discard chain=eBGP-ALIBABA-in prefix=103.19.56.0/22 prefix-length=\
    22-24
add action=discard chain=eBGP-ABHINAWA-in prefix=103.19.56.0/22 \
    prefix-length=22-24
add action=discard chain=eBGP-ALIBABA-in prefix=103.143.244.0/23 \
    prefix-length=23-24
add action=discard chain=eBGP-ABHINAWA-in prefix=103.143.244.0/23 \
    prefix-length=23-24
add action=discard chain=eBGP-ALIBABA-in prefix=202.46.80.0/22 prefix-length=\
    22-24
add action=discard chain=eBGP-ABHINAWA-in prefix=202.46.80.0/22 \
    prefix-length=22-24
add action=accept chain=eBGP-ALIBABA-in
add action=accept chain=eBGP-ABHINAWA-in
add action=accept chain=eBGP-NICE-OUT prefix=103.19.56.0/24 prefix-length=24
add action=accept chain=eBGP-NICE-OUT prefix=103.19.57.0/24 prefix-length=24
add action=accept chain=eBGP-NICE-OUT prefix=103.19.58.0/24 prefix-length=24
add action=accept chain=eBGP-NICE-OUT prefix=103.19.59.0/24 prefix-length=24
add action=accept chain=eBGP-NICE-OUT prefix=103.143.244.0/24 prefix-length=\
    24
add action=accept chain=eBGP-NICE-OUT prefix=103.143.245.0/24 prefix-length=\
    24
add action=accept chain=eBGP-NICE-OUT prefix=202.46.80.0/22 prefix-length=22
add action=accept chain=eBGP-NICE-OUT prefix=103.105.142.0/24 prefix-length=\
    24
add action=discard chain=eBGP-NICE-OUT
add action=accept bgp-as-path=3382 chain=eBGP-NICE-IN comment=\
    "University Of Indonesia ( UI ) VIA OIXP" disabled=yes \
    set-bgp-local-pref=810
add action=discard chain=eBGP-NICE-IN comment=Hipernet prefix=202.93.229.0/24 \
    prefix-length=24
add action=discard chain=eBGP-NICE-IN comment="Remala Abadi" prefix=\
    101.255.0.0/17 prefix-length=17-24
add action=discard chain=eBGP-NICE-IN prefix=103.49.220.0/22 prefix-length=\
    22-24
add action=discard chain=eBGP-NICE-IN prefix=107.155.0.0/18 prefix-length=\
    18-24
add action=discard chain=eBGP-NICE-IN prefix=163.181.26.0/24 prefix-length=\
    24-32
add action=discard chain=eBGP-NICE-IN prefix=202.158.8.0/22 prefix-length=\
    22-24
add action=discard chain=eBGP-NICE-IN prefix=103.143.244.0/23 prefix-length=\
    23-24
add action=discard chain=eBGP-NICE-IN prefix=8.8.8.0/24 prefix-length=24
add action=discard chain=eBGP-NICE-IN prefix=8.8.4.0/24 prefix-length=24
add action=discard bgp-as-path=15133 chain=eBGP-NICE-IN comment=\
    "dribbble / mci"
add action=accept chain=eBGP-NICE-IN
add action=discard chain=ospf-in prefix=103.19.56.0/22 prefix-length=22-32
add action=discard chain=ospf-in prefix=103.143.244.0/23 prefix-length=23-32
add action=accept chain=ospf-in
/snmp
set contact=snmp@bits.net.id enabled=yes location=cdc.bits.net.id \
    trap-community=jakarta trap-generators="" trap-version=2
/system clock
set time-zone-name=Asia/Jakarta
/system identity
set name=cdn.bitsnet.id
/system note
set note="Konfigurasi Jangan Pakai BGP Weight, Pakai Local Pref saja"
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
/tool romon
set enabled=yes secrets=7895123ok
