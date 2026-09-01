#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2.5cm),
  numbering: "1",
  columns: 1,
)
#set text(size: 12pt)
#set par(justify: true, leading: 0.65em)
#set heading(numbering: "1.")
#show bibliography: set heading(numbering: "1.")
#show figure: set block(breakable: true)

// --------------------------
// Title Page
// --------------------------
#set page(numbering: none)

// Top Section: University Branding
#align(center)[
  #image("PSTU.png", width: 20%, alt: "PSTU")
  #v(1em)
  #text(20pt, weight: "bold")[Patuakhali Science and Technology University] \
  #v(0.5em)
  #text(16pt)[Faculty of Computer Science and Engineering]
]

#v(1.5fr)

// Middle Section: Course & Project Title
#align(center)[
  #image("logo/logo.svg", width: 25%, alt: "Divider")
  #v(1.5em)

  #text(16pt, weight: "bold", fill: luma(80))[Network Routing and Switching] \
  #text(16pt, style: "italic")[CCE-416] \
  #v(0.5em)
  #text(14pt, style: "italic")[Project Proposal]

  #v(2em)
  #line(length: 85%, stroke: 1pt + luma(150))
  #v(1em)
  #text(18pt, weight: "bold")[Multi-Site Hosting Provider Network]
  #v(1em)
  #line(length: 85%, stroke: 1pt + luma(150))
]

#v(2fr)

// Bottom Section: Submission Details 
#grid(
  columns: (1fr, auto),
  gutter: 2em,
  align(left)[
    #text(12pt, weight: "bold", fill: luma(100))[Submitted by:] \
    #v(0.5em)
    *Md. Sharafat Karim* \
    ID: 2102024 \
    Reg: 10151 \
    Semester: 7\ (Level-4, Semester-1)
  ],
  align(left)[
    #text(12pt, weight: "bold", fill: luma(100))[Submitted to:] \
    #v(0.5em)
    *Prof. Dr. Md Samsuzzaman* \
    Professor, \
    Dept. of Computer and Communication Engineering, \
    Patuakhali Science and Technology University.
  ]
)

#v(1.5fr)

// Footer: Date
#align(center)[
  #text(11pt, weight: "bold")[Submission Date: #datetime.today().display("[day] [month repr:long] [year]")]
]

// --------------------------
// Document Content
// --------------------------
#pagebreak()
#set page(numbering: "1")
#outline(indent: auto)
#pagebreak()

// center aligned title
#align(center)[
  #text(16pt, weight: "bold")[Multi-Site Hosting Provider Network] \
]

#v(5pt)

// --------------------------
// Chapter 1: Introduction & Executive Summary
// --------------------------
= Introduction

Modern web infrastructure requires consistent uptime, minimal latency, and zero data loss. Hosting providers running Virtual Private Servers (VPS), web servers, authoritative DNS, and Software-as-a-Service (SaaS) products face strict Service Level Agreements (SLAs). Single-point-of-failure architectures, flat network designs, and unsegmented traffic models expose cloud hosts to costly outages, lateral malware movements, and routing bottlenecks @uptime_outage.

The infrastructure spans five distinct operational facilities: a primary Data Center (DC), a Head Office & Network Operations Center (HO/NOC), two Regional Points of Presence (PoP-1 and PoP-2), and a Disaster Recovery (DR) site.

By introducing hierarchical core-distribution-access switching, multi-area OSPF routing, dual-stack IPv4/IPv6 addressing, first-hop gateway redundancy (HSRP/VRRP), 802.1Q VLAN segmentation, EtherChannel bandwidth aggregation, strict Access Control Lists (ACLs), and Quality of Service (QoS) queues, the proposed network addresses existing scaling limitations while ensuring rapid failover and robust perimeter defense @teare_arch.

// --------------------------
// Chapter 2: Project Objectives & Scope
// --------------------------
= Project Objectives & Scope

