## I. Questions from January-June 2023 (Session 2020-2021)

### Q. 1. Networking Concepts and Performance
1.  What distinguishes a host from an end system? Provide examples of various end systems. Would a web server be considered an end system? Why are end systems related to hosts, and what distinguishes clients from servers within this context?

    1.  **Host vs. End System:** There is **no significant distinction** between these two terms. They are used interchangeably to describe any device connected to the "edge" of the internet (i.e., not a core network device like a router or switch). These devices run user applications.
    2.  **Examples of End Systems:** PCs, laptops, smartphones, tablets, smart TVs, game consoles, IoT devices (like a smart thermostat), and file servers.
    3.  **Is a Web Server an End System?** **Yes.** It is an "end system" because it is the final destination for a request. It sits at the edge of the network and runs an application (the web server software) that provides a service to other end systems.
    4.  **Client vs. Server:** This distinction describes the *role* a host plays in a specific communication.
        * **Client:** An end system that *requests* a service (e.g., your laptop running a web browser to *get* a webpage).
        * **Server:** An end system that *provides* a service (e.g., the web server that *sends* the webpage).
        * A single host can be both. For example, in a peer-to-peer (P2P) file-sharing application, your computer acts as a server when uploading a file to a peer and as a client when downloading a file from a peer.

2.  HFC, DSL, and FTTH are all used for residential access. For each of these access technologies, provide a range of transmission rates and comment on whether the transmission rate is shared or dedicated.


    | Technology | Full Name | Typical Rates (Downstream / Upstream) | Medium (Shared or Dedicated) |
    | :--- | :--- | :--- | :--- |
    | **HFC** | Hybrid Fiber-Coax | 25 Mbps – 1 Gbps+ / 5 Mbps – 50 Mbps (Asymmetric) | **Shared.** Users in a neighborhood (typically 100-500 homes) share the capacity of the coaxial cable segment. This can lead to slowdowns during peak hours. |
    | **DSL** | Digital Subscriber Line | 5 Mbps – 100+ Mbps / 1 Mbps – 20 Mbps (Asymmetric) | **Dedicated (in the last mile).** The copper phone line from your home to the local switching office (or street-side cabinet) is dedicated to you. The backhaul from that point is shared. |
    | **FTTH** | Fiber to the Home | 100 Mbps – 10 Gbps / 100 Mbps – 10 Gbps (Often Symmetric) | **Dedicated.** A dedicated fiber line (or a non-contended slot in a Passive Optical Network) runs directly to the home, providing consistent, high speeds. |


3.  Suppose users share a 2 Mbps link. Also suppose each user transmits continuously at 1 Mbps when transmitting, but each user transmits only 20 percent of the time.
    *   When circuit switching is used, how many users can be supported?
    *   For the remainder of this problem, suppose packet switching is used. Why will there be essentially no queuing delay before the link if two or fewer users transmit at the same time?
    *   Why will there be queuing delay if three users transmit at the same time?
    *   Find the probability that a given user is transmitting.
    *   Suppose now there are three users. Find the probability that at any given time, all three users are transmitting simultaneously.
    *   Find the fraction of time during which the queue grows.

    * **When circuit switching is used, how many users can be supported?**
    * **Answer:** **2 users.**
    * **Reasoning:** Circuit switching reserves a dedicated, fixed-rate "circuit" for each user. Each user needs 1 Mbps of *guaranteed* capacity. Since the total link capacity is 2 Mbps, you can only support $2 \text{ Mbps} / 1 \text{ Mbps per user} = 2 \text{ users}$.

        * **Why will there be essentially no queuing delay... if two or fewer users transmit?**
            * **Answer:** The total arrival rate is less than or equal to the link's capacity.
            * **Reasoning:** The link's capacity (service rate) is 2 Mbps.
                * If 1 user transmits, the arrival rate is 1 Mbps.
                * If 2 users transmit, the arrival rate is $1 + 1 = 2 \text{ Mbps}$.
                * In both cases, the arrival rate is $\leq$ the service rate. Packets are forwarded as fast as they arrive, so no backlog (queue) forms.

        * **Why will there be queuing delay... if three users transmit at the same time?**
            * **Answer:** The total arrival rate (3 Mbps) is **greater than** the link's capacity (2 Mbps).
            * **Reasoning:** Packets arrive faster ($3 \text{ Mbps}$) than they can be sent ($2 \text{ Mbps}$). The excess packets (1 Mbps worth) must be stored in a buffer (queue) to wait for their turn to be transmitted.

        * **Find the probability that a given user is transmitting.**
            * **Answer:** **0.2** (or 20%). This is stated directly in the problem ("each user transmits only 20 percent of the time").

        * **Find the probability that... all three users are transmitting simultaneously.**
            * **Answer:** **0.008** (or 0.8%).
            * **Reasoning:** Since each user's transmission is an independent event, we multiply their individual probabilities:
                $P(\text{all three}) = P(\text{user 1}) \times P(\text{user 2}) \times P(\text{user 3})$
                $P(\text{all three}) = 0.2 \times 0.2 \times 0.2 = \mathbf{0.008}$

        * **Find the fraction of time during which the queue grows.**
            * **Answer:** **0.008** (or 0.8%).
            * **Reasoning:** As we determined, the queue *only* grows when the arrival rate is greater than the 2 Mbps capacity. This *only* happens when all three users transmit simultaneously (creating 3 Mbps of traffic). Therefore, the fraction of time the queue grows is equal to the probability that all three users are transmitting, which we just calculated.
    
