# Network Topology (Physical Hardware Implementation)

## Figure 1: Network Topology

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
                          /       |       \
        192.168.42.0/29  /        |        \  192.168.42.16/29
        (OSPF Area 0)   /  192.168.42.8/29  \ (OSPF Area 2)
                       /   (OSPF Area 1)     \
                      /           |           \
         (Routed Gi1/0/24) (Routed Gi1/0/24) (Routed Gi1/0/24)
           [ MLS-CSE ]       [ MLS-BBA ]       [ MLS-NFS ]
          (3560 Switch)     (3560 Switch)     (3560 Switch)
          (OSPF Area 0)     (OSPF Area 1)     (OSPF Area 2)
            /   |   \         /   |   \         /   |   \
          V10  V20  V30     V10  V20  V30     V10  V20  V30
          /     |     \     /     |     \     /     |     \
        PCs    PCs    PCs  PCs   PCs    PCs  PCs   PCs    PCs
       +APs   +APs   +APs +APs  +APs   +APs +APs  +APs   +APs
```

> **Hardware Note on Interface Numbering:**
> - Multilayer Switches (Catalyst 3560/3750): Ports are denoted as `GigabitEthernet 1/0/X` (or `FastEthernet 0/X` on 10/100 models like Catalyst 3560-24TS/PS). Port 24 (`Gi1/0/24` or `Fa0/24`) is dedicated as the routed uplink port (`no switchport`). Access ports 1–18 are divided equally among VLANs (1–6: VLAN 10, 7–12: VLAN 20, 13–18: VLAN 30).
> - Routers: Adjust interface identifiers (`Gi0/0`, `Gi1/0`, or `Gi0/0/0`, `Gi0/0/1`) to match your physical router's slot/port layout (`show ip interface brief`).
> - Password standard across all devices: **`cisco`** (Privileged EXEC enable secret, SSH user passwords, and console line).

---

## Device Configurations

### 1. Core Router

Acts as the OSPF Area Border Router (ABR) and default gateway towards the ISP.

```cisco
enable
configure terminal

! Device Identity & DNS Lookup Suppression
hostname Core-Router
ip domain-name campus.edu
no ip domain-lookup

! Management Security & Passwords
enable secret cisco
username admin privilege 15 secret cisco
username cisco privilege 15 secret cisco
service password-encryption

! SSH Configuration (SSHv2 with 1024-bit RSA key)
crypto key generate rsa modulus 1024
ip ssh version 2
ip ssh time-out 60
ip ssh authentication-retries 3

! Console & Remote Access Lines
line con 0
 password cisco
 login
 logging synchronous
 exec-timeout 15 0
exit

line vty 0 15
 login local
 transport input ssh
 logging synchronous
 exec-timeout 15 0
exit

! Downlink to MLS-CSE (OSPF Area 0)
! network = 192.168.42.0/29
interface GigabitEthernet1/0
 description Downlink to MLS-CSE (Area 0)
 ip address 192.168.42.1 255.255.255.248
 no shutdown
exit

! Downlink to MLS-BBA (OSPF Area 1)
! network = 192.168.42.8/29
interface GigabitEthernet2/0
 description Downlink to MLS-BBA (Area 1)
 ip address 192.168.42.9 255.255.255.248
 no shutdown
exit

! Downlink to MLS-NFS (OSPF Area 2)
! network = 192.168.42.16/29
interface GigabitEthernet3/0
 description Downlink to MLS-NFS (Area 2)
 ip address 192.168.42.17 255.255.255.248
 no shutdown
exit

! Uplink to ISP Router
! network = 103.133.254.0/24
interface GigabitEthernet0/0
 description Uplink to ISP Router
 ip address 103.133.254.2 255.255.255.0
 no shutdown
exit

! Default Route to Internet
ip route 0.0.0.0 0.0.0.0 103.133.254.1

! Multi-Area OSPF Configuration (ABR)
router ospf 1
 router-id 1.2.3.0
 network 192.168.42.0 0.0.0.7 area 0
 network 192.168.42.8 0.0.0.7 area 1
 network 192.168.42.16 0.0.0.7 area 2
 default-information originate
exit

end
write memory
```

---

### 2. MLS-CSE (Multilayer Switch)

All interfaces and uplinks reside in **OSPF Area 0**.

```cisco
enable
configure terminal

