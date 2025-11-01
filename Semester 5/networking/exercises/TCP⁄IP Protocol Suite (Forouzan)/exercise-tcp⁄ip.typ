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

#set page(numbering: "1")
#outline()
#align(bottom)[
  #line(length: 100%)
  *Revision 07* \
  Try to directly open the file from Rising Flare, to avoid missing any updates. \
]
#pagebreak()


// --------------------------
// Contents
// --------------------------

= Chapter 19: Domain Name System (DNS)
== Exercises

+ Determine which of the following is an FQDN and which is a PQDN: \
  a. xxx
  b. xxx.yyy.
  c. xxx.yyy.net
  d. zzz.yyy.xxx.edu.

  *Ans:* a, c = *PQDN*; b, d = *FQDN*

  #highlight()[
    সাধারণত FQDN এর শেষে একটি dot থাকে, যা DNS সার্ভারকে বলে দেয় যে এটি একটি সম্পূর্ণ ডোমেইন নাম।
  ]

+ Determine which of the following is an FQDN and which is a PQDN: \
  a. mil.
  b. edu.
  c. xxx.yyy.net
  d. zzz.yyy.xxx.edu

  *Ans:* a, b = *FQDN*; c, d = *PQDN*

+ Find the value of the flags field (in hexadecimal) for a query message requesting an address and demanding a recursive answer.

  *Ans:* 0x0100 \
  Here, our flag field will be like,

  #table(
    columns: 8,
    [QR], [Opcode], [AA], [TC], [RD], [RA], [Three 0s], [rCode],
    [0], [0000], [0], [0], [1], [0], [000], [0000],
  )

+ Find the value of the flags field (in hexadecimal) for an unauthoritative message carrying an inverse response. The resolver had asked for a recursive response, but the recursive answer was not available.

  *Ans:* 0x8900 \
  Here, our flag field will be like,

  #table(
    columns: 8,
    [QR], [Opcode], [AA], [TC], [RD], [RA], [Three 0s], [rCode],
    [1], [0001], [0], [0], [1], [0], [000], [0000],
  )

+ Analyze the flag 0x8F80.

  *Ans:*
  Here, our flag field will be like,

  #table(
    columns: 8,
    [QR], [Opcode], [AA], [TC], [RD], [RA], [Three 0s], [rCode],
    [1], [0001], [1], [1], [1], [1], [000], [0000],
  )

  - QR = 1 (Response)
  - Opcode = 0001 (Inverse Query)
  - AA = 1 (Authoritative Answer)
  - TC = 1 (Truncated)
  - RD = 1 (Recursion Desired)
  - RA = 1 (Recursion Available)
  - rCode = 0000 (No Error)

+ Analyze the flag 0x0503. Is it valid?

  *Ans:*
  Here, our flag field will be like,

  #table(
    columns: 8,
    [QR], [Opcode], [AA], [TC], [RD], [RA], [Three 0s], [rCode],
    [0], [0000], [1], [0], [1], [0], [000], [0011],
  )

  - QR = 0 (Query)
  - Opcode = 0000 (Standard Query)
  - AA = 1 (Authoritative Answer - don't care)
  - TC = 0 (Not Truncated - don't care)
  - RD = 1 (Recursion Desired)
  - RA = 0 (Recursion Available - don't care)
  - rCode = 0001 (Format Error)

  Here AA is a don't care condition, so it's value will not matter. And the rCode is not valid, as it should be 0000 (No Error) for a valid query. Becuase only the authoritative server can make the judgement for rCode. So, this flag is *not valid*.

+ Is the size of a question record fixed?

  *Ans:* Nope.

+ Is the size of a resource record fixed?

  *Ans:* Nope.

+ What is the size of a question record containing the domain name `fhda.edu`?

  *Ans:* Question record = Query name + Query type + Query class \
  Here, query type and query class are fixed at 2 bytes each. \
  Query name is variable length, but in this case, it will be stored like,

  #table(
    columns: 5,
    [4], ['fhda'], [3], ['edu'], [0],
  )

  So here 10 byte or 80 bit can store the query name. \
  Question Record Size = 10 (query name) + 2 (query type) + 2 (query class) = 14 bytes. \

+ What is the size of a question record containing an IP address?

  *Ans:* Question record = Query name + Query type + Query class \
  Here, query type and query class are fixed at 2 bytes each. \
  Query name is variable length, but in this case, it will be stored like,

  #table(
    columns: 13,
    [3], ['aaa'], [3], ['aaa'], [3], ['aaa'], [3], ['aaa'], [7], ['in-addr'], [4], ['arpa'], [0],
  )

  Here for the maximum cases around 30 bytes will be requried to store the query name. \
  Question Record Size = 30 (query name) + 2 (query type) + 2 (query class) = 34 bytes. \

+ What is the size of a resource record containing the domain name `fhda.edu`?

  *Ans:* Resource record = Name + Type + Class + TTL + Data length + RDATA \
  Here, Name is variable length, but in this case, it will be stored like,

  #table(
    columns: 5,
    [4], ['fhda'], [3], ['edu'], [0],
  )

  So here 10 byte or 80 bit can store the query name. \
  Type and Class are fixed at 2 bytes each. \
  TTL is fixed at 4 bytes. \
  Data length is fixed at 2 bytes. \
  RDATA is the IP address, which is 4 bytes (written in octets). \

  Resource Record Size = 10 (name) + 2 (type) + 2 (class) + 4 (ttl) + 2 (data length) + 4 (rdata) \
  #h(3.5cm) = 24 bytes.