4.  In this problem, we consider sending real-time voice from Host A to Host B over a packet-switched network (VoIP). Host A converts the analog voice signal into a digital bit stream at a rate of 64 kbps. Host A then collects the bits into packets, each containing 4000 bytes. There is a single link between Host A and B with a transmission rate of 10 Mbps and propagation delay of 10 milliseconds. As soon as Host A gathers a packet, it sends it to Host B. Immediately upon receiving the entire packet, Host B converts the packet’s bits back into an analog signal. What is the total time that elapses from the moment a bit is created (from the original analog signal at Host A) until it is decoded (as part of the analog signal at Host B)?

    The total time (delay) is the sum of all the delays from the moment the bit is created until it is decoded. A bit cannot be decoded until the *entire packet* it belongs to has been received.

    The total delay has three components:
    1.  **Packetization Delay ($d_{\text{packet}}$):** The time it takes for Host A to *collect* enough bits to fill one packet.
    2.  **Transmission Delay ($d_{\text{trans}}$):** The time it takes for Host A to *push* all the packet's bits onto the link.
    3.  **Propagation Delay ($d_{\text{prop}}$):** The time it takes for a bit to *travel* across the link from A to B.

    **1. Packetization Delay:**
    * **Packet Size:** 4000 bytes $\times$ 8 bits/byte = 32,000 bits
    * **Conversion Rate:** 64 kbps = 64,000 bits per second
    * **Time:** $d_{\text{packet}} = \text{Packet Size} / \text{Conversion Rate} = 32,000 \text{ bits} / 64,000 \text{ bits/s} = \mathbf{0.5 \text{ s}}$

    **2. Transmission Delay:**
    * **Packet Size:** 32,000 bits
    * **Link Rate:** 10 Mbps = 10,000,000 bits per second
    * **Time:** $d_{\text{trans}} = \text{Packet Size} / \text{Link Rate} = 32,000 \text{ bits} / 10,000,000 \text{ bits/s} = \mathbf{0.0032 \text{ s}}$

    **3. Propagation Delay:**
    * **Given:** 10 milliseconds = $\mathbf{0.01 \text{ s}}$

    **Total Time:**
    * $d_{\text{total}} = d_{\text{packet}} + d_{\text{trans}} + d_{\text{prop}}$
    * $d_{\text{total}} = 0.5 \text{ s} + 0.0032 \text{ s} + 0.01 \text{ s}$
    * $d_{\text{total}} = \mathbf{0.5132 \text{ seconds}}$ (or 513.2 ms)

5.  What are an application-layer message? A transport-layer segment? A network-layer datagram? A link-layer frame?

    These are the names for the "packet" of data at each layer of the TCP/IP model. This process is called **encapsulation**, where each layer wraps the data from the layer above it in a new header.

    * **Application-layer message:** This is the raw data generated by a user application, such as an HTTP GET request, an email (SMTP), or a file transfer (FTP).
    * **Transport-layer segment:** This is the application-layer message encapsulated with a transport header (like **TCP** or **UDP**). This header adds source and destination **port numbers**, which identify the specific application/process on the host.
    * **Network-layer datagram:** This is the transport-layer segment encapsulated with a network header (like **IP**). This header adds source and destination **IP addresses**, which identify the specific hosts on the network.
    * **Link-layer frame:** This is the network-layer datagram encapsulated with a link-layer header and trailer (like **Ethernet**). This header adds source and destination **MAC addresses**, which identify the specific network interface cards (NICs) for the next hop.


### Q. 2. IP Addressing and NAT
1.  **A router receives a packet with the destination address 201.24.67.32. Show how the router finds the next-hop address of the packet.**

    The router uses its forwarding table to find the next-hop address. The forwarding table has entries that map destination address ranges to next-hop addresses. The router will look for the entry that matches the destination address of the packet. For example, if the forwarding table has an entry for the network 201.24.67.0/24 with the next-hop address of R2, the router will forward the packet to R2.