! Device Identity & DNS Lookup Suppression
hostname MLS-CSE
ip domain-name campus.edu
no ip domain-lookup

! Enable Layer 3 Routing
ip routing

! Management Security & Passwords
enable secret cisco
username admin privilege 15 secret cisco
username cisco privilege 15 secret cisco
service password-encryption

! SSH Configuration (SSHv2 with 1024-bit RSA key)
crypto key generate rsa modulus 1024
ip ssh version 2
ip ssh time-out 60
ip ssh authentication-retries 3

! Console & Remote Access Lines
line con 0
 password cisco
 login
 logging synchronous
 exec-timeout 15 0
exit

line vty 0 15
 login local
 transport input ssh
 logging synchronous
 exec-timeout 15 0
exit

! VLAN Definitions
vlan 10
 name Student
vlan 20
 name Teacher
vlan 30
 name Academic
exit

! Access Port Allocation (Ports 1-18 for Users/APs)
! Note: spanning-tree portfast allows client ports to bypass STP listening/learning delay for immediate DHCP acquisition.
interface range GigabitEthernet 1/0/1 - 6
 description Student Access Ports
 switchport mode access
 switchport access vlan 10
 spanning-tree portfast
exit

interface range GigabitEthernet 1/0/7 - 12
 description Teacher Access Ports
 switchport mode access
 switchport access vlan 20
 spanning-tree portfast
exit

interface range GigabitEthernet 1/0/13 - 18
 description Academic Access Ports
 switchport mode access
 switchport access vlan 30
 spanning-tree portfast
exit

! Switched Virtual Interfaces (SVIs) - Gateways
interface vlan 10
 description Gateway Student
 ip address 192.168.0.1 255.255.248.0
 no shutdown
exit

interface vlan 20
 description Gateway Teacher
 ip address 192.168.24.1 255.255.252.0
 no shutdown
exit

interface vlan 30
 description Gateway Academic
 ip address 192.168.36.1 255.255.254.0
 no shutdown
exit

! DHCP Pool Configuration
ip dhcp excluded-address 192.168.0.1
ip dhcp excluded-address 192.168.24.1
ip dhcp excluded-address 192.168.36.1

ip dhcp pool CSE_STUDENT
 network 192.168.0.0 255.255.248.0
 default-router 192.168.0.1
 dns-server 103.133.254.2
exit

ip dhcp pool CSE_TEACHER
 network 192.168.24.0 255.255.252.0
 default-router 192.168.24.1
 dns-server 103.133.254.2
exit

ip dhcp pool CSE_ACADEMIC
 network 192.168.36.0 255.255.254.0
 default-router 192.168.36.1
 dns-server 103.133.254.2
exit

! Routed Uplink Interface to Core Router
interface GigabitEthernet1/0/24
 description Uplink to Core Router (Area 0)
 no switchport
 ip address 192.168.42.2 255.255.255.248
 no shutdown
exit

! OSPF Configuration (Area 0)
router ospf 1
 router-id 1.1.1.1
 network 192.168.0.0 0.0.7.255 area 0
 network 192.168.24.0 0.0.3.255 area 0
 network 192.168.36.0 0.0.1.255 area 0
 network 192.168.42.0 0.0.0.7 area 0
exit

end
write memory
```

---

### 3. MLS-BBA (Multilayer Switch)

All interfaces and uplinks reside in **OSPF Area 1**.

```cisco
enable
configure terminal

! Device Identity & DNS Lookup Suppression
hostname MLS-BBA
ip domain-name campus.edu
no ip domain-lookup

! Enable Layer 3 Routing
ip routing

! Management Security & Passwords
enable secret cisco
username admin privilege 15 secret cisco
username cisco privilege 15 secret cisco
service password-encryption

! SSH Configuration (SSHv2 with 1024-bit RSA key)
crypto key generate rsa modulus 1024
ip ssh version 2
ip ssh time-out 60
ip ssh authentication-retries 3

! Console & Remote Access Lines
line con 0
 password cisco
 login
 logging synchronous
 exec-timeout 15 0
exit

line vty 0 15
 login local
 transport input ssh
 logging synchronous
 exec-timeout 15 0
exit

! VLAN Definitions
vlan 10
 name Student
vlan 20
 name Teacher
vlan 30
 name Academic
exit

