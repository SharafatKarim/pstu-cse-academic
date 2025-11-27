#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2.5cm),
  numbering: "1",
  columns: 1,
)
// #set text(font: "Ubuntu Nerd Font")
#set text(size: 12pt)
#set par(justify: true)
#set heading(numbering: "1.")
#show bibliography: set heading(numbering: "1.")

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
    *Project Report*
  ])
  #line(length: 100%)
]

#align(left)[
  #v(12pt)
  #image("logo/logo-2.png", width: 25%, height: auto, alt: "Divider")
]

#align(bottom)[
  #line(length: 100%)
  *Project Title : PSTU Diary* \
  Submission Date : Thu 27, Nov 2025 \
  #line(length: 100%)
]

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
      + *Arpita Howlader* \
        Assistant Professor, \
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
  #image("logo/logo.png", width: 15%, height: auto, alt: "PSTU Diary Logo")
]
#align(center)[
  #text(size: 20pt, weight: "bold")[PSTU Diary]
]

= Introduction

PSTU Diary is a cross-platform application designed to help students and faculty members of Patuakhali Science and Technology University (PSTU) efficiently access resources and contact information of various departments, faculties, and administrative offices. The app aims to provide a user-friendly interface for quick navigation and retrieval of essential information, enhancing the overall experience of the university community.

It stores contact information of our University "Patuakhali Science and Technology University" all employees including Teacher, Staff, MLSS and Others who are directly or indirectly related to this University. Contact information includes phone number, email address.

= Objectives

- To develop a user-friendly mobile application that provides easy access to contact information of PSTU departments and personnel.
- To ensure the application is accessible on Web, Android and iOS (optional) platforms.
- To provide administrative features for updating and managing contact information.
- To implement role based authentication and authorization for different user types (Admin, Editor, User).
- Add profile page for each contact with detailed information.
- Implement different pages for different club and societies of PSTU.
- Implement a universal searching feature to quickly find contacts.
- Implement a feedback system for users to report issues or suggest improvements through GitHub.
- Implement a campus map's link for easy navigation around the university.
- Ensure data security and privacy for all users of the application.

= Problem Statement

Existing applications and websites often lack a centralized and user-friendly platform for accessing university contact information. Users may face difficulties in finding accurate and up-to-date information, leading to inefficiencies in communication.

Also the existing application "PSTU Diary (পবিপ্রবি ডায়েরি)" is no longer maintained and has several limitations, including a less intuitive user interface, lack of features for updating contact information, and limited platform support (only available on Android). This creates a need for a more modern, efficient, and accessible solution.

= Related Work

- *PSTU Diary (পবিপ্রবি ডায়েরি) - Old Version* - Old version, no longer maintained. It lacks the ability to update contact information and has a less intuitive user interface. It also doesn't support iOS or web platforms @pstu_old_diary 

- *PSTU Diary (পবিপ্রবি ডায়েরি) - Admin Version* - Only for Admin, with unstable API. It is not available for general users and has limited functionality. Database is not well-structured. And it uses MySQL as for the database source, which is not well protected with row level security @pstu_old_diary_admin 

= Scope

The application will focus on providing contact information for all departments and personnel within PSTU. It will include features such as search functionality, categorization of contacts, and an admin panel for updating information. The app will be developed for Android, iOS, and web platforms to ensure wide accessibility.

= Methodology

== Technology Stack
The development of PSTU Diary will follow an agile methodology, allowing for iterative improvements and user feedback. Our technology stack will includes,

- *Frontend*: Flutter@flutter (Dart)
- *Backend*: Supabase
- *UI/ UX Design*: Inkscape
- *Database*: PostgreSQL
- *Authentication*: Supabase Auth
- *Hosting (web app)*: Vercel 
- *CI/CD*: GitHub Actions, Docker (optional)

== Design Principles

The design of PSTU Diary will adhere to the following principles,

- *Material Design*: Following Google's Material Design guidelines for a consistent and modern UI/UX in Android.
- *Responsive Design*: Ensuring the application works seamlessly on various screen sizes and orientations, including the web app.
- *User-Centric Design*: Focusing on user experience and ease of use, with intuitive navigation and clear UI elements.
- *Cross-Platform*: Ensuring consistent functionality and design across Android, iOS, and web platforms.
- *Documentation*: Providing comprehensive documentation for developers and users, including API documentation and user guides.
- *Security*: Implementing best practices for data security and user privacy, including secure authentication and data encryption.

= Visual Models

== Flow Chart Diagram

#figure(
  image("diagrams/flow-chart.svg", width: 100%, height: auto, alt: "Flow Chart"),
  caption: "Flow Chart of PSTU Diary Architecture",
) <DFD>

The above @DFD illustrates the overall architecture of the PSTU Diary application.

== Schema Diagram

#figure(
  image("diagrams/schema_2.svg", width: 91%, height: auto, alt: "Database Schema Diagram"),
  caption: "Database Schema Diagram of PSTU Diary",
) <Schema>

The above @Schema illustrates the database schema for PSTU Diary, showing the tables, their fields, and relationships between them. 


== ERD (Entry Relationship Diagram)

#figure(
  image("diagrams/erd.svg", width: 96%, height: auto, alt: "Entity Relationship Diagram"),
  caption: "Entity Relationship Diagram of PSTU Diary",
) <ERD>

The above @ERD illustrates the entity-relationship diagram for PSTU Diary, showing the entities, their attributes, and relationships between them. The ERD helps in understanding the data model and how different entities interact with each other.


== Timeline (Gantt Chart)

The base timeline for the development of PSTU Diary is as follows,

#figure(
  table(
    columns: (auto, 7.5%, 7.5%, 7.5%, 7.5%, 7.5%, 7.5%, 7.5%, 7.5%),
    [*Task*], [*Week 1-2*], [*Week 3-4*], [*Week 5-6*], [*Week 7-8*], [*Week 9*], [*Week 10*], [*Week 11*], [*Week 12*],
    [Requirements & UI Mockup], [✓], [], [✓], [], [], [], [], [],
    [App structure and navigation design], [], [✓], [✓], [], [], [], [], [],
    [Basic UI and supabase/ backend integration], [], [], [✓], [✓], [], [], [], [],
    [Admin panel design with role-based access control], [], [], [✓], [✓], [✓], [], [], [],
    [Fetch data realtime from db], [], [], [], [], [], [✓], [], [],
    [UI Polish & Documentation], [], [], [], [], [], [✓], [✓], [],
    [Final Testing & Deployment], [], [], [], [], [], [], [], [✓],
  ),
  caption: "Development Timeline of PSTU Diary",
)

The timeline is divided into 12 weeks, with specific tasks allocated to each period which describes an approximate timeline for the whole development process.

== UI Mockups

// #figure(
//   image("UI/1.png", height: 50%, alt: "UI Mockups"),
//   caption: "UI Mockups of PSTU Diary",
// ) <UI1>

#figure(
  grid(
    columns: (auto, auto),
    rows: (auto, auto),
    gutter: 1em,
    [ #image("UI/2.png", width: 61%) ], [ #image("UI/3.png", width: 61%) ],
  ),
  caption: [Home page and profile page's UI concept],
) <UI2>

#figure(
  grid(
    columns: (auto, auto),
    rows: (auto, auto),
    [ #image("UI/4.png", width: 61%) ], [ #image("UI/5.png", width: 61%) ],
  ),
  caption: [Settings and Admin sign in page's UI concept],
) <UI3>

= Future Plans

+ Collecting and to add more information about each contact.
+ Implementing more features like event calendar, lost and found section, blood donor finder, club activities etc.
+ Implementing student section for collecting their data.
+ Enhancing the admin panel with more functionalities.
+ Improving the UI/UX based on user feedback.
+ Implementing push notifications for important updates and announcements.

= Result
The project is aimed to give students and faculty members of Patuakhali Science and Technology University (PSTU) a centralized platform to access contact information and resources efficiently. The application is expected to enhance communication within the university community and provide a user-friendly experience across multiple platforms.

#bibliography(title: "References", "refs.bib")

#align(center + bottom)[
  *THE END*
]

// #pagebreak()

// = Weekly Report

// #table(
//   columns: (8%, 12%, 50%, 10%, auto),
//   [*No.*], [*Date*], [*Objective*], [*Status*], [*Remarks*],
//   [1],
//   [],
//   [*Project proposal* \
//     - Initial research on existing solutions \
//     - Defining objectives and scope \
//     - Creating initial UI mockups \
//   ],
//   [],
//   [],

//   [2],
//   [],
//   [
//     *Environment and navigation setup* \
//     - Setting up development environment \
//     - Designing app structure and navigation \
//     - Creating basic UI components \
//   ],
//   [],
//   [],

//   [3],
//   [],
//   [
//     *Basic UI and backend integration* \
//     - Implementing basic UI screens \
//     - Integrating with Supabase for authentication and authorization \
//     - Theming and multilingual support \
//   ],
//   [],
//   [],

//   [4],
//   [],
//   [
//     *Admin panel design with role-based access control* \
//     - Designing admin panel UI \
//     - Implementing role-based access control for different user types \
//     - Testing admin functionalities \
//   ],
//   [],
//   [],

//   [5],
//   [],
//   [
//     *Realtime data fetching from database* \
//     - Implementing real-time data fetching using Supabase \
//     - Testing data synchronization across devices \
//     - Optimizing data queries for performance \
//   ],
//   [],
//   [],

//   [6],
//   [],
//   [
//     *UI Polish & Documentation* \
//     - Refining UI elements for better user experience \
//     - Creating comprehensive documentation for users and developers \
//     - Preparing for final testing and deployment \
//   ],
//   [],
//   [],

//   [7],
//   [],
//   [
//     *Final Testing & Deployment* \
//     - Conducting final testing on all platforms \
//     - Fixing bugs and issues identified during testing \
//     - Deploying the application to app stores and web hosting platforms \
//   ],
//   [],
//   [],

//   // [8], [], [], [], [],
// )