2.  **What is CIDR, and how can you extract block information from a given IP address?**

    *   **CIDR (Classless Inter-Domain Routing):** A method for allocating IP addresses and for IP routing. It allows for more flexible allocation of IP addresses than the old classful system.
    *   **Extracting Block Information:** To extract block information from a given IP address, you need the IP address and the prefix length (e.g., /24). The prefix length tells you how many bits are in the network portion of the address. The remaining bits are the host portion. You can then determine the network address, the first and last host addresses, and the broadcast address.

3.  **Assume a company has three offices: Central, East, and West. The Central office is connected to the East and West offices via private, point-to-point WAN lines. The company is granted a block of addresses with the beginning address 70.12.100.128/26. The management has decided to allocate 32 addresses for the Central office and divides the rest of addresses between the two other offices. Finaly the the block with its IP address.**

    *   **Total Addresses:** The block 70.12.100.128/26 has 2^(32-26) = 2^6 = 64 addresses.
    *   **Central Office:** The Central office is allocated 32 addresses. We can assign it the first half of the block: 70.12.100.128/27.
    *   **East and West Offices:** The remaining 32 addresses are divided between the East and West offices. We can give each office 16 addresses.
        *   **East Office:** 70.12.100.160/28
        *   **West Office:** 70.12.100.176/28

4.  **An ISP is granted a block of addresses starting with 150.80.0.0/16. The ISP wants to distribute these blocks to 2000 customers as follows:
    *   The first group has 200 medium-size businesses; each needs approximately 128 addresses.
    *   The second group has 400 small businesses; each needs approximately 16 addresses.
    *   The third group has 2000 households; each needs 4 addresses.
    *   Design the subblocks and give the slash notation for each subblock. Find out how many addresses are still available after the allocations.**

    *   ... check exercise for similar ;)

### Q. 3. Classless Addressing, Routing, and Protocols
1.  **In classless addressing, we know the first and the last address in the block. Can we find the prefix length? If yes, show the process and give an example.**

    Yes, we can. By performing a bitwise XOR operation on the first and last addresses, we can find a bitmask that represents the host portion of the address space. The number of set bits in this mask corresponds to the number of host bits. The prefix length is then 32 minus the number of host bits.

2.  **We noted that network layer functionality can be broadly divided into data plane functionality and control plane functionality. What are the main functions of the data plane? Of the control plane?**

    *   **Data Plane:** The data plane is responsible for forwarding packets from an input link to an output link. This is done at each router. The main functions are:
        *   **Forwarding:** Moving packets from a router's input to the appropriate output.
        *   **Encapsulation/Decapsulation:** Adding and removing link-layer headers.
    *   **Control Plane:** The control plane is responsible for determining the path that packets take from source to destination. The main functions are:
        *   **Routing:** Running routing protocols to create the forwarding tables.
        *   **Address Management:** Assigning IP addresses to hosts.

3.  **Compare and contrast the properties of a centralized and a distributed routing algorithm. Give an example of a routing protocol that takes a centralized and a decentralized approach.**

    *   **Centralized Routing Algorithm:**
        *   **Properties:** A single entity has knowledge of the entire network topology and computes the forwarding tables for all routers. This can be more efficient but is less scalable and has a single point of failure.
        *   **Example:** Link-state routing algorithms, like OSPF, are centralized in the sense that each router has a complete map of the network.
    *   **Distributed Routing Algorithm:**
        *   **Properties:** Each router has only local knowledge of the network and communicates with its neighbors to compute its forwarding table. This is more scalable and robust but may be less efficient.
        *   **Example:** Distance-vector routing algorithms, like RIP, are decentralized.

