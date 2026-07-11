#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2.5cm),
  numbering: "1",
  columns: 1,
)
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
    *CCE 324 :: Simulation and Modeling Sessional*
  ])
  #align(left, text(14pt)[
    *Project Report*
  ])
  #line(length: 100%)
]

#align(left)[
  #v(12pt)
  #image("logo/logo.svg", width: 45%, height: auto, alt: "CloudCalc Flow")
]

#align(bottom)[
  #line(length: 100%)
  *Project Title : CloudCalc Flow* \
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
      + *Dr. Md Abdul Masud* \
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
  #image("logo/logo-2.svg", width: 25%, height: auto, alt: "CloudCalc Flow Logo")
]
#align(center)[
  #text(size: 20pt, weight: "bold")[CloudCalc Flow]
  #linebreak()
  #text(size: 12pt, style: "italic")[Visual Cloud Architecture Simulator and Cost Estimator]
]

= Introduction

CloudCalc Flow is a fully client-side, visual cloud architecture simulator and cost estimator. It lets a user drag infrastructure components — compute servers, load balancers, API gateways, SQL and NoSQL databases, object storage, in-memory cache, a CDN and a message queue — onto an interactive canvas, wire them together under enforced connection rules, and then simulate a variable concurrent-user load. As the load changes, the application recomputes each server's RAM utilisation, response time and throughput, aggregates a live monthly cost, flags overloaded (out-of-memory) nodes and proposes concrete remediation.

Unlike spreadsheet-style cloud pricing calculators, CloudCalc Flow couples *topology* with *behaviour*: the same diagram that documents an architecture also drives a lightweight performance-and-cost model, so a student or engineer can reason about capacity and budget together, entirely in the browser and without any account, backend or data leaving the device.

= Objectives

+ To build a responsive, node-based canvas for composing cloud architectures through drag-and-drop with enforced, type-safe connection rules.
+ To implement a transparent, real-time simulation of RAM utilisation, response time and throughput as a function of the simulated concurrent-user load.
+ To estimate the total monthly cost of an architecture live, and to detect overloaded servers and surface actionable upgrade/scale/reduce suggestions with their cost deltas.
+ To provide full undo/redo, localStorage autosave, JSON export/import and a copy-as-text summary — all client-side.
+ To keep the domain logic pure and unit-tested, and the interface accessible, themeable (light/dark) and responsive.

= Problem Statement

Planning a cloud deployment forces two questions to be answered at once: *what will it look like* and *what will it cost and sustain*. Existing tools tend to answer only one. Native cloud pricing calculators (AWS, Google Cloud, Azure) produce accurate bills but present a flat list of line items with no topology and no notion of load-driven capacity. Diagramming tools (draw.io, Lucidchart) capture topology beautifully but know nothing about cost or performance. Visual cost tools such as Cloudcraft bridge some of this gap but are provider-locked, require an account, and keep the model opaque.

The result is that early-stage capacity and budget reasoning — "will one Micro server survive 2,000 users, and what does the next step up cost?" — is done by hand or across disconnected tools. There is a need for a single, instant, no-login, provider-agnostic tool that visualises an architecture and simulates its cost and load-behaviour side by side, with a model simple and transparent enough to teach with.

= Literature Review

The relationship between server utilisation and responsiveness is a classical result of queueing theory. Kleinrock @kleinrock_queueing shows that for an M/M/1-style service, mean response time rises sharply and non-linearly as utilisation approaches 100%, which motivates CloudCalc Flow's response-time penalty that grows with RAM utilisation and its throughput degradation term near saturation. Little's Law @little_law — that the mean number in a system equals arrival rate times mean time in system — underpins the intuition that throughput and concurrency cannot both grow without bound on fixed resources.

For capacity planning specifically, Menascé and Almeida @menasce_capacity_planning formalise metrics-driven models that map workload intensity (here, concurrent users) onto resource demand and service level, which is the exact shape of the per-server calculation used in this project. At the platform level, Armbrust et al. @armbrust_view_cloud frame elasticity and pay-as-you-go economics as the defining properties of cloud computing, and note that the ability to add or remove capacity in response to load is what makes cost a first-class design variable — echoed in CloudCalc Flow's "add another server" and "upgrade tier" suggestions and their explicit cost deltas.

Finally, the practice of treating cloud spend as an engineering concern is codified by the FinOps Foundation @finops_foundation, whose framework argues that engineers should see the cost consequences of architectural choices in real time. CloudCalc Flow is a small, educational embodiment of that principle.

= Related Commercial Projects

+ *AWS Pricing Calculator* @aws_pricing_calculator gives authoritative, up-to-date pricing for real AWS services, but produces a flat itemised estimate with no architecture diagram and no load or performance simulation.

+ *Google Cloud* @gcp_pricing_calculator and *Azure* @azure_pricing_calculator calculators are equivalent in spirit — accurate, provider-specific, list-based — and likewise omit topology and capacity behaviour.

+ *Cloudcraft* @cloudcraft is the closest visual analogue: it renders live AWS/Azure diagrams with attached cost. However, it is provider-locked, requires an account, is not open source, and does not simulate user-driven load against per-node capacity.

+ *React Flow / xyflow* @reactflow is not a competitor but the enabling library — a node-based editor toolkit — on which CloudCalc Flow's canvas, custom nodes, edges and connection validation are built.

= Scope

CloudCalc Flow is delivered as a modern web application built with Next.js and React Flow. It is entirely client-side: there is no server, database or authentication, and no data ever leaves the browser. The application ships nine component types with a hardcoded but clearly-documented cost and capacity catalogue, a strict connection-rule engine, a pure simulation module, undo/redo history, localStorage persistence, JSON export/import and a markdown summary.

The performance model is intentionally simplified and pedagogical rather than a byte-accurate emulation of any specific cloud provider; its constants (server tiers, OS overheads, per-stack memory footprints and component prices) are transparent and editable in a single data file. The interface is responsive down to mobile widths, supports a light/dark theme, and is keyboard-navigable.

== Job Market Analysis

The stack chosen for CloudCalc Flow — Next.js, React, TypeScript and Tailwind CSS — sits at the centre of current full-stack web-developer demand in Bangladesh and globally. Listings on major portals (BDJobs, Arc.dev, Wellfound) for full-stack and front-end roles consistently name React/Next.js, TypeScript and a utility CSS framework as core requirements, frequently alongside state-management and data-visualisation experience. The competencies exercised by this project — component-driven UI, client-side state architecture, canvas/graph interaction and a self-contained computational model — map directly onto those hiring signals, making CloudCalc Flow a demonstrable portfolio artefact.

= Methodology

== Technology Stack

Development followed an iterative, agile approach. The stack was selected for performance, type-safety and a fully client-side deployment.

#figure(
  table(
    columns: (34%, 66%),
    [*Component*], [*Technology*],
    [Frontend Framework], [Next.js 16 (React 19, App Router, Turbopack)],
    [Language], [TypeScript (strict)],
    [Canvas / Graph], [React Flow v12 (\@xyflow/react)],
    [State Management], [Zustand 5 with immer + persist middleware],
    [Styling], [Tailwind CSS v4],
    [Icons], [Lucide React],
    [Persistence], [Browser localStorage (autosave) + JSON export/import],
    [Testing], [Vitest (pure simulation unit tests)],
    [Diagrams], [Mermaid; report typeset in Typst],
  ),
  caption: "Technology stack for CloudCalc Flow",
)

== Design Principles

+ *Pure, testable domain logic.* All cost and performance math lives in dependency-free functions (`lib/simulation.ts`) so it can be unit-tested and reused by both the nodes and the metrics panel.
+ *Single source of truth.* A Zustand store holds nodes, edges and the user-count; every view derives from it, and history snapshots wrap each mutation for undo/redo.
+ *Client-first and private.* No backend, no login; the whole architecture autosaves to localStorage and can be exported as a portable JSON file.
+ *Type-safety end to end.* Discriminated-union node data and a typed connection-rule table make invalid states hard to represent.

= Simulation Model

The core of CloudCalc Flow is a pure calculation run whenever the user-count slider or any node configuration changes. For each Compute Server in the traffic path:

