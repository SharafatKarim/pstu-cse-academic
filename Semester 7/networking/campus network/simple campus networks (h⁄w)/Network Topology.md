# Network Topology

## Figure 1: Network

```
[ External Server ]
                              103.133.254.3
                                    |
                           [ ISP / Remote Router ]
                          (103.133.254.1 / AS 65001)
                                    |
                          (103.133.254.2 / AS 65002)
                            [ CORE ROUTER ] 
                            (OSPF Area 0/1/2)
                             /      |      \
           192.168.42.0/29  /       |       \ 192.168.42.16/29
          (Area 0)         / 192.168.42.8/29 \         (Area 0)
                          /     (Area 0)      \
                         /          |          \
             (Routed G0/1)          |          (Routed G0/1)
              [ MLS-CSE ]      [ MLS-BBA ]      [ MLS-NFS ]
             (3560 Switch)    (3560 Switch)    (3560 Switch)
             (OSPF Area 0)    (OSPF Area 1)    (OSPF Area 2)
              /   |   \        /    |    \      /    |    \
            V10  V20  V30    V10   V20   V30  V10   V20   V30
            /     |     \    /      |      \  /      |      \
          PCs    PCs    PCs PCs    PCs    PCs PCs   PCs     PCs
         +APs   +APs   +APs +APs  +APs   +APs +APs  +APs   +APs
```

## Commands

### Core Router

This device acts as the OSPF Area Border Router (ABR).

```cisco
enable
configure terminal

! Link to CSE (Area 0)
! network = 192.168.42.0/29
interface GigabitEthernet1/0
 ip address 192.168.42.1 255.255.255.248
 no shutdown
exit

! Link to BBA (Area 1)
! network = 192.168.42.8/29
interface GigabitEthernet2/0
 ip address 192.168.42.9 255.255.255.248
 no shutdown
exit

! Link to NFS (Area 2)
! network = 192.168.42.16/29
interface GigabitEthernet3/0
 ip address 192.168.42.17 255.255.255.248
 no shutdown
exit

! Link to ISP
! network = 103.133.254.0/24
interface GigabitEthernet0/0
 ip address 103.133.254.2 255.255.255.0
 no shutdown
exit

! Default route to Internet
ip route 0.0.0.0 0.0.0.0 103.133.254.1

! OSPF Configuration
router ospf 1
 router-id 1.2.3.0
 network 192.168.42.0 0.0.0.7 area 0
 network 192.168.42.8 0.0.0.7 area 1
 network 192.168.42.16 0.0.0.7 area 2
 default-information originate
exit
```

---

### MLS-CSE (Multilayer Switch)

All interfaces, including the uplink, reside in OSPF Area 0.

```cisco
enable
configure terminal
ip routing

vlan 10
 name Student
vlan 20
 name Teacher
vlan 30
 name Academic
exit

interface range GigabitEthernet 1/0/1 - 6
 switchport mode access
 switchport access vlan 10
interface range GigabitEthernet 1/0/7 - 12
 switchport mode access
 switchport access vlan 20
interface range GigabitEthernet 1/0/13 - 18
 switchport mode access
 switchport access vlan 30
exit

interface vlan 10
 ip address 192.168.0.1 255.255.248.0
 no shutdown
interface vlan 20
 ip address 192.168.24.1 255.255.252.0
 no shutdown
interface vlan 30
 ip address 192.168.36.1 255.255.254.0
 no shutdown
exit

ip dhcp excluded-address 192.168.0.1
ip dhcp excluded-address 192.168.24.1
ip dhcp excluded-address 192.168.36.1

ip dhcp pool CSE_STUDENT
 network 192.168.0.0 255.255.248.0
 default-router 192.168.0.1
 dns-server 103.133.254.2
ip dhcp pool CSE_TEACHER
 network 192.168.24.0 255.255.252.0
 default-router 192.168.24.1
 dns-server 103.133.254.2
ip dhcp pool CSE_ACADEMIC
 network 192.168.36.0 255.255.254.0
 default-router 192.168.36.1
 dns-server 103.133.254.2
exit

interface GigabitEthernet1/0/24
 no switchport
 ip address 192.168.42.2 255.255.255.248
 no shutdown
exit

router ospf 1
 router-id 1.1.1.1
 network 192.168.0.0 0.0.7.255 area 0
 network 192.168.24.0 0.0.3.255 area 0
 network 192.168.36.0 0.0.1.255 area 0
 network 192.168.42.0 0.0.0.7 area 0
exit

```

