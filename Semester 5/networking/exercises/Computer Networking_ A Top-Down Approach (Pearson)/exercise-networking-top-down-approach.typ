#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2.5cm),
  numbering: "1",
  columns: 1,
)

// #set text(font: "Ubuntu Nerd Font")
#set par(justify: true)
#set heading()

// --------------------------
// Title page
// --------------------------

#set page(numbering: none)

#align(left)[
  #line(length: 100%)
  #align(left, text(22pt)[
    *Computer Networking* \
    *A Top-Down Approach (Pearson)*
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
  *Revision 01* \
  Try to directly open the file from Rising Flare, to avoid missing any updates. \
]
#pagebreak()


// --------------------------
// Contents
// --------------------------

= Chapter 2: Domain Name System (DNS)

== Chapter 2 Review Questions

=== Section 2.1

+ List five nonproprietary Internet applications and the application-layer protocols that they use.

  *Ans:* Here's a list,

  #table(
    columns: 2,
    [*Name*], [*Protocol name*],
    [Email], [SMTP],
    [Terminal shell sharing], [SSH],
    [File transfer], [FTP],
    [Websites], [HTTPS],
    [Streaming], [DASH],
  )

+ What is the difference between network architecture and application architecture?

  *Ans:* Here's some key differences,

  #table(
    columns: 2,
    [Application architecture], [Networking architecture],
    [
      + Application architecture is not fixed
      + Application architecture is flexible, and developers can choose from multiple paradigms, for example, MVC or microservices.
      + Application architecture includes application components, such as user interfaces, business logic, and data storage.
    ],
    [
      + Networking architecture is fixed
      + Networking architecture is not flexible, and developers have to follow one of the two paradigms, either client-server or peer-to-peer.
      + Networking architecture includes network components, such as routers, switches, and links.
    ],
  )

+ For a communication session between a pair of processes, which process is the client and which is the server?

  *Ans:* In a communication session, 
  - the client is the process that initiates the communication, 
  - while the server is the process that waits for incoming requests. 
  
  The client sends requests to the server, and the server processes these requests and sends back responses.

+ For a P2P file-sharing application, do you agree with the statement, “There is no notion of client and server sides of a communication session”? Why or why not? 

  *Ans:* No, I do not agree with the statement. In a P2P file-sharing application, each peer can act as both a client and a server. 
  
  - When a peer requests a file from another peer, it is acting as a client. 
  - Conversely, when it shares a file with another peer, it is acting as a server. 
  
  Therefore, the roles of client and server are not fixed and can change dynamically in a P2P architecture.

+ What information is used by a process running on one host to identify a process running on another host?

  *Ans:* We will need,

  - The IP address of the host where the process is running.
  - The port number associated with the process on that host.

+ Suppose you wanted to do a transaction from a remote client to a server as fast as possible. Would you use UDP or TCP? Why?
Referring to Figure 2.4, we see that none of the applications listed in Figure
2.4 requires both no data loss and timing. Can you conceive of an application
that requires no data loss and that is also highly time-sensitive?
List the four broad classes of services that a transport protocol can provide.
For each of the service classes, indicate if either UDP or TCP (or both) pro-
vides such a service.
Recall that TCP can be enhanced with TLS to provide process-to-process
security services, including encryption. Does TLS operate at the transport
layer or the application layer? If the application developer wants TCP to be
enhanced with TLS, what does the developer have to do?

== Section 2.2
== Section 2.3
== Section 2.4

// --------------------------
// Ending
// --------------------------

#align(bottom)[
  "Never trust anyone too much; remember, the devil was once an angel." \
  — Ken Kaneki, Tokyo Ghoul \
  // *THE END*
]
