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
    *Project Report*
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
      *Semester* : 6 \ (Level-3, Semester-2)
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

= Introduction

Linkerine is a modern, offline first RSS reader and personal knowledge hub that helps users follow, read, organize, and sync news feeds, articles, bookmarks, private notes, and secrets across all of their devices. In an age of growing information overload, Linkerine pairs a progressive web application (PWA) with a local first data layer and cloud synchronization to deliver a fast, installable, and fully offline capable experience. 

It further integrates optional bring-your-own-key (BYOK) AI for summaries, semantic search and auto-tagging, keyless translation, a zero knowledge encrypted vault for sensitive data, and one click following of sources such as YouTube, Reddit, Mastodon and Bluesky.

= Objectives

+ To build a high performance, responsive, offline first web application for following and reading RSS feeds and managing bookmarks, notes and secrets.
+ To implement a local first offline appication with secure cloud synchronization and authentication via Firebase.
+ To provide an "Installable", fully offline capable experience on mobile and desktop devices.
+ To integrate optional AI for summarization and semantic search, alongside keyless translation.
+ To safeguard sensitive data with a zero knowledge, client side encrypted vault.

= Problem Statement

Existing solutions for bookmark management are often fragmented; users must choose between native apps that don't sync well with the web, or browser extensions that don't work on mobile. They are often limited to RSS or bookmarks or AI based features with no cross platform support.

Furthermore, many modern tools (like Pocket or Raindrop) lock essential features like full text search or unlimited nested folders behind paywalls. There is a need for a unified, open web solution that runs instantly on any browser while offering the performance of a native application with versatile features like offline first operation, cloud sync, AI assistance, and secure data storage.

= Literature Review

According to Z. Chang's et at's @recommendation_feature_rss_reader survey of modern crawler methods, web crawlers are essential for automating data retrieval from the vast and unstructured Internet, which can be classified into various types based on their strategies and targets, such as generic, focused, incremental, and distributed crawlers. The choice of libraries, databases, and frameworks for building these systems depends heavily on the specific target data, purpose, and the programmer's ease.

Later on in "The News Crawler: A Big Data Approach to Local Information Ecosystems" by Khanom et al. @news_crawler_big_data they address the growing crisis of losing access to local journalism. Because manually auditing local news coverage is expensive and time consuming. So the authors propose a scalable, semi automated pipeline with a custom web crawler alongside Machine Learning and Natural Language Processing, such as the spaCy library, to evaluate the content.

But due to lack of time and resources, the crawler was unable to capture all content from large, dynamically updating news sites. So in "Using RSS to Improve Web Harvest Results for News Web Sites" by Jones & Neubert @using_rss_to_improve_web_harvest_results, strategy has shifted to crawl the sites' RSS feeds twice daily to build targeted,  seed lists of newly published URLs but created a navigation problem, as the pages often lacked hyperlinks.

To further improve the user experience and information overload, "A Study on Recommendation Features for an RSS Reader" by Ji & Zhou @ai_driven_web_crawling proposes integrating recommendation algorithms directly into RSS readers. This study worked on: Text Similarity, Favorite Fraction, Inverse Update Frequency, and PostRank. The most effective approach was a hybrid feature combination, combining Text Similarity with the Favorite Fraction.

Finally we arrive at "AI driven web crawling for semantic extraction of news content from newspapers" by Saravanan & Ahamed @ai_driven_web_crawling. Traditional crawlers rely on rigid DOM tree rules and keyword matching, which may fail with complex layouts. This paper introduces WISE, an advanced framework that integrates Deep Learning (CNNs and RNNs) and NLP (like BERT embeddings) to understand the semantic context. But it is resource intensive and requires significant computational power and so, less feasible for smaller scale applications.

= Related Commercial Projects

+ Mozilla Pocket  @pocket was a popular read it later app, but has become bloated with premium tiers. It was not necessarily a RSS feed reader, but it allowed offline reading, and synchonization with mobile devices. As of January 2026, it is no longer actively maintained and has been deprecated. 

+ Goodlinks @goodlinks has an excellent UI, but exclusive to the Apple ecosystem. It's not ported to Android or Windows, and lacks a web interface. It's relatively expensive than others as well. And it also lacks vault support.

+ Futurwise @futurwise is a Chromium only extension; lacks a standalone mobile interface. It is not open source, and has no offline first capabilities. It is also a paid service. It also lack Firefox/ Safari support, and non FOSS.

+ Instapaper @instapaper is Great for reading, but poor for organizing bookmarks. Became the official replacement for Kobo e readers. It doesn't come with vault or AI features, and is not FOSS. 

+ Raindrop.io @raindrop is the industry standard, but lacks self hosting capabilities and anonymous usage. It is also limited to bookmarks, and does not support RSS feeds. It is also a paid service, and not FOSS.

