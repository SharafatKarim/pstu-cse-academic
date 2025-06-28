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
  #align(left, text(18pt)[
    *CIT 222 - Information System Analysis and Design*
  ])
  #align(left, text(14pt)[
    *Sessional Project Report*
  ])
  #line(length: 100%)

]

#align(bottom)[
  #line(length: 100%)
  *Project Title : Board Autoprofiler* \
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

= Industry visit

For industry visit, we went to "Rayan's Computer Ltd, Barishal branch" in ordeer to gain experience from a real deployed system and the workaround behing the overall architecture. It also helped us to learn about the overall e-commerce and POS system. And last but not least, how it integrates with each of the componenets such as frontend and backend with a shared sigular database connection.

#grid(
  columns: 2,
  gutter: 2mm,
  image("img/1.jpg", width: 100%, height: auto, alt: "PSTU"),
  image("img/2.jpg", width: 100%, height: auto, alt: "PSTU"),
)

== Interviewing

As for data collection, we interviewed several users and technicians to understand their needs and pain points when selecting PC components.

+ The feedback highlighted the need for a system that *not only recommends compatible parts* but also provides insights into *performance bottlenecks and benchmarks*.

+ Another important aspect was user interface with a *clean design* that allows users to easily navigate.

+ The admin panel should be *intuitive* for managing products and inventory.

+ The e-commerce functionality should support a *seamless shopping experience*, including product browsing, cart management, and secure checkout.

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

== For admin panel
The admin panel is built using ASP.NET MVC Core (.NET 8+) with Razor Pages, providing a robust backend for managing products, categories, and orders. It uses Entity Framework Core for database interactions and Microsoft SQL Server for data storage.

#table(
  columns: (auto, auto),
  table.header([*Layer*], [*Technology*]),
  [Frontend], [HTML/CSS, Bootstrap, JavaScript],
  [Backend], [ASP.NET MVC Core (.NET 8+)],
  [Database], [Microsoft SQL Server],
  [ORM], [Entity Framework Core],
  [Authentication], [JWT / ASP.NET Identity],
  [Hosting], [MonsterASP.net/ Local IIS],
)

== For e-commerce
The e-commerce microservice is built using Node.js. It handles product management, cart functionality, and order processing. The service communicates via RESTful APIs through an API Gateway, ensuring modularity and scalability. The e-commerce service uses MongoDB for product data, PostgreSQL for order management, and Redis for caching.
#table(
  columns: (auto, auto),
  table.header([*Layer*], [*Technology*]),
  [Frontend], [React.js (Next JS integration), Tailwind CSS, Shadcn UI],
  [Backend], [Next JS (for ASP.NET MVC Core integration)],
  [Database], [Microsoft SQL Server],
  [Hosting], [Vercel],
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

= Visualizations
== E-R Diagram

The Entity-Relationship (E-R) diagram illustrates the relationships between different entities in the system, such as Users, Products, Orders, and Recommendations. It helps visualize how data is structured and how different components interact with each other.

#image("diagram.svg", width: 100%, height: auto, alt: "E-R Diagram")

== Data Visualization

Visualization on the sample dataset of PC components, in order to make sure that the recommendation system is working as expected. The visualization includes component specifications, compatibility rules, and performance benchmarks.

#image("img/3.png", width: 100%, height: auto, alt: "Data Visualization")

*`Visualization Tool: Microsoft Power BI`*

= Implementation

== Admin Panel


#rect(width: 100%)[
  Admin Live URL : #link("http://board-autoprofiler.runasp.net") \
]

The Admin Panel is built using ASP.NET MVC Core (.NET 8+) with Razor Pages, providing a robust backend for managing products, categories, and orders. It uses Entity Framework Core for database interactions and Microsoft SQL Server for data storage.

#grid(
  columns: 2,
  gutter: 2mm,
  image("img/4.png", width: 100%, height: auto, alt: "PSTU"),
  image("img/5.png", width: 100%, height: auto, alt: "PSTU"),
)


The Admin Panel provides a user-friendly interface for administrators to manage the system effectively. Key features include:

- *Product Management*: Admins can add, edit, and remove products from the catalog, including specifications, pricing, and availability.
#image("img/6.png", width: 100%, height: auto, alt: "Data Visualization")

- *Easy Edit and Delete*: Admins can easily edit product details or remove products from the catalog with a few clicks.

#grid(
  columns: 2,
  gutter: 2mm,
  image("img/7.png", width: 100%, height: auto, alt: "PSTU"),
  image("img/8.png", width: 100%, height: auto, alt: "PSTU"),
)

- *User Management*: Admins can view, edit, and delete user accounts, as well as manage user roles and permissions.
#image("img/9.png", width: 100%, height: auto, alt: "Data Visualization")

- *Benchmarking and Bottleneck Analysis*: Admins can analyze system performance, identify bottlenecks, and optimize resource allocation.
#image("img/10.png", width: 100%, height: auto, alt: "Data Visualization")

- *Order Management*: Admins can view and manage customer orders, including order status, payment processing, and shipping details.

== E-commerce Portal


#rect(width: 100%)[
  Online Store URL : #link("https://demo.board-autoprofiler.sharafat.xyz/") \
]

The E-commerce Portal is built using React.js with Next.js integration, providing a modern and responsive user interface. It leverages Tailwind CSS for styling and Shadcn UI for reusable components.

- *Eye-catching Design*: The portal features a visually appealing design that enhances user experience and engagement.
#image("img/11.png", width: 100%, height: auto, alt: "Data Visualization")

- *Advanced categories*: The portal supports advanced category management, allowing for better organization and filtering of products.
#image("img/12.png", width: 100%, height: auto, alt: "Data Visualization")

- *Pagination & Sorting*: The portal implements pagination for product listings, improving performance and usability. It also supports sorting options to help users find products more easily. Users can sort products by randomness, price, popularity, or rating, enhancing their shopping experience.

- *Zero Authentication*: The portal allows users to browse products and categories without requiring an account or login. It provides a seamless shopping experience, enabling users to explore the catalog without barriers.

- *Mobile App*: The portal is designed to be mobile-friendly, ensuring a smooth experience on smartphones and tablets. It adapts to different screen sizes and resolutions, providing a consistent user interface across devices.
#image("img/13.png", width: 100%, height: auto, alt: "Data Visualization")

- *Product Details*: Each product page includes detailed specifications, images, and pricing information. Users can view product details to make informed purchasing decisions.
#image("img/14.png", width: 100%, height: auto, alt: "Data Visualization")

- *Stock Status*: The portal displays real-time stock status for each product, helping users know product availability before making a purchase. This feature ensures that users are aware of whether a product is in stock or out of stock, preventing frustration during the shopping process. This settings can be easily managed by the admin through the admin panel.

- *User Reviews*: Users can leave reviews and ratings for products they have purchased, helping other customers make informed decisions. This feature encourages user engagement and provides valuable feedback to the admin.
#image("img/16.png", width: 100%, height: auto, alt: "Data Visualization")

- *Add to Cart*: Users can easily add products to their cart with a single click, streamlining the shopping process.
#image("img/15.png", width: 100%, height: auto, alt: "Data Visualization")

- *Cart Management*: The portal allows users to view and manage their cart, including adding or removing items, updating quantities, and proceeding to checkout. Users can easily navigate to their cart to review selected items before finalizing their purchase.

- *Invoice Generation*: The portal generates invoices for completed orders, providing users with a record of their purchases. This feature enhances transparency and helps users keep track of their transactions. This invoice is also exported as a PDF file, making it easy for users to save or print their purchase records.

#grid(
  columns: 2,
  gutter: 2mm,
  image("img/17.png", width: 100%, height: auto, alt: "PSTU"),
  image("img/18.png", width: 100%, height: auto, alt: "PSTU"),
)

= Business Model

#rect(width: 100%)[
  Business Landpage URL : #link("https://board-autoprofiler.sharafat.xyz")
]

The business model for Board Autoprofiler is based on selling our e-commerce software as a service (SaaS) to computer hardware retailers and repair shops. The system can be deployed on their servers or hosted on our cloud platform, providing them with a comprehensive solution for managing their online presence and sales. 

#image("img/19.png", width: 100%, height: auto, alt: "Data Visualization")

== Our Services
- *Customizable E-commerce Platform*: A fully functional e-commerce platform that can be tailored to the specific needs of each retailer, including product management, order processing, and customer management.
#image("img/20.png", width: 100%, height: auto, alt: "Data Visualization")
- *Admin Dashboard*: A user-friendly admin panel for managing products, categories, orders, and user accounts.
- *Mobile-Friendly Design*: A responsive design that ensures a seamless shopping experience across devices, including smartphones and tablets.
- *Secure Payment Processing*: Integration with secure payment gateways to facilitate online transactions.
- *Analytics and Reporting*: Tools for tracking sales, user behavior, and system performance, enabling retailers to make data-driven decisions. 
- *Support and Maintenance*: Ongoing support and maintenance services to ensure the system runs smoothly and is updated with the latest features and security patches.

== Revenue Model
- *Subscription Fees*: Monthly or annual subscription fees for using the software, which includes access to updates, support, and new features.

- *Transaction Fees*: A small percentage of each sale made through the platform, incentivizing us to improve the system continuously.

- *Customization Fees*: Additional fees for custom features or integrations requested by retailers, allowing us to tailor the system to their specific needs.

#image("img/21.png", width: 100%, height: auto, alt: "Data Visualization")

= Conclusion
Board Autoprofiler aims to revolutionize the way users select PC components by combining intelligent recommendation systems with real-time performance analysis. By addressing the gaps in existing platforms like Ryans Computers, this system empowers users to make informed decisions while building or upgrading their desktop PCs. With a scalable microservices architecture, robust security, and user-friendly interface, the system is well-positioned for long-term success and expansion.


= References
== Feasibility study
- #link("https://www.ryans.com/")
- #link("https://www.startech.com.bd/")
- #link("https://pc-builds.com/")
- #link("https://pc-builds.com/bottleneck-calculator/")


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
