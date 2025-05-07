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
  #align(
    left,
    text(18pt)[
      *Questions Summary & Overview :: 2025*
    ],
  )
  #align(
    left,
    text(14pt)[
      *CCE 221 :: Digital Logic Design*
    ],
  )
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
  - ⭐ mark represents repentance amount in the previous questions,
  - while, single ⭐ mark represents appearance.
  - #strike[Strike-through] refers to out of syllabus.
  - #highlight[Highlighted texts] are something I didn't find in materials, so help me to find it :)
]

#align(bottom)[
  #line(length: 100%)
  By no means, *this is any sorts of suggestions*. Just a quick *overview!* \
  Nothing more, nothing less :) \
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

// --------------------------
// Chapter 1
// --------------------------

= Binary System

#rect(width: 100%)[
  Not really that important, but still you can read...\
  In our mid, r-1's complement was required!
]
== Definitions

+ Flat and dual-in-line package (Mahbub sir)

== Thoery + implementation


+ Number base conversion (decimal, binary, octal, hexa or *base-n*) ⭐
+ complements (r's and r-1's)
+ substruction with r's complement
+ Advantages and disadvantages of digital techniques over analog techniques ⭐

// --------------------------
// Chapter 2
// --------------------------

= Boolean Algebra and Logic Gates

== Thoery + implementation

+ Basic theorems and properties of bool algebra ⭐
  - basic therorem :: postulates
  - Operator precedence
  - Venn Diagram
  - Boolean functions
  - Algebric manupulation
+ Canonical and standard forms
  - Minterm & Maxterm examples
  - Sum of Maxterm
  - Product of Maxterm
    - Example 2-5
  - Conversation between Canonical Forms ⭐⭐
  - Standard Form

// --------------------------
// Chapter 3
// --------------------------

= Simplification of Boolean Functions
== Definitions
+ Prime implicants
+ Essential prime implicants

== Thoery + implementation
+ *2-3-4-5-6 Variable Maps (Simplification)* ⭐
  - Find prime implicants and essential prime implicants using K-map. ⭐
+ *Don't care condition* ⭐
  - *"An expression with the minimum number of literals is not necessarily unique."* ⭐⭐
+ *Tabular Method * ⭐
  - Simplify Don't Care Condition using Tabular Method.


// --------------------------
// Chapter 4
// --------------------------

#pagebreak()
= Combinational Logic
#rect(width: 100%)[
  For Mahbub sir's part, it's recommended to solve exercise problems from both books.
]
== Thoery
+ Design procedures (x7 steps)
+ Universal Gate (definition) ⭐

== Logical implementation
+ Adders
  - Half adder
  - Full adder
+ Subtractors
  - Half subtractor
  - Full subtractor
+ BCD to excess-3
+ Analysis procedure ⭐⭐
+ Multilevel NAND and NOR implementation ⭐
+ implementation with universal Gates
+ XOR & XNOR
+ Parity

// --------------------------
// Chapter 5
// --------------------------

= Combinational Logic with MSI and LSI
#rect(width: 100%)[
  For Mahbub sir's part, it's recommended to solve exercise problems from both books.
]

== Definitions
+ Adder ⭐
+ Decoder ⭐
+ Binary parallel adder
+ Programmable read only memory (ROM) ⭐


== Thoery + implementation
+ Carry propagation
  - Look ahead carry generator
+ Decimal adder
  - BCD adder ⭐
+ Magnitude comparator ⭐
+ Decoder & Demultiplexer ⭐⭐
  - Decoder with enable (E) input
+ Encoder & Multiplexer ⭐⭐
+ Boolean function implementation
+ Read-only memory (ROM)
  - Combinational logic implementation
  - Types of ROM
+ Programmable logic array (PLA)

// --------------------------
// Chapter 6
// --------------------------

= Sequential Logic

== Definitions
+ Sequencial logic
+ Flip flop ⭐
+ Synchronous vs asynchronous circuits ⭐

== Thoery + implementation
+ Combinational vs sequential circuits ⭐
+ Clocked RS flip-flop ⭐
+ Clocked D flip-flop ⭐
+ Clocked JK flip-flop ⭐⭐
+ Clocked T flip-flop
+ Triggering of flip-flops
  - Master-slave flip-flop
  - Edge-triggered flip-flop

  #rect(width: 100%)[
    For the following topics, it's *recommended to watch YouTube videos*. \
    *"Sequential Circuits"* by *Neso Academy* is a good one. \
    Also there're some recommended ones from *Mahbub sir* (link availabe on 🌄✨ or Classroom).
  ]
+ Analysis of clocked sequential circuits
  - Example of a sequential circuit
  - State table ⭐
  - State diagram ⭐
  - State equation
+ State reduction
  - State assignment
+ Design procedure

// --------------------------
// Chapter 7
// --------------------------

= Registers, Counters and the Memory Unit

#rect(width: 100%)[
  Go through Rising Flare's progress for capturing exact tables and figures.
]

= Definition
+ Register ⭐
+ Bidirectional shift register ⭐
+ Binary ripple counter ⭐
+ Serial vs parallel transfer ⭐

== Thoery

+ Registers 
  - 4 bit register with parallel load ⭐
  - register with parallel load (D flip-flops) ⭐
  - Block diagram of a sequential circuit
  - Example 7-1
+ Shift register
  - Serial transfer from register A to register B ⭐⭐
  - Bidirectional shift register with parallel load
  - 4-bit Bidirectional shift register with parallel load
+ Serial addition ⭐⭐
+ Ripple counter (asynchronous counter) ⭐
+ BCD Ripple counter (asynchronous counter) ⭐⭐
+ Synchronous counter
  - 4-bit synchronous binary counter
+ Johnson counter (construction) ⭐
+ The memory unit 
+ Examples of Random Access Memory (RAM)
  - Memory cell
  - Integrated circuit memory
  - Magnetic core memory

// --------------------------
// Chapter 8
// --------------------------

= Register-Transfer Logic

#rect(width: 100%)[
  From this chapter we actually need to know only simple statements. \
  Don't skip statements, \
  and get overloaded with the details! \
]

== Definition
+ Register 
+ Binary information
+ Microoperation
+ MBR (previous chapter)

== Thoery
+ Microoperation types
+ Interregister transfer
  - Fig 8-2
  - Table 8-1
  - Fig 8-3
+ Memory transfer
+ Arithmetic, logic and shift microoperations
  - Basics and statements  
    - Table 8-2
  - Logic microoperation
    - Table 8-3
  - Shift microoperation
+ Overflow


#align(right + bottom)[
  --- \
  *Nobody can go back and start a new beginning, \
  but anyone can start today and make a new ending.* \
  \~ Maria Robinson
]