== Objectives
+ To build a reliable, high-speed network infrastructure for hosting virtual servers, web applications, and domain services across multiple locations.
+ To design a clear multi-site network structure that connects the head office, data center, regional branch offices, and backup recovery site.
+ To implement both IPv4 and IPv6 network addressing schemes across all connected devices.
+ To separate internal network traffic into distinct virtual groups to keep data organized and prevent unauthorized access.
+ To isolate public-facing websites and DNS servers in a secure public area while keeping internal databases protected.
+ To enforce network security rules, remote login controls, and port restrictions to block external threats.
+ To prioritize time-sensitive traffic like voice calls and core business software over bulk background backups.
+ To test and verify network stability by simulating cable cuts, hardware failures, and unexpected outages.
+ To produce complete network topology diagrams, setup scripts, and empirical test reports for verification.

== Project Scope & Boundary
The scope covers network layers 1 through 4, along with essential network services (DNS, DHCP relay, Web hosting, SSH). Cisco packet tracer will be initially used for emulation, while GNS3 will be used for advanced routing and security testing. The project does not include physical cabling, server OS configuration, or application-level software deployment.

// --------------------------
// Chapter 3: Proposed Network Architecture
// --------------------------
= Proposed Network Architecture

The architecture mirrors a production hosting provider infrastructure, organized into five physical and logical sites connected through redundant WAN and fiber backbones.

#figure(
  image("diagrams/topology.png", width: 95%),
  caption: "High-Availability Multi-Site Hosting Provider Network Architecture",
) <fig_topology>

== Site Breakdown & Physical Distribution

#table(
  columns: (22%, 28%, 50%),
  align: (left, left, left),
  [*Site Name*], [*Minimum Devices*], [*Primary Role & Hosted Services*],
  [Head Office (HO)], [2 Core/Dist switches, 4 Access switches], [Corporate NOC, IT, HR, Finance, Voice, Wireless, Guest Access],
  [Data Center (DC)], [2 Core Routers, 2 Dist Switches, 4 Rack Switches], [VPS Compute Pods, Web Server Pools, Anycast DNS, DMZ, Storage Array],
  [PoP-1 (Regional)], [1 Edge Router, 2 Access Switches], [Regional Edge Caching, Customer VPS Edge Access, Local Transit],
  [PoP-2 (Regional)], [1 Edge Router, 2 Access Switches], [Secondary Regional Edge Caching, Customer Aggregation],
  [Disaster Recovery (DR)], [1 DR Router, 2 Storage Switches], [Offsite Backup Replicas, Standby Database & DNS Mirrors]
)

== Hierarchical Layer Design
+ Core Layer: High-speed Layer-3 switching backbone running OSPF Area 0. Transports traffic between DC, HO, and PoP aggregators without processing CPU-intensive ACL filtering.
+ Distribution Layer: Implements inter-VLAN routing (SVIs), HSRP/VRRP gateway redundancy, OSPF route summarization, and security ACL execution.
+ Access Layer: Connects physical servers, hypervisors, NOC workstations, and IP phones. Enforces Layer-2 security (Port Security, BPDU Guard, Storm Control).
+ Edge / Perimeter: Dual-homed BGP routers (`EDGE-R1` and `EDGE-R2`) interfacing with Tier-1 upstream transit providers, executing Stateful NAT/PAT and Edge ACL filtering.

// --------------------------
// Chapter 4: IP Addressing & VLAN Design
// --------------------------
= IP Addressing 

// == Structured IPv4 VLSM Allocation Plan
The hoster is assigned the private address space `10.0.0.0/8`. Using Variable Length Subnet Masking (VLSM), subnets are allocated hierarchically by location to facilitate summary routes at ABR boundaries.

#table(
  columns: (20%, 25%, 20%, 35%),
  align: (left, left, left, left),
  [*Location*], [*IPv4 Subnet Block*], [*Mask*], [*Subnet Purpose*],
  [Head Office (HO)], [`10.10.0.0/16`], [255.255.0.0], [NOC, Administration, Corporate Departments],
  [PoP-1 (Regional)], [`10.20.0.0/16`], [255.255.0.0], [Regional Customer Edge & Transit],
  [PoP-2 (Regional)], [`10.30.0.0/16`], [255.255.0.0], [Secondary Customer Edge],
  [Data Center (DC)], [`10.40.0.0/16`], [255.255.0.0], [DMZ, VPS Pods, Web Hosting, Storage],
  [Disaster Recovery (DR)], [`10.50.0.0/16`], [255.255.0.0], [Backup Servers & Mirror Replicas],
  [WAN Interconnects], [`10.254.0.0/24`], [255.255.255.0], [Point-to-point router links (/30 subnets)]
)

