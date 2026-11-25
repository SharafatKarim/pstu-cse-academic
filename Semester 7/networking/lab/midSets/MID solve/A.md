# R1

en
conf term
hostname R1
enable secret class
line console 0
password cisco
login
exit
line vty 0 4
password cisco
login
exit
int se1/0
clock rate 64000
ip addr 209.165.201.2 255.255.255.252
no shut
exit
int se0/0
description something
clock rate 64000
ip addr 10.0.1.1 255.255.255.252
no shut
exit
int se0/1
clock rate 64000
ip addr 10.0.1.5 255.255.255.252
no shut
exit
int se0/2
clock rate 64000
ip addr 10.0.1.9 255.255.255.252
no shut
exit
int se0/3
clock rate 64000
ip addr 10.0.1.13 255.255.255.252
no shut
exit
ip route 10.1.0.0 255.255.192.0 Serial 0/0
ip route 10.1.64.0 255.255.192.0 Serial 0/1
ip route 10.1.128.0 255.255.192.0 Serial 0/2
ip route 10.1.192.0 255.255.192.0 Serial 0/3
ip route 0.0.0.0 0.0.0.0 Serial 1/0
router rip
version 1
network 209.165.201.0
network 10.1.0.0
network 10.1.64.0
network 10.1.128.0
network 10.1.192.0
network 10.0.1.0
network 10.0.1.4
network 10.0.1.8
network 10.0.1.12

# ISP

en
conf term
hostname ISP
enable secret class
line console 0
password cisco
login
exit
line vty 0 4
password cisco
login
exit
int se0/0
clock rate 64000
ip addr 209.165.201.1 255.255.255.252
no shut
exit
int fa0/0
ip addr 209.165.200.225 255.255.255.252
no shut
exit
router rip
version 1
network 209.165.201.0
network 209.165.200.224

# B1

en
conf term
hostname B1
enable secret class
line console 0
password cisco
login
exit
line vty 0 4
password cisco
login
exit
int se0/0
ip addr 10.0.1.2 255.255.255.252
no shut
exit
int fa0/0
ip addr 10.1.0.1 255.255.240.0
no shut
exit
int fa0/1
ip addr 10.1.16.1 255.255.240.0
no shut
exit
int fa1/0
ip addr 10.1.32.1 255.255.240.0
no shut
exit
int fa1/1
ip addr 10.1.48.1 255.255.240.0
no shut
exit
ip route 0.0.0.0 0.0.0.0 serial 0/0
router rip
version 1
network 10.1.0.0
network 10.0.1.0


# B2

en
conf term
hostname B2
enable secret class
line console 0
password cisco
login
exit
line vty 0 4
password cisco
login
exit
int se0/0
ip addr 10.0.1.6 255.255.255.252
no shut
exit
int fa0/0
ip addr 10.1.64.1 255.255.240.0
no shut
exit
int fa0/1
ip addr 10.1.80.1 255.255.240.0
no shut
exit
int fa1/0
ip addr 10.1.96.1 255.255.240.0
no shut
exit
int fa1/1
ip addr 10.1.112.1 255.255.240.0
no shut
exit
ip route 0.0.0.0 0.0.0.0 serial 0/0
router rip
version 1
network 10.1.64.0
network 10.0.1.4

# B3

en
conf term
hostname B3
enable secret class
line console 0
password cisco
login
exit
line vty 0 4
password cisco
login
exit
int se0/0
ip addr 10.0.1.10 255.255.255.252
no shut
exit
int fa0/0
ip addr 10.1.128.1 255.255.240.0
no shut
exit
int fa0/1
ip addr 10.1.144.1 255.255.240.0
no shut
exit
int fa1/0
ip addr 10.1.160.1 255.255.240.0
no shut
exit
int fa1/1
ip addr 10.1.176.1 255.255.240.0
no shut
exit
ip route 0.0.0.0 0.0.0.0 serial 0/0
ip route 0.0.0.0 0.0.0.0 serial 0/0
router rip
version 1
network 10.1.128.0
network 10.0.1.8

# B4

en
conf term
hostname B4
enable secret class
line console 0
password cisco
login
exit
line vty 0 4
password cisco
login
exit
int se0/0
ip addr 10.0.1.14 255.255.255.252
no shut
exit
int fa0/0
ip addr 10.1.192.1 255.255.240.0
no shut
exit
int fa0/1
ip addr 10.1.208.1 255.255.240.0
no shut
exit
int fa1/0
ip addr 10.1.224.1 255.255.240.0
no shut
exit
int fa1/1
ip addr 10.1.240.1 255.255.240.0
no shut
exit
ip route 0.0.0.0 0.0.0.0 serial 0/0
router rip
version 1
network 10.1.192.0
network 10.0.1.12