+ What is the size of a resource record containing an IP address?

  #highlight()[
    আগের প্রশ্নটির অনুরূপ, তবে এখানে domain নাম যেকোনো একটা ধরে নিতে হবে (variable length)। এখন এটা standard response হবে নাকি inverse response, তা আমি নিশ্চিত নই।
  ]

+ What is the size of a query message requesting the IP address for `challenger.atc.fhda.edu`?

  *Ans:* Query message = Header + Question record \

  Header is fixed at 12 bytes. \

  #h(0.85cm) Question record = Query name + Query type + Query class \
  Here, query type and query class are fixed at 2 bytes each. \
  Query name is variable length, but in this case, it will be stored like,

  #table(
    columns: 9,
    [10], ['challenger'], [3], ['atc'], [4], ['fhda'], [3], ['edu'], [0],
  )

  So here 25 byte can store the query name. \
  Question Record Size = 25 (query name) + 2 (query type) + 2 (query class) = 29 bytes. \

  Finally, \
  Query Message Size = 12 (header) + 29 (question record) = 41 bytes. \

+ What is the size of a query message requesting the domain name for 185.34.23.12?

  *Ans:* Query message = Header + Question record \

  Header is fixed at 12 bytes. \

  #h(0.85cm) Question record = Query name + Query type + Query class \
  Here, query type and query class are fixed at 2 bytes each. \
  Query name is variable length, but in this case, it will be stored like,

  #table(
    columns: 13,
    [2], ['12'], [2], ['23'], [2], ['34'], [3], ['185'], [7], ['in-addr'], [4], ['arpa'], [0],
  )

  So here 27 byte can store the query name. \
  Question Record Size = 27 (query name) + 2 (query type) + 2 (query class) = 31 bytes. \

  Finally, \
  Query Message Size = 12 (header) + 31 (question record) = 43 bytes. \

+ What is the size of the response message responding to the query message in Exercise 13?

  *Ans:* Response message = Header + Question record + Answer record \

  Header is fixed at 12 bytes. \

  #h(0.85cm) Question record = Query name + Query type + Query class \
  Here, query type and query class are fixed at 2 bytes each. \
  Query name is variable length, but in this case, it will be stored like,

  #table(
    columns: 9,
    [10], ['challenger'], [3], ['atc'], [4], ['fhda'], [3], ['edu'], [0],
  )

  So here 25 byte can store the query name. \
  Question Record Size = 25 (query name) + 2 (query type) + 2 (query class) = 29 bytes. \

  #h(0.85cm) Answer record = Name + Type + Class + TTL + Data length + RDATA \
  Here,
  + lName is variable length, but in this case, Name is variable length, but in this case, we can use compression, which will cost 2 bytes. \
  + Type and Class are fixed at 2 bytes each. \
  + TTL is fixed at 4 bytes. \
  + Data length is fixed at 2 bytes. \
  + RDATA is the IP address, which is assumed to be 4 bytes (written in octets). \
  + Answer Record Size = 2 (name) + 2 (type) + 2 (class) + 4 (ttl) + 2 (data length) + 4 (rdata) = 16 bytes. \

  #highlight[
    আমি এখানে name = ২ বাইট ধরেছি, কিন্তু যদি compression না থাকে তাহলে কিন্তু ঠিকই ২৫ বাটট দরকার হবে।
  ]

  Finally, \
  Response Message Size = 12 (header) + 29 (question record) + 16 (answer record) = 57 bytes. \

