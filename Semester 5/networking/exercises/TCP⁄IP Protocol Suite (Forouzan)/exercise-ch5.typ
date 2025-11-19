#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2.5cm),
  numbering: "1",
  columns: 1,
)
// #set text(font: "Ubuntu Nerd Font")
#set par(justify: true)
// #set heading(numbering: "1.1")

// --------------------------
// Title page
// --------------------------

#set page(numbering: none)

#align(left)[
  #line(length: 100%)
  #align(left, text(18pt)[
    *TCP/IP Protocol Suite (Forouzan)*
  ])
  #align(left, text(16pt)[
    *Exercises Solution*
  ])
  #line(length: 100%)

]
#align(bottom)[
  #image("logo.svg", width: 2cm)
  #link("https://github.com/SharafatKarim/pstu-cse-academic")[Source code is *available on GitHub*]. \
  Made with *typst typesetting*.
]

// Extra Notes
#rect(width: 100%)[
  #text(size: 14pt)[
    *Legends* \
  ]
  #parbreak()
  - *Bold texts* are used for decoration or emphasis.
  - #strike[Strike-through] refers to out of syllabus/ context.
  - #highlight[Highlighted texts] are some optional texts :)
]

#align(bottom)[
  #line(length: 100%)
  #text(size: 14pt)[
    *Terms & Conditions* \
  ] \
  - This is just a *sample*, nothing more, nothing less :) \
  - I have tried to put things like *summary*, and obviously this is not the solution that I will submit or recommended! I am in no way responsible for any illegal use of this file. \
  - If you need direct solutions for submitting your assignment, please ask DeepSeek, ChatGPT, Google Gemini, Anthropic Claude, Hugging Chat, Le Chat Mistral or any other predictive models (LLM). \
  And yah, can be *inaccurate*! Feel free to *criticize*.
  #line(length: 100%)
]

#pagebreak()

// #set page(numbering: "1")
// #outline()
// #align(bottom)[
//   #line(length: 100%)
//   *Revision 08* \
//   Try to directly open the file from Rising Flare, to avoid missing any updates. \
// ]
// #pagebreak()


// --------------------------
// Contents
// --------------------------

= Chapter 5: IPv4 Addresses
== Exercises

+ What is the address space in each of the following systems? \
  a. a system with 8-bit addresses \
  *Ans:* $2^8$ = *256 addresses*

  b. a system with 16-bit addresses \
  *Ans:* $2^16$ = *65,536 addresses*

  c. a system with 64-bit addresses \
  *Ans:* $2^64$ = *$1.844674407 times 10^19$ addresses*

+ An address space has a total of 1,024 addresses. How many bits are needed to represent an address? \
  *Ans:* $log_2(1024)$ = *10 bits*

+ An address space uses three symbols: 0, 1, and 2 to represent addresses. If each address is made of 10 symbols, how many addresses are available in this system? \
  *Ans:* $3^10$ = *59,049 addresses*

+ Change the following IP addresses from dotted-decimal notation to binary notation: \
  a. 114.34.2.8 \
  *Ans:* 01110010 #h(0.2cm) 00100010 #h(0.2cm) 00000010 #h(0.2cm) 00001000

  b. 129.14.6.8 \
  *Ans:* 10000001 #h(0.2cm) 00001110 #h(0.2cm) 00000110 #h(0.2cm) 00001000 \
  c. 208.34.54.12 \
  *Ans:* 11010000 #h(0.2cm) 00100010 #h(0.2cm) 00110110 #h(0.2cm) 00001100 \
  d. 238.34.2.1 \
  *Ans:* 11101110 #h(0.2cm) 00100010 #h(0.2cm) 00000010 #h(0.2cm) 00000001 \

+ Change the following IP addresses from dotted-decimal notation to hexadecimal notation: \
  a. 114.34.2.8 \
  *Ans:* 0x72220A \
  b. 129.14.6.8 \
  *Ans:* 0x810E0608 \
  c. 208.34.54.12 \
  *Ans:* 0xD022360C \
  d. 238.34.2.1 \
  *Ans:* 0xEE220201 \

+ Change the following IP addresses from hexadecimal notation to binary notation: \
  a. 0x1347FEAB \
  *Ans:* 00010011 #h(0.2cm) 01000100 #h(0.2cm) 01111110 #h(0.2cm) 10101011 \
  b. 0xAB234102 \
  *Ans:* 10101011 #h(0.2cm) 00100011 #h(0.2cm) 01000001 #h(0.2cm) 00000010 \
  c. 0x0123A2BE \
  *Ans:* 00000001 #h(0.2cm) 00100011 #h(0.2cm) 10100010 #h(0.2cm) 10111110 \
  d. 0x00001111 \
  *Ans:* 00000000 #h(0.2cm) 00000000 #h(0.2cm) 00010000 #h(0.2cm) 00001111 \

+ How many hexadecimal digits are needed to define the netid in each of the following classes? \
  a. Class A \
  *Ans:* 2 hex digits (8 bits)

  b. Class B \
  *Ans:* 4 hex digits (16 bits)

  c. Class C \
  *Ans:* 6 hex digits (24 bits)

+ Change the following IP addresses from binary notation to dotted-decimal notation: \
  a. 01111111 11110000 01100111 01111101 \
  *Ans:* 127.240.103.125

  b. 10101111 11000000 11111000 00011101 \
  c. 11011111 10110000 00011111 01011101 \
  d. 11101111 11110111 11000111 00011101 \

+ Find the class of the following IP addresses: \
  a. 208.34.54.12 \
  *Ans:* Class C

  b. 238.34.2.1 \
  *Ans:* Class D

  c. 242.34.2.8 \
  *Ans:* Class E

  d. 129.14.6.8 \
  *Ans:* Class B

+ Find the class of the following IP addresses: \
  a. 11110111 11110011 10000111 11011101 \
  *Ans:* Class E

  b. 10101111 11000000 11110000 00011101 \
  *Ans:* Class B

  c. 11011111 10110000 00011111 01011101 \
  *Ans:* Class C

  d. 11101111 11110111 11000111 00011101 \
  *Ans:* Class D

+ Find the netid and the hostid of the following IP addresses: \
  a. 114.34.2.8 \
  *Ans:*
  #table(
    columns: 3,
    [Class], [Netid], [Hostid],
    [A], [114], [34.2.8],
  )

  b. 132.56.8.6 \
  *Ans:*
  #table(
    columns: 3,
    [Class], [Netid], [Hostid],
    [B], [132.56], [8.6],
  )

  c. 208.34.54.12 \
  *Ans:*
  #table(
    columns: 3,
    [Class], [Netid], [Hostid],
    [C], [208.34.54], [12],
  )

  d. 251.34.98.5 \
  *Ans:* It's class E, which doesn't have a defined netid and hostid. Therefore, all bits in a Class E address are used for the network ID, and it is not typically used for standard networking.

+ Find the number of addresses in the range if the first address is 14.7.24.0 and the last address is 14.14.34.255. \
  *Ans:* We can subtract the first address from the last address to find the number of addresses in the range.

  The result is 0.7.10.255. We convert this number to base 10 and add 1 to it, \
  Number of addresses = $(0 * 256^3) + (7 * 256^2) + (10 * 256^1) + (255 * 256^0) + 1 = 461568$

+ If the first address in a range is 122.12.7.0 and there are 2048 addresses in the range, what is the last address? \
  *Ans:* We convert the number of addresses minus 1 to base 256, which is 0.0.7.255. Then we add this number to the first address, \
  The last address is (122.12.7.0 + 0.0.7.255) = 122.12.14.255

+ Find the result of each operation: \
  a. NOT (22.14.70.34) \
  *Ans:* 233.241.185.221

  b. NOT (145.36.12.20) \
  *Ans:* 110.219.243.235

  c. NOT (200.7.2.0) \
  *Ans:* 55.248.253.255

  d. NOT (11.20.255.255) \
  *Ans:* 244.235.0.0

+ Find the result of each operation: \
  a. (22.14.70.34) AND (255.255.0.0) \
  *Ans:* 22.14.0.0

  b. (12.11.60.12) AND (255.0.0.0) \
  *Ans:* 12.0.0.0

  c. (14.110.160.12) AND (255.200.140.0) \
  *Ans:* 14.70.128.0

  d. (28.14.40.100) AND (255.128.100.0) \
  *Ans:* 28.0.32.0

+ Find the result of each operation: \
  a. (22.14.70.34) OR (255.255.0.0) \
  *Ans:* 255.255.70.34

  b. (12.11.60.12) OR (255.0.0.0) \
  *Ans:* 255.11.60.12

  c. (14.110.160.12) OR (255.200.140.0) \
  *Ans:* 255.238.172.12

  d. (28.14.40.100) OR (255.128.100.0) \
  *Ans:* 255.142.108.100

+ In a class A subnet, we know the IP address of one of the hosts and the subnet mask as given below:
  ```
  IP Address: 25.34.12.56
  Subnet mask: 255.255.0.0
  ```
  What is the first address (subnet address)? *25.34.0.0* \
  What is the last address? *25.34.255.255*

+ In a class B subnet, we know the IP address of one of the hosts and the subnet mask as given below:
  ```IP Address: 131.134.112.66
  Subnet mask: 255.255.224.0```
  What is the first address (subnet address)? *131.134.96.0* \
  What is the last address? *131.134.127.255*

+ In a class C subnet, we know the IP address of one of the hosts and the subnet mask as given below:
  ```IP Address: 202.44.82.16
  Subnet mask: 255.255.255.192```
  What is the first address (subnet address)? 202.44.82.0 \
  What is the last address? 202.44.82.63

+ Find the subnet mask in each case: \
  a. 1024 subnets in class A *255.255.192.0* \
  b. 256 subnets in class B *255.255.255.0* \
  c. 32 subnets in class C *255.255.255.224* \
  d. 4 subnets in class C *255.255.255.252* 

+ In a block of addresses, we know the IP address of one host is `25.34.12.56/16`.
  What is the first address (network address) and the last address (limited broadcast address) in this block? \
  *Ans:* The first address is 25.34.0.0 and the last address is 25.34.255.255.

+ In a block of addresses, we know the IP address of one host is 182.44.82.16/26.
  What is the first address (network address) and the last address (limited broadcast address) in this block? \
  *Ans:* The first address is 182.44.82.0 and the last address is 182.44.82.63.

+ In fixed-length subnetting, find the number of 1s that must be added to the mask if the number of desired subnets is \_\_\_\_ . \
  a. 2 *Ans:* 1 \
  b. 62 *Ans:* 6 \
  c. 122 *Ans:* 7 \
  d. 250 *Ans:* 8 \

+ An organization is granted the block 16.0.0.0/8. The administrator wants to create 500 fixed-length subnets. \

  + Find the subnet mask.
    *Ans:* 255.255.128.0
  + Find the number of addresses in each subnet.
    *Ans:* $2^{15}$ 
  + Find the first and the last address in the first subnet.
    *Ans:* 16.0.0.0 - 16.0.127.255
  + Find the first and the last address in the last subnet (subnet 500). \
    *Ans:* 16.249.128.0 - 16.249.255.255

+ An organization is granted the block 130.56.0.0/16. The administrator wants to create 1024 subnets. \
  + Find the subnet mask.
  + Find the number of addresses in each subnet.
  + Find the first and the last address in the first subnet.
  + Find the first and the last address in the last subnet (subnet 1024).
  *Ans:* same as 24/ check Rising's other solution...

+ An organization is granted the block 211.17.180.0/24. The administrator wants to create 32 subnets.
  + Find the subnet mask.
  + Find the number of addresses in each subnet.
  + Find the first and the last address in the first subnet.
  + Find the first and the last address in the last subnet (subnet 32).
  *Ans:* same as 24

+ Write the following mask in slash notation (/n):
  + 255.255.255.0 *Ans:* /24
  + 255.0.0.0 *Ans:* /8
  + 255.255.224.0 *Ans:* /19
  + 255.255.240.0 *Ans:* /20

+ Find the range of addresses in the following blocks:
  + 123.56.77.32/29 *Ans:* 123.56.77.32 - 123.56.77.39
  + 200.17.21.128/27 *Ans:* 200.17.21.128 - 200.17.21.159
  + 17.34.16.0/23 *Ans:* 17.34.16.0 - 17.34.17.255
  + 180.34.64.64/30 *Ans:* 180.34.64.64 - 180.34.64.67

+ In classless addressing, we know the first and the last address in the block. Can we find the prefix length? If the answer is yes, show the process and give an example. \
  *Ans:* Yes, we can find the prefix length. \
  Process: \
  + Subtract the first address from the last address to find the number of addresses in the block. \
  + Use $n = 32 - log_2 N$

  For example, if the first address is 17.24.12.64 and the last address is 17.24.12.127, then the number of addresses in the block is 64. We can find the prefix length as follows: \
  $n = 32 - log_2 N = 32 - log_2 64 = 26$