= Scope

Linkerine is primarily developed as a modern web application using the Next.js framework. The application focuses on server side RSS/Atom parsing, offline first storage, cloud sync and authentication support. It currently natively support news, articles and blogs from RSS supported blogs, hugo, astro, wordpress, SSG, and other dynmic platforms where RSS/Atom feeds are available.  

For mobile devices, PWA (Progressive Web App) is attached alongside a responsive interface was built with Tailwind CSS and DaisyUI.

The project has since been extended with optional BYOK AI features, a zero knowledge encrypted vault, one click following of social sources (YouTube, Reddit, Mastodon and Bluesky natively), and companion browser extensions that share the same deployment. 

It can also be optionally integrated with RSSHub instances for broader social and platform coverage as well.

== Job Market Analysis

The job market for full stack web developers in Bangladesh is growing rapidly, with significant demand for Next.js and modern JavaScript expertise. According to major job portals:

#figure(
  align(left)[
    #table(
      columns: (20%, 50%, 30%),
      [*Job Portal*], [*Link*], [*Stack*],
      [BD Jobs],
      [
        + https://bdjobs.com/jobs/details/1449039?ln=1
        + https://bdjobs.com/jobs/details/1449038?ln=1
        + https://bdjobs.com/jobs/details/1452423?ln=1
      ],
      [React, NodeJS, mongoDB, mongoose, JavaScript, Github, Git],

      [BD Tech Jobs @bdtechjobs_2026 & TechnTalents @techntalents_2026],
      [
        + https://authlab.io/wpjb-jobs/senior-software-engineer/
        + https://riseuplabs.com/jobs/full-stack-developer-python-django/
      ],
      [Vue.js, React],

      [eJobs Bangladesh @ejobs_bd_2026 & JobMatchingBD @jobmatchingbd_2026],
      [
        + https://www.ejobs.com.bd/jobs/san-francisco-ca-senior-full-stack-developer
        + https://jobmatchingbd.com/job/engineering-jobs-14/
        + https://jobmatchingbd.com/job/it-jobs-in-bangladesh-second-source/
      ],
      [Node.js, React/ Vue, PostgreSQL or, MongoDB],

      [Arc.dev @arc_dev_bd_2026 & Wellfound @wellfound_bd_2026],
      [
        + https://wellfound.com/jobs/2993781-senior-react-and-nextjs-web-developer
        + https://wellfound.com/jobs/2927551-senior-full-stack-developer
      ],
      [React, npm, TypeScript, Next.js, and Git],

      [Careerjet Bangladesh @careerjet_bd_2026],
      [
        + https://www.careerjet.com.bd/jobad/bdbe02ffc4686d4de58c19bc2c53c6f999
        + https://www.careerjet.com.bd/jobad/bda7f026ae3ccb8bd6ab7d9027f8d5c26f
      ],
      [React, NodeJS, mongoDB, mongoose, JavaScript, Github, Git, Tailwind CSS],
    )
  ],
  caption: "Job Market Opportunities for Next.js & Full-stack Developers in Bangladesh",
)

The demand for full stack developers with Next.js expertise is becoming the standard for modern web development in Bangladesh, making Linkerine a timely project that demonstrates bleeding edge skill technology.


= Methodology

== Technology Stack
The development of Linkerine will follow an agile methodology. We have selected a stack optimized for performance, type safety, and rapid deployment.

+ Frontend Framework: Next.js 16 (React 19, App Router, Turbopack)
+ Language: TypeScript
+ UI/ UX Design and Icons: Inkscape vector graphics (SVG)
+ Styling: Tailwind CSS 4 + DaisyUI 5 (with Radix UI primitives)
+ Backend / API: Next.js Route Handlers (SSRF-protected feed proxy)
+ Cloud Database: Firebase Firestore (user data, multi-device sync)
+ Local Storage: Dexie (IndexedDB) — offline article cache
+ Authentication: Firebase Authentication
+ AI (optional, BYOK): OpenAI / Google Gemini / Anthropic Claude
+ Encryption: Web Crypto API (AES-256) for the vault
+ Hosting: Vercel (frontend), Netlify (Backend), GitHub (VSC)

// #figure(
//   table(
//     columns: (30%, 70%),
//     [*Frontend Framework*], [Next.js 16 (React 19, App Router, Turbopack)],
//     [*Language*], [TypeScript],
//     [*Styling*], [Tailwind CSS 4 + DaisyUI 5 (with Radix UI primitives)],
//     [*Backend / API*], [Next.js Route Handlers (SSRF-protected feed proxy)],
//     [*Cloud Database*], [Firebase Firestore (user data, multi-device sync)],
//     [*Local Storage*], [Dexie (IndexedDB) — offline article cache],
//     [*Authentication*], [Firebase Authentication],
//     [*AI (optional, BYOK)*], [OpenAI / Google Gemini / Anthropic Claude],
//     [*Encryption*], [Web Crypto API (PBKDF2 + AES-256-GCM) for the vault],
//     [*Hosting*], [Vercel],
//   ),
//   caption: "Technology Stack for Linkerine",
// )