+ What is the size of the response message responding to the query message in Exercise 14?

  *Ans:* Response message = Header + Question record + Answer record \

  Header is fixed at 12 bytes. \

  #h(0.85cm) Question record = Query name + Query type + Query class \
  Here, query type and query class are fixed at 2 bytes each. \
  Query name is variable length, but in this case, it will be stored like,

  #table(
    columns: 13,
    [2], ['12'], [2], ['23'], [2], ['34'], [3], ['185'], [7], ['in-addr'], [4], ['arpa'], [0],
  )

  So here 27 byte can store the query name. \
  Question Record Size = 27 (query name) + 2 (query type) + 2 (query class) = 31 bytes. \

  #h(0.85cm) Answer record = Name + Type + Class + TTL + Data length + RDATA \
  Here,
  + Name is variable length, but in this case, we can use compression, which will cost 2 bytes. \
  + Type and Class are fixed at 2 bytes each. \
  + TTL is fixed at 4 bytes. \
  + Data length is fixed at 2 bytes. \
  + RDATA is considered variable length, but in this case, let use consider it to be 16 bytes. \

  Answer Record Size = 2 (name) + 2 (type) + 2 (class) + 4 (ttl) + 2 (data length) + 16 (rdata) = 28 bytes. \

  Finally, \
  Response Message Size = 12 (header) + 31 (question record) + 28 (answer record) = *71 bytes*. \

  #highlight()[
    এখানে আমি আন্দাজে ১৬ বাইট RDATA ধরেছি। যেটা নি:সন্দেহে ভুল। সঠিক কি করা উচিত, তা আমি জানি না।
  ]

+ Redo Example 19.1 using a response message with one answer record and one authoritative record which defines “fhda.edu.” as the authoritative server.

  *Ans:* Here for this case, our flag field will be like,

  #table(
    columns: 8,
    [QR], [Opcode], [AA], [TC], [RD], [RA], [Three 0s], [rCode],
    [1], [0000], [1], [0], [1], [1], [000], [0000],
  )

  It can be representyed in hexadecimal as 0x8580. \

  So, the response message will be like,
  #table(
    columns: 2,
    [0x1333], [0x8580], [1], [1], [1], [0],
    table.cell(colspan: 2)[4 'chal' 4 'fhda' 3 'edu' 0],
    [1], [1],
    table.cell(colspan: 2)[0xC00C],
    [1], [1],
    table.cell(colspan: 2)[1200],
    [4], [153 18 8 105],
    table.cell(colspan: 2)[0xC00C],
    [2], [1],
    table.cell(colspan: 2)[1200],
    [10], [4 'fhda' 3 'edu' 0],
  )

  #highlight()[
    এখানে query type 2 ধরা হয়েছে authoritative server এর জন্য। \
  ]

+ Redo Exercise 17, but add one additional record that defines the address of the authoritative server as 153.18.9.0.

  *Ans:* Here the flag field will as same as previous one, 0x8580. \
  So, the response message will be like,
  #table(
    columns: 2,
    [0x1333], [0x8580], [1], [1], [1], [1],
    table.cell(colspan: 2)[4 'chal' 4 'fhda' 3 'edu' 0],
    [1], [1],
    table.cell(colspan: 2)[0xC00C],
    [1], [1],
    table.cell(colspan: 2)[1200],
    [4], [153 18 8 105],
    table.cell(colspan: 2)[0xC00C],
    [2], [1],
    table.cell(colspan: 2)[1200],
    [10], [4 'fhda' 3 'edu' 0],
    table.cell(colspan: 2)[0xC00C],
    [2], [1],
    table.cell(colspan: 2)[1200],
    [4], [153 18 9 0],
  )

+ A DNS client is looking for the IP address of xxx.yyy.com. Show the query message with values for each field.

  *Ans:* The query message will be like,

  #table(
    columns: 2,
    [0x1333], [0x0100], [1], [0], [0], [0],
    table.cell(colspan: 2)[3 'xxx' 3 'yyy' 3 'com' 0],
    [1], [1],
  )

  Here the flag field is 0x0100, which means it is a standard query with recursion desired. The flag will be like, \

  #table(
    columns: 8,
    [QR], [Opcode], [AA], [TC], [RD], [RA], [Three 0s], [rCode],
    [0], [0000], [0], [0], [1], [0], [000], [0000],
  )