#figure(
  table(
    columns: (40%, 60%),
    align: (left, left),
    [*Quantity*], [*Definition*],
    [Base RAM], [$"OS overhead" + "framework idle"$],
    [Traffic RAM], [$("users" \/ N_"servers") \/ 100 times "stackPer100"$],
    [Utilisation], [$("Base" + "Traffic") \/ "TierRAM" times 100%$],
    [Response time], [$"TierBaseline" + "Util"\/100 times 50"ms"$],
    [Throughput], [$"TierMax" times (1 - "Util"\/150)$],
  ),
  caption: "Per-server simulation formulas",
)

Here $N_"servers"$ is the number of servers sharing traffic. If any Load Balancer is present, only servers wired from it receive traffic and share the load evenly; otherwise every server receives the full load directly. A server crosses into *Warning* at 80% utilisation and *Overloaded* (OOM) at 100%, at which point its border turns red and remediation suggestions are generated. The response-time penalty and throughput degradation deliberately mirror the qualitative behaviour of a saturating queue @kleinrock_queueing.

Global metrics aggregate these per-server results: total monthly cost (sum of all node costs), total RAM, traffic-weighted average response time, peak throughput (capped by load-balancer capacity), estimated bandwidth, and the worst node status. The catalogue that feeds the model is summarised below.

#figure(
  table(
    columns: (auto, auto, auto, auto, auto),
    align: (left, center, center, center, center),
    [*Tier*], [*RAM*], [*vCPU*], [*Cost/mo*], [*Max req/s*],
    [Micro], [1 GB], [2], [\$8], [100],
    [Small], [2 GB], [2], [\$16], [500],
    [Medium], [4 GB], [4], [\$32], [2000],
    [Large], [8 GB], [8], [\$64], [5000],
  ),
  caption: "Compute server tiers",
)

#figure(
  table(
    columns: (auto, auto, auto, auto),
    align: (left, center, left, center),
    [*Component*], [*Cost/mo*], [*Stack (RAM / 100 users)*], [*idle*],
    [Load Balancer], [\$20], [Next.js — 150 MB], [120 MB],
    [API Gateway], [\$15], [Express.js — 80 MB], [60 MB],
    [SQL Database], [\$8–10 +/GB], [Flask — 50 MB], [40 MB],
    [NoSQL Database], [\$12–15 +/GB], [Go — 20 MB], [15 MB],
    [S3 Storage], [\$5 + \$0.10/GB], [OS: Ubuntu 400 MB], [],
    [Redis Cache], [\$15], [OS: Alpine 50 MB], [],
    [CDN], [\$20 + \$0.08/GB], [OS: Arch 100 MB], [],
    [Message Queue], [\$25], [], [],
  ),
  caption: "Component costs and memory footprints (documented defaults)",
)

= Feature Comparison

@comparison contrasts CloudCalc Flow with widely used cloud pricing and diagramming tools.

#figure(
  table(
    columns: (auto, auto, auto, auto, auto, auto, auto, auto, auto),
    align: (left, center, center, center, center, center, center, center, center),
    [*Tool*], [*Visual canvas*], [*Live cost*], [*Traffic sim*], [*Perf metrics*], [*Client-side*], [*No login*], [*Export*], [*FOSS*],
    [*CloudCalc Flow*], [✓], [✓], [✓], [✓], [✓], [✓], [✓], [✓],
    [AWS Pricing Calc.], [—], [✓], [—], [—], [—], [✓], [✓], [—],
    [GCP Calculator], [—], [✓], [—], [—], [—], [✓], [✓], [—],
    [Azure Calculator], [—], [✓], [—], [—], [—], [✓], [✓], [—],
    [Cloudcraft], [✓], [✓], [—], [—], [—], [—], [✓], [—],
    [draw.io], [✓], [—], [—], [—], [✓], [✓], [✓], [✓],
  ),
  caption: "Feature comparison of CloudCalc Flow with existing tools",
) <comparison>

= Visual Models

== System Architecture

#figure(
  image("diagrams/architecture.png", width: 78%, height: auto, alt: "Architecture"),
  caption: "Layered architecture: presentation, Zustand state, pure domain logic and persistence",
) <Arch>

@Arch shows the four layers of CloudCalc Flow. React components dispatch to a single Zustand store; the store delegates cost/performance math to pure modules and validity checks to a connection-rule table, and autosaves to localStorage.

== Simulation Flow

#figure(
  image("diagrams/simulation.png", width: 62%, height: auto, alt: "Simulation flow"),
  caption: "The calculation loop from a slider/config change to per-node status and global metrics",
) <Sim>