== Design Principles

The design of Linkerine will adhere to the following principles:

+ Ensuring the layout adapts perfectly from mobile screens to large desktop monitors using Tailwind CSS and DaisyUI, with installable PWA support.
+ A Dexie/IndexedDB cache keeps articles and the interface fully usable without a network; Firebase synchronizes user data across devices when online.
+ AI keys are stored only in the browser (BYOK) and never sent to the app's servers, while the vault is end-to-end encrypted (zero-knowledge).
+ Using TypeScript to ensure robust data validation from the database to the UI.

= Feature Comparison

@comparison contrasts Linkerine with widely used and commercial read-later, bookmarking and RSS tools. 

#figure(
  table(
    columns: (auto, auto, auto, auto, auto, auto, auto, auto, auto, auto, auto, auto),
    align: (left, center, center, center, center, center, center, center, center, center, center, center),
    [*App*], [*Dev*], [*RSS*], [*Offline*], [*AI*], [*Vault*], [*FOSS*], [*Web*], [*Desktop*], [*Phone*], [*Chrome*], [*Firefox*],
    [*Linkerine*], [✓], [✓], [✓], [✓], [✓], [✓], [✓], [✓], [not iOS], [✓], [✓],
    [Mozilla Pocket], [Dead], [—], [✓], [—], [—], [✓], [✓], [✓], [✓], [✓], [✓],
    [Raindrop], [✓], [✓], [Paid], [—], [—], [—], [✓], [✓], [✓], [✓], [✓],
    [Instapaper], [✓], [—], [✓], [—], [—], [—], [✓], [Mac only], [✓], [✓], [✓],
    [Good Links], [✓], [—], [✓], [—], [—], [—], [—], [Mac only], [iOS only], [—], [—],
    [Feedly], [✓], [✓], [Paid], [Paid], [—], [—], [✓], [—], [✓], [✓], [✓],
    [Futurwise], [✓], [✓], [—], [—], [—], [—], [—], [—], [✓], [✓], [—],
  ),
  caption: "Feature comparison of Linkerine with existing solutions across platforms",
) <comparison>


= Visual Models

== ERD (Entity Relationship Diagram)

#figure(
  image("diagrams/erd.png", width: 90%, height: auto, alt: "Entity Relationship Diagram"),
  caption: "Entity Relationship Diagram of Linkerine (Firestore + Dexie)",
) <ERD>

== Schema Diagram

#figure(
  image("diagrams/schema.png", width: 100%, height: auto, alt: "Storage Schema"),
  caption: "Storage schema — Firestore (cloud sync) and Dexie (offline) records",
) <Schema>

@Schema shows the overall schema diagram of Linkerine.

== Data Flow Diagram

#figure(
  image("diagrams/flowchart.png", height: 46%, alt: "Data Flow"),
  caption: "Source-addition and reading data flow in Linkerine",
) <Arch>

Here @Arch illustrates the architecture and flow chart of Linkerine.

== Timeline (Gantt Chart)

The timeline is divided into 12 weeks, focusing on the Next.js development lifecycle.

#figure(
  table(
    columns: (auto, 7.5%, 7.5%, 7.5%, 7.5%, 7.5%, 7.5%, 7.5%, 7.5%),
    [*Task*], [*Week 1-2*], [*Week 3-4*], [*Week 5-6*], [*Week 7-8*], [*Week 9*], [*Week 10*], [*Week 11*], [*Week 12*],
    [Setup Next.js 16, TS & Firebase Auth], [✓], [], [✓], [], [], [], [], [],
    [Data layer (Firestore + Dexie/IndexedDB)], [], [✓], [✓], [], [], [], [], [],
    [Feed sync proxy & subscriptions], [], [], [✓], [✓], [], [], [], [],
    [RSS/Atom parser & reader views], [], [], [], [✓], [], [], [], [],
    [Search, folders/tags & BYOK AI], [], [], [✓], [✓], [✓], [], [], [],
    [Encrypted vault & social sources], [], [], [], [], [], [✓], [], [],
    [PWA, DaisyUI themes & UI polish], [], [], [], [], [], [✓], [✓], [],
    [Vercel deployment & testing], [], [], [], [], [], [], [], [✓],
  ),
  caption: "Development Timeline of Linkerine",
)

= UI Mockups

// #figure(
//   image("UI/2.png", height: 52%, alt: "UI Mockups"),
//   caption: "Landing Page & Dashboard",
// ) <UI1>

