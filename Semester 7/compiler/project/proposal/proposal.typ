// Project Proposal — Cross-Platform Mini-C Bytecode Compiler and Portable Stack Virtual Machine
// One page. Compile with: typst compile proposal.typ
// If pipeline.dot changes, regenerate pipeline.svg with: neato -Tsvg pipeline.dot -o pipeline.svg

#set page(paper: "a4", margin: (x: 2cm, y: 1.3cm))
#set text(font: "Libertinus Serif", size: 9.5pt)
#set par(justify: true, leading: 0.42em)
#show heading: it => [
  #set text(size: 11pt, weight: "bold")
  #v(0.35em)
  #it.body
  #v(0.15em)
]
#show figure.caption: set text(size: 8.5pt, style: "italic")

// ---- Title and student details ----
#align(center)[
  #text(size: 15pt, weight: "bold", tracking: 0.06em)[PROJECT PROPOSAL]\
  #v(0.3em)
  #text(size: 11pt, style: "italic")[Cross-Platform Mini-C Bytecode Compiler and Portable Stack Virtual Machine]
  #v(0.6em)
]

#grid(
  columns: (1fr, 1fr),
  gutter: 0.35em,
  [*Name:* Md. Sharafat Karim], [*ID:* 2102024],
  [*Registration:* 10151], [*Course:* CIT-412], [*Course Title:* Compiler Design & Automata Theory Sessional], [*Faculty:* Computer Science and Engineering, PSTU],
)

#v(0.4em)
#line(length: 100%, stroke: 0.6pt)
#v(0.4em)

// ---- 1. Executive Summary ----
= 1. Introduction

This proposal presents the design and implementation of a cross-platform Mini-C bytecode compiler and portable stack virtual machine. The system will accept a small C-like program, verifies that it is meaningful, translates it into a compact platform-independent bytecode file, and executes that file on a lightweight virtual machine written in C99.

The work extends an existing Flex/Bison front-end prototype (`c_scanner.l` and `c_parser.y`), which performs lexical and syntactic analysis but stops before semantic checking, code generation, and execution. `minic-vm` completes the pipeline by adding a scope-aware semantic analyzer with static type checking, a bytecode generator, and a deterministic virtual machine.

Rather than emitting native machine code for a single processor, the compiler emits instructions for a small abstract machine, which a separate runtime interprets on each platform. This compile-once, run-anywhere design allows one `.mbc` file to run unchanged on Linux, Windows, and Android (through Termux or a native NDK/FFI bridge).

// ---- 2. Problem Statement ----
= 2. Problem Statement

Introductory compiler prototypes typically end at syntax-tree construction or immediate evaluation inside grammar actions. These are sufficient for demonstrating context-free grammars and operator precedence, but they leave three important gaps:

#let items = (
  [No semantic verification. A syntactically valid program may still be meaningless: undeclared identifiers, duplicate declarations in the same scope, and operations on incompatible types go undetected until runtime.],
  [Tight coupling of parsing and execution. Evaluating expressions directly inside Bison actions prevents optimization, control-flow backpatching, and ahead-of-time compilation.],
  [Platform lock-in. Emitting native assembly ties the backend to one processor architecture and operating-system ABI, so each target platform requires a separate build.],
)
#for (i, item) in items.enumerate(start: 1) [
  #grid(columns: (auto, 1fr), gutter: 0.4em, [#i. #item])
]

We will try to addresses these issues by separating parsing, semantic analysis, code generation, and execution into independent stages connected by intermediate structures.

// ---- 3. Architecture ----
= 3. Proposed Architecture

The compiler is organized as four modular stages connected by simple intermediate structures, as shown in @pipeline.

#figure(
  block(fill: gray.lighten(95%), inset: 8pt, radius: 3pt, width: 100%)[
    #image("pipeline.svg", width: 100%)
  ],
  caption: [Compilation pipeline of minic-vm, from source file to running bytecode],
  supplement: "Figure",
) <pipeline>

The stages and the data passed between them are:

+ *Source*: the input program, stored as a text file.
+ *Lexer / Parser*: tokenizes the source and checks it against the grammar, producing an AST.
+ *AST*: a syntax tree representing the program's structure.
+ *Semantic Analyzer*: resolves scopes and checks types on the tree.
+ *Typed AST*: the syntax tree annotated with type information.
+ *Codegen*: translates the typed tree into platform-independent bytecode.
+ *Bytecode (.mbc)*: the portable compiled output.
+ *Stack VM*: a deterministic interpreter for the bytecode.

Because the VM has no external dependencies and is written in C99, it can be built on every target platform, and a single `.mbc` file behaves identically across all platforms. The clear boundaries between stages also make the design straightforward to extend with new language features.

#pagebreak() 

== Progress Update

#table(
  columns: (8%, 12%, 60%, 20%),
  [*No.*], [*Date*], [*Objective*], [*Remarks*],
  [], [], [ \ \ ], [],
  [], [], [ \ \ ], [],
  [], [], [ \ \ ], [],
  [], [], [ \ \ ], [],
  [], [], [ \ \ ], [],
  [], [], [ \ \ ], [],
  [], [], [ \ \ ], [],
  [], [], [ \ \ ], [],
  [], [], [ \ \ ], [],
  [], [], [ \ \ ], [],

)

== Overall Status

#table(
  columns: (30%, 14%, 12%, 12%, 12%, 12%),
  [*Stage*], [*GNU/Linux*], [*Windows*], [*macOS*], [*Android*], [*iOS*], 
  [Lexical Analyzer], [], [], [], [], [],
  [Syntax Analyzer], [], [], [], [], [],
  [Semantic Analyzer], [], [], [], [], [],
  [Intermediate Code Generator], [], [], [], [], [],
  [Codegen], [], [], [], [], [],
  [Stack VM], [], [], [], [], [],
)  