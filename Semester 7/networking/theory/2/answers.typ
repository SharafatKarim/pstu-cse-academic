#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2.5cm),
  numbering: "1",
  columns: 1,
)
#set text(size: 11pt)
#set par(justify: true, leading: 0.65em)
#set heading(numbering: "1.")

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
  #text(15pt)[Faculty of Computer Science and Engineering]
]

#v(1.5fr)

// Middle Section: Course & Assignment Title
#align(center)[
  #text(16pt, weight: "bold", fill: luma(60))[Network Routing and Switching] \
  #v(0.3em)
  #text(15pt, style: "italic")[CCE-415] \
  #v(0.5em)
  #text(14pt, style: "italic")[Theory Assignment -- 02]

  #v(1.5em)
  #line(length: 90%, stroke: 1pt + luma(150))
  #v(0.8em)
  #text(17pt, weight: "bold")[Comprehensive IPv6 Architecture, Protocols, and Practical Implementation]
  #v(0.8em)
  #line(length: 90%, stroke: 1pt + luma(150))
]

#v(2fr)

// Bottom Section: Submission Details 
#grid(
  columns: (1fr, 1fr),
  gutter: 2em,
  align(left)[
    #text(12pt, weight: "bold", fill: luma(80))[Submitted by:] \
    #v(0.4em)
    *Md. Sharafat Karim* \
    ID: 2102024 \
    Reg: 10151 \
    Semester: 7 (Level-4, Semester-1) \
    Faculty of CSE, PSTU
  ],
  align(left)[
    #text(12pt, weight: "bold", fill: luma(80))[Submitted to:] \
    #v(0.4em)
    *Prof. Dr. Md Samsuzzaman* \
    Professor, \
    Dept. of Computer and Communication Engineering, \
    Faculty of CSE, PSTU
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

= Introduction to IPv6 and Motivation

+ IPv6 is designed to be the successor to IPv4.
+ Depletion of IPv4 address space has been the motivating factor for moving to IPv6.
+ Projections show that all five RIRs will run out of IPv4 addresses between 2015 and 2020.
+ With an increasing Internet population, a limited IPv4 address space, issues with NAT and an Internet of things, the time has come to begin the transition to IPv6!
+ IPv4 has a theoretical maximum of 4.3 billion addresses, plus private addresses in combination with NAT. 
+ IPv6 larger 128-bit address space provides for 340 undecillion addresses.
+ IPv6 fixes the limitations of IPv4 and includes additional enhancements, such as ICMPv6.


#v(0.8em)

= IPv6 Address Architecture & Representation Rules

128 bits represented in 8 groups of 4 hexadecimal digits separated by colons (e.g., `2001:0db8:0000:0000:0000:ff00:0042:8329`).

- *Shortening Rules:*
  1. *Omit Leading Zeros* \ `0db8` $arrow$ `db8`, `0042` $arrow$ `42`.
  2. *Double Colon (`::`)* \ Replace a single contiguous block of consecutive all-zero groups with `::` (applied only once per address).
  - *Shortened Form*\ `2001:db8::ff00:42:8329/64`.

  - Prefix Notation is followed by a slash and prefix length indicating the network bits (standard end-host prefix is `/64`).

#v(0.8em)

= IPv6 Address Types and Scopes

#table(
  columns: (1.5fr, 1.2fr, 1.5fr, 2fr),
  fill: (x, y) => if y == 0 { rgb("e6ecf5") } else { none },
  stroke: 0.5pt + luma(150),
  align: (left, center, center, left),
  [*Address Type*], [*Prefix*], [*Scope*], [*Use Case*],
  [Global Unicast (GUA)], [`2000::/3`], [Global / Internet], [Publicly routable host and server addressing],
  [Unique Local (ULA)], [`fd00::/8`], [Local / Organization], [Private routing within internal corporate networks],
  [Link-Local (LLA)], [`fe80::/10`], [Single Link / Segment], [Local communication, NDP, next-hop routing],
  [Multicast], [`ff00::/8`], [Variable Scope], [One-to-many communication (replaces broadcast)],
  [Anycast], [Same as GUA], [Nearest Node], [One-to-nearest service (DNS, load balancers)]
)

#v(0.8em)

= Configuration Mechanisms: SLAAC, EUI-64, and DHCPv6