// == VLAN Architecture & Segmentation
// Traffic is partitioned across 16 distinct VLANs to prevent broadcast storms, isolate tenant traffic, and simplify firewall rule creation.

// #table(
//   columns: (12%, 22%, 22%, 44%),
//   align: (center, left, left, left),
//   [*VLAN*], [*Name*], [*Subnet Range*], [*Functional Description & Access Rights*],
//   [10], [ADMIN], [`10.10.10.0/24`], [System Administrators & Executive Workstations],
//   [20], [HR], [`10.10.20.0/24`], [Human Resources Department],
//   [30], [FINANCE], [`10.10.30.0/24`], [Finance & Billing Systems (Restricted)],
//   [40], [IT_NOC], [`10.10.40.0/24`], [Network Operations Center & Engineers],
//   [50], [ENGINEERING], [`10.10.50.0/24`], [Software & Infrastructure Engineers],
//   [60], [GENERAL_USER], [`10.10.60.0/23`], [Corporate Desk Staff & General Office],
//   [70], [INT_SERVER], [`10.40.70.0/24`], [Internal Corporate Servers (LDAP, Active Directory)],
//   [80], [VOIP], [`10.10.80.0/24`], [IP Telephony & Unified Communications (High Priority)],
//   [90], [GUEST], [`10.10.90.0/24`], [Isolated Guest Wi-Fi (Internet-Only Access)],
//   [100], [MANAGEMENT], [`10.250.100.0/24`], [Out-of-band Switch/Router SSH Management],
//   [110], [SECURITY], [`10.250.110.0/24`], [IP Cameras, Access Control & CCTV],
//   [120], [IOT_FACILITY], [`10.250.120.0/24`], [Environmental Sensors & Smart PDU Monitoring],
//   [200], [DMZ_WEB], [`10.40.200.0/24`], [Public Web Hosting Farms (Inbound Port 80/443)],
//   [210], [DMZ_DNS], [`10.40.210.0/24`], [Authoritative & Recursive DNS Nodes (Port 53)],
//   [220], [VPS_POD_A], [`10.40.220.0/22`], [Hypervisor Cluster A Tenant Virtual Machines],
//   [240], [STORAGE_SAN], [`10.40.240.0/24`], [iSCSI / NFS Storage Traffic (Jumbo Frames)]
// )

// == Dual-Stack IPv6 Implementation Plan
// IPv6 operates concurrently on all SVIs and routing interfaces. Global Unicast Addresses (GUA) are assigned from the allocated prefix `2001:DB8:10::/48`.

// #table(
//   columns: (25%, 35%, 40%),
//   align: (left, left, left),
//   [*Segment*], [*IPv6 Prefix Allocation*], [*Gateway & Interface Assignment*],
//   [Backbone Links], [`2001:DB8:10:0000::/64`], [`FE80::1` Link-Local on all router interfaces],
//   [Head Office NOC], [`2001:DB8:10:1040::/64`], [`2001:DB8:10:1040::1/64` (SVI 40)],
//   [DC DMZ Web], [`2001:DB8:10:4200::/64`], [`2001:DB8:10:4200::1/64` (SVI 200)],
//   [DC DMZ DNS], [`2001:DB8:10:4210::/64`], [`2001:DB8:10:4210::1/64` (SVI 210)],
//   [DC VPS Compute], [`2001:DB8:10:4220::/64`], [`2001:DB8:10:4220::1/64` (SVI 220)],
//   [DR Backup Site], [`2001:DB8:10:5000::/64`], [`2001:DB8:10:5000::1/64` (DR Gateway)]
// )