! Access Port Allocation (Ports 1-18 for Users/APs)
interface range GigabitEthernet 1/0/1 - 6
 description Student Access Ports
 switchport mode access
 switchport access vlan 10
 spanning-tree portfast
exit

interface range GigabitEthernet 1/0/7 - 12
 description Teacher Access Ports
 switchport mode access
 switchport access vlan 20
 spanning-tree portfast
exit

interface range GigabitEthernet 1/0/13 - 18
 description Academic Access Ports
 switchport mode access
 switchport access vlan 30
 spanning-tree portfast
exit

! Switched Virtual Interfaces (SVIs) - Gateways
interface vlan 10
 description Gateway Student
 ip address 192.168.8.1 255.255.248.0
 no shutdown
exit

interface vlan 20
 description Gateway Teacher
 ip address 192.168.28.1 255.255.252.0
 no shutdown
exit

interface vlan 30
 description Gateway Academic
 ip address 192.168.38.1 255.255.254.0
 no shutdown
exit

! DHCP Pool Configuration
ip dhcp excluded-address 192.168.8.1
ip dhcp excluded-address 192.168.28.1
ip dhcp excluded-address 192.168.38.1

ip dhcp pool BBA_STUDENT
 network 192.168.8.0 255.255.248.0
 default-router 192.168.8.1
 dns-server 103.133.254.2
exit

ip dhcp pool BBA_TEACHER
 network 192.168.28.0 255.255.252.0
 default-router 192.168.28.1
 dns-server 103.133.254.2
exit

ip dhcp pool BBA_ACADEMIC
 network 192.168.38.0 255.255.254.0
 default-router 192.168.38.1
 dns-server 103.133.254.2
exit

! Routed Uplink Interface to Core Router
interface GigabitEthernet1/0/24
 description Uplink to Core Router (Area 1)
 no switchport
 ip address 192.168.42.10 255.255.255.248
 no shutdown
exit

! OSPF Configuration (Area 1)
router ospf 1
 router-id 2.2.2.2
 network 192.168.8.0 0.0.7.255 area 1
 network 192.168.28.0 0.0.3.255 area 1
 network 192.168.38.0 0.0.1.255 area 1
 network 192.168.42.8 0.0.0.7 area 1
exit

end
write memory
```

---

### 4. MLS-NFS (Multilayer Switch)

All interfaces and uplinks reside in **OSPF Area 2**.

```cisco
enable
configure terminal

! Device Identity & DNS Lookup Suppression
hostname MLS-NFS
ip domain-name campus.edu
no ip domain-lookup

! Enable Layer 3 Routing
ip routing

! Management Security & Passwords
enable secret cisco
username admin privilege 15 secret cisco
username cisco privilege 15 secret cisco
service password-encryption

! SSH Configuration (SSHv2 with 1024-bit RSA key)
crypto key generate rsa modulus 1024
ip ssh version 2
ip ssh time-out 60
ip ssh authentication-retries 3

! Console & Remote Access Lines
line con 0
 password cisco
 login
 logging synchronous
 exec-timeout 15 0
exit

line vty 0 15
 login local
 transport input ssh
 logging synchronous
 exec-timeout 15 0
exit

! VLAN Definitions
vlan 10
 name Student
vlan 20
 name Teacher
vlan 30
 name Academic
exit

! Access Port Allocation (Ports 1-18 for Users/APs)
interface range GigabitEthernet 1/0/1 - 6
 description Student Access Ports
 switchport mode access
 switchport access vlan 10
 spanning-tree portfast
exit

interface range GigabitEthernet 1/0/7 - 12
 description Teacher Access Ports
 switchport mode access
 switchport access vlan 20
 spanning-tree portfast
exit

interface range GigabitEthernet 1/0/13 - 18
 description Academic Access Ports
 switchport mode access
 switchport access vlan 30
 spanning-tree portfast
exit

! Switched Virtual Interfaces (SVIs) - Gateways
interface vlan 10
 description Gateway Student
 ip address 192.168.16.1 255.255.248.0
 no shutdown
exit

interface vlan 20
 description Gateway Teacher
 ip address 192.168.32.1 255.255.252.0
 no shutdown
exit

interface vlan 30
 description Gateway Academic
 ip address 192.168.40.1 255.255.254.0
 no shutdown
exit

! DHCP Pool Configuration
ip dhcp excluded-address 192.168.16.1
ip dhcp excluded-address 192.168.32.1
ip dhcp excluded-address 192.168.40.1

