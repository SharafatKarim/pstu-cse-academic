// Project Proposal — Optimizing Three-Address Code Compiler and RISC-V Target Code Generator
// One page proposal + Progress Update table. Compile with: typst compile proposal.typ
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
  #text(size: 11pt, style: "italic")[Optimizing Three-Address Code Compiler and RISC-V Code Generator for Nano-C]
  #v(0.6em)
]

// Note: Replace the placeholder student details below with your own credentials
#grid(
  columns: (1fr, 1fr),
  gutter: 0.35em,
  [*Name:* Your Name], [*ID:* 21020XX],
  [*Registration:* 10XXX], [*Course:* CIT-412], [*Course Title:* Compiler Design & Automata Theory Sessional], [*Faculty:* Computer Science and Engineering, PSTU],
)

#v(0.4em)
#line(length: 100%, stroke: 0.6pt)
#v(0.4em)

// ---- 1. Executive Summary ----
= 1. Introduction

This proposal presents the design and implementation of an optimizing ahead-of-time compiler and RISC-V target code generator for a structured imperative language (`Nano-C`). The system accepts source programs, verifies semantic validity through static type checking and scope resolution, lowers code into a Three-Address Code (TAC) intermediate representation, performs machine-independent optimizations, and emits standard RV32I RISC-V assembly.

The project extends a Flex and Bison front-end prototype (`lexer.l` and `parser.y`), which performs lexical and syntactic analysis to construct an Abstract Syntax Tree (AST). The `nanoc-rv` compiler completes the pipeline by adding a scope-aware symbol table, intermediate code generation, an optimizer for constant folding and dead-code elimination, and an assembly code emitter.

Lowering high-level constructs to an explicit intermediate representation decouples language semantics from target instruction selection. The emitted `.s` assembly can be assembled with GNU binutils or simulated in standard environments like QEMU or Spike, demonstrating a modular multi-pass compiler architecture.

// ---- 2. Problem Statement ----
= 2. Problem Statement

Introductory compiler prototypes typically end at syntax tree generation or immediate evaluation inside grammar actions. While sufficient for parsing demonstrations, they leave three critical gaps:

#let items = (
  [No semantic verification. Syntactically valid programs may still be invalid: undeclared variables, duplicate definitions, and type mismatches go undetected until runtime.],
  [Absence of intermediate representation. Translating source code directly to target instructions tightly couples grammar to hardware, preventing machine-independent optimization.],
  [Inefficient code emission. Direct translation emits redundant loads and stores without basic block optimization, producing bloated and suboptimal assembly.],
)
#for (i, item) in items.enumerate(start: 1) [
  #grid(columns: (auto, 1fr), gutter: 0.4em, [#i. #item])
]

We address these issues by separating parsing, semantic analysis, intermediate optimization, and code generation into modular passes connected by intermediate structures.

// ---- 3. Architecture ----
= 3. Proposed Architecture

The compiler is organized as modular pipeline stages connected by simple intermediate structures, as shown in @pipeline.

#figure(
  block(fill: gray.lighten(95%), inset: 8pt, radius: 3pt, width: 100%)[
    #image("pipeline.svg", width: 100%)
  ],
  caption: [Compilation pipeline of nanoc-rv, from source file to RISC-V assembly],
  supplement: "Figure",
) <pipeline>

The stages and the data passed between them are:

+ *Source*: the input program, stored as a `.nc` text file.
+ *Lexer / Parser*: tokenizes source and checks grammar, producing an AST.
+ *AST*: a syntax tree representing the program's syntactic structure.
+ *Semantic Analyzer*: resolves nested scopes and verifies static types.
+ *Typed AST*: the syntax tree annotated with type and symbol information.
+ *IR Gen & Optimizer*: generates Three-Address Code and performs constant folding.
+ *Optimized TAC*: linearized quadruples intermediate representation.
+ *RISC-V Gen*: translates optimized TAC into standard RV32I assembly (`.s`).

Decoupling front-end parsing from machine emission via intermediate quadruples ensures clean boundaries between analysis and synthesis. This modular design makes the compiler easy to test and extend with further optimization passes.

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

)