// --------------------------
// Chapter 5: Advanced Routing & Gateway Redundancy Design
// --------------------------
// = Advanced Routing & Gateway Redundancy Design

// == Multi-Area OSPF Architecture
// The internal routing domain uses OSPFv2 (IPv4) and OSPFv3 (IPv6). The network is split into multiple areas to isolate Link State Advertisements (LSAs), conserve memory, and accelerate convergence @ospf_moy.

// #figure(
//   image("diagrams/ospf.png", width: 85%),
//   caption: "Multi-Area OSPF Routing Topology & Area Boundaries",
// ) <fig_ospf>

// #table(
//   columns: (15%, 25%, 30%, 30%),
//   align: (left, left, left, left),
//   [*Area ID*], [*Area Type*], [*Assigned Location*], [*Route Summarization & LSA Rules*],
//   [Area 0], [Backbone], [Core Switches & Edge Routers], [High-speed transit backbone; links all areas],
//   [Area 10], [Standard], [Head Office / NOC], [Summarizes `10.10.0.0/16` at `HO-DIST` ABR],
//   [Area 20], [Stub], [PoP-1 Regional], [Suppresses Type 4/5 LSAs; uses default route],
//   [Area 30], [Stub], [PoP-2 Regional], [Suppresses Type 4/5 LSAs; uses default route],
//   [Area 40], [Standard], [Data Center Pods], [Summarizes `10.40.0.0/16` at `DC-DIST1/2` ABRs],
//   [Area 50], [NSSA], [Disaster Recovery Site], [Allows local external redistributions (Type 7 LSA)]
// )

// === OSPF Tuning & Parameters
// - *Router IDs*: Explicitly configured using loopback interface IPs (e.g., `CORE-SW1` = `1.1.1.1`, `CORE-SW2` = `2.2.2.2`).
// - *Passive Interfaces*: Enabled on all user-facing Access VLAN SVIs to prevent unauthorized OSPF adjacency formation.
// - *Authentication*: OSPF MD5 message-digest authentication enabled on all inter-router links.
// - *Default Route Origination*: `EDGE-R1` advertises `default-information originate` into Area 0 based on BGP status.

// == First-Hop Gateway Redundancy (HSRP / VRRP)
// To eliminate gateway failures for hosted servers and NOC users, Core and Distribution switches run Hot Standby Router Protocol (HSRP) / Virtual Router Redundancy Protocol (VRRP).

// ```
//    +-----------------------+              +-----------------------+
//    |   CORE-SW1 (Active)   |              |  CORE-SW2 (Standby)   |
//    | Priority: 110         |              | Priority: 100         |
//    | Real IP: 10.40.200.2  |              | Real IP: 10.40.200.3  |
//    +-----------+-----------+              +-----------+-----------+
//                |                                      |
//                +------------------+-------------------+
//                                   |
//                         Virtual IP: 10.40.200.1
//                         Virtual MAC: 0000.0c07.ac96
//                                   |
//                        +----------+----------+
//                        | DMZ Web Server Pool |
//                        +---------------------+
// ```

// - *Active/Standby Tuning*: `CORE-SW1` is configured as active (Priority 110 with Preemption) for even VLANs (e.g., VLAN 200, 220), while `CORE-SW2` is active for odd VLANs (VLAN 210).
// - *Sub-Second Timers*: Hello timers set to 250ms and Dead timers set to 750ms to ensure rapid failover @rfc5798.

// --------------------------
// Chapter 6: Switching & Switching Security Design
// --------------------------
// = Advanced Switching & Layer-2 Security Design

// == Spanning Tree Protocol (RSTP / MSTP)
// Rapid Spanning Tree Protocol (IEEE 802.1w) protects the Layer-2 switching domain against loops while maintaining sub-second topology recovery @ieee8021w.