---

### MLS-BBA (Multilayer Switch)

All interfaces, including the uplink, reside in OSPF Area 1.

```cisco
enable
configure terminal
ip routing

vlan 10
 name Student
vlan 20
 name Teacher
vlan 30
 name Academic
exit

interface range GigabitEthernet 1/0/1 - 6
 switchport mode access
 switchport access vlan 10
interface range GigabitEthernet 1/0/7 - 12
 switchport mode access
 switchport access vlan 20
interface range GigabitEthernet 1/0/13 - 18
 switchport mode access
 switchport access vlan 30
exit

interface vlan 10
 ip address 192.168.8.1 255.255.248.0
 no shutdown
interface vlan 20
 ip address 192.168.28.1 255.255.252.0
 no shutdown
interface vlan 30
 ip address 192.168.38.1 255.255.254.0
 no shutdown
exit

ip dhcp excluded-address 192.168.8.1
ip dhcp excluded-address 192.168.28.1
ip dhcp excluded-address 192.168.38.1

ip dhcp pool BBA_STUDENT
 network 192.168.8.0 255.255.248.0
 default-router 192.168.8.1
 dns-server 103.133.254.2
ip dhcp pool BBA_TEACHER
 network 192.168.28.0 255.255.252.0
 default-router 192.168.28.1
 dns-server 103.133.254.2
ip dhcp pool BBA_ACADEMIC
 network 192.168.38.0 255.255.254.0
 default-router 192.168.38.1
 dns-server 103.133.254.2
exit

interface GigabitEthernet1/0/24
 no switchport
 ip address 192.168.42.10 255.255.255.248
 no shutdown
exit

router ospf 1
 router-id 2.2.2.2
 network 192.168.8.0 0.0.7.255 area 1
 network 192.168.28.0 0.0.3.255 area 1
 network 192.168.38.0 0.0.1.255 area 1
 network 192.168.42.8 0.0.0.7 area 1
exit

```

---

### MLS-NFS (Multilayer Switch)

All interfaces, including the uplink, reside in OSPF Area 2.

```cisco
enable
configure terminal
ip routing

vlan 10
 name Student
vlan 20
 name Teacher
vlan 30
 name Academic
exit

interface range GigabitEthernet 1/0/1 - 6
 switchport mode access
 switchport access vlan 10
interface range GigabitEthernet 1/0/7 - 12
 switchport mode access
 switchport access vlan 20
interface range GigabitEthernet 1/0/13 - 18
 switchport mode access
 switchport access vlan 30
exit

interface vlan 10
 ip address 192.168.16.1 255.255.248.0
 no shutdown
interface vlan 20
 ip address 192.168.32.1 255.255.252.0
 no shutdown
interface vlan 30
 ip address 192.168.40.1 255.255.254.0
 no shutdown
exit

ip dhcp excluded-address 192.168.16.1
ip dhcp excluded-address 192.168.32.1
ip dhcp excluded-address 192.168.40.1

ip dhcp pool NFS_STUDENT
 network 192.168.16.0 255.255.248.0
 default-router 192.168.16.1
 dns-server 103.133.254.2
ip dhcp pool NFS_TEACHER
 network 192.168.32.0 255.255.252.0
 default-router 192.168.32.1
 dns-server 103.133.254.2
ip dhcp pool NFS_ACADEMIC
 network 192.168.40.0 255.255.254.0
 default-router 192.168.40.1
 dns-server 103.133.254.2
exit

interface GigabitEthernet1/0/24
 no switchport
 ip address 192.168.42.18 255.255.255.248
 no shutdown
exit

router ospf 1
 router-id 3.3.3.3
 network 192.168.16.0 0.0.7.255 area 2
 network 192.168.32.0 0.0.3.255 area 2
 network 192.168.40.0 0.0.1.255 area 2
 network 192.168.42.16 0.0.0.7 area 2
exit

```

### ISP Router

A basic configuration establishing connectivity to the campus and sending a static route back to your internal networks.

```cisco
enable
configure terminal
! Link to Core
interface GigabitEthernet0/0/0
 ip address 103.133.254.1 255.255.255.0
 no shutdown
exit

! Static route for the campus VLSM block
ip route 192.168.0.0 255.255.0.0 103.133.254.2

```