## I. Questions from January-June 2023 (Session 2020-2021)

### Q. 1. Networking Concepts and Performance
1.  What distinguishes a host from an end system? Provide examples of various end systems. Would a web server be considered an end system? Why are end systems related to hosts, and what distinguishes clients from servers within this context?
2.  HFC, DSL, and FTTH are all used for residential access. For each of these access technologies, provide a range of transmission rates and comment on whether the transmission rate is shared or dedicated.
3.  Suppose users share a 2 Mbps link. Also suppose each user transmits continuously at 1 Mbps when transmitting, but each user transmits only 20 percent of the time.
    *   When circuit switching is used, how many users can be supported?
    *   For the remainder of this problem, suppose packet switching is used. Why will there be essentially no queuing delay before the link if two or fewer users transmit at the same time?
    *   Why will there be queuing delay if three users transmit at the same time?
    *   Find the probability that a given user is transmitting.
    *   Suppose now there are three users. Find the probability that at any given time, all three users are transmitting simultaneously.
    *   Find the fraction of time during which the queue grows.
4.  In this problem, we consider sending real-time voice from Host A to Host B over a packet-switched network (VoIP). Host A converts the analog voice signal into a digital bit stream at a rate of 64 kbps. Host A then collects the bits into packets, each containing 4000 bytes. There is a single link between Host A and B with a transmission rate of 10 Mbps and propagation delay of 10 milliseconds. As soon as Host A gathers a packet, it sends it to Host B. Immediately upon receiving the entire packet, Host B converts the packet’s bits back into an analog signal. What is the total time that elapses from the moment a bit is created (from the original analog signal at Host A) until it is decoded (as part of the analog signal at Host B)?
5.  What are an application-layer message? A transport-layer segment? A network-layer datagram? A link-layer frame?

### Q. 2. IP Addressing and NAT
1.  A router receives a packet with the destination address 201.24.67.32. Show how the router finds the next-hop address of the packet.
2.  What is CIDR, and how can you extract block information from a given IP address?
3.  Assume a company has three offices: Central, East, and West. The Central office is connected to the East and West offices via private, point-to-point WAN lines. The company is granted a block of addresses with the beginning address 70.12.100.128/26. The management has decided to allocate 32 addresses for the Central office and divides the rest of addresses between the two other offices. Finaly the the block with its IP address.
4.  An ISP is granted a block of addresses starting with 150.80.0.0/16. The ISP wants to distribute these blocks to 2000 customers as follows:
    *   The first group has 200 medium-size businesses; each needs approximately 128 addresses.
    *   The second group has 400 small businesses; each needs approximately 16 addresses.
    *   The third group has 2000 households; each needs 4 addresses.
    *   Design the subblocks and give the slash notation for each subblock. Find out how many addresses are still available after the allocations.

### Q. 3. Classless Addressing, Routing, and Protocols
1.  In classless addressing, we know the first and the last address in the block. Can we find the prefix length? If yes, show the process and give an example.
2.  We noted that network layer functionality can be broadly divided into data plane functionality and control plane functionality. What are the main functions of the data plane? Of the control plane?
3.  Compare and contrast the properties of a centralized and a distributed routing algorithm. Give an example of a routing protocol that takes a centralized and a decentralized approach.
4.  Consider the following network. With the indicated link costs, use Dijkstra’s shortest-path algorithm to compute the shortest path from $x$ to all network nodes. Show how the algorithm works by computing a table and also draw the shortest path graph.

### Q. 4. TCP Connection Establishment
1.  TCP opens a connection using an initial sequence number (ISN) of 14,534. The other party opens the connection with an ISN of 21,732. Show the three TCP segments during the connection establishment.

### Q. 5. TCP Data Transfer and Flow Control
1.  Show the contents of the segments during the data transmission if the initiator sends a segment containing the message “Hello dear customer” and the other party answers with a segment containing “Hi there seller.”
2.  Show the entries for the header and pseudoheader of a UDP user datagram that carries a message from a Daytime client (153.1.8.8:105) to a Daytime server (171.2.14.10). Consider the data message “PSTU#”. Choose the correct well-known port number and 1087 as ephemeral port number. Calculate the checksum value. Show the UDP packet ready to be sent.
3.  In a send window, $S_F=401$ and $S_L=701$. If window size is 1,000 bytes, show the send window before and after the station receives an ACK segment with ackNo = 601 and rwnd = 700. Ignore congestion control. Does this situation mean shrinking the window?
4.  Illustrate the 'half-close' case in TCP.