#figure(
  grid(
    columns: (auto, auto),
    rows: (auto, auto),
    gutter: 1em,
    [ #image("UI/2.png", width: 74%) ], [ #image("UI/1.png", width: 74%) ],
  ),
  caption: [Landing Page and Vault],
) <UI1>

#figure(
  grid(
    columns: (auto, auto),
    rows: (auto, auto),
    gutter: 1em,
    [ #image("UI/4.png", width: 80%) ], [ #image("UI/3.png", width: 80%) ],
  ),
  caption: [Reading view and Discover Feeds view],
) <UI2>

#figure(
  grid(
    columns: (auto, auto),
    rows: (auto, auto),
    [ #image("UI/desktop.png", width: 100%) ]
  ),
  caption: [Landing page in Desktop view],
) <UI3>

= Future Plans

Several capabilities have been implemented, but the following remain as planned extensions:

+ To allow users to publish or share specific feeds or folders as public, shareable read-only web pages.
+ To enable native push notifications and periodic background synchronization to surface new articles even when the app is closed.
+ To allow more broader social and platform coverage, with first-class support for self-hosted RSSHub instances.

= Result

The outcomes of the project are as follows:

+ The project has successfully implemented a modern, offline-first RSS reader and personal knowledge hub with a local-first data layer, cloud synchronization, optional BYOK AI features, and a zero-knowledge encrypted vault.

+ Semantic search and keyless translation have been integrated, enhancing the user experience and accessibility of content.

+ The application has been deployed on Vercel and netlify, ensuring high performance and availability across all device types.

+ The project has been designed with a focus on privacy, security, and user control, allowing users to manage their digital content without compromising their personal data.

// + The outcome is a highly performant, offline-first progressive web application deployed on Vercel, providing a superior user experience for following, reading and managing digital content across all device types — with optional AI assistance and a privacy-preserving encrypted vault.

= Conclusion

The project has successfully demonstrated the development of a modern, offline-first RSS reader and personal knowledge hub that addresses the limitations of existing solutions. It's browser extension will help users to more easily access our website. The vault and BYOK AI features provide additional value, enhancing the UX and ensuring privacy and security. Bookmarks and links can be organized and managed effectively, while the optional AI features offer summaries and semantic search.

As of now, most of the blog sites, news sites, and some social media platforms support RSS/Atom feeds, making Linkerine a versatile tool for managing digital content. The project has been designed with scalability in mind, allowing for future enhancements and integrations. Currently PWA is supported on Android, Windows, Linux and MacOS. iOS support is limited due to Apple's restrictions on PWA features.

#pagebreak()

#bibliography(title: "References", "refs.bib")

#align(center + bottom)[
  *THE END*
]

// #pagebreak()

// = Weekly Report

// #table(
//   columns: (8%, 12%, 55%, 10%, 15%),
//   [*No.*], [*Date*], [*Objective*], [*Status*], [*Remarks*],
//   [1],
//   [],
//   [
//     *Project proposal* \
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
//     - Setting up the Next.js 16 (App Router) development environment \
//     - Designing the app structure and dashboard layout \
//     - Building base UI with Tailwind CSS + DaisyUI \
//   ],
//   [],
//   [],

//   [3],
//   [],
//   [
//     *Auth and data layer* \
//     - Integrating Firebase Authentication \
//     - Setting up the dual storage model (Firestore + Dexie/IndexedDB) \
//     - Configuring offline persistence and theming \
//   ],
//   [],
//   [],

//   [4],
//   [],
//   [
//     *RSS engine* \
//     - Building the SSRF-protected feed proxy (`/api/sync-feed`) \
//     - Parsing RSS/Atom and caching articles in Dexie \
//     - Implementing subscriptions and the reader views \
//   ],
//   [],
//   [],

//   [5],
//   [],
//   [
//     *Reader features* \
//     - Four view modes, search, filters, folders and tags \
//     - Bookmarks, read states and OPML import/export \
//     - Discover catalog of curated feeds \
//   ],
//   [],
//   [],

//   [6],
//   [],
//   [
//     *BYOK AI, translation and vault* \
//     - AI summaries, ask, semantic search and auto-tagging (BYOK) \
//     - Keyless translation; zero-knowledge encrypted vault \
//     - Social sources (YouTube, Reddit, Mastodon, Bluesky, RSSHub bridge) \
//   ],
//   [],
//   [],

//   [7],
//   [],
//   [
//     *PWA polish, extension, testing & deployment* \
//     - PWA refinements and responsive/theme polish \
//     - Companion Chrome/Firefox new-tab extension \
//     - Cross-device testing, bug fixes and Vercel deployment \
//   ],
//   [],
//   [],
// )