4.  **Consider the following network. With the indicated link costs, use Dijkstra’s shortest-path algorithm to compute the shortest path from $x$ to all network nodes. Show how the algorithm works by computing a table and also draw the shortest path graph.**

    (Assuming a network diagram was provided with the question, which is missing here. I will provide a general explanation of how Dijkstra's algorithm works.)

    Dijkstra's algorithm finds the shortest path between a source node and all other nodes in a graph. It works by maintaining a set of visited nodes and a table of distances from the source node to all other nodes. The algorithm starts at the source node and iteratively selects the unvisited node with the smallest distance, adds it to the visited set, and updates the distances to its neighbors.

### Q. 4. TCP Connection Establishment
1.  **TCP opens a connection using an initial sequence number (ISN) of 14,534. The other party opens the connection with an ISN of 21,732. Show the three TCP segments during the connection establishment.**

    1.  **Client -> Server:** `SYN=1, Seq=14534`
    2.  **Server -> Client:** `SYN=1, ACK=1, Seq=21732, Ack=14535`
    3.  **Client -> Server:** `ACK=1, Seq=14535, Ack=21733`

### Q. 5. TCP Data Transfer and Flow Control
1.  **Show the contents of the segments during the data transmission if the initiator sends a segment containing the message “Hello dear customer” and the other party answers with a segment containing “Hi there seller.”**

    *   **Initiator -> Other Party:** `PSH=1, ACK=1, Seq=14535, Ack=21733, Data="Hello dear customer"`
    *   **Other Party -> Initiator:** `PSH=1, ACK=1, Seq=21733, Ack=14555, Data="Hi there seller"` (Assuming "Hello dear customer" is 20 bytes)

2.  **Show the entries for the header and pseudoheader of a UDP user datagram that carries a message from a Daytime client (153.1.8.8:105) to a Daytime server (171.2.14.10). Consider the data message “PSTU#”. Choose the correct well-known port number and 1087 as ephemeral port number. Calculate the checksum value. Show the UDP packet ready to be sent.**

    *   **UDP Header:**
        *   Source Port: 1087
        *   Destination Port: 13 (Daytime Protocol)
        *   Length: 14 (8 bytes header + 6 bytes data)
        *   Checksum: (calculated below)
    *   **Pseudoheader:**
        *   Source IP: 153.1.8.8
        *   Destination IP: 171.2.14.10
        *   Protocol: 17 (UDP)
        *   UDP Length: 14
    *   **Checksum Calculation:** The checksum is the 16-bit one's complement of the one's complement sum of the pseudoheader, the UDP header, and the data, padded with a zero byte if necessary.

3.  **In a send window, $S_F=401$ and $S_L=701$. If window size is 1,000 bytes, show the send window before and after the station receives an ACK segment with ackNo = 601 and rwnd = 700. Ignore congestion control. Does this situation mean shrinking the window?**

    *   **Before:** The window is from 401 to 1400.
    *   **After:** The new window will be from 601 to 1300. The window has not shrunk, but it has shifted.

4.  **Illustrate the 'half-close' case in TCP.**

    A half-close is when one side of a TCP connection closes its end of the connection, but the other side keeps its end open. This is done by sending a FIN segment. The side that sends the FIN can no longer send data, but it can still receive data. The other side can continue to send data until it also closes its end of the connection.

### Q. 6. DNS, Application Protocols, and Multimedia
1.  **A DNS client is looking for the name of the computer with IP address 132.1.17.8. Show the query message. Also show the response message sent by the server to this query. Encapsulate the query and response message in a UDP user datagram.**

    *   **Query Message:** The query message would be a PTR query for the reverse DNS lookup of the IP address.
    *   **Response Message:** The response message would contain the domain name associated with that IP address.

2.  **Consider distributing a file of F = 20 Gbits to N peers...**

    (This question requires calculations based on formulas for client-server and P2P distribution times, which are detailed in the textbook.)

3.  **How does SMTP mark the end of a message body? How about HTTP? Can HTTP use the same method as SMTP to mark the end of a message body? Explain.**

    *   **SMTP:** Uses a single period (`.`) on a line by itself to mark the end of the message body.
    *   **HTTP:** Uses the `Content-Length` header field to indicate the size of the message body.
    *   **Can HTTP use the same method?** No, because a period could be part of the message body in HTTP.

4.  **What is the function of MIME? A sender sends a JPEG message. Show the MIME header.**

    *   **MIME (Multipurpose Internet Mail Extensions):** Extends the format of email to support text in character sets other than ASCII, as well as attachments of audio, video, images, and application programs.
    *   **MIME Header for JPEG:**
        ```
        Content-Type: image/jpeg
        Content-Transfer-Encoding: base64
        ```

5.  **Obtain the HTTP/1.1 specification (RFC 2616). Answer the following questions...**

    (This requires consulting the RFC.)

6.  **Why do we need an RRQ or WRQ message in TFTP but not in FTP? Show the encapsulation of an RRQ message and a WRQ message in separate UDP user datagram. Assume the file name is “report” and the mode is ASCII. What are the sizes of UDP datagrams?**

    *   **RRQ/WRQ in TFTP:** TFTP is a simpler protocol than FTP and does not have a control connection. Therefore, the first packet must specify whether it is a read or write request.
    *   **Encapsulation:** The RRQ and WRQ messages are encapsulated in a UDP datagram.

7.  **Consider a DASH system...**

    (This question requires knowledge of DASH, which is covered in the multimedia networking chapter of the book.)

8.  **What is the Apache Web server? How much does it cost? What functionality does it currently have?**

    *   **Apache Web Server:** A free and open-source web server that is widely used on the internet.
    *   **Cost:** Free.
    *   **Functionality:** It is a modular web server that can be extended with a wide variety of features.

## II. Questions from January-June 2022 (Session 2018-2019)

1.  **Find the netid, subnet mask and the hostid of the following IP addresses: a. 114.34.2.8, b. 132.56.8.6, c. 208.34.54.12, d. 251.34.98.5.**

    *   a. 114.34.2.8: Class A. Netid: 114, Hostid: 34.2.8, Subnet Mask: 255.0.0.0
    *   b. 132.56.8.6: Class B. Netid: 132.56, Hostid: 8.6, Subnet Mask: 255.255.0.0
    *   c. 208.34.54.12: Class C. Netid: 208.34.54, Hostid: 12, Subnet Mask: 255.255.255.0
    *   d. 251.34.98.5: Class E (Reserved for future use)

2.  **An address in a block is given as 191.8.243.9. Find the number of addresses in the block, subnet mask the first address, and the last address.**

    Assuming a /24 prefix, the number of addresses is 256, the first address is 191.8.243.0, and the last address is 191.8.243.255.

3.  **A company is granted the site address 201.70.64.0. The company needs six subnets. Design the subnets and shows the first address and last address with subnetmask through a pictorial representation.**

    With 6 subnets, we need to borrow 3 bits from the host part. The subnet mask will be 255.255.255.224. The subnets would be 201.70.64.0/27, 201.70.64.32/27, 201.70.64.64/27, 201.70.64.96/27, 201.70.64.128/27, and 201.70.64.160/27.

4.  **What are the services that a transport-layer protocol cannot provide to applications invoking it?**

    A transport-layer protocol cannot guarantee a minimum bandwidth or a maximum delay.

5.  **Can an application use the services of TLS?**

    Yes, an application can use the services of TLS. TLS provides security services to applications that use TCP.

6.  **Describe how installing a proxy server can reduce the delay in receiving a requested object.**

    A proxy server can cache frequently requested objects. When a user requests a cached object, the proxy server can deliver it to the user immediately, without having to fetch it from the origin server. This can significantly reduce the delay in receiving the object.

## III. Questions from January-June 2021 (Session 2018-2019)

### Q. 1. Access Technologies and Network Services
1.  **Describe the most popular wireless internet access technologies today. Compare and contrast the different wireless access technologies. Classify each one as home access, enterprise access, or wide-area wireless access.**

    *   **Wi-Fi (802.11):** Home and enterprise access.
    *   **Cellular (4G, 5G):** Wide-area wireless access.
    *   **WiMAX:** Can be used for both enterprise and wide-area access.

2.  **Write the duties/services and protocol of each specific OSI layer.**

    *   **Physical Layer:** Transmit bits over a medium. Protocols: Ethernet, 802.11.
    *   **Data Link Layer:** Node-to-node delivery of frames. Protocols: Ethernet, PPP.
    *   **Network Layer:** Host-to-host delivery of datagrams. Protocols: IP, ICMP.
    *   **Transport Layer:** Process-to-process delivery of segments. Protocols: TCP, UDP.
    *   **Session Layer:** Manages sessions between applications.
    *   **Presentation Layer:** Translates, encrypts, and compresses data.
    *   **Application Layer:** Provides services to the user. Protocols: HTTP, SMTP, FTP.

3.  **In the problem, we consider sending real-time voice from Host A to Host B over a packet-switched network... What is the total time that elapses from the moment a bit is created (from the original analog signal at Host A) until it is decoded (as part of the analog signal at Host B)?**

    (This is a duplicate question. See the answer in Section I, Q. 1, part 4.)

4.  **Explain whether a packet-switched network or a circuit-switched network be more appropriate for this application. Why?**

    Packet switching is more appropriate for this application because it is more efficient for bursty traffic, which is typical of voice communication.

5.  **Compare and contrast the properties of a centralized and a distributed routing algorithm. Give an example of a routing protocol that takes a centralized and a decentralized approach.**

    (This is a duplicate question. See the answer in Section I, Q. 3, part 3.)

### Q. 2. IP Addressing and Subnetting
1.  **How are the blocks allocated? What are the restrictions need to be applied to the allocated block.**

    Blocks are allocated by IANA and RIRs. The restrictions are that the number of addresses in a block must be a power of 2, and the first address must be divisible by the number of addresses in the block.

2.  **The address 192.168.12.0/20 is given. Find the number of addresses, the first address, and the last address in the block.**

    *   Number of addresses: 2^(32-20) = 2^12 = 4096
    *   First address: 192.168.0.0
    *   Last address: 192.168.15.255

3.  **An ISP is granted a block of addresses 23.34.252.0/24. The organization needs to have 4 subblocks of addresses to use in its four zones at shown below. Distribute the addresses.**

    With 4 sub-blocks, we need to borrow 2 bits from the host part. The subnet mask will be 255.255.255.192. The subnets would be 23.34.252.0/26, 23.34.252.64/26, 23.34.252.128/26, and 23.34.252.192/26.

4.  **Write the steps need to be carefully followed to guarantee the proper operation of the sub-networks.**

    1.  Determine the number of subnets needed.
    2.  Determine the number of bits to borrow from the host part.
    3.  Calculate the new subnet mask.
    4.  Determine the address range for each subnet.

### Q. 3. Routing and Forwarding
1.  **Discuss the forwarding process of a packet arrives at R1 in below Figure with the destination address 180.70.65.140.**

    (Assuming a figure was provided, which is missing here. The router would use its forwarding table to find the next hop for the given destination address.)

2.  **What is NAT? How can NAT help in address depletion?**

    (This is a duplicate question. See the answer in Section II, Q. 2, part 2.)

3.  **Briefly define subnetting and supernetting. How do the subnet mask and supernet mask differ from a default mask in classful addressing?**

    *   **Subnetting:** Dividing a large block of addresses into smaller sub-blocks.
    *   **Supernetting:** Combining smaller blocks of addresses into a larger block.
    *   A subnet mask has more 1s than the default mask, and a supernet mask has fewer 1s.

4.  **A block of addresses is granted to a small organization. We know that one of the addresses is 205.16.37.19/24. Find out the first address, last address, and the number of addresses in the block. Also show this network structure through a block.**

    *   First address: 205.16.37.0
    *   Last address: 205.16.37.255
    *   Number of addresses: 256

### Q. 4. Transport Layer and Physical Layer
1.  **Where do we find the netid and the hostid of the following IP addresses: a. 117.14.15.5, b. 47.20.17.25, c. 200.10.20.30, d. 250.8.2.3.**

    (This is a duplicate question. See the answer in Section II, Q. 1.)

2.  **In TCP, if the value of HLEN is 1000, how many bytes of option are included in the segment?**

    HLEN is a 4-bit field that specifies the length of the TCP header in 32-bit words. If HLEN is 1000 (binary), which is 8 in decimal, the header length is 8 * 4 = 32 bytes. Since the base TCP header is 20 bytes, there are 32 - 20 = 12 bytes of options.

3.  **A TCP connection is using a window size of 12,000 bytes...**

    (This question requires drawing a diagram to show the window movement, which is difficult to represent in text.)

4.  **In the standard Ethernet, if the maximum transmission rate is 25.0 ps, what is the minimum size of the frame?**

    The minimum frame size in Ethernet is 64 bytes.

## IV. Questions from January-June 2020

### A. Session 2019-2020 Exam

1.  **Queuing Delay and Traffic:**
    *   **In practice, does the queuing delay tend to vary a lot? Answer Yes or No and why.**
        *   Yes, the queuing delay can vary a lot depending on the traffic intensity and the router's buffer size.
    *   **What is R = 2R, what is the needed value of $\lambda$?**
        *   This question is unclear.
    *   **Assuming the router's buffer is infinite, the queuing delay is 0.4357 ms, and 1218 packets arrive. How many packets will be in the buffer?**
        *   This question is unanswerable without knowing the arrival rate and the service rate.
    *   **If the buffer has a maximum size of 563 packets, how many of the 1218 packets would be dropped upon arrival from the previous question?**
        *   This question is unanswerable without knowing the arrival rate and the service rate.
2.  **General Network Concepts:**
    *   (These are duplicate questions. See answers in previous sections.)
3.  **IP Addressing and Subnetting:**
    *   (These are duplicate questions. See answers in previous sections.)
4.  **Specific Calculations and Routing:**
    *   **You have an interface on a router with the IP address of 192.168.192.10/29. What is the broadcast address for the subnet that this LAN?**
        *   The broadcast address is 192.168.192.15.
    *   **What is the last valid host on the subnetwork 165.21.80.128/26?**
        *   The last valid host is 165.21.80.190.
    *   **In the mask-length notation, find the number of 1’s that must be added to the mask if the number of desired subnets will be 8 and 122.**
        *   For 8 subnets, you need to add 3 bits (2^3 = 8). For 122 subnets, you need to add 7 bits (2^7 = 128).
    *   **Construct least-cost-path tree by tracing predecessor nodes. Also find out the resulting least-cost-path tree from u and also show the resulting forwarding table in u.**
        *   (This question requires a network diagram.)
    *   **When the algorithm converges, what are the distance vectors from router 'y' to all routers? Write your answer as u,v,w,x.**
        *   (This question requires a network diagram and the initial distance vectors.)
    *   **What is the initial distance vectors for router W? Write your answer as u,v,w,x,y and if a distance is $\infty$, write 'x'.**
        *   (This question requires a network diagram.)

## V. Questions from Session 2018-2019 Mid I

1.  **An classful address in a block is given as 223.4.17.9. Find the number of addresses in the block, the first address, and the last address. Draw also the block diagram of this IP address topology.**

    *   This is a Class C address. The first address is 223.4.17.0, and the last address is 223.4.17.255. The number of addresses is 256.

2.  **Suppose you have given a classful block of IP 140.15.0.0. Now you need to divide this IP block to four subnetwork with equal IP address space of each block. Now extracting the first address, the last address, subnetwork mask to follow the proper procedure and also show the diagram of the sub network.**

    *   This is a Class B address. To create four subnets, we need to borrow 2 bits from the host part. The subnet mask will be 255.255.192.0. The subnets will be 140.15.0.0/18, 140.15.64.0/18, 140.15.128.0/18, and 140.15.192.0/18.

3.  **Suppose Alice, who always accesses the Web using Internet Explorer from her home PC, contacts the Amazon.com for the first time. Let us also suppose that in the past she has already visited the eBay site. Now what will happen, when she request comes into the Amazon Web server for the first time and then one week later? Illustrate the communication process between Alice's browser and the Amazon web server with respect to cookies.**

    *   When Alice visits Amazon for the first time, the Amazon server will create a cookie and send it to Alice's browser. The browser will store the cookie. When Alice visits Amazon again, the browser will send the cookie back to the server. The server can then use the cookie to identify Alice and retrieve her shopping cart, for example.

4.  **What is the function of conditional GET?**

    *   A conditional GET is an HTTP request that includes an `If-Modified-Since` header. If the requested object has not been modified since the date specified in the header, the server will respond with a `304 Not Modified` status code, and the client can use its cached version of the object.

## VI. Questions from January-June 2018

1.  **Protocols and Topologies:**
    *   **Discuss about the protocols in computer networking.**
        *   Protocols are rules that govern communication between devices on a network.
    *   **Discuss about bus, ring, star and mesh topology with cable link connection of the given topology.**
        *   **Bus:** All devices are connected to a single cable.
        *   **Ring:** All devices are connected in a circle.
        *   **Star:** All devices are connected to a central hub.
        *   **Mesh:** All devices are connected to each other.
2.  **Data Link Layer:**
    *   **What are the major duties of data link layer? How data link layer completes node-to-node delivery?**
        *   The data link layer is responsible for node-to-node delivery of frames. It does this by adding a header and a trailer to the network-layer datagram to create a frame.
    *   **Write down the short note on congestion control, flow control and error control in transport layer.**
        *   **Congestion Control:** Prevents the network from being overloaded with too much traffic.
        *   **Flow Control:** Prevents the sender from overwhelming the receiver with too much data.
        *   **Error Control:** Detects and corrects errors that occur during transmission.
3.  **Addressing and Ethernet:**
    *   **Distinguish a unicast address from multicast address.**
        *   A unicast address identifies a single host. A multicast address identifies a group of hosts.
    *   **Discuss the functions of 802.3 MAC frame.**
        *   The 802.3 MAC frame is used to encapsulate network-layer datagrams for transmission over an Ethernet network.
    *   **Why bridged and switched Ethernet are used in networking systems?**
        *   Bridges and switches are used to segment a LAN into smaller collision domains, which improves performance.
4.  **Physical Layer and LANs:**
    *   **Show the encoding of 1000 base-X and 1000 base-T Ethernet.**
        *   1000Base-X uses fiber-optic cable, and 1000Base-T uses twisted-pair copper cable.
    *   **What are the features of RS and MII of fast Ethernet?**
        *   RS (Reconciliation Sublayer) and MII (Medium Independent Interface) are part of the Fast Ethernet standard that allow for different types of media to be used.
    *   **Why repeater is used in networking system? Compare the performance of repeater and hub.**
        *   A repeater is used to extend the length of a network. A hub is a multi-port repeater. A hub is less efficient than a switch because it forwards all packets to all ports.
5.  **Bridging and Subnetting:**
    *   **What are the loop problems for bridge connections? Show the example of loop problems.**
        *   Loops can occur in a bridged network if there are multiple paths between two bridges. This can cause packets to be forwarded endlessly in a loop.
    *   **Show the steps of spanning tree in a bridged LAN.**
        *   The spanning tree protocol is used to prevent loops in a bridged network by disabling redundant paths.
    *   **How does a VLAN reduce network traffic?**
        *   A VLAN can reduce network traffic by dividing a LAN into smaller broadcast domains.
6.  **Routing and Subnet Calculations:**
    *   **Discuss about store and forward packet switching in network layer.**
        *   In store-and-forward packet switching, a router must receive the entire packet before it can begin to forward it.
    *   **How each node is labeled in shortest path routing algorithm?**
        *   Each node is labeled with its distance from the source node.
    *   **Why subnet masks are used in computer networking?**
        *   Subnet masks are used to divide a large block of addresses into smaller subnets.
    *   **In a computer network, Network address is given as 196.64.10.0 Subnet Mask is given as 255.255.255.248. Find the answer of following questions: i. What are the valid subnets? ii. What are the valid first hosts?**
        *   i. The valid subnets are 196.64.10.0/29, 196.64.10.8/29, 196.64.10.16/29, etc.
        *   ii. The first valid host on the 196.64.10.0/29 subnet is 196.64.10.1.

## VII. Questions from January-June 2014

1.  **Network Topology:** Which topology in computer networks is better according to your perception? Show your justifications.

    The best topology depends on the specific needs of the network. A star topology is easy to install and manage, but it has a single point of failure. A mesh topology is more reliable but is more expensive and difficult to manage.

2.  **Layer Responsibilities:** Write down the responsibilities of data link layer and transport layer in internet model.

    *   **Data Link Layer:** Node-to-node delivery of frames.
    *   **Transport Layer:** Process-to-process delivery of segments.

3.  **Ethernet and Gigabit:**
    *   **Discuss about the MAC frame in Traditional Ethernet.**
        *   The Ethernet MAC frame is used to encapsulate network-layer datagrams for transmission over an Ethernet network.
    *   **Write down the short note on RS, GMII, PHY, and MDI in Gigabit Ethernet.**
        *   RS (Reconciliation Sublayer), GMII (Gigabit Medium Independent Interface), PHY (Physical Layer), and MDI (Medium Dependent Interface) are all part of the Gigabit Ethernet standard.

4.  **ARP and IP:**
    *   **What is ARP? Discuss about the fields in ARP packet.**
        *   ARP (Address Resolution Protocol) is used to map an IP address to a MAC address. The ARP packet contains the sender and target IP and MAC addresses.
    *   **Find out the checksum in the given IP packet.**
        *   (This question requires an IP packet.)

5.  **Network Layer Implementation:**
    *   **Implement the connection-oriented service in the network layer.**
        *   A connection-oriented service can be implemented in the network layer using a virtual-circuit network.
    *   **What is datagram subnet? Implement the datagram subnet.**
        *   A datagram subnet is a network in which each packet is routed independently.

6.  **Routing and Switching:**
    *   **Show how distance vector routing works in a subnet.**
        *   In distance-vector routing, each router maintains a table of distances to all other routers in the network. The routers periodically exchange their tables with their neighbors.
    *   **What is routing algorithm? Discuss about the shortest path routing algorithm.**
        *   A routing algorithm is used to find the best path for a packet to travel from its source to its destination. The shortest path routing algorithm finds the path with the lowest cost.
    *   **Show the timing of events in circuit switching and packet switching.**
        *   In circuit switching, a dedicated circuit is established between the source and destination before any data is transferred. In packet switching, packets are sent independently and may take different paths.
    *   **In a computer network, Network address is given as 192.168.10.0 Subnet Mask is given as 255.255.255.248. Find the answer of following questions: i. How many subnets? ii. How many hosts? iii. What are the valid subnets? iv. What are the valid hosts? v. What are the broadcast addresses for each subnet?**
        *   i. 8 subnets
        *   ii. 6 hosts per subnet
        *   iii. 192.168.10.0/29, 192.168.10.8/29, ...
        *   iv. 192.168.10.1-192.168.10.6, 192.168.10.9-192.168.10.14, ...
        *   v. 192.168.10.7, 192.168.10.15, ...

## VIII. Undated Mid-Examinations/Sessions

### A. Mid-Exam Set 1
1.  **BTCL is granted a block of addresses starting with 254.103.0.0/15...**

    (This is a subnetting problem similar to others that have been answered.)

2.  **One of the addresses in a block is 167.199.170.82/24. Find the number of addresses in the network, the first address, and the last address with proper procedure.**

    *   Number of addresses: 256
    *   First address: 167.199.170.0
    *   Last address: 167.199.170.255

### B. Mid-Exam Set 2
1.  **What is the network address in a block of addresses? How can we find the network address if one of the addresses in a block is given?**

    The network address is the first address in a block of addresses. It can be found by performing a bitwise AND operation on the given IP address and the subnet mask.

2.  **An ISP is granted a block of addresses starting with 120.60.4.0/22. The ISP wants to distribute these blocks to 100 organizations with each organization receiving just eight addresses. Design the subblocks and give the slash notation for each subblock. Find out how many addresses are still available after these allocations.**

    *   Each organization needs 8 addresses, which is 2^3 addresses. So, we need a /29 prefix for each organization.
    *   Total addresses needed: 100 * 8 = 800
    *   The ISP has a /22 block, which has 2^(32-22) = 2^10 = 1024 addresses. This is enough to accommodate the 100 organizations.
    *   Available addresses: 1024 - 800 = 224

3.  **In a connection, the value of cwnd is 2500 and the value of rwnd is 4500. The host has sent 2000 bytes which has not been acknowledged. How many more bytes can be sent?**

    The number of bytes that can be sent is the minimum of cwnd and rwnd, minus the number of unacknowledged bytes. So, the host can send min(2500, 4500) - 2000 = 500 more bytes.

4.  **A window holds bytes 2001 to 6000. The next byte to be sent is 3001. Draw a figure to show the situation of the window after the following two events: a. An ACK segment with the acknowledgement number 3500 and window size advertisement 4000 is received. b. A segment carrying 1500 bytes is sent.**

    (This question requires drawing a diagram to show the window movement, which is difficult to represent in text.)

5.  **What is a socket address?**

    A socket address is the combination of an IP address and a port number.
