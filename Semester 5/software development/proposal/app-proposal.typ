#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2.5cm),
  numbering: "1",
  columns: 1,
)
// #set text(font: "Ubuntu Nerd Font")
#set par(justify: true)
#set heading(numbering: "1.")

// --------------------------
// Title page
// --------------------------

#align(left)[
  #image("PSTU.png", width: 20%, height: auto, alt: "PSTU")
  #text(16pt)[
    *Patuakhali Science and Technology University* \
  ]
  #text(14pt)[
    Faculty of Computer Science and Engineering
  ]

  #line(length: 100%)
  #align(
    left,
    text(18pt)[
      *CCE 310 :: Software Development Project-I*
    ],
  )
  #align(
    left,
    text(14pt)[
      *Sessional Project Proposal*
    ],
  )
  #line(length: 100%)
]

#align(bottom)[
  #line(length: 100%)
  *Project Title : SQL Judge* \
  Submission Date : Sat 14, June 2025 \
  #line(length: 100%)
]

#align(bottom)[
  // Submitted to,
  #rect(width: 100%)[
    #text(size: 14pt)[
      *Submitted to,* \
    ]
    #parbreak()
    *Prof. Dr. Md Samsuzzaman* \
    Professor, \
    Department of Computer and Communication Engineering, \
    Patuakhali Science and Technology University.
  ]
]

#align(bottom)[

  // Submitted by,
  #rect(width: 100%)[
    #text(size: 14pt)[
      *Submitted by,* \
    ]

    *Md. Sharafat Karim* \
    ID : 2102024, \
    Reg: 10151 \
  ]
]

#pagebreak()

#outline()
#pagebreak()

// --------------------------
// Contents
// --------------------------

#align(center)[
  #text(size: 20pt, weight: "bold")[SQL Judge]
]

#align(center + bottom)[
  *THE END*
]
