#set page(
  paper: "a4",
  flipped: true,
  margin: (x: 1.5cm, y: 1.2cm),
  header: align(right)[#text(size: 8pt, fill: luma(120))[Campus Network IP & Subnet Plan]],
  footer: context align(center)[#text(size: 8pt, fill: luma(120))[Page #counter(page).display() of #counter(page).final().first()]]
)
#set text(font: "Liberation Sans", size: 8.5pt)

#align(center)[
  #text(size: 15pt, weight: "bold")[Campus Network Subnetting & IP Address Plan]
  
  #text(size: 9.5pt, fill: luma(80))[Physical Hardware Lab Implementation: MikroTik RouterOS Core, Cisco ISR 4321 Distribution Router & Cisco Catalyst MLS]
]

#v(0.6em)

== 1. Complete IP Address Calculation Table

#table(
  columns: (1.8fr, 1fr, 0.8fr, 1.8fr, 1.8fr, 1.6fr, 2.5fr, 1.6fr, 1.3fr),
  fill: (col, row) => if row == 0 { rgb("1e293b") } else if calc.even(row) { rgb("f8fafc") } else { rgb("ffffff") },
  stroke: (x, y) => if y == 0 { none } else { 0.5pt + rgb("cbd5e1") },
  align: (center + horizon),
  
  // Header
  table.header(
    text(white, weight: "bold")[Segment / Role],
    text(white, weight: "bold")[VLAN],
    text(white, weight: "bold")[Prefix],
    text(white, weight: "bold")[Network Addr],
    text(white, weight: "bold")[Subnet Mask],
    text(white, weight: "bold")[Wildcard],
    text(white, weight: "bold")[Usable Host Range],
    text(white, weight: "bold")[Broadcast],
    text(white, weight: "bold")[Usable Hosts],
  ),
  
  // Faculty: CSE
  [MLS-CSE Student], [10], [/21], [192.168.0.0], [255.255.248.0], [0.0.7.255], [192.168.0.1 – 192.168.7.254], [192.168.7.255], [2046],
  [MLS-CSE Teacher], [20], [/22], [192.168.24.0], [255.255.252.0], [0.0.3.255], [192.168.24.1 – 192.168.27.254], [192.168.27.255], [1022],
  [MLS-CSE Academic], [30], [/23], [192.168.36.0], [255.255.254.0], [0.0.1.255], [192.168.36.1 – 192.168.37.254], [192.168.37.255], [510],
  
  // Faculty: BBA
  [MLS-BBA Student], [10], [/21], [192.168.8.0], [255.255.248.0], [0.0.7.255], [192.168.8.1 – 192.168.15.254], [192.168.15.255], [2046],
  [MLS-BBA Teacher], [20], [/22], [192.168.28.0], [255.255.252.0], [0.0.3.255], [192.168.28.1 – 192.168.31.254], [192.168.31.255], [1022],
  [MLS-BBA Academic], [30], [/23], [192.168.38.0], [255.255.254.0], [0.0.1.255], [192.168.38.1 – 192.168.39.254], [192.168.39.255], [510],
  
  // Faculty: NFS
  [MLS-NFS Student], [10], [/21], [192.168.16.0], [255.255.248.0], [0.0.7.255], [192.168.16.1 – 192.168.23.254], [192.168.23.255], [2046],
  [MLS-NFS Teacher], [20], [/22], [192.168.32.0], [255.255.252.0], [0.0.3.255], [192.168.32.1 – 192.168.35.254], [192.168.35.255], [1022],
  [MLS-NFS Academic], [30], [/23], [192.168.40.0], [255.255.254.0], [0.0.1.255], [192.168.40.1 – 192.168.41.254], [192.168.41.255], [510],
  
  // P2P Routed Links
  [DIST -- MLS-CSE], [N/A], [/29], [192.168.42.0], [255.255.255.248], [0.0.0.7], [192.168.42.1 – 192.168.42.6], [192.168.42.7], [6],
  [DIST -- MLS-BBA], [N/A], [/29], [192.168.42.8], [255.255.255.248], [0.0.0.7], [192.168.42.9 – 192.168.42.14], [192.168.42.15], [6],
  [DIST -- MLS-NFS], [N/A], [/29], [192.168.42.16], [255.255.255.248], [0.0.0.7], [192.168.42.17 – 192.168.42.22], [192.168.42.23], [6],
  
  // Core Interconnect
  [Core -- DIST Link], [N/A], [/24], [103.133.254.0], [255.255.255.0], [0.0.0.255], [103.133.254.1 – 103.133.254.254], [103.133.254.255], [254],
)

#pagebreak()

