[bitsnet@sw-fiberconnect.id] > export 
# nov/27/2021 02:44:52 by RouterOS 6.48
# software id = PFB5-UKLX
#
# model = CRS326-24G-2S+
# serial number = CD010D973367
/interface bridge
add name=bridge1-switch protocol-mode=none vlan-filtering=yes
/interface ethernet
set [ find default-name=ether21 ] comment=TO-DIST-CNDC-Eth6
set [ find default-name=ether22 ] comment=TO-DIST-CNDC-Eth7
set [ find default-name=ether23 ] comment=TO-DIST-CNDC-Eth8
set [ find default-name=ether24 ] comment=TO-DIST-CNDC-Eth9
set [ find default-name=sfp-sfpplus1 ] comment=TO-DIST-BANDUNG-LT7-Sfp+2
/interface vlan
add interface=bridge1-switch name=20-MGT vlan-id=20
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/user group
set full policy=local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,password,web,sniff,sensitive,api,romon,dude,tikapp
/interface bridge port
add bridge=bridge1-switch interface=sfp-sfpplus1
add bridge=bridge1-switch interface=ether21
add bridge=bridge1-switch interface=ether22
add bridge=bridge1-switch interface=ether23
add bridge=bridge1-switch interface=ether24
add bridge=bridge1-switch interface=sfp-sfpplus2
/ip neighbor discovery-settings
set discover-interface-list=!dynamic
/interface bridge vlan
add bridge=bridge1-switch tagged=sfp-sfpplus1,ether24 vlan-ids=2090
add bridge=bridge1-switch tagged=ether24,bridge1-switch vlan-ids=20
add bridge=bridge1-switch tagged=ether24,sfp-sfpplus2 vlan-ids=552
/ip address
add address=10.11.12.6/30 interface=20-MGT network=10.11.12.4
/ip route
add distance=1 gateway=10.11.12.5
/ip service
set ftp disabled=yes
set www disabled=yes
set ssh disabled=yes
set api disabled=yes
set api-ssl disabled=yes
/system clock
set time-zone-name=Asia/Jakarta
/system identity
set name=sw-fiberconnect.id
/system routerboard settings
set boot-os=router-os
/tool romon
set enabled=yes secrets=7895123ok