### Q. 6. DNS, Application Protocols, and Multimedia
1.  A DNS client is looking for the name of the computer with IP address 132.1.17.8. Show the query message. Also show the response message sent by the server to this query. Encapsulate the query and response message in a UDP user datagram.
2.  Consider distributing a file of F = 20 Gbits to N peers. The server has an upload rate of $u_s = 30$ Mbps, and each peer has a download rate of $d_i = 2$ Mbps and an upload rate of $u$. For N = 10, 100, and 1,000 and $u = 300$ Kbps, 700 Kbps, and 2 Mbps, prepare a chart giving the minimum distribution time for each of the combinations of N and u for both client-server distribution and P2P distribution.
3.  How does SMTP mark the end of a message body? How about HTTP? Can HTTP use the same method as SMTP to mark the end of a message body? Explain.
4.  What is the function of MIME? A sender sends a JPEG message. Show the MIME header.
5.  Obtain the HTTP/1.1 specification (RFC 2616). Answer the following questions:
    *   Explain the mechanism used for signaling between the client and server to indicate that a persistent connection is being closed.
    *   What encryption services are provided by HTTP?
    *   Can a client open three or more simultaneous connections with a given server?
    *   Either a server or a client may close a transport connection between them if either one detects the connection has been idle for some time. Is it possible that one side starts closing a connection while the other side is transmitting data via this connection? Explain.
6.  Why do we need an RRQ or WRQ message in TFTP but not in FTP? Show the encapsulation of an RRQ message and a WRQ message in separate UDP user datagram. Assume the file name is “report” and the mode is ASCII. What are the sizes of UDP datagrams?
7.  Consider a DASH system in which there are M video versions (at N different rates and qualities) and N audio versions (at N different rates and qualities). Suppose we want to allow the player to choose at any time any of the M video versions and any of the N audio versions.
    *   If we create files so that the client is mixed in with the video, the server sends only one media stream at given time, how many files will the server need to store (each a different URL)?
    *   If the server instead sends the audio and video streams separately and has the client synchronize the streams, how many files will the server need to store?
8.  What is the Apache Web server? How much does it cost? What functionality does it currently have?

***

## II. Questions from January-June 2022 (Session 2018-2019)

1.  Find the netid, subnet mask and the hostid of the following IP addresses: a. 114.34.2.8, b. 132.56.8.6, c. 208.34.54.12, d. 251.34.98.5.
2.  An address in a block is given as 191.8.243.9. Find the number of addresses in the block, subnet mask the first address, and the last address.
3.  A company is granted the site address 201.70.64.0. The company needs six subnets. Design the subnets and shows the first address and last address with subnetmask through a pictorial representation.
4.  What are the services that a transport-layer protocol cannot provide to applications invoking it?
5.  Can an application use the services of TLS?
6.  Describe how installing a proxy server can reduce the delay in receiving a requested object.

***

## III. Questions from January-June 2021 (Session 2018-2019)

### Q. 1. Access Technologies and Network Services
1.  Describe the most popular wireless internet access technologies today. Compare and contrast the different wireless access technologies. Classify each one as home access, enterprise access, or wide-area wireless access.
2.  Write the duties/services and protocol of each specific OSI layer.
3.  In the problem, we consider sending real-time voice from Host A to Host B over a packet-switched network... What is the total time that elapses from the moment a bit is created (from the original analog signal at Host A) until it is decoded (as part of the analog signal at Host B)?
4.  Explain whether a packet-switched network or a circuit-switched network be more appropriate for this application. Why?
5.  Compare and contrast the properties of a centralized and a distributed routing algorithm. Give an example of a routing protocol that takes a centralized and a decentralized approach.

### Q. 2. IP Addressing and Subnetting
1.  How are the blocks allocated? What are the restrictions need to be applied to the allocated block.
2.  The address 192.168.12.0/20 is given. Find the number of addresses, the first address, and the last address in the block.
3.  An ISP is granted a block of addresses 23.34.252.0/24. The organization needs to have 4 subblocks of addresses to use in its four zones at shown below. Distribute the addresses.
4.  Write the steps need to be carefully followed to guarantee the proper operation of the sub-networks.

