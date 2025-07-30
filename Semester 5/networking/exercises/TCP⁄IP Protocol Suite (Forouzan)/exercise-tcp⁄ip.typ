#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2.5cm),
  numbering: "1",
  columns: 1,
)
// #set text(font: "Ubuntu Nerd Font")
#set par(justify: true)
#set heading(numbering: "1.1")

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
  *Revision 03* \
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

#strike[
  + Encapsulate the query message of Exercise 24 in a UDP user datagram.
  + Encapsulate the response message of Exercise 25 in a UDP user datagram.
]

#highlight()[
  উপরের দুটো প্রশ্ন UDP user diagram এর অংশ পড়ানোর সময় কভার হবে আশা করি :)
]

// --------------------------
// Ending
// --------------------------

#align(bottom)[
  "Never trust anyone too much; remember, the devil was once an angel." \
  — Ken Kaneki, Tokyo Ghoul \
  // *THE END*
]
