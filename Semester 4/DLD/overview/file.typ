#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2.5cm),
  numbering: "1",
  columns: 1,
)
// #set text(font: "Ubuntu Nerd Font")
#set par(
  justify: true
)
#set heading(numbering: "1.1")

// --------------------------
// Title page
// --------------------------

#align(left)[
  #line(length: 100%)
  #align(
    left,
    text(18pt)[
      *Questions Summary & Analysis*
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

== Thoery


+ Number base conversion (decimal, binary, octal, hexa)
+ complements (r's and r-1's)
+ substruction with r's complement

// --------------------------
// Chapter 2
// --------------------------

= Boolean Algebra and Logic Gates

== Definitions
== Thoery

+ Basic theorems and properties of bool algebra 
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
  - Conversation between Canonical Forms
  - Standard Form

== Logical implementation

// --------------------------
// Chapter 3
// --------------------------

= Simplification of Boolean Functions

== Definitions
+ Prime implicants
+ Essential prime implicants

== Thoery
+ 2-3-4-5-6 Variable Maps (Simplification)
+ *Don't care condition*
+ *Tabular Method *
  - Simplify Don't Care Condition using Tabular Method.

== Logical implementation

// --------------------------
// Chapter 4
// --------------------------

= Combinational Logic

== Definitions
== Thoery
== Logical implementation

// --------------------------
// Chapter 5
// --------------------------

= Combinational Logic with MSI and LSI

== Definitions
== Thoery
== Logical implementation

// --------------------------
// Chapter 6
// --------------------------

= Sequential Logic

== Definitions
== Thoery
== Logical implementation

// --------------------------
// Chapter 7
// --------------------------

== Definitions
== Thoery
== Logical implementation

= Registers, Counters and the Memory Unit

== Definitions
== Thoery
== Logical implementation

// --------------------------
// Chapter 8
// --------------------------

= Register-Transfer Logic

== Definitions
== Thoery
== Logical implementation


#align(right + bottom)[
  --- \
  *There's no end to EXPLORATION!*
]