+ In classless addressing, we know the first address and the number of addresses in the block. Can we find the prefix length? If the answer is yes, show the process and give an example.
  *Ans:* Yes, we can find the prefix length. \
  Process: \
  + Use $n = 32 - log_2 N$

  For example, if the first address is 17.24.12.64 and the number of addresses is 64, then we can find the prefix length as follows: \
  $n = 32 - log_2 N = 32 - log_2 64 = 26$

+ In classless addressing, can two blocks have the same prefix length? Explain. \
  *Ans:* Yes, two blocks can have the same prefix length. \
  Explanation: \
  The prefix length indicates the number of bits used for the network portion of the address. Two different blocks can have the same number of bits allocated for the network portion, resulting in the same prefix length. However, the actual addresses within those blocks will be different.

+ In classless addressing, we know the first address and one of the addresses in the block (not necessarily the last address). Can we find the prefix length? Explain. \
  *Ans:* No, we cannot find the prefix length. \
  Knowing only one address within the block does not provide enough information to determine the size of the block or the number of addresses it contains. Without knowing either the last address or the total number of addresses in the block, we cannot calculate the prefix length.

+ An ISP is granted a block of addresses starting with 150.80.0.0/16. The ISP wants to distribute these blocks to 2600 customers as follows:
  + The first group has 200 medium-size businesses; each needs approximately 128 addresses.
  + The second group has 400 small businesses; each needs approximately 16 addresses.
  + The third group has 2000 households; each needs 4 addresses.
  Design the subblocks and give the slash notation for each subblock. Find out how many addresses are still available after these allocations.

  *Ans:* 
  - For the first group (200 medium-size businesses needing 128 addresses each): \
    - Each business requires a /25 subnet (128 addresses). \
      + First subnet: 150.80.0.0/25 - 150.80.0.127 \
      + Second subnet: 150.80.0.128/25 - 150.80.0.255 \
      + Last subnet: 150.80.99.128/25 - 150.80.99.255 \
    - Total addresses used: $200 times 128$ = 25,600 addresses. \
  - For the second group (400 small businesses needing 16 addresses each): \
    - Each business requires a /28 subnet (16 addresses). \
      + First subnet: 150.80.100.0/28 - 150.80.100.15 \
      + Second subnet: 150.80.100.16/28 - 150.80.100.31 \
      + Last subnet: 150.80.124.240/28 - 150.80.124.255 \
    - Total addresses used: $400 times 16$ = 6,400 addresses. \

  - For the third group (2000 households needing 4 addresses each): \
    - Each household requires a /30 subnet (4 addresses). \
      + First subnet: 150.80.125.0/30 - 150.80.125.3 \
      + Second subnet: 150.80.125.4/30 - 150.80.125.7 \
      + 2000th subnet: 150.80.156.60/30 - 150.80.156.63 \
    - Total addresses used: $2000 times 4$ = 8,000 addresses. \

  - Total addresses used: 25,600 + 6,400 + 8,000 = 40,000 addresses. \
  - Total addresses available: 65,536 - 40,000 = 25,536 addresses. \

+ An ISP is granted a block of addresses starting with 120.60.4.0/20. The ISP wants to distribute these blocks to 100 organizations with each organization receiving 8 addresses only. Design the subblocks and give the slash notation for each subblock. Find out how many addresses are still available after these allocations.

  *Ans:* 
  - Each organization requires a /29 subnet (8 addresses). \
    + First subnet: 120.60.4.0/29 - 120.60.4.7 \
    + Second subnet: 120.60.4.8/29 - 120.60.4.15 \
    + Last subnet: 120.60.7.24/29 - 120.60.7.31 \
  - Total addresses used: $100 times 8$ = 800 addresses. \
  - Total addresses available: 4096 - 800 = 3296 addresses. \

+ An ISP has a block of 1024 addresses. It needs to divide the addresses to 1024 cus-tomers. Does it need subnetting? Explain your answer. \
  *Ans:* No, it does not need subnetting. \
  Since the ISP has exactly 1024 addresses and needs to allocate one address to each of its 1024 customers, it can directly assign one address to each customer without the need for subnetting. Each customer can be assigned a unique address from the available block.

// --------------------------
// Ending of ch 5
// --------------------------

// #align(bottom)[
//   "The night might seem endless right now, but I promise, the morning will come again." \
//   — Suzume, Suzume no Tojimari \
//   // *THE END*
// ]