- *SLAAC (Stateless Address Autoconfiguration):*
  - Host receives a `/64` network prefix from router Router Advertisement (RA) messages.
  - Host auto-generates its 64-bit Interface ID using EUI-64 or random generation without a DHCP server.
- *EUI-64 Calculation:*
  1. Take 48-bit MAC address (e.g., `00:11:22:33:44:55`).
  2. Insert `ff:fe` in the middle $arrow$ `0011:22ff:fe33:4455`.
  3. Invert the 7th bit (Universal/Local bit) $arrow$ `0211:22ff:fe33:4455`.
- *DHCPv6:*
  - *Stateful DHCPv6:* Server centrally assigns IPv6 addresses, default gateway, and DNS servers (similar to IPv4 DHCP).
  - *Stateless DHCPv6:* Host uses SLAAC for its IP address and queries the DHCPv6 server only for auxiliary settings (e.g., DNS server, domain name).

#v(0.8em)

= Key Protocols: NDP and ICMPv6

- *Neighbor Discovery Protocol (NDP):*\
  - Operates over ICMPv6 to replace IPv4 ARP, ICMP Router Discovery, and ICMP Redirect.
  - *Neighbor Solicitation (NS) / Neighbor Advertisement (NA):* \ Resolves IPv6 addresses to Layer 2 MAC addresses and detects duplicate addresses (DAD).
  - *Router Solicitation (RS) / Router Advertisement (RA):* \ Discovers default gateways and network prefixes.
- *ICMPv6:* \ 
  - Handles diagnostic error reporting, path MTU discovery, multicast group management (MLD), and reachability testing (`ping6`).

#v(0.8em)

= Subnetting and Address Aggregation

- *Standard Subnet Size:* `/64` is the standard prefix for all end-user network segments ($2^(64)$ addresses per subnet).
- *Subnetting a `/48` Allocation:*
  - Given ISP allocation: `2001:db8:1000::/48`.
  - Subnet bits available: $64 - 48 = 16$ bits ($2^(16) = 65,536$ individual `/64` subnets).
  - *Example Department Subnets:*
    - Engineering: `2001:db8:1000:0001::/64`
    - Sales: `2001:db8:1000:0002::/64`
    - Management: `2001:db8:1000:0003::/64`
- *Address Aggregation:* Upstream routers summarize all $65,536$ subnets into a single `/48` route advertisement, keeping global routing tables compact.

#v(0.8em)

= Transition Mechanisms and Security

- *Transition Mechanisms:*
  - *Dual Stack:* Nodes run IPv4 and IPv6 protocol stacks concurrently.
  - *Tunneling (e.g., 6to4, GRE):* Encapsulates IPv6 packets inside IPv4 headers to traverse IPv4-only transit backbones.
  - *Translation (NAT64/DNS64):* Converts IPv6 packet headers to IPv4 headers for legacy system inter-communication.
- *Security & Privacy:*
  - *IPsec:* Natively supported in IPv6 for network-layer encryption and data authentication.
  - *Privacy Extensions (RFC 4941):* Generates randomized temporary interface identifiers to prevent tracking client devices across networks.

#v(0.8em)

= Practical Implementations and Troubleshooting

1. *Basic Linux IPv6 Configuration & Verification:*
   ```bash
   sudo ip -6 addr add 2001:db8:1:1::10/64 dev eth0
   ping6 -c 4 2001:db8:1:1::1
   traceroute6 2001:db8:1:1::1
   ```
2. *DHCPv6 Server Configuration (`/etc/dhcp/dhcpd6.conf`):*
   ```conf
   subnet6 2001:db8:1:2::/64 {
       range6 2001:db8:1:2::100 2001:db8:1:2::200;
       option dhcp6.name-servers 2001:db8:1:2::1;
       option dhcp6.domain-search "pstu.ac.bd";
   }
   ```
3. *SLAAC Troubleshooting Case Study:*
   - *Issue:* Hosts fail to auto-configure addresses via SLAAC.
   - *Diagnosis:* Inspect Router Advertisement flags:
     - `ManagedAddressConfiguration` (M-flag = 1) forces hosts to query Stateful DHCPv6 instead of using SLAAC.
     - `AutonomousAddressConfiguration` (A-flag = 0) blocks SLAAC interface ID generation.
   - *Fix:* Ensure RA advertises `A-flag = 1` and appropriate prefix lifetimes.
