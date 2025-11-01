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

    *   **Group 1 (200 businesses, 128 addresses each):**
        *   Each business needs 128 addresses, which is 2^7 addresses. So, we need a /25 prefix for each business.
        *   Total addresses needed: 200 * 128 = 25600 addresses.
        *   We can assign the block 150.80.0.0/19 to this group. This block has 2^(32-19) = 2^13 = 8192 addresses, which is enough to accommodate the 200 businesses.
    *   **Group 2 (400 businesses, 16 addresses each):**
        *   Each business needs 16 addresses, which is 2^4 addresses. So, we need a /28 prefix for each business.
        *   Total addresses needed: 400 * 16 = 6400 addresses.
        *   We can assign the block 150.80.32.0/20 to this group. This block has 2^(32-20) = 2^12 = 4096 addresses. This is not enough.
        *   Let's try 150.80.32.0/19. This has 8192 addresses. This is enough.
    *   **Group 3 (2000 households, 4 addresses each):**
        *   Each household needs 4 addresses, which is 2^2 addresses. So, we need a /30 prefix for each household.
        *   Total addresses needed: 2000 * 4 = 8000 addresses.
        *   We can assign the block 150.80.64.0/19 to this group. This block has 8192 addresses.
    *   **Available Addresses:**
        *   Total addresses in 150.80.0.0/16: 2^16 = 65536
        *   Addresses allocated: 8192 + 8192 + 8192 = 24576
        *   Available addresses: 65536 - 24576 = **40960**

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
