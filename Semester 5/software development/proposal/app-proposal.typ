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

#set page(numbering: none)

#align(left)[
  #image("PSTU.png", width: 20%, height: auto, alt: "PSTU")
  #text(16pt)[
    *Patuakhali Science and Technology University* \
  ]
  #text(14pt)[
    Faculty of Computer Science and Engineering
  ]

  #line(length: 100%)
  #align(left, text(18pt)[
    *CCE 310 :: Software Development Project-I*
  ])
  #align(left, text(14pt)[
    *Sessional Project Proposal*
  ])
  #line(length: 100%)
]

#align(bottom)[
  #line(length: 100%)
  *Project Title : Linkerine* \
  Submission Date : Fri 18, July 2025 \
  #line(length: 100%)
]

// #align(bottom)[
//   // Submitted to,
//   #rect(width: 100%)[
//     #text(size: 14pt)[
//       *Submitted to,* \
//     ]
//     #parbreak()
//     *Prof. Dr. Md Samsuzzaman* \
//     Professor, \
//     Department of Computer and Communication Engineering, \
//     Patuakhali Science and Technology University.
//   ]
// ]

// #align(bottom)[

//   // Submitted by,
//   #rect(width: 100%)[
//     #text(size: 14pt)[
//       *Submitted by,* \
//     ]

//     *Md. Sharafat Karim* \
//     ID : 2102024, \
//     Reg: 10151, \
//     Semester: 5 (L-3, S-1)
//   ]
// ]

#align(top)[
  #table(
    columns: (35%, auto),
    [
      #text(size: 14pt)[
        *Submitted from,* \
      ]

      *Md. Sharafat Karim* \
      *ID* : 2102024, \
      *Reg* : 10151, \
      *Semester* : 5 \ (Level-3, Semester-1)
    ],
    [
      #text(size: 14pt)[
        *Submitted to,* \
      ]
      #parbreak()
      + *Prof. Dr. Md Samsuzzaman* \
        Professor, \
        Department of Computer and Communication Engineering, \
        Patuakhali Science and Technology University.
      + *Sarna Majumder* \
        Associate Professor, \
        Department of Computer and Communication Engineering, \
        Patuakhali Science and Technology University.
    ],
  )
]


#pagebreak()
#set page(numbering: "1")
#outline()
#pagebreak()

// --------------------------
// Contents
// --------------------------

#align(center)[
  #text(size: 20pt, weight: "bold")[Linkerine]
]

= Abstract

Linkerine is a cross-platform bookmark management application designed to help users seamlessly store, organize, and sync *bookmarks*, *articles*, *notes*, *passwords*, and *RSS feeds* across multiple devices. In an age of increasing digital information overload, Linkerine aims to provide a simplified and powerful interface to manage and retrieve valuable resources from anywhere.

= Objectives

- To build a unified, cross-platform system to organize bookmarks, articles, and RSS feeds.

- To provide secure sync and storage for user data including notes and passwords.

- To implement intuitive features like nested folders, duplicate URL detection, powerful search, and anonymous usage.

- To offer a seamless experience across Android, iOS, and web platforms.

= Problem Statement

Existing solutions for bookmark and content management are either limited to specific platforms, paid-only, lack Android support, or provide limited functionality. Furthermore, most do not support features like anonymous mode, password storage, nested folders, and offline-first architecture. There is a need for a comprehensive, user-friendly tool that works everywhere and adapts to user privacy and organization needs.

= Related Work

- @pocket *Mozilla Pocket* - Popular read-it-later app, but now has been *deprecated* (as of July 8, 2025).

- @goodlinks *Goodlinks* - Paid and available only on macOS.

- @futurwise *Futurwise* - Chromium-only extension. Also mobile apps are not available.

- @instapaper *Instapaper* - Focused on reading but lacks strong organization.

- @matter *Matter* - No Android support, limited availability.

- @raindrop *Raindrop.io* - Feature-rich but lacks anonymous mode and some sync customizations.

- @readwise *Readwise* - Premium-focused and still in beta.

= Methodology

The development of Linkerine will follow an agile methodology, allowing for iterative improvements and user feedback. Our technology stack will includes,

#table(
  columns: (30%, 70%),
  [*Frontend*], [Flutter (Dart)],
  [*Backend*], [Supabase],
  [*UI Design*], [Material Design (android), Cupertino (IOS)],
  [*Database*], [PostgreSQL],
  [*Authentication*], [JWT, OAuth2],
  [*Hosting (web app)*], [Vercel or Netlify],
  [*CI/CD*], [GitHub Actions, Docker],
)

= Visual Models

== Flow Chart Diagram

#figure(
  image("diagrams/linkerine.DFD.svg", width: 100%, height: auto, alt: "Flow Chart"),
  caption: "Flow Chart of Linkerine Architecture",
) <DFD>

Here the above @DFD illustrates the high-level architecture of Linkerine, showing how different components interact with each other. Mainly the frontend communication is portrayed here.

In the frontend part, the user interacts with the application, which communicates with the backend server. The backend server handles requests, processes data, and interacts with the database for storage and retrieval of bookmarks, articles, notes, passwords, and RSS feeds.

== ERD (Entry Relationship Diagram)

#figure(
  image("diagrams/plantUML.svg", width: 100%, height: auto, alt: "Entity Relationship Diagram"),
  caption: "Entity Relationship Diagram of Linkerine",
) <ERD>

Here the above @ERD illustrates the backend database structure of Linkerine, showing the relationships between different entities such as users, bookmarks, articles, notes, passwords, and RSS feeds. 

== Timeline

The base timeline for the development of Linkerine is as follows,

#table(
  columns: (20%, 10%, 10%, 10%, 10%, 10%, 10%, 10%, 10%),
  [*Task*], [*Week 1-2*], [*Week 3-4*], [*Week 5-6*], [*Week 7-8*], [*Week 9*], [*Week 10*], [*Week 11*], [*Week 12*],
  [Requirements & UI Mockup], [✓], [], [✓], [], [], [], [], [],
  [Authentication + Supabase DB], [], [✓], [✓], [], [], [], [], [],
  [Bookmark CRUD + Nested Folders], [], [], [✓], [✓], [], [], [], [],
  [Article Reader + RSS Parsing], [], [], [], [✓], [], [], [], [],
  [History + Search Module], [], [], [✓], [✓], [✓], [], [], [],
  [Duplicate Removal & Testing], [], [], [], [], [], [✓], [], [],
  [UI Polish & Documentation], [], [], [], [], [], [✓], [✓], [],
  [Final Testing & Deployment], [], [], [], [], [], [], [], [✓],
)

== UI Mockups

#figure(
  image("diagrams/ui-mockup.png", width: 100%, height: auto, alt: "UI Mockups"),
  caption: "UI Mockups of Linkerine",
) <UI>

= Scope

Linkerine will be developed as a cross-platform application using Flutter, allowing it to run on Android, iOS, and web browsers. The application will focus on providing a rich set of features for managing bookmarks, articles, notes, passwords, and RSS feeds. It will also include advanced functionalities like nested folders, duplicate URL detection, and a powerful search engine.

Later on, it can be extended to include URL shortening, generating QR codes, importing or exporting bookmarks with different browsers compatibiolity, sharing bookmarks globally, tagging and so on...


= Result
The expected outcome of Linkerine is a fully functional, cross-platform application that allows users to manage their digital resources efficiently.

#bibliography("refs.bib")

#align(center + bottom)[
  *THE END*
]
