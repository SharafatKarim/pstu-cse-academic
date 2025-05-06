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
#set heading(numbering: "1")

// --------------------------
// Title page
// --------------------------

#align(left)[
  #line(length: 100%)
  #align(
    left,
    text(18pt)[
      *A fluid dynamic model for glacier flow*
    ],
  )
  #align(
    left,
    text(14pt)[
      *Sharafat Karim*
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
  - *Bold texts* were included in previous years questions.
  - ⭐ mark represents repentance amount.
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

= Introduction
In this report, we will explore the
various factors that influence fluid
dynamics in glaciers and how they
contribute to the formation and
behaviour of these natural structures.


#lorem(50)

\ ...

#align(right + bottom)[
  --- \
  *There's no end to EXPLORATION!*
]