== Data Flow

#figure(
  image("diagrams/dataflow.png", width: 100%, height: auto, alt: "Data flow"),
  caption: "Action to render: history snapshot, immer mutation, persistence and pure recompute",
) <Flow>

== Connection Rules

#figure(
  image("diagrams/connections.png", width: 92%, height: auto, alt: "Connection rules"),
  caption: "Enforced topology — entry points route to servers; servers write to data, cache, edge and queue sinks",
) <Conn>

== Timeline (Gantt Chart)

#figure(
  table(
    columns: (auto, 10%, 10%, 10%, 10%, 10%, 10%),
    [*Task*], [*Wk 1*], [*Wk 2*], [*Wk 3*], [*Wk 4*], [*Wk 5*], [*Wk 6*],
    [Data models + simulation math + tests], [✓], [], [], [], [], [],
    [Zustand store + history + connection rules], [], [✓], [], [], [], [],
    [Canvas, custom nodes and edges], [], [✓], [✓], [], [], [],
    [Palette, metrics panel, config modal], [], [], [✓], [✓], [], [],
    [Warnings, suggestions, export, shortcuts], [], [], [], [✓], [], [],
    [Extended components (CDN, gateway, queue, NoSQL)], [], [], [], [], [✓], [],
    [Dark mode, responsiveness, verification], [], [], [], [], [✓], [✓],
  ),
  caption: "Development timeline of CloudCalc Flow",
)

= User Interface

#figure(
  image("UI/desktop.png", width: 100%, alt: "Desktop view"),
  caption: [Populated architecture — an overloaded Micro server (red, 197% RAM) with live suggestions, alongside a healthy Medium server; total cost and system status on the right.],
) <UI1>

#figure(
  image("UI/config.png", width: 100%, alt: "Config panel"),
  caption: [Node configuration panel with tier / OS / stack controls and a live preview of the resulting utilisation, cost, response time and throughput.],
) <UI2>

#figure(
  image("UI/desktop-dark.png", width: 100%, alt: "Dark theme"),
  caption: [The same simulator in dark theme.],
) <UI3>

= Security and Privacy

CloudCalc Flow is private by construction. It has no backend, no authentication and no network calls that carry user data: the entire architecture lives in browser memory and is autosaved only to the local device's `localStorage`. Export produces a plain JSON file the user chooses to save; import reads a local file. Because there is no server, there is no attack surface for data exfiltration, no account to breach and no telemetry. This aligns with a privacy-first, offline-capable design and sidesteps the account and data-residency concerns of hosted cost tools.

= Future Plans

+ Provider-specific pricing profiles (AWS/GCP/Azure) selectable at runtime, replacing the single documented catalogue.
+ Preset architectures ("scalable web app", "microservices") and side-by-side cost comparison of two designs.
+ Richer traffic modelling — per-edge bandwidth, autoscaling policies and multi-region deployment.
+ Infrastructure-as-Code export (Terraform / Docker Compose) generated from the canvas.

= Result

+ A fully client-side simulator was delivered with nine component types, drag-and-drop composition and enforced, type-safe connection rules.
+ A transparent per-server model computes RAM utilisation, response time and throughput live, aggregates a monthly cost, and flags overloaded nodes with cost-annotated upgrade/scale/reduce suggestions — verified end-to-end (see @UI1).
+ Undo/redo, localStorage autosave, JSON export/import, copy-as-text, keyboard shortcuts, light/dark theming and responsive layout were all implemented.
+ The simulation math is covered by passing unit tests, and the production build compiles cleanly.

= Conclusion

CloudCalc Flow demonstrates that architecture visualisation and cost/performance reasoning can be unified in a single, instant, no-login web tool. By pairing a node-based canvas with a small, transparent and unit-tested simulation model, it turns an otherwise static diagram into an interactive capacity-and-budget sandbox. The design keeps all data on the device, exposes every constant for teaching, and remains extensible toward real provider pricing and infrastructure-as-code export. It is both a usable planning aid and a compact showcase of a modern React/Next.js, state-management and data-visualisation skill set.

#pagebreak()

#bibliography(title: "References", "refs.bib")

#align(center + bottom)[
  *THE END*
]
