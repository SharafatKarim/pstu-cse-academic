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
  #line(length: 100%)
  #align(
    left,
    text(18pt)[
      *CIT 222 - Information System Analysis and Design*
    ],
  )
  #align(
    left,
    text(14pt)[
      *Sessional Project Report*
    ],
  )
  #line(length: 100%)

]

#align(bottom)[
  #line(length: 100%)
  *Project Title : Board Autoprofiler* \
  Last Updated on : Wed 28, May 2025 \
  Submission Date : Wed 28, May 2025 \
  #line(length: 100%)
]

#align(bottom)[
  // Submitted to,
  #rect(width: 100%)[
    #text(size: 14pt)[
      *Submitted to,* \
    ]
    #parbreak()
    *Md Atikur Rahman* \
    Professor, \
    Department of Computer Science and Information Technology, \
    Patuakhali Science and Technology University.
  ]
]

#align(bottom)[

  // Submitted by,
  #rect(width: 100%)[
    #text(size: 14pt)[
      *Submitted by,* \
    ]
    #parbreak()
    + *Md. Sadman Kabir Bhuiyan* \
      ID : 2102020, \
      Reg: 10147 \

    #parbreak()
    + *Md. Sharafat Karim* \
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
  #text(size: 20pt, weight: "bold")[Board Autoprofiler]
]

= Introduction

The Board Autoprofiler is a web-based system designed to simplify the process of selecting compatible PC components. It leverages intelligent recommendation algorithms to ensure optimal performance, compatibility, and benchmarking. The system also integrates e-commerce functionality, enabling users to purchase recommended components directly.

#rect(width: 100%)[
  Online Store URL : #link("https://demo.board-autoprofiler.sharafat.xyz/") \
  Admin URL : #link("http://board-autoprofiler.runasp.net") \
  Business URL : #link("https://board-autoprofiler.sharafat.xyz") 
]

= Objective

To develop a web-based system that provides intelligent recommendations for computer hardware components based on user selections, ensuring compatibility, performance optimization (via bottleneck analysis), and benchmarking. Additionally, the system will include an e-commerce portal for customers and an admin dashboard for managing products and data.

= Scopes

The project scope includes the development of a recommendation engine, e-commerce portal, and admin dashboard. It aims to address compatibility issues, performance bottlenecks, and benchmarking needs for PC components.

= Problem Statement

Currently, users face difficulties when selecting compatible and balanced PC components. Existing platforms like Ryans Computers Limited allow purchasing but lack intelligent recommendation systems that consider performance metrics, bottlenecks, and benchmarks.

== Target Audience
- General users looking to build or upgrade their PCs.
- Computer repair shops and technicians.
- Gamers seeking optimal performance.
- Professionals needing specific hardware configurations.

= Requirements
== Functional Requirements

+ User selects PC components (e.g., CPU, GPU, RAM).
+ System recommends compatible parts based on selection.
+ Performance bottleneck detection and suggestions.
+ Benchmark comparison between selected and recommended components.
+ E-commerce functionality: product browsing, cart, checkout.
+ Admin panel to manage inventory, add/edit products.
+ User registration and login.
+ Search and filter functionality.

== Non-Functional Requirements

+ System should be responsive and user-friendly.
+ Fast response time for recommendations.
+ Secure user data and transactions.
+ Scalable to handle multiple users and products.

= Technology

#table(
  columns: (auto, auto),
  table.header(
    [*Layer*], [*Technology*],
  ),
  [Frontend], [HTML/CSS, Bootstrap, JavaScript, React.js (Optional)],
  [Backend], [ASP.NET MVC Core (.NET 8+)],
  [Microservices], [ASP.NET Web API],
  [Database], [Microsoft SQL Server],
  [ORM], [Entity Framework Core],
  [Authentication], [JWT / ASP.NET Identity],
  [Hosting], [MonsterASP.net / Azure / AWS / Local IIS],
  [CI/CD], [GitHub Actions],
)

= Architecture
== Overview
The system uses a microservices architecture with MVC pattern integration to ensure modularity, scalability, and maintainability. The Recommendation Microservice and E-commerce Microservice are independently deployable, communicating via RESTful APIs through an API Gateway. The MVC pattern structures the application logic within each microservice and the frontend, separating data (Model), presentation (View), and business logic (Controller).

== MACH Architecture
The architecture follows MACH principles (Microservices, API-first, Cloud-native, Headless) and is divided into:

+ *Client Tier*: Web and mobile interfaces built with React.js, following MVC for frontend logic.

+ *Application Tier*: Microservices with MVC-based backend logic (Node.js for E-commerce, Python for Recommendation).

+ *Data Tier*: Distributed databases tailored to each microservice's needs.

== MVC Integration

+ *Model*: Represents data and business logic.

  - In the Recommendation Microservice, the Model includes component specifications, compatibility rules, and benchmark data stored in MongoDB and Elasticsearch.

  - In the E-commerce Microservice, the Model includes product catalog, cart state, and order data stored in MongoDB, PostgreSQL, and Redis.

+ *View*: Handles presentation and user interface.

  - Built with React.js and Tailwind CSS, rendering dynamic UI components for product listings, recommendation results, and admin dashboards.

  - Views fetch data from Controllers via API calls and update based on user interactions.

+ *Controller*: Manages communication between Model and View.

  - In microservices, Controllers are RESTful API endpoints (Node.js for E-commerce, Python/Flask for Recommendation) that process requests, query Models, and return data to Views.

  - Frontend Controllers in React.js handle user events (e.g., component selection, checkout) and update Views accordingly.

== E-R Diagram
#image("diagram.svg", width: 100%, height: auto, alt: "E-R Diagram")

= Implementation
== Microservices Architecture
+ Component Recommendation Service  
    - API Endpoints:  
        - `/api/recommendations`
            - POST: Accepts selected components
            - Returns: Compatible components + bottleneck analysis

    - Logic:  
        - Parse selected components
        - Query database for specifications and benchmarks
        - Apply rules to detect bottlenecks
        - Recommend compatible alternatives
         
     

+ E-Commerce & Admin Service  

    - API Endpoints:  
        - `/api/products`
        - `/api/cart`
        - `/api/orders`
         

    - Features:  
        - Customer can browse and purchase
        - Admin can manage products, stock, categories
     

= Conclusion
Board Autoprofiler aims to revolutionize the way users select PC components by combining intelligent recommendation systems with real-time performance analysis. By addressing the gaps in existing platforms like Ryans Computers, this system empowers users to make informed decisions while building or upgrading their desktop PCs. With a scalable microservices architecture, robust security, and user-friendly interface, the system is well-positioned for long-term success and expansion.


= References
== Feasibility study
- #link("https://pc-builds.com/")
- #link("https://pc-builds.com/bottleneck-calculator/")
- #link("https://www.ryans.com/")
- #link("https://www.startech.com.bd/")


== Documentations
- #link("https://www.w3schools.com/html/") [*W3Schools HTML*]
- #link("https://www.w3schools.com/css/") [*W3Schools CSS*]
- #link("https://www.w3schools.com/js/") [*W3Schools JavaScript*]
- #link("https://www.w3schools.com/bootstrap5/index.php") [*W3Schools Bootstrap 5*]
- #link("https://reactjs.org/docs/getting-started.html") [*React.js docs*]
- #link("https://tailwindcss.com/docs") [*Tailwind CSS docs*]
- #link("https://docs.microsoft.com/en-us/aspnet/core/introduction-to-aspnet-core?view=aspnetcore-8.0") [*ASP.NET Core docs*]

#align(center + bottom)[
  *THE END*
]