// - *Primary Root Bridge*: `CORE-SW1` set to priority 4096 for VLANs 10–100.
// - *Secondary Root Bridge*: `CORE-SW2` set to priority 8192 for backup protection.
// - *PortFast & BPDU Guard*: Applied globally on all edge access switchports (`spanning-tree portfast default`, `spanning-tree bpduguard enable`). If a user or rogue switch plugs into an access port and emits BPDUs, the port immediately transitions to the `err-disabled` state.

// == Link Aggregation (EtherChannel)
// High-bandwidth trunks between Core, Distribution, and Access switches are bundled into IEEE 802.3ad Link Aggregation Control Protocol (LACP) EtherChannels.

// #table(
//   columns: (20%, 30%, 25%, 25%),
//   align: (left, left, left, left),
//   [*Channel Group*], [*Connected Devices*], [*Member Ports*], [*Protocol & Mode*],
//   [Port-Channel 1], [`CORE-SW1` <-> `CORE-SW2`], [Gig0/1 - Gig0/2], [LACP Active (20 Gbps)],
//   [Port-Channel 2], [`CORE-SW1` <-> `DC-DIST1`], [Gig0/3 - Gig0/4], [LACP Active (20 Gbps)],
//   [Port-Channel 3], [`CORE-SW2` <-> `DC-DIST2`], [Gig0/3 - Gig0/4], [LACP Active (20 Gbps)],
//   [Port-Channel 4], [`DC-DIST1` <-> `DC-ACCESS1`], [Fast0/1 - Fast0/2], [LACP Active (2 Gbps)]
// )

// == Layer-2 Port Security Enforcement
// Access ports facing physical servers and NOC workstations enforce MAC address locking to prevent MAC flooding attacks:
// ```cisco
// interface FastEthernet0/5
//  switchport mode access
//  switchport access vlan 40
//  switchport port-security
//  switchport port-security maximum 2
//  switchport port-security violation restrict
//  switchport port-security mac-address sticky
// ```

// --------------------------
// Chapter 7: Network Security Architecture & ACL Policies
// --------------------------
= Network Security 

The security architecture follows a Defense-in-Depth strategy, using perimeter firewalling, segment isolation, and access control matrices.

== Access Rules & Enforcement Matrix

#table(
  columns: (8%, 32%, 35%, 25%),
  align: (center, left, left, left),
  [*Rule*], [*Security Directive*], [*Enforcement Mechanism*], [*Applied Interface*],
  [1], [Guest users isolated from internal servers], [Deny traffic from `10.10.90.0/24` to internal networks], [Inbound on VLAN 90 SVI],
  [2], [General users restricted from Finance VLAN], [Deny `10.10.60.0/23` to `10.10.30.0/24` except HTTP billing API], [Inbound on VLAN 60 SVI],
  [3], [Remote management restricted to IT NOC], [Permit SSH (TCP 22) only from `10.10.40.0/24` to MGMT VLAN 100], [VTY Lines on all devices],
  [4], [Public hosting services isolated in DMZ], [Stateful inspection filtering external requests to DMZ Web/DNS], [DC Edge Router / DMZ SVI],
  [5], [Voice & critical SaaS traffic permitted], [Explicit permit rules for VoIP SIP (5060) and RTP traffic], [Core QoS / ACL policies],
  [6], [Full documentation & rule testing], [Logging enabled on implicit deny statements], [All ACL configurations]
)

// == Cisco Extended ACL Configuration Implementation
// Below is the validated extended ACL implementation deployed at the Data Center Distribution boundary:

// ```cisco
// ip access-list extended DC_SECURITY_POLICY
//  ! --- Rule 1: Isolate Guest Network ---
//  deny ip 10.10.90.0 0.0.0.255 10.0.0.0 0.255.255.255
//  ! --- Rule 2: Restrict General Users from Finance ---
//  permit tcp 10.10.60.0 0.0.1.255 host 10.10.30.50 eq 443
//  deny ip 10.10.60.0 0.0.1.255 10.10.30.0 0.0.0.255
//  ! --- Rule 3: IT NOC Secure SSH Management ---
//  permit tcp 10.10.40.0 0.0.0.255 10.250.100.0 0.0.0.255 eq 22
//  ! --- Rule 4: DMZ Public Access Permitted ---
//  permit tcp any 10.40.200.0 0.0.0.255 eq 80
//  permit tcp any 10.40.200.0 0.0.0.255 eq 443
//  permit udp any 10.40.210.0 0.0.0.255 eq 53
//  permit tcp any 10.40.210.0 0.0.0.255 eq 53
//  ! --- Rule 5: VoIP Traffic Permitted ---
//  permit udp 10.10.80.0 0.0.0.255 any range 16384 32767
//  permit tcp 10.10.80.0 0.0.0.255 any eq 5060
//  ! --- Default Catch-All with Logging ---
//  deny ip any any log
// ```