ip dhcp pool NFS_STUDENT
 network 192.168.16.0 255.255.248.0
 default-router 192.168.16.1
 dns-server 103.133.254.2
exit

ip dhcp pool NFS_TEACHER
 network 192.168.32.0 255.255.252.0
 default-router 192.168.32.1
 dns-server 103.133.254.2
exit

ip dhcp pool NFS_ACADEMIC
 network 192.168.40.0 255.255.254.0
 default-router 192.168.40.1
 dns-server 103.133.254.2
exit

! Routed Uplink Interface to Core Router
interface GigabitEthernet1/0/24
 description Uplink to Core Router (Area 2)
 no switchport
 ip address 192.168.42.18 255.255.255.248
 no shutdown
exit

! OSPF Configuration (Area 2)
router ospf 1
 router-id 3.3.3.3
 network 192.168.16.0 0.0.7.255 area 2
 network 192.168.32.0 0.0.3.255 area 2
 network 192.168.40.0 0.0.1.255 area 2
 network 192.168.42.16 0.0.0.7 area 2
exit

end
write memory
```

---

### 5. ISP Router

Simulates upstream ISP connectivity and returns campus traffic via static routing.

```cisco
enable
configure terminal

! Device Identity & DNS Lookup Suppression
hostname ISP-Router
ip domain-name campus.edu
no ip domain-lookup

! Management Security & Passwords
enable secret cisco
username admin privilege 15 secret cisco
username cisco privilege 15 secret cisco
service password-encryption

! SSH Configuration (SSHv2 with 1024-bit RSA key)
crypto key generate rsa modulus 1024
ip ssh version 2
ip ssh time-out 60
ip ssh authentication-retries 3

! Console & Remote Access Lines
line con 0
 password cisco
 login
 logging synchronous
 exec-timeout 15 0
exit

line vty 0 15
 login local
 transport input ssh
 logging synchronous
 exec-timeout 15 0
exit

! Link to Campus Core Router
interface GigabitEthernet0/0/0
 description Link to Campus Core Router
 ip address 103.133.254.1 255.255.255.0
 no shutdown
exit

! Static Return Route for the Campus VLSM Block
ip route 192.168.0.0 255.255.0.0 103.133.254.2

end
write memory
```

---

## Hardware Deployment, Verification & SSH Access Guide

### 1. SSH Remote Management Quick Reference

From any client workstation connected to any department VLAN or management laptop:

```bash
# Connect as admin or cisco (Password: cisco)
ssh admin@<Device-IP>
# or
ssh cisco@<Device-IP>
```

| Device | Management IP(s) | Role / Location |
| :--- | :--- | :--- |
| **Core Router** | `192.168.42.1` (CSE link), `192.168.42.9` (BBA), `192.168.42.17` (NFS), `103.133.254.2` (WAN) | Central ABR |
| **MLS-CSE** | `192.168.42.2` (Uplink), `192.168.0.1` (VLAN 10), `192.168.24.1` (VLAN 20), `192.168.36.1` (VLAN 30) | CSE Multilayer Switch |
| **MLS-BBA** | `192.168.42.10` (Uplink), `192.168.8.1` (VLAN 10), `192.168.28.1` (VLAN 20), `192.168.38.1` (VLAN 30) | BBA Multilayer Switch |
| **MLS-NFS** | `192.168.42.18` (Uplink), `192.168.16.1` (VLAN 10), `192.168.32.1` (VLAN 20), `192.168.40.1` (VLAN 30) | NFS Multilayer Switch |
| **ISP Router** | `103.133.254.1` (WAN link) | External Edge |

### 2. Verification Commands on Real Hardware

Run these commands in Privileged EXEC mode (`#`) on the devices:

```cisco
! 1. Verify SSH Status and Version
show ip ssh
show crypto key mypubkey rsa

! 2. Check Interface Status (Ensure Status=up and Protocol=up)
show ip interface brief

! 3. Check OSPF Neighbor Adjacency (State must reach FULL/BDR or FULL/DR)
show ip ospf neighbor

! 4. Check Routing Table (Look for O IA inter-area routes and O*E2 default route)
show ip route
show ip route ospf

! 5. Verify DHCP Bindings on Multilayer Switches
show ip dhcp binding
show ip dhcp pool

! 6. Save Configuration to NVRAM
copy running-config startup-config
```