+ Show the response message of a DNS server to Exercise 19. Assume the IP address is 201.34.23.12.

  *Ans:* The response message will be like,

  #table(
    columns: 2,
    [0x1333], [0x8180], [1], [1], [0], [0],
    table.cell(colspan: 2)[3 'xxx' 3 'yyy' 3 'com' 0],
    [1], [1],
    table.cell(colspan: 2)[0xC00C],
    [1], [1],
    table.cell(colspan: 2)[1200],
    [4], [201 34 23 12],
  )

  Here the flag field is 0x8180, which means it is a standard response with recursion available. The flag will be like, \

  #table(
    columns: 8,
    [QR], [Opcode], [AA], [TC], [RD], [RA], [Three 0s], [rCode],
    [1], [0000], [0], [0], [1], [1], [000], [0000],
  )

+ A DNS client is looking for the IP addresses corresponding to xxx.yyy.com and aaa.bbb.edu. Show the query message.

  *Ans:* The query message will be like,

  #table(
    columns: 2,
    [0x1333], [0x0100], [2], [0], [0], [0],
    table.cell(colspan: 2)[3 'xxx' 3 'yyy' 3 'com' 0],
    [1], [1],
    table.cell(colspan: 2)[3 'aaa' 3 'bbb' 3 'edu' 0],
    [1], [1],
  )

  Here the flag field is 0x0100, which means it is a standard query with recursion desired. The flag will be like, \

  #table(
    columns: 8,
    [QR], [Opcode], [AA], [TC], [RD], [RA], [Three 0s], [rCode],
    [0], [0000], [0], [0], [1], [0], [000], [0000],
  )

+ Show the response message of a DNS server to the query in Exercise 21 if the addresses are 14.23.45.12 and 131.34.67.89.

  *Ans:* The response message will be like,

  #table(
    columns: 2,
    [0x1333], [0x8180], [2], [2], [0], [0],
    table.cell(colspan: 2)[3 'xxx' 3 'yyy' 3 'com' 0],
    [1], [1],
    table.cell(colspan: 2)[3 'aaa' 3 'bbb' 3 'edu' 0],
    [1], [1],
    table.cell(colspan: 2)[0xC00C],
    [1], [1],
    table.cell(colspan: 2)[1200],
    [4], [14 23 45 12],
    table.cell(colspan: 2)[0xC01D],
    [1], [1],
    table.cell(colspan: 2)[1200],
    [4], [131 34 67 89],
  )

  Here the flag field is 0x8180, which means it is a standard response with recursion available. The flag will be like, \
  #table(
    columns: 8,
    [QR], [Opcode], [AA], [TC], [RD], [RA], [Three 0s], [rCode],
    [1], [0000], [0], [0], [1], [1], [000], [0000],
  )

  #highlight()[
    এবং 0xC00C হল xxx.yyy.com এর address। \
    এখানে 0xC01D হল aaa.bbb.edu এর address।
  ]

+ Show the response message of Exercise 22 if the DNS server can resolve the first enquiry but not the second.

  *Ans:* The response message will be like,

  #table(
    columns: 2,
    [0x1333], [0x8180], [2], [1], [0], [0],
    table.cell(colspan: 2)[3 'xxx' 3 'yyy' 3 'com' 0],
    [1], [1],
    table.cell(colspan: 2)[3 'aaa' 3 'bbb' 3 'edu' 0],
    [1], [1],
    table.cell(colspan: 2)[0xC00C],
    [1], [1],
    table.cell(colspan: 2)[1200],
    [4], [14 23 45 12],
  )

  Here the flag field is 0x8180, which means it is a standard response with recursion available. The flag will be like, \
  #table(
    columns: 8,
    [QR], [Opcode], [AA], [TC], [RD], [RA], [Three 0s], [rCode],
    [1], [0000], [0], [0], [1], [1], [000], [0000],
  )

+ A DNS client is looking for the name of the computer with IP address 132.1.17.8. Show the query message.

  *Ans:* The query message will be like,
  #table(
    columns: 2,
    [0x1333], [0x0900], [1], [0], [0], [0],
    table.cell(colspan: 2)[1 '8' 2 '17' 1 '1' 3 '132' 7 'in-addr' 4 'arpa' 0],
    [12], [1],
  )

  Here the flag field is 0x0900, which means it is a standard query with recursion desired. The flag will be like, \
  #table(
    columns: 8,
    [QR], [Opcode], [AA], [TC], [RD], [RA], [Three 0s], [rCode],
    [0], [0001], [0], [0], [1], [0], [000], [0000],
  )

