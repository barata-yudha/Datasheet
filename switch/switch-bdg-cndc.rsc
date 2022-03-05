switch-cndc-bdg-bitsnet.id#show running-config

 Being processed.This may take a few minutes,please wait......

 System current configuration:
!command in view_mode
!
!command in config_mode first-step
create vlan 20,28,552,601,2090-2093 active
ipv6 dhcp client mode normal
!
!command in qos mapping mode
!
!command in sred mode
!
!command in vrf_mode
!
!command in acl-ipv4-basic mode
!
!command in acl-ipv4-advanced mode
!
!command in acl-mac mode
!
!command in acl-map mode
!
!command in acl-ipv6 mode
!
!command in acl-advanced mode
!
!command in filter-vlanlist mode
!
!command in traffic policer mode
!
!command in cmap_mode
!
!command in pmap_mode
!
!command in bandwidth profile mode
!
!command in hcos_mode
!
!command in hvlan_mode
!
!command in enable_mode
enable password cipher $@!!92db2f495087f23ed0aafea83193ff7f
user name ageng password cipher $@!!dab73ac88f165aa047b981af78852363 confirm
user name bitsnet password cipher $@!!92db2f495087f23ed0aafea83193ff7f confirm
user name support password cipher $@!!248c5b65af9b3e059db8746a69630bff confirm
user name support privilege 4
hostname switch-cndc-bdg-bitsnet.id
clock timezone + 7 0 Jakarta
clock display utc
!
!command in region_mode
!
!command in ip igmp profile mode
!
!command in mld profile mode
!
!command in outband_mode
!
interface fastethernet 1/0/1
ip address 10.254.11.22 255.255.255.252
!
!command in NULL_mode
!
!command in l2cp profile mode
!
!command in aggregation_mode
!
!command in vlan configuration mode
!
vlan 20
name 20-MGT-SW-CNDC-FIX
!
vlan 28
name 28-MGT-SWICTH-CNDC
!
vlan 552
name 552-ABHINAWA-IX
!
vlan 601
name 601-JABRIX
!
vlan 2090
name 2090-BACKBONE-CNDC
!
vlan 2091
name 2091-BACKBONE-CNDC-BONDING
!
vlan 2092
name 2092-BACKBONE-CNDC-BONDING
!
vlan 2093
name 2093-BACKBONE-CNDC-BONDING
!
!command in tunnel interface mode
!
!command in port_mode
!
interface gigaethernet 1/1/21
description TO-DIST-CNDC-ETH6
switchport access vlan 2091
!
interface gigaethernet 1/1/22
description TO-DIST-CNDC-ETH7
switchport access vlan 2092
!
interface gigaethernet 1/1/23
description TO-DIST-CNDC-ETH8
switchport access vlan 2093
!
interface gigaethernet 1/1/24
description TO-DIST-CNDC-ETH9
switchport trunk allowed vlan 20,552,2090
switchport mode trunk
!
interface tengigabitethernet 1/1/25
description TO-SW-LT7-BANDUNG
switchport trunk allowed vlan 28,601,2090-2093
switchport mode trunk
!
interface tengigabitethernet 1/1/26
description TO-ABHINAWA
switchport trunk allowed vlan 552,601
switchport mode trunk
!
interface tengigabitethernet 1/1/27
speed 1000
!
!command in isf_mode
!
!command in dhcp-pool mode
!
!command in loopback interface mode
!
interface loopback 0
!
!command in vlan interface mode
!
interface vlan 1
shutdown
!
interface vlan 20
ip address 10.11.11.26 255.255.255.252
!
interface vlan 28
ip address 10.254.11.26 255.255.255.252
!
!command in sub_interface mode
!
!command in tdm port mode
!
!command in vxlan_interface mode
!
!command in routemap_mode
!
!command in ospf_mode
!
!command in rip_mode
!
!command in keychain_mode
!
!command in bfd_template_mode
!
!command in iccp mode
!
!command in service_mode
!
!command in mlacp_mode
!
!command in config_mode
dot1x enable
snmp-server location BBU-Bandung-LT7
snmp-server contact noc@bits.net.id
snmp-server community encryption 0x7266ca10ff56ddab ro
snmp-server community encryption 0xae46c4be7fc99191 ro
ip route 0.0.0.0 0.0.0.0 10.254.11.21
console baud-rate 115200
!
!command in linktrace_mode
!
!command in clkmgmt_mode
!
