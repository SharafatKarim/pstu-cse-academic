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

#align(left)[
  #line(length: 100%)
  #align(left, text(18pt)[
    *TCP⁄IP Protocol Suite (Forouzan)*
  ])
  #align(left, text(14pt)[
    *Chapter 19 (Exercises)*
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
  - *Bold texts* mark importance.
  - #strike[Strike-through] refers to out of syllabus/ context.
  - #highlight[Highlighted texts] are some optional  :)
]

#align(bottom)[
  #line(length: 100%)
  #text(size: 14pt)[
    *Terms* \
  ] \
  - This is just a *sample*, nothing more, nothing less :) \
  - I have tried to put things like *summary*, and obviously this is not the solution that I will submit or recommended! I am in no way responsible for any illegal use of this file. \
  - If you need direct solutions for submitting your assignment, please ask DeepSeek, ChatGPT, Google Gemini, Anthropic Claude, Hugging Chat, Le Chat Mistral or any other predictive models (LLM). \
  And yah, can be *inaccurate*! Feel free to *criticize*.
  #line(length: 100%)
]

#pagebreak()

#outline()
#align(bottom)[
  #line(length: 100%)
  *Revision 01* \
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
    [0], [0000], [0], [0], [1], [0], [000], [0000]
  )

+ Find the value of the flags field (in hexadecimal) for an unauthoritative message carrying an inverse response. The resolver had asked for a recursive response, but the recursive answer was not available.

  *Ans:* 0x8900 \
  Here, our flag field will be like, 

  #table(
    columns: 8,
    [QR], [Opcode], [AA], [TC], [RD], [RA], [Three 0s], [rCode],
    [1], [0001], [0], [0], [1], [0], [000], [0000]
  )

+ Analyze the flag 0x8F80.

  *Ans:* 
  Here, our flag field will be like, 

  #table(
    columns: 8,
    [QR], [Opcode], [AA], [TC], [RD], [RA], [Three 0s], [rCode],
    [1], [0001], [1], [1], [1], [1], [000], [0000]
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
    [0], [0000], [1], [0], [1], [0], [000], [0011]
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
  
+ What is the size of a question record containing the domain name fhda.edu?

  *Ans:* Header (12 bytes) + Question Record. \

  Question record = Query name + Query type + Query class \
  Here, query type and query class are fixed at 2 bytes each. \
  Query name is variable length, but in this case, it will be stored like, \
  
  #table(
    columns: 10,
    [4], [f], [h], [d], [a], [3], [e], [d], [u], [0]
  )

  So here 2 byte or 16 bit is more than enough to store the query name. \

  So we can say, \
  Total Size = 12 (header) + 4 (question record) = 16 bytes.

+ What is the size of a question record containing an IP address?
+ What is the size of a resource record containing the domain name fhda.edu?
+ What is the size of a resource record containing an IP address?
+ What is the size of a query message requesting the IP address for challenger. atc.fhda.edu?
+ What is the size of a query message requesting the domain name for 185.34.23.12?
+ What is the size of the response message responding to the query message in Exercise 13?
+ What is the size of the response message responding to the query message in Exercise 14?
+ Redo Example 19.1 using a response message with one answer record and one authoritative record which defines “fhda.edu.” as the authoritative server.
+ Redo Exercise 17, but add one additional record that defines the address of the authoritative server as 153.18.9.0.
+ A DNS client is looking for the IP address of xxx.yyy.com. Show the query message with values for each field.
+ Show the response message of a DNS server to Exercise 19. Assume the IP address is 201.34.23.12.
+ A DNS client is looking for the IP addresses corresponding to xxx.yyy.com and aaa.bbb.edu. Show the query message.
+ Show the response message of a DNS server to the query in Exercise 21 if the addresses are 14.23.45.12 and 131.34.67.89.
+ Show the response message of Exercise 22 if the DNS server can resolve the first enquiry but not the second.
+ A DNS client is looking for the name of the computer with IP address 132.1.17.8. Show the query message.
+ Show the response message sent by the server to the query in Exercise 24.
+ Encapsulate the query message of Exercise 24 in a UDP user datagram.
+ Encapsulate the response message of Exercise 25 in a UDP user datagram.

// --------------------------
// Ending
// --------------------------

#align(center + bottom)[
  *THE END*
]