// --------------------------
// Chapter 8: Hosting Network Services & DMZ Integration
// --------------------------
// = Hosting Network Services & DMZ Integration

// The hosting platform integrates multi-tenant services required for modern cloud operations.

// == Data Center & DMZ Architecture
// Publicly accessible endpoints (Web hosting farms and DNS clusters) reside within DMZ VLANs 200 and 210. Internal databases, hypervisors, and storage networks are located behind a multi-layered security boundary.

// ```
// Internet ---> Edge Routers (BGP/NAT) ---> Core Switch ---> DC Dist Switch
//                                                                 |
//                                              +------------------+------------------+
//                                              |                                     |
//                                      [DMZ Security SVI]                  [Internal SVI]
//                                              |                                     |
//                                   +----------+----------+               +----------+----------+
//                                   | Web Hosting (VLAN 200)|               | VPS Pods (VLAN 220) |
//                                   | Anycast DNS (VLAN 210)|               | SAN Storage(VLAN 240)|
//                                   +---------------------+               +---------------------+
// ```

= Essential Network Services
+ Authoritative & Recursive DNS: Deployed across two redundant nodes (`10.40.210.10` primary in DC, `10.50.210.10` secondary in DR) offering public name resolution for hosted tenant domains.
+ Web Server Pools: Scalable Apache/Nginx web server clusters hosted in DMZ VLAN 200, load-balanced via virtual VIPs.
+ Centralized DHCP & DHCP Relay: A central redundant DHCP server (`10.40.70.15`) assigns dynamic IPs for NOC users, Voice devices, and temporary VPS staging pods. Switches running SVIs use `ip helper-address 10.40.70.15` to forward requests.
+ NAT / PAT (Port Address Translation): Edge routers execute overload NAT to map internal corporate subnets (`10.10.0.0/16`) to public IP addresses while protecting internal topology structure.

// --------------------------
// Chapter 9: Quality of Service (QoS) & Traffic Engineering
// --------------------------
// = Quality of Service (QoS) & Traffic Engineering

// Hosting networks transmit heterogeneous traffic types—ranging from real-time customer VoIP calls to multi-gigabyte offsite SAN storage backups. Without QoS, backup spikes cause packet drops and jitter on voice and web streams @rfc2474.

// == Traffic Classification & Prioritization Matrix

// #table(
//   columns: (20%, 15%, 20%, 45%),
//   align: (left, center, left, left),
//   [*Traffic Class*], [*DSCP / CoS*], [*Queue Type*], [*Application Scope & SLA Target*],
//   [VoIP Telephony], [EF (46) / 5], [Strict Priority], [Voice traffic (Latency < 30ms, Jitter < 10ms)],
//   [Video Conferencing], [AF41 (34) / 4], [Low-Latency Queue], [NOC Team Video Meetings & Operations],
//   [Business Applications], [AF21 (18) / 3], [Bandwidth Guaranteed], [SaaS Control Panel, Database Queries],
//   [Default Web Traffic], [CS0 (0) / 0], [Default Fair Queue], [Standard HTTP/HTTPS Customer Traffic],
//   [SAN & DR Backups], [CS1 (8) / 1], [Scavenger Queue], [Offsite SAN backups (Throttled during peak hours)]
// )

// == Modular QoS CLI (MQC) Configuration Example
// ```cisco
// class-map match-any VOICE_CLASS
//  match ip dscp ef
// class-map match-any CRITICAL_SAAS
//  match ip dscp af21