### Q. 3. Routing and Forwarding
1.  Discuss the forwarding process of a packet arrives at R1 in below Figure with the destination address 180.70.65.140.
2.  What is NAT? How can NAT help in address depletion?
3.  Briefly define subnetting and supernetting. How do the subnet mask and supernet mask differ from a default mask in classful addressing?
4.  A block of addresses is granted to a small organization. We know that one of the addresses is 205.16.37.19/24. Find out the first address, last address, and the number of addresses in the block. Also show this network structure through a block.

### Q. 4. Transport Layer and Physical Layer
1.  Where do we find the netid and the hostid of the following IP addresses: a. 117.14.15.5, b. 47.20.17.25, c. 200.10.20.30, d. 250.8.2.3.
2.  In TCP, if the value of HLEN is 1000, how many bytes of option are included in the segment?
3.  A TCP connection is using a window size of 12,000 bytes, and the previous acknowledgment number was 22,001. If it receives a segment with acknowledgment number 24,001 and window size advertisement 8,000. Draw a figure to show the situation of the window after the following two events: a. An ACK segment with the acknowledgement number 3500 and window size advertisement 4000 is received. b. A segment carrying 1500 bytes is sent.
4.  In the standard Ethernet, if the maximum transmission rate is 25.0 ps, what is the minimum size of the frame?

***

## IV. Questions from January-June 2020

(Note: This period covers two distinct exam papers: Session 2019-2020 and Session 2017-2018, plus a Sessional Exam.)

### A. Session 2019-2020 Exam

1.  **Queuing Delay and Traffic:**
    *   In practice, does the queuing delay tend to vary a lot? Answer Yes or No and why.
    *   What is R = 2R, what is the needed value of $\lambda$?
    *   Assuming the router's buffer is infinite, the queuing delay is 0.4357 ms, and 1218 packets arrive. How many packets will be in the buffer?
    *   If the buffer has a maximum size of 563 packets, how many of the 1218 packets would be dropped upon arrival from the previous question?
2.  **General Network Concepts:**
    *   Some content providers have created their own networks. Describe Google’s network. What motivates content providers to create these networks?
    *   What are an application-layer message? A transport-layer segment? A network-layer datagram? A link-layer frame?
    *   HFC, DSL, and FTTH are all used for residential access. For each of these access technologies, provide a range of transmission rates and comment on whether the transmission rate is shared or dedicated.
    *   In the problem, we consider sending real-time voice from Host A to Host B over a packet-switched network (VoIP)... What is the total time that elapses from the moment a bit is created (from the original analog signal at Host A) until it is decoded (as part of the analog signal at Host B)?
3.  **IP Addressing and Subnetting:**
    *   For the proper operation of the CIDR, three restrictions need to be applied to the allocated block. Justify this statement.
    *   An organization is granted the block 130.34.12.64/26. The organization needs four sub-networks, each with an equal number of addresses. Design the sub-networks and find the information about each sub-network.
    *   An ISP is granted a block of addresses starting with 150.80.0.0/16. The ISP wants to distribute these blocks to 2000 customers as follows:
        *   The first group has 200 medium-size businesses; each needs approximately 128 addresses.
        *   The second group has 400 small businesses; each needs approximately 16 addresses.
        *   The third group has 2000 households; each needs 4 addresses.
        *   Design the subblocks and give the slash notation for each subblock. Find out how many addresses are still available after these allocations.
4.  **Specific Calculations and Routing:**
    *   Three necessary steps need to be carefully followed to guarantee the proper operation of the sub-networks.
    *   You have an interface on a router with the IP address of 192.168.192.10/29. What is the broadcast address for the subnet that this LAN?
    *   What is the last valid host on the subnetwork 165.21.80.128/26?
    *   In the mask-length notation, find the number of 1’s that must be added to the mask if the number of desired subnets will be 8 and 122.
    *   Construct least-cost-path tree by tracing predecessor nodes. Also find out the resulting least-cost-path tree from u and also show the resulting forwarding table in u.
    *   When the algorithm converges, what are the distance vectors from router 'y' to all routers? Write your answer as u,v,w,x.
    *   What is the initial distance vectors for router W? Write your answer as u,v,w,x,y and if a distance is $\infty$, write 'x'.

### B. Session 2017-2018 Exam

1.  **Course and Career Requirements:**
    *   Explain the learning outcomes of this computer network course as a student of CSE.
    *   What are the requirements to get a job in the computer networking field? Mention five ISP providers in Bangladesh.
    *   Suppose PC A wants to communicate to PC B through below networking devices. Now state the below network configuration through TCP/IP layer model in each device.
    *   Write the duties/services and protocol of each specific OSI layer.
