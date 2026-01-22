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
#show figure: set block(breakable: true)

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
    *CIT 320 :: Software Development Project-II*
  ])
  #align(left, text(14pt)[
    *Project Proposal*
  ])
  #line(length: 100%)
]


#align(left)[
  #v(12pt)
  #image("logo/logo.svg", width: 35%, height: auto, alt: "Divider")
]

#align(bottom)[
  #line(length: 100%)
  *Project Title : Linkerine* \
  Submission Date : #datetime.today().display("[day] [month repr:long] [year]") \
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
      + *Md Mahbubur Rahman* \
        Associate Professor, \
        Department of Computer Science and Information Technology, \
        Patuakhali Science and Technology University.
      + *Md Atikqur Rahaman* \
        Professor, \
        Department of Computer Science and Information Technology, \
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
  #image("logo/logo.svg", width: 30%, height: auto, alt: "Linkerine Logo")
]
#align(center)[
  #text(size: 20pt, weight: "bold")[Linkerine]
]

= Abstract

Linkerine is a modern, web-based bookmark and RSS management platform designed to help users seamlessly store, organize, and sync *bookmarks*, *articles*, *notes*, and *RSS feeds* across all devices. In an age of increasing digital information overload, Linkerine leverages the power of Next.js to provide a fast, SEO-friendly, and progressive web application (PWA) that offers a simplified yet powerful interface to manage and retrieve valuable resources from anywhere.

= Objectives

- To build a high-performance, responsive web application for organizing bookmarks and RSS feeds.

- To implement secure server-side data fetching and storage using Next.js Server Actions.

- To provide an "Installable" experience on mobile and desktop via Progressive Web App (PWA) standards.

- To implement advanced features like automatic metadata scraping, nested collections, and full-text search.

= Problem Statement

Existing solutions for bookmark management are often fragmented; users must choose between native apps that don't sync well with the web, or browser extensions that don't work on mobile. 

Furthermore, many modern tools (like Pocket or Raindrop) lock essential features like full-text search or unlimited nested folders behind paywalls. There is a need for a unified, open-web solution that runs instantly on any browser while offering the performance of a native application.

= Related Work

- *Mozilla Pocket* - Popular read-it-later app, but has become bloated with premium tiers. @pocket

- *Goodlinks* - Excellent UI, but exclusive to the Apple ecosystem. @goodlinks

- *Futurwise* - Chromium-only extension; lacks a standalone mobile interface. @futurwise

- *Instapaper* - Great for reading, but poor for organizing bookmarks. @instapaper

- *Raindrop.io* - The industry standard, but lacks self-hosting capabilities and anonymous usage. @raindrop


= Scope

Linkerine will be developed as a modern web application using the *Next.js 15* framework. This ensures it is accessible from any device with a web browser (Windows, macOS, Linux, Android, iOS).  The application will focus on providing a rich set of features including server-side RSS parsing, automatic Open Graph metadata extraction for links, and a responsive UI built with Tailwind CSS.

Later on, the project can be extended to include browser extensions that share the same codebase, public bookmark collections, and AI-driven content summarization.

== Job Market Analysis

The job market for full-stack web developers in Bangladesh is growing rapidly, with significant demand for Next.js and modern JavaScript expertise. According to major job portals:

- *BD Tech Jobs* and *TechnTalents* consistently list 150-200+ open positions for full-stack developers, with a strong emphasis on Next.js, React, and TypeScript skills. @bdtechjobs_2026 @techntalents_2026

- *eJobs Bangladesh* and *JobMatchingBD* show that companies prioritize developers with experience in server-side rendering, database design, and PWA development—core features of Linkerine. @ejobs_bd_2026 @jobmatchingbd_2026

- Remote opportunities through *Arc.dev* and *Wellfound* indicate that specialized tools like Linkerine could attract both local and international users seeking productivity solutions tailored to the Asian market. @arc_dev_bd_2026 @wellfound_bd_2026

- *Careerjet Bangladesh* analysis reveals that bookmark management and RSS aggregation tools are in demand among knowledge workers and developers, suggesting a viable market niche for this project. @careerjet_bd_2026

The demand for full-stack developers with Next.js expertise is not just growing—it is becoming the standard for modern web development in Bangladesh, making Linkerine a timely project that demonstrates cutting-edge skill proficiency.


= Methodology

== Technology Stack
The development of Linkerine will follow an agile methodology. We have selected a stack optimized for performance, type safety, and rapid deployment.

#figure(
  table(
    columns: (30%, 70%),
    [*Frontend Framework*], [Next.js 15 (React)],
    [*Language*], [TypeScript],
    [*Styling*], [Tailwind CSS + Shadcn/ui],
    [*Backend / API*], [Next.js Server Actions + Route Handlers],
    [*Database*], [PostgreSQL (via Supabase or Neon)],
    [*ORM*], [Drizzle ORM],
    [*Authentication*], [Clerk or Supabase Auth],
    [*Hosting*], [Vercel],
  ),
  caption: "Technology Stack for Linkerine",
)

== Design Principles

The design of Linkerine will adhere to the following principles:

- *Mobile-First Responsive Design*: Ensuring the layout adapts perfectly from mobile screens to large desktop monitors using Tailwind CSS.
- *Server-Side Rendering (SSR)*: Utilizing Next.js to render pages on the server for speed and SEO, ensuring content is visible instantly.
- *Edge Computing*: Running middleware at the edge for low-latency authentication and redirect handling.
- *Type Safety*: Using TypeScript and Zod to ensure robust data validation from the database to the UI.
- *Accessibility*: Adhering to WCAG guidelines using the accessible primitives from Shadcn/ui (Radix UI).