// policy-map HOSTING_QOS_POLICY
//  class VOICE_CLASS
//   priority percent 15
//  class CRITICAL_SAAS
//   bandwidth percent 35
//  class class-default
//   fair-queue
// ```

// --------------------------
// Chapter 10: Mandatory Failure & Recovery Testing Plan
// --------------------------

// = Mandatory Failure & Recovery Testing Plan

// To satisfy project guidelines, six empirical failure injection tests will be executed in the emulation environment (Packet Tracer / GNS3).

// #table(
//   columns: (6%, 24%, 25%, 25%, 20%),
//   align: (center, left, left, left, left),
//   [*ID*], [*Failure Scenario*], [*Expected System Reaction*], [*Observed Behavior & Logs*], [*Recovery Metric*],
//   [1], [Disconnect Core Link between `CORE-SW1` & `CORE-SW2`], [RSTP updates topology; traffic reroutes via Distribution trunk], [Spanning-tree topology change notification logged], [RSTP Reconvergence < 1 second],
//   [2], [Shutdown OSPF Interface on DC Router], [OSPF neighbor state drops; ABR recalculates SPF tree], [LSA Type 1 updated; SPF calculation triggered], [OSPF Convergence < 2 seconds],
//   [3], [Disable Primary Gateway (`CORE-SW1`)], [HSRP Standby (`CORE-SW2`) assumes Active state], [HSRP state change from Standby to Active; virtual MAC reassigned], [HSRP Failover < 750 ms],
//   [4], [Disable One Link in EtherChannel Bundle], [Traffic dynamically redistributes across remaining active LACP member], [LACP channel state updated; 0% packet loss for active streams], [Seamless failover (0 ms loss)],
//   [5], [Shutdown Core OSPF Router (`CORE-SW1`)], [Neighbors drop adjacency; OSPF routes via secondary path], [Full topology recalculation in Area 0], [Convergence < 3 seconds],
//   [6], [Block Trunk Port to Access Switch], [RSTP unblocks redundant link; traffic resumes], [Port state transitions from Alternate to Forwarding], [RSTP Convergence < 2 seconds]
// )

// --------------------------
// Chapter 11: Network Monitoring & Performance Metrics
// --------------------------
// = Network Monitoring & Performance Metrics

// Maintaining high uptime requires real-time observability across all infrastructure layers.

// == Monitoring Stack & Protocols
// - *SNMPv3*: Used for polling device status, CPU/Memory utilization, and interface traffic statistics with SHA authentication and AES encryption.
// - *Syslog*: Centralized logging server (`10.40.70.20`) collects log levels 0–4 (Emergency to Warning) from all switches and routers.
// - *NetFlow / IPFIX*: Flow sampling enabled on Edge routers to analyze traffic volume by protocol, source IP, and destination IP.
// - *ICMP Keepalives*: Automated latency and packet loss ping probes executed every 60 seconds across all WAN links.

// == Key Performance Indicators (KPIs)
// - *Core Backbone Latency*: Inter-site latency target < 15 ms.
// - *Packet Loss*: SLA target < 0.01% under full load.
// - *Routing Convergence Time*: Less than 3 seconds following any single link failover.
// - *Interface Utilization*: Trunks flagged for upgrades when sustained bandwidth exceeds 70%.

// --------------------------
// Chapter 12: Project Deliverables, Work Plan & Rubric Alignment
// --------------------------
// = Project Deliverables, Work Plan & Rubric Alignment

// == Project Deliverables Matrix
// 1. *Project Proposal Document*: Formal 8–12 page specification document (this Typst deliverable).
// 2. *Network Topology Files*: Logical and physical diagrams in SVG/PNG format.
// 3. *Emulation Project File*: Complete, working Packet Tracer / GNS3 project topology file.
// 4. *Device Configurations*: Baseline setup scripts for all routers, Layer-3 core switches, and access switches.
// 5. *Verification & Testing Logbook*: Step-by-step empirical output logs covering commands and failover results.


= Project Timeline (Gantt Chart)

#table(
  columns: (28%, 9%, 9%, 9%, 9%, 9%, 9%, 9%, 9%),
  align: (left, center, center, center, center, center, center, center, center),
  [*Project Task*], [*W1-2*], [*W3-4*], [*W5-6*], [*W7-8*], [*W9*], [*W10*], [*W11*], [*W12*],
  [Requirements & Topology Design], [X], [ ], [ ], [ ], [ ], [ ], [ ], [ ],
  [IPv4/VLSM & IPv6 Address Design], [ ], [X], [ ], [ ], [ ], [ ], [ ], [ ],
  [Switching, VLANs & EtherChannel], [ ], [ ], [X], [ ], [ ], [ ], [ ], [ ],
  [Multi-Area OSPF & Gateway Redundancy], [ ], [ ], [ ], [X], [ ], [ ], [ ], [ ],
  [Security, Extended ACLs & SSH], [ ], [ ], [ ], [ ], [X], [ ], [ ], [ ],
  [Hosting Services (DNS, DMZ, NAT)], [ ], [ ], [ ], [ ], [ ], [X], [ ], [ ],
  [Failure Injection & Convergence Testing], [ ], [ ], [ ], [ ], [ ], [ ], [X], [ ],
  [Final Technical Report & Defense], [ ], [ ], [ ], [ ], [ ], [ ], [ ], [X]
)

// == Recommended Evidence Commands
// To verify the configuration during presentation and viva defense, the following execution commands will be demonstrated:

// ```cisco
// show ip route
// show ip ospf neighbor
// show ip ospf interface
// show standby brief
// show etherchannel summary
// show spanning-tree brief
// show vlan brief
// show ip interface brief
// show access-lists
// show ipv6 route
// ```

// == Assessment Rubric Self-Audit (100 Marks Total)
// - *Project Proposal (5 Marks)*: Addressed via this technical proposal.
// - *Network Architecture & Topology (10 Marks)*: 5-site design with Core, Distribution, Access, and DR facilities.
// - *IP Addressing & VLSM (10 Marks)*: Detailed IPv4 VLSM allocations and IPv6 GUA prefixes.
// - *VLAN & Advanced Switching (10 Marks)*: 16 VLANs, 802.1Q trunks, RSTP, LACP EtherChannels.
// - *OSPF / Advanced Routing (15 Marks)*: Multi-area OSPF design, summarization, passive interfaces.
// - *IPv6 Implementation (5 Marks)*: Dual-stack operational design.
// - *Network Security & ACLs (10 Marks)*: Layer-2 port security, BPDU Guard, 6 mandatory ACL policies.
// - *WAN & NAT (5 Marks)*: BGP edge, dynamic PAT, point-to-point interconnects.
// - *Network Services (5 Marks)*: DNS, DMZ, Web hosting, DHCP relay.
// - *QoS & Gateway Redundancy (5 Marks)*: MQC QoS policies, HSRP/VRRP active-standby failover.
// - *Failure & Recovery Testing (5 Marks)*: 6 empirical failure tests.
// - *Performance Evaluation (5 Marks)*: Metrics for throughput, latency, and convergence.
// - *Final Report (5 Marks)*: 40–60 page complete technical report.
// - *Presentation & Viva (5 Marks)*: 15–20 minute technical defense slides.

// --------------------------
// Chapter 13: Conclusion & Future Work
// --------------------------
= Conclusion

This proposal presents a comprehensive, high-availability network design tailored specifically for a multi-site cloud hosting provider. By incorporating 3-tier hierarchical architecture, dual-stack IPv4/IPv6 addressing, multi-area OSPF routing, HSRP/VRRP gateway redundancy, and defense-in-depth security filtering, the proposed design guarantees operational resilience, scalable tenant isolation, and strict SLA compliance.

// Future expansion steps include integrating BGP EVPN with VXLAN overlay networks for dynamic multi-tenant overlay stretch across data centers, alongside automated infrastructure provisioning through Ansible playbooks.

// #pagebreak()

#bibliography(title: "References", "refs.bib")