2.  **Addressing and Network Layer:**
    *   Why do you think both the sender and receiver addresses are needed in the Internet?
    *   Four levels of addresses are used in an Internet employed by TCP/IP protocols and each address is related to a one layer in the TCP/IP architecture? Justify the statement.
    *   Distinguish among broadcast, multicast and unicast address.
    *   Define the type of the following destination addresses with explanation: a. 200.17.21.5, b. 47.20.17.25.0/24.
3.  **Classes, Structure, and Allocation:**
    *   Find the class of each address: a. 00000001 00000111 00001011 11111111, b. 11000001 10000010 00001011 11111111, c. 11100001 11011011 10001011 01111111, d. 11110011 10011011 11111011 00001111.
    *   How can you extract three levels of information in a block? Explain the procedure with a block diagram.
    *   An address in a block is given as 180.8.17.9. Find the number of addresses in the block, the first address, and the last address and presents it with a diagram.
    *   An ISP is granted a block of addresses starting with 150.80.0.0/16. The ISP wants to distribute these blocks to 2000 customers as follows:
        *   The first group has 200 medium-size businesses; each needs approximately 128 addresses.
        *   The second group has 400 small businesses; each needs approximately 16 addresses.
        *   The third group has 2000 households; each needs 4 addresses.
        *   Design the subblocks and give the slash notation for each subblock. Find out how many addresses are still available after the allocations.
4.  **CIDR, Subnetting, and Connection Types:**
    *   Three necessary steps need to be carefully followed to guarantee the proper operation of the network. Justify the statement.
    *   For the proper operation of the CIDR, three restrictions need to be applied to the allocated block. Justify this statement.
    *   Draw and explain a connection oriented packet switched network.
    *   What are the steps need to be carefully followed to guarantee the proper operation of the sub-networks.
5.  **Addressing, Routing, and Forwarding:**
    *   Which addresses are used either in isolation or in connection with network address translation techniques?
    *   Define Subnet. Discuss the simplified forwarding module in classful address without subnetting.
    *   The Figure shows an imaginary part of the Internet. Show the routing tables for router R1 if router $R_1$ receives a packet with destination address 192.16.7.14. Discuss how the packet is forwarded.
    *   Make a routing table for router R1 using the configuration in Figure below, then show the forwarding process if a packet arrives at R1 in Figure with the destination address 180.70.65.140.
6.  **Application Layer and Routing Algorithms:**
    *   Explain non-persistent HTTP based on www.pstu.ac.bd/someDepartment/home index (containing five references to 10 jpg images).
    *   Describe how Web caching can reduce the delay in receiving a requested object. Will Web caching reduce the delay for all objects requested by a user or for only some of the objects? Why?
    *   Consider the case when the server does not store the copy of the requested document but decides to generate and send it for each of its customers. Describe how cache could be done at source site that would keep a purchase record for each of its customers.
    *   Compute the shortest path from u to all network nodes. Show how the algorithm works by computing a table.

### C. January-June 2020 Sessional Exam
1.  Build, test, and configure the entire lab network
    *   Integrate skills from throughout the course
    *   Analyze the protocols involved in requesting a web page (DNS, ARP, HTTP, TCP, IP, Ethernet, HDLC)
    *   Analyze the protocols involved in tracing the route to the web server (DNS, UDP, ARP, ICMP, IP, Ethernet, HDLC)
2.  Viva Voce
3.  Project work on computer network
4.  Course work/Class test/Review
5.  Continuous lab assignment submission

***

## V. Questions from Session 2018-2019 Mid I

1.  An classful address in a block is given as 223.4.17.9. Find the number of addresses in the block, the first address, and the last address. Draw also the block diagram of this IP address topology.
2.  Suppose you have given a classful block of IP 140.15.0.0. Now you need to divide this IP block to four subnetwork with equal IP address space of each block. Now extracting the first address, the last address, subnetwork mask to follow the proper procedure and also show the diagram of the sub network.
3.  Suppose Alice, who always accesses the Web using Internet Explorer from her home PC, contacts the Amazon.com for the first time. Let us also suppose that in the past she has already visited the eBay site. Now what will happen, when she request comes into the Amazon Web server for the first time and then one week later? Illustrate the communication process between Alice's browser and the Amazon web server with respect to cookies.
4.  What is the function of conditional GET?