= Visual Models

== ERD (Entity Relationship Diagram)

#figure(
  image("diagrams/plantUML.svg", width: 100%, height: auto, alt: "Entity Relationship Diagram"),
  caption: "Entity Relationship Diagram of Linkerine",
) <ERD>

== System Architecture Diagram

// Replacing the old DFD with a context relevant block diagram description or placeholder
#figure(
  image("diagrams/linkerine.DFD.svg", width: 100%, height: auto, alt: "System Architecture"),
  caption: "Next.js App Router Architecture & Data Flow",
) <Arch>

Here @Arch illustrates the architecture where the Next.js Client communicates with Server Actions, which then interact with the PostgreSQL database via Drizzle ORM. RSS feeds are fetched via a proxy route to handle CORS.

== Timeline (Gantt Chart)

The timeline is divided into 12 weeks, focusing on the Next.js development lifecycle.

#figure(
  table(
    columns: (auto, 7.5%, 7.5%, 7.5%, 7.5%, 7.5%, 7.5%, 7.5%, 7.5%),
    [*Task*], [*Week 1-2*], [*Week 3-4*], [*Week 5-6*], [*Week 7-8*], [*Week 9*], [*Week 10*], [*Week 11*], [*Week 12*],
    [Setup Next.js, TS, & Auth], [✓], [], [✓], [], [], [], [], [],
    [DB Schema (Drizzle) + Migrations], [], [✓], [✓], [], [], [], [], [],
    [Bookmark Actions & Scraping], [], [], [✓], [✓], [], [], [], [],
    [RSS Parser & Feed UI], [], [], [], [✓], [], [], [], [],
    [Search & Tagging System], [], [], [✓], [✓], [✓], [], [], [],
    [PWA Integration & Optimization], [], [], [], [], [], [✓], [], [],
    [UI Polish (Dark Mode/Themes)], [], [], [], [], [], [✓], [✓], [],
    [Vercel Deployment & Testing], [], [], [], [], [], [], [], [✓],
  ),
  caption: "Development Timeline of Linkerine",
)

= UI Mockups

#figure(
  image("UI/1.png", height: 62%, alt: "UI Mockups"),
  caption: "Landing Page & Dashboard",
) <UI1>

#figure(
  grid(
    columns: (auto, auto),
    rows: (auto, auto),
    gutter: 1em,
    [ #image("UI/2.png", width: 61%) ], [ #image("UI/3.png", width: 61%) ],
  ),
  caption: [Add Link Modal (with auto-fetch) and Reader View],
) <UI2>

// #figure(
//   grid(
//     columns: (auto, auto),
//     rows: (auto, auto),
//     [ #image("UI/4.png", width: 61%) ], [ #image("UI/5.png", width: 61%) ],
//   ),
//   caption: [Settings and Mobile Response Layout],
// ) <UI3>

= Future Plans

+ *Browser Extensions*: Leveraging the shared TypeScript codebase to build Chrome/Firefox extensions that save links directly to the database.
+ *AI Summarization*: Integrating OpenAI or local LLMs to generate summaries of bookmarked articles.
+ *Public Collections*: Allowing users to publish specific folders as public, shareable web pages.
+ *Offline Sync*: Enhancing the PWA with local storage to allow reading cached articles without an internet connection.

= Result
The expected outcome is a highly performant, server-rendered web application deployed on Vercel, providing a superior user experience for managing digital content across all device types.

#pagebreak()

#bibliography(title: "References", "refs.bib")  

#align(center + bottom)[
  *THE END*
]

#pagebreak()

= Weekly Report

#table(
  columns: (8%, 12%, 55%, 10%, 15%),
  [*No.*], [*Date*], [*Objective*], [*Status*], [*Remarks*],
  [1],
  [],
  [
    *Project proposal* \
    - Initial research on existing solutions \
    - Defining objectives and scope \
    - Creating initial UI mockups \
  ],
  [],
  [],

  [2],
  [],
  [
    *Environment and navigation setup* \
    - Setting up Next.js development environment \
    - Designing app structure with App Router \
    - Creating basic UI components with Shadcn/ui \
  ],
  [],
  [],

  [3],
  [],
  [
    *Basic UI and backend integration* \
    - Implementing basic bookmark and RSS UI screens \
    - Integrating Clerk/Supabase authentication \
    - Setting up Tailwind CSS theming \
  ],
  [],
  [],

  [4],
  [],
  [
    *Database schema and ORM setup* \
    - Designing ERD with Drizzle ORM \
    - Setting up PostgreSQL migrations \
    - Implementing Server Actions for data operations \
  ],
  [],
  [],

  [5],
  [],
  [
    *Bookmark and RSS feed features* \
    - Implementing bookmark creation with metadata scraping \
    - Building RSS parser and feed synchronization \
    - Adding search and tagging system \
  ],
  [],
  [],

  [6],
  [],
  [
    *PWA and UI Polish* \
    - Integrating PWA capabilities \
    - Implementing dark mode and responsive design \
    - Optimizing performance for deployment \
  ],
  [],
  [],

  [7],
  [],
  [
    *Final Testing & Deployment* \
    - Conducting testing across devices and browsers \
    - Fixing bugs and performance issues \
    - Deploying to Vercel and finalization \
  ],
  [],
  [],
)