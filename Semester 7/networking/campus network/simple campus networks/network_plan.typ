#set page(
  paper: "a4",
  flipped: true,
  margin: (x: 1.5cm, y: 1.5cm),
  header: align(right)[#text(size: 8pt, fill: luma(120))[Campus Network IP & Subnet Plan]],
  footer: context align(center)[#text(size: 8pt, fill: luma(120))[Page #counter(page).display()]]
)
#set text(font: "Liberation Sans", size: 9pt)

#align(center)[
  #text(size: 16pt, weight: "bold")[Campus Network Subnetting & IP Address Plan]
  
  #text(size: 10pt, fill: luma(80))[Based on Network Topology & Cisco Multi-Area OSPF Configuration]
]

#v(0.8em)

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
  [Core -- MLS-CSE], [N/A], [/29], [192.168.42.0], [255.255.255.248], [0.0.0.7], [192.168.42.1 – 192.168.42.6], [192.168.42.7], [6],
  [Core -- MLS-BBA], [N/A], [/29], [192.168.42.8], [255.255.255.248], [0.0.0.7], [192.168.42.9 – 192.168.42.14], [192.168.42.15], [6],
  [Core -- MLS-NFS], [N/A], [/29], [192.168.42.16], [255.255.255.248], [0.0.0.7], [192.168.42.17 – 192.168.42.22], [192.168.42.23], [6],
  
  // WAN / ISP
  [Core -- ISP WAN], [N/A], [/24], [103.133.254.0], [255.255.255.0], [0.0.0.255], [103.133.254.1 – 103.133.254.254], [103.133.254.255], [254],
)

#v(1em)

#grid(
  columns: (1fr, 1fr),
  gutter: 1.5cm,
  [
    == 2. Device Interface IP Assignments
    #table(
      columns: (1.5fr, 1.4fr, 1.8fr, 1fr, 1.8fr),
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
      [Core Router], [Gi0/0], [103.133.254.2/24], [N/A], [Uplink to ISP],
      [Core Router], [Gi1/0], [192.168.42.1/29], [0], [Downlink to CSE],
      [Core Router], [Gi2/0], [192.168.42.9/29], [1], [Downlink to BBA],
      [Core Router], [Gi3/0], [192.168.42.17/29], [2], [Downlink to NFS],
      
      [MLS-CSE], [Gi1/0/24], [192.168.42.2/29], [0], [Uplink to Core],
      [MLS-CSE], [Vlan 10], [192.168.0.1/21], [0], [Default Gateway],
      [MLS-CSE], [Vlan 20], [192.168.24.1/22], [0], [Default Gateway],
      [MLS-CSE], [Vlan 30], [192.168.36.1/23], [0], [Default Gateway],
      
      [MLS-BBA], [Gi1/0/24], [192.168.42.10/29], [1], [Uplink to Core],
      [MLS-BBA], [Vlan 10], [192.168.8.1/21], [1], [Default Gateway],
      [MLS-BBA], [Vlan 20], [192.168.28.1/22], [1], [Default Gateway],
      [MLS-BBA], [Vlan 30], [192.168.38.1/23], [1], [Default Gateway],
      
      [MLS-NFS], [Gi1/0/24], [192.168.42.18/29], [2], [Uplink to Core],
      [MLS-NFS], [Vlan 10], [192.168.16.1/21], [2], [Default Gateway],
      [MLS-NFS], [Vlan 20], [192.168.32.1/22], [2], [Default Gateway],
      [MLS-NFS], [Vlan 30], [192.168.40.1/23], [2], [Default Gateway],
      
      [ISP Router], [Gi0/0/0], [103.133.254.1/24], [N/A], [Gateway to Internet],
      [External], [NIC], [103.133.254.3/24], [N/A], [External Server],
    )
  ],
  [
    == 3. DHCP Pools & Infrastructure Mapping
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
    
    #v(0.6em)
    == 4. OSPF Architecture Summary
    #list(
      [*Core Router ID:* 1.2.3.0 (ABR)],
      [*MLS-CSE ID:* 1.1.1.1 (Internal Area 0)],
      [*MLS-BBA ID:* 2.2.2.2 (Internal Area 1)],
      [*MLS-NFS ID:* 3.3.3.3 (Internal Area 2)],
      [*Default Route:* 0.0.0.0/0 via 103.133.254.1 originated into OSPF],
      [*Switch Access Ports:* 1-6 (VLAN 10), 7-12 (VLAN 20), 13-18 (VLAN 30)],
    )
  ]
)