+ Show the response message sent by the server to the query in Exercise 24.

  *Ans:* The response message will be like,
  #table(
    columns: 2,
    [0x1333], [0x8980], [1], [1], [0], [0],
    table.cell(colspan: 2)[1 '8' 2 '17' 1 '1' 3 '132' 7 'in-addr' 4 'arpa' 0],
    [12], [1],
    table.cell(colspan: 2)[0xC00C],
    [12], [1],
    table.cell(colspan: 2)[1200],
    [13], [3 'aaa' 3 'bbb' 3 'edu' 0],
  )

  #highlight()[
    এখানে 3 'aaa' 3 'bbb' 3 'edu' 0 মনমতো ধরে নিয়েছি :)
  ]

  Here the flag field is 0x8980, which means it is an inverse query with recursion available. The flag will be like, \
  #table(
    columns: 8,
    [QR], [Opcode], [AA], [TC], [RD], [RA], [Three 0s], [rCode],
    [1], [0001], [0], [0], [1], [1], [000], [0000],
  )

+ Encapsulate the query message of Exercise 24 in a UDP user datagram. \
  *Ans:* The UDP user datagram will be like,
   #table(
    columns: 2,
    [30000], [53],
    [49], [0x0000],
    [0x1333], [0x0900], [1], [0], [0], [0],
    table.cell(colspan: 2)[1 '8' 2 '17' 1 '1' 3 '132' 7 'in-addr' 4 'arpa' 0],
    [12], [1],
  )

  #highlight()[
    এখানে 30000 হল source port (আন্দাজে ধরেছি) এবং 53 হল destination port (DNS server এর জন্য)। আর 49 হলো length। \
  ]

+ Encapsulate the response message of Exercise 25 in a UDP user datagram. \
  *Ans:* The UDP user datagram will be like,
     #table(
    columns: 2,
    [53], [30000],
    [74], [0x0000],
    [0x1333], [0x8980], [1], [1], [0], [0],
    table.cell(colspan: 2)[1 '8' 2 '17' 1 '1' 3 '132' 7 'in-addr' 4 'arpa' 0],
    [12], [1],
    table.cell(colspan: 2)[0xC00C],
    [12], [1],
    table.cell(colspan: 2)[1200],
    [13], [3 'aaa' 3 'bbb' 3 'edu' 0],
  )

  #highlight()[
    এখানে 53 হল source port (DNS server এর জন্য) এবং 30000 হল destination port (আন্দাজে ধরেছি)। আর 74 হলো length। \
  ]
  
// --------------------------
// Ending of ch 1
// --------------------------

#align(bottom)[
  "Never trust anyone too much; remember, the devil was once an angel." \
  — Ken Kaneki, Tokyo Ghoul \
  // *THE END*
]

#pagebreak()

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
  c. 208.34.54.12 \
  d. 238.34.2.1

  #highlight()[
    কেবল dec থেকে bin conversion :) \
    In python, write `bin(129)` for conversion!
  ]

+ Change the following IP addresses from dotted-decimal notation to hexadecimal notation: \
  a. 114.34.2.8 \
  b. 129.14.6.8 \
  c. 208.34.54.12 \
  d. 238.34.2.1

  #highlight()[
    কেবল dec থেকে hex conversion :) \
    In python, write `hex(129)` for conversion!
  ]

+ Change the following IP addresses from hexadecimal notation to binary notation: \
  a. 0x1347FEAB \
  b. 0xAB234102 \
  c. 0x0123A2BE \
  d. 0x00001111 \

  #highlight()[
    কেবল hex থেকে bin conversion :) \
    In python, write `bin(0x1347FEAB)` for conversion!
  ]

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

  #highlight()[
    কেবল bin থেকে decimal conversion :) \
    In python, write `int(0b10101111)` for conversion!
  ]

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
  *Ans:* It's class E, which doesn't have a defined netid and hostid. Therefore, all bits in a Class E address are used for the network ID, and it is not typically used for standard networking. (#link("https://www.geeksforgeeks.org/computer-networks/what-is-network-id-and-host-id-in-ip-addresses/")[read more here...])

+ Find the number of addresses in the range if the first address is 14.7.24.0 and the last address is 14.14.34.255. \
  *Ans:* We can subtract the first address from the last address to find the number of addresses in the range.

  The result is 0.7.10.255. We convert this number to base 10 and add 1 to it, \
  Number of addresses = $(0 * 256^3) + (7 * 256^2) + (10 * 256^1) + (255 * 256^0) + 1 = 461568$

+ If the first address in a range is 122.12.7.0 and there are 2048 addresses in the range, what is the last address? \
  *Ans:* We convert the number of addresses minus 1 to base 256, which is 0.0.7.255. Then we add this number to the first address, \
  The last address is (122.12.7.0 + 0.0.7.255) = 122.12.14.255

  #highlight()[
    This one is a bit critical, think like money divide algorithm! \
    Courtesy *Imamul Anan*
  ]