#grid(
  columns: (1fr, 1.05fr),
  gutter: 1.2cm,
  [
    == 2. Device Interface IP Assignments
    #v(0.3em)
    #table(
      columns: (1.5fr, 1.4fr, 1.8fr, 0.8fr, 1.8fr),
      fill: (col, row) => if row == 0 { rgb("334155") } else if calc.even(row) { rgb("f8fafc") } else { rgb("ffffff") },
      stroke: (x, y) => if y == 0 { none } else { 0.5pt + rgb("cbd5e1") },
      align: (center + horizon),
      table.header(
        text(white, weight: "bold")[Device],
        text(white, weight: "bold")[Interface],
        text(white, weight: "bold")[IP Address],
        text(white, weight: "bold")[Area],
        text(white, weight: "bold")[Description],
      ),
      [Core Router (MikroTik)], [sfp2 (to-DIST)], [103.133.254.2/24], [0], [Interconnect & DNS Server],
      
      [DIST Router (Cisco 4321)], [Gi0/0/0], [103.133.254.1/24], [0], [Uplink to Core (MikroTik)],
      [DIST Router (Cisco 4321)], [Gi0/0/1], [192.168.42.1/29], [0], [Downlink to MLS-CSE],
      
      [MLS-CSE], [Gi1/0/1], [192.168.42.2/29], [0], [Uplink to DIST Router],
      [MLS-CSE], [Vlan 10], [192.168.0.1/21], [0], [Default Gateway (Student)],
      [MLS-CSE], [Vlan 20], [192.168.24.1/22], [0], [Default Gateway (Teacher)],
      [MLS-CSE], [Vlan 30], [192.168.36.1/23], [0], [Default Gateway (Academic)],
      
      [MLS-BBA (Planned)], [Gi1/0/1], [192.168.42.10/29], [1], [Uplink to DIST Router],
      [MLS-BBA (Planned)], [Vlan 10], [192.168.8.1/21], [1], [Default Gateway (Student)],
      [MLS-BBA (Planned)], [Vlan 20], [192.168.28.1/22], [1], [Default Gateway (Teacher)],
      [MLS-BBA (Planned)], [Vlan 30], [192.168.38.1/23], [1], [Default Gateway (Academic)],
      
      [MLS-NFS (Planned)], [Gi1/0/1], [192.168.42.18/29], [2], [Uplink to DIST Router],
      [MLS-NFS (Planned)], [Vlan 10], [192.168.16.1/21], [2], [Default Gateway (Student)],
      [MLS-NFS (Planned)], [Vlan 20], [192.168.32.1/22], [2], [Default Gateway (Teacher)],
      [MLS-NFS (Planned)], [Vlan 30], [192.168.40.1/23], [2], [Default Gateway (Academic)],
      
      [Internet / Upstream], [DNS Servers], [8.8.8.8, 1.1.1.1], [N/A], [External Public DNS],
    )
  ],
  [
    == 3. DHCP Pools & Infrastructure Mapping
    #v(0.3em)
    #table(
      columns: (1.5fr, 1.8fr, 1.6fr, 1.5fr),
      fill: (col, row) => if row == 0 { rgb("334155") } else if calc.even(row) { rgb("f8fafc") } else { rgb("ffffff") },
      stroke: (x, y) => if y == 0 { none } else { 0.5pt + rgb("cbd5e1") },
      align: (center + horizon),
      table.header(
        text(white, weight: "bold")[Pool Name],
        text(white, weight: "bold")[Network],
        text(white, weight: "bold")[Default Router],
        text(white, weight: "bold")[DNS Server],
      ),
      [CSE_STUDENT], [192.168.0.0/21], [192.168.0.1], [103.133.254.2],
      [CSE_TEACHER], [192.168.24.0/22], [192.168.24.1], [103.133.254.2],
      [CSE_ACADEMIC], [192.168.36.0/23], [192.168.36.1], [103.133.254.2],
      
      [BBA_STUDENT], [192.168.8.0/21], [192.168.8.1], [103.133.254.2],
      [BBA_TEACHER], [192.168.28.0/22], [192.168.28.1], [103.133.254.2],
      [BBA_ACADEMIC], [192.168.38.0/23], [192.168.38.1], [103.133.254.2],
      
      [NFS_STUDENT], [192.168.16.0/21], [192.168.16.1], [103.133.254.2],
      [NFS_TEACHER], [192.168.32.0/22], [192.168.32.1], [103.133.254.2],
      [NFS_ACADEMIC], [192.168.40.0/23], [192.168.40.1], [103.133.254.2],
    )
    
    #v(0.5em)
    #grid(
      columns: (1fr, 1.2fr),
      gutter: 0.8cm,
      [
        == 4. OSPF Architecture
        #v(0.2em)
        #list(
          [*Core ID:* 1.2.3.0 (MikroTik, Area 0)],
          [*DIST ID:* 2.2.2.2 (Cisco 4321, Area 0)],
          [*MLS-CSE ID:* 1.1.1.1 (Area 0)],
          [*Static Route:* 192.168.0.0/16 -> 103.133.254.2],
          [*Access Ports:* 1-12 (V10), 13-24 (V20), 25-36 (V30)],
          [*Uplink Port:* Gi1/0/1 (`no switchport`)],
          [*Backbone Link:* 103.133.254.0/24],
        )
      ],
      [
        == 5. Remote Access & Services
        #v(0.2em)
        #list(
          [*DNS Service:* Core at 103.133.254.2 (8.8.8.8, 1.1.1.1)],
          [*SSH / Access:* SSHv2 (Port 22), Domain: `campus.edu`],
          [*Credentials:* `admin`, `cisco` (Privilege 15)],
          [*Mgmt IPs:* Core: 103.133.254.2, DIST: 103.133.254.1],
          [*Switch Mgmt:* CSE: 192.168.42.2 / 192.168.0.1],
          [*Core Tests:* `/ping 103.133.254.1`, `/ping 192.168.0.1`],
          [*OSPF Status:* `/routing ospf neighbor print`],
        )
      ]
    )
  ]
)