***

## VI. Questions from January-June 2018

1.  **Protocols and Topologies:**
    *   Discuss about the protocols in computer networking.
    *   Discuss about bus, ring, star and mesh topology with cable link connection of the given topology.
2.  **Data Link Layer:**
    *   What are the major duties of data link layer? How data link layer completes node-to-node delivery?
    *   Write down the short note on congestion control, flow control and error control in transport layer.
3.  **Addressing and Ethernet:**
    *   Distinguish a unicast address from multicast address.
    *   Discuss the functions of 802.3 MAC frame.
    *   Why bridged and switched Ethernet are used in networking systems?
4.  **Physical Layer and LANs:**
    *   Show the encoding of 1000 base-X and 1000 base-T Ethernet.
    *   What are the features of RS and MII of fast Ethernet?
    *   Why repeater is used in networking system? Compare the performance of repeater and hub.
5.  **Bridging and Subnetting:**
    *   What are the loop problems for bridge connections? Show the example of loop problems.
    *   Show the steps of spanning tree in a bridged LAN.
    *   How does a VLAN reduce network traffic?
6.  **Routing and Subnet Calculations:**
    *   Discuss about store and forward packet switching in network layer.
    *   How each node is labeled in shortest path routing algorithm?
    *   Why subnet masks are used in computer networking?
    *   In a computer network, Network address is given as 196.64.10.0 Subnet Mask is given as 255.255.255.248. Find the answer of following questions: i. What are the valid subnets? ii. What are the valid first hosts?

***

## VII. Questions from January-June 2014

1.  **Network Topology:** Which topology in computer networks is better according to your perception? Show your justifications.
2.  **Layer Responsibilities:** Write down the responsibilities of data link layer and transport layer in internet model.
3.  **Ethernet and Gigabit:**
    *   Discuss about the MAC frame in Traditional Ethernet.
    *   Write down the short note on RS, GMII, PHY, and MDI in Gigabit Ethernet.
4.  **ARP and IP:**
    *   What is ARP? Discuss about the fields in ARP packet.
    *   Find out the checksum in the given IP packet.
5.  **Network Layer Implementation:**
    *   Implement the connection-oriented service in the network layer.
    *   What is datagram subnet? Implement the datagram subnet.
6.  **Routing and Switching:**
    *   Show how distance vector routing works in a subnet.
    *   What is routing algorithm? Discuss about the shortest path routing algorithm.
    *   Show the timing of events in circuit switching and packet switching.
    *   In a computer network, Network address is given as 192.168.10.0 Subnet Mask is given as 255.255.255.248. Find the answer of following questions: i. How many subnets? ii. How many hosts? iii. What are the valid subnets? iv. What are the valid hosts? v. What are the broadcast addresses for each subnet?

***

## VIII. Undated Mid-Examinations/Sessions

### A. Mid-Exam Set 1
1.  BTCL is granted a block of addresses starting with 254.103.0.0/15. The BTCL needs to distribute these addresses to three division of customers as follows: i) The Dhaka city has 64 customers; each needs approximately 256 addresses. ii) The Barisal city has 128 customers; each needs approximately 128 addresses. iii) The Khulna city has 128 customers; each needs approximately 256 addresses. Now design the subblocks and find out how many addresses are still available after these allocations with diagram.
2.  One of the addresses in a block is 167.199.170.82/24. Find the number of addresses in the network, the first address, and the last address with proper procedure.

### B. Mid-Exam Set 2
1.  What is the network address in a block of addresses? How can we find the network address if one of the addresses in a block is given?
2.  An ISP is granted a block of addresses starting with 120.60.4.0/22. The ISP wants to distribute these blocks to 100 organizations with each organization receiving just eight addresses. Design the subblocks and give the slash notation for each subblock. Find out how many addresses are still available after these allocations.
3.  In a connection, the value of cwnd is 2500 and the value of rwnd is 4500. The host has sent 2000 bytes which has not been acknowledged. How many more bytes can be sent?
4.  A window holds bytes 2001 to 6000. The next byte to be sent is 3001. Draw a figure to show the situation of the window after the following two events: a. An ACK segment with the acknowledgement number 3500 and window size advertisement 4000 is received. b. A segment carrying 1500 bytes is sent.
5.  What is a socket address?