+ Find the result of each operation: \
  a. NOT (22.14.70.34) \
  *Ans:* 233.241.185.221

  b. NOT (145.36.12.20) \
  *Ans:* 110.219.243.235

  c. NOT (200.7.2.0) \
  *Ans:* 55.248.253.255

  d. NOT (11.20.255.255) \
  *Ans:* 244.235.0.0

  #highlight()[
    `(255 - decimal)` for not conversion!
  ]

+ Find the result of each operation: \
  a. (22.14.70.34) AND (255.255.0.0) \
  *Ans:* 22.14.0.0

  b. (12.11.60.12) AND (255.0.0.0) \
  *Ans:* 12.0.0.0

  c. (14.110.160.12) AND (255.200.140.0) \
  *Ans:* 14.70.128.0

  d. (28.14.40.100) AND (255.128.100.0) \
  *Ans:* 28.0.32.0

  #highlight()[
    AND, OR calculator এই করা যাবে :)
  ]

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

  #highlight()[
    Use formula $2^n$ >= number of subnets to find n!
  ]

+ An organization is granted the block 16.0.0.0/8. The administrator wants to create 500 fixed-length subnets. \

  + Find the subnet mask.
    *Ans:* 255.255.128.0
  + Find the number of addresses in each subnet.
    *Ans:* $2^{15}$ 
  + Find the first and the last address in the first subnet.
    *Ans:* 16.0.0.0 - 16.0.127.255
  + Find the first and the last address in the last subnet (subnet 500).
    *Ans:* 16.255.128.0 - 16.255.255.255

+ An organization is granted the block 130.56.0.0/16. The administrator wants to create 1024 subnets. \
  a. Find the subnet mask.
  b. Find the number of addresses in each subnet.
  c. Find the first and the last address in the first subnet.
  d. Find the first and the last address in the last subnet (subnet 1024).
  *Ans:* check Rising's other solution...

26. An organization is granted the block 211.17.180.0/24. The administrator wants to
create 32 subnets.
a. Find the subnet mask.
b. Find the number of addresses in each subnet.
c. Find the first and the last address in the first subnet.
d. Find the first and the last address in the last subnet (subnet 32).
27. Write the following mask in slash notation (/n):
a. 255.255.255.0
b. 255.0.0.0
c. 255.255.224.0
d. 255.255.240.0
28. Find the range of addresses in the following blocks:
a. 123.56.77.32/29
b. 200.17.21.128/27
c. 17.34.16.0/23
d. 180.34.64.64/30
29. In classless addressing, we know the first and the last address in the block. Can we
find the prefix length? If the answer is yes, show the process and give an example.
30. In classless addressing, we know the first address and the number of addresses in
the block. Can we find the prefix length? If the answer is yes, show the process and
give an example.
31. In classless addressing, can two blocks have the same prefix length? Explain.
32. In classless addressing, we know the first address and one of the addresses in
the block (not necessarily the last address). Can we find the prefix length?
Explain.
33. An ISP is granted a block of addresses starting with 150.80.0.0/16. The ISP wants
to distribute these blocks to 2600 customers as follows:
a. The first group has 200 medium-size businesses; each needs approximately
128 addresses.
b. The second group has 400 small businesses; each needs approximately
16 addresses.
c. The third group has 2000 households; each needs 4 addresses.
Design the subblocks and give the slash notation for each subblock. Find out how
many addresses are still available after these allocations.
34. An ISP is granted a block of addresses starting with 120.60.4.0/20. The ISP wants
to distribute these blocks to 100 organizations with each organization receiving
8 addresses only. Design the subblocks and give the slash notation for each subblock.
Find out how many addresses are still available after these allocations.
35. An ISP has a block of 1024 addresses. It needs to divide the addresses to 1024 cus-
tomers. Does it need subnetting? Explain your answer.

// --------------------------
// Ending of ch 5
// --------------------------

#align(bottom)[
  "The night might seem endless right now, but I promise, the morning will come again." \
  — Suzume, Suzume no Tojimari \
  // *THE END*
]
