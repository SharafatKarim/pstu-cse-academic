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
  #text(14pt, style: "italic")[Theory Assignment -- 01]

  #v(1.5em)
  #line(length: 90%, stroke: 1pt + luma(150))
  #v(0.8em)
  #text(17pt, weight: "bold")[Short Questions and Answers on Routing]
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

= Describe the primary functions and features of a router.

*Primary Functions:*
+ Selects the best path to route packets to a destination network based on routing tables and metrics.
+ Receives a packet on an ingress interface and transmits it out of the appropriate egress interface toward the destination.
+ Connects disparate Layer 2 media and logical networks.

It operates at Layer 3 (Network Layer). It contains internal components such as CPU, RAM, NVRAM, Flash, and ROM. It maintains a Routing Information Base (RIB) and Forwarding Information Base (FIB) for fast packet switching.

#v(0.8em)

= Connect devices for a small, routed network.

Connecting devices in a small routed network involves:
+ Host PCs connect to switch access ports using straight-through Ethernet (UTP) cables.
+ Switch uplink ports connect to router interfaces (e.g., `Gig0/0/0`, `Gig0/0/1`) via straight-through UTP cables.
+ Router interfaces connect to each other via serial or Ethernet links.
+ Each host is assigned:
   + An IP address within its local subnet.
   + A subnet mask.
   + A default gateway (the IP address of the local router interface).
+ An administrative PC connects to the router's console port via a rollover/console cable for initial setup. Or it can also connect via SSH/Telnet for remote management.

#v(0.8em)

= Configure basic settings on a router to route between two directly-connected networks, using CLI.

```bash
Router> enable
Router# configure terminal

! Configure Interface 1 (LAN 1)
Router(config)# interface GigabitEthernet0/0/0
Router(config-if)# ip address 192.168.10.1 255.255.255.0
Router(config-if)# no shutdown
Router(config-if)# exit

! Configure Interface 2 (LAN 2)
Router(config)# interface GigabitEthernet0/0/1
Router(config-if)# ip address 192.168.20.1 255.255.255.0
Router(config-if)# no shutdown
Router(config-if)# exit

! Enable Routing and Save
Router(config)# ip routing
Router(config)# end
Router# copy running-config startup-config
```

#v(0.8em)

= Verify connectivity between two networks that are directly connected to a router.

+ Verify Router Interfaces:
   + `show ip interface brief` — ensures interface status and line protocol are both *up/up*.
   + `show ip route` — verifies both connected subnets (`C`) appear in the routing table.
+ Check Connectivity:
   + Ping: Execute `ping 192.168.20.10` from a host on LAN 1 to a host on LAN 2 to verify ICMP reachability.
   + Traceroute: Execute `tracert 192.168.20.10` to confirm that the router is the first hop (`192.168.10.1`).
   + ARP Table: Execute `show ip arp` on the router to verify Layer 2 to Layer 3 bindings.

#v(0.8em)

= Explain the encapsulation and de-encapsulation process used by routers when switching packets between interfaces.

The process can be described like,

+ At first the router receives a packet in an interface. It checks the destination IP address in the packet header.
+ The router looks up the destination IP in its routing table to determine the best path and the corresponding egress interface.
+ The router then removes the existing Layer 2 frame header and trailer (de-encapsulation) and prepares to forward the packet.
+ The router encapsulates the packet with a new Layer 2 frame header and trailer appropriate for the egress interface (e.g., Ethernet, Serial, etc.).
+ Finally, the router transmits the newly encapsulated frame out of the egress interface toward the next hop or destination.

#v(0.8em)

= Explain the path determination function of a router.

Router fist checks either destination is on the same subnet or not. If the destination is on the same subnet, it sends the packet directly to the destination host. If the destination is on a different subnet, the router performs path determination to find the best route to reach that destination network.

1. The route with the most specific match (highest prefix length, e.g., `/26` over `/24`) is always selected first.
2. When identical network prefixes are learned from multiple sources, the route from the source with the lowest AD is chosen (e.g., Connected = 0, Static = 1, OSPF = 110, RIP = 120).
3. When multiple routes exist from the same routing protocol, the path with the lowest metric (e.g., hop count in RIP, cost in OSPF) is selected.
4. If multiple paths have identical metrics, the router load-balances traffic across them.

#v(0.8em)

= Explain routing table entries for directly connected networks.

When an active interface is assigned an IP address, two entries appear in the routing table:
```text
C   192.168.10.0/24 is directly connected, GigabitEthernet0/0/0
L   192.168.10.1/32 is directly connected, GigabitEthernet0/0/0
```
+ *`C` (Connected Route):* Represents the network subnet attached to the interface. Used to forward traffic destined for any host in that subnet directly out of the interface using ARP.
+ *`L` (Local Route):* A `/32` host route representing the specific IP address assigned to the router's interface. It allows the router to quickly identify traffic destined for itself (e.g., management/control traffic).

#v(0.8em)

= Explain how a router builds a routing table of directly connected networks.

A router automatically adds directly connected networks to its routing table when:
+ An IPv4/IPv6 address and subnet mask are configured on the interface.
+ The `no shutdown` command is issued.
+ Both Layer 1 (Physical link sense) and Layer 2 (Data-link keepalive/framing) transition to the *`up/up`* state.

// Once `up/up`, the router creates a `C` entry (network prefix) and an `L` entry (`/32` host IP) with $"AD"=0$. If the physical link goes down, the router immediately removes both entries.

#v(0.8em)

= Explain how a router builds a routing table using static routes.

A router builds static routing entries when an administrator manually configures routes using the `ip route` command:

+ *Syntax:* `ip route <destination-network> <subnet-mask> {next-hop-ip | exit-interface} [AD]`
+ *Types:*
  - `ip route 10.1.1.0 255.255.255.0 192.168.12.2` (requires recursive lookup).
  - `ip route 10.1.1.0 255.255.255.0 Serial0/1/0`.
  - `ip route 0.0.0.0 0.0.0.0 192.168.12.2` (gateway of last resort).

#v(0.8em)

= Explain how a router builds a routing table using a dynamic routing protocol.

A router builds its routing table dynamically through automated protocol exchanges:

+ Routers send periodic Hello packets to discover adjacent routers and establish neighbor relationships.
+ Routers exchange routing updates or Link-State Advertisements (LSAs) containing reachable subnets and link costs.
+ The routing algorithm (e.g., Dijkstra SPF in OSPF, Bellman-Ford in RIP, DUAL in EIGRP) calculates the shortest loop-free path to each network.
+ Optimal routes are installed in the routing table (e.g., `O` for OSPF, `D` for EIGRP, `R` for RIP) with their respective AD and metric values.
+ If network topology changes or a link fails, routers automatically propagate updates and recalculate new best paths without manual intervention.
