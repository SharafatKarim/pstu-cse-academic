#set document(title: "Compiler Design Lab Manual: Flex & Bison", author: "Compiler Design Lab")

// Base page configuration
#set page(
  paper: "a4",
  margin: (top: 2.8cm, bottom: 2.5cm, left: 2.8cm, right: 2.8cm),
  header: context {
    let page_num = counter(page).get().first()
    // Suppress header on cover page and outline page
    if page_num > 2 [
      #text(9pt, fill: rgb("#555555"))[
        #grid(
          columns: (1fr, 1fr),
          align(left)[*Flex & Bison: Compiler Design Manual*],
          align(right)[*Semester 7 • Lab Reference*]
        )
      ]
      #v(-4pt)
      #line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
    ]
  },
  footer: context {
    let page_num = counter(page).get().first()
    if page_num > 1 [
      #align(center)[#text(9pt, fill: rgb("#64748b"))[- #page_num -]]
    ]
  }
)

#set text(
  font: "Liberation Sans",
  size: 10.5pt,
  fill: rgb("#1e293b"),
  lang: "en"
)

#set par(justify: true, leading: 0.75em)

#show heading: set text(fill: rgb("#0f172a"), weight: "bold")
#show heading.where(level: 1): it => {
  v(18pt)
  it
  v(8pt)
}
#show heading.where(level: 2): it => {
  v(14pt)
  it
  v(6pt)
}
#show heading.where(level: 3): it => {
  v(10pt)
  it
  v(4pt)
}

#show raw.where(block: true): block.with(
  fill: rgb("#f8fafc"),
  stroke: 0.5pt + rgb("#e2e8f0"),
  inset: 10pt,
  radius: 5pt,
  width: 100%
)

#let callout(title: "Note", body, color: rgb("#2563eb")) = {
  block(
    fill: color.lighten(94%),
    stroke: (left: 3.5pt + color),
    inset: (x: 12pt, y: 10pt),
    radius: (right: 4pt),
    width: 100%,
    [
      #text(weight: "bold", fill: color)[#title]\
      #v(3pt)
      #body
    ]
  )
}

// -------------------------------------------------------------
// COVER PAGE (Minimalist & Professional)
// -------------------------------------------------------------
#place(top + left, dx: 0pt, dy: 80pt)[
  #text(12pt, tracking: 2pt, weight: "medium", fill: rgb("#3b82f6"))[COMPILER DESIGN LAB MANUAL]
  #v(14pt)
  #text(32pt, weight: "bold", fill: rgb("#0f172a"))[Building Compiler\ Front-Ends]
  #v(8pt)
  #text(16pt, weight: "regular", fill: rgb("#64748b"))[A Hands-on Guide to Lexical Analysis with Flex\ and Syntactic Parsing with Yacc / GNU Bison]
  #v(25pt)
  #line(length: 60pt, stroke: 3pt + rgb("#3b82f6"))
]

#place(bottom + left, dy: -40pt)[
  #grid(
    columns: (auto, auto),
    column-gutter: 20pt,
    row-gutter: 8pt,
    [*Subject:*], [Compiler Design & Construction (CSE 7th Semester)],
    [*Tools:*], [Flex 2.6+, GNU Bison 3.8+, GCC, GNU Make],
    [*Environment:*], [Linux / POSIX (x86_64)],
    [*Author / Department:*], [Department of Computer Science & Engineering]
  )
  #v(18pt)
  #text(9pt, fill: rgb("#94a3b8"))[Document compiled with Typst • #datetime.today().display("[month repr:long] [year]")]
]

#pagebreak()

// -------------------------------------------------------------
// TABLE OF CONTENTS PAGE
// -------------------------------------------------------------
#v(20pt)
#text(22pt, weight: "bold", fill: rgb("#0f172a"))[Table of Contents]
#v(10pt)
#line(length: 100%, stroke: 1pt + rgb("#e2e8f0"))
#v(10pt)

#outline(
  title: none,
  indent: auto,
  depth: 3
)

#v(20pt)
#callout(title: "How to Use This Manual", color: rgb("#0284c7"))[
  This manual is organized to take you progressively from first principles to a fully working compiler front-end. If you are preparing for lab evaluations, make sure to thoroughly inspect *Chapter 2* (file anatomy), *Chapter 4* (handling data types), and *Chapter 6* (resolving grammar conflicts).
]

#pagebreak()

// -------------------------------------------------------------
// CHAPTER 1
// -------------------------------------------------------------
= 1. Foundations of Compiler Front-Ends

A compiler is a computer program that translates computer code written in one programming language (the source language) into another language (the target language, usually machine code or intermediate byte code). 

Traditionally, a compiler's pipeline is divided into two distinct components:
1. *Front-End:* Language-dependent. It reads raw character strings, verifies syntax correctness according to formal grammar rules, and produces an Intermediate Representation (IR) or Abstract Syntax Tree (AST).
2. *Back-End:* Machine-dependent. It optimizes the intermediate representation, assigns machine registers, and generates hardware-specific machine instructions.

This manual focuses squarely on building the *Compiler Front-End* using two industry-standard tools: *Flex* (Fast Lexical Analyzer) and *Yacc/Bison* (Yet Another Compiler-Compiler / GNU Bison).

== The Two Phases of Front-End Analysis

#grid(
  columns: (1fr, 1fr),
  gutter: 16pt,
  [
    *Phase 1: Lexical Analysis (Scanner)*
    - *Tool:* Flex
    - *Theoretical Model:* Deterministic Finite Automata (DFA) generated from Regular Expressions (Regex).
    - *Purpose:* Ingests a raw character stream (`"int x = 42;"`) and discards irrelevant details (whitespace, comments). It partitions the characters into atomic units called *lexemes* and attributes each a symbolic category called a *token* (e.g., `KEYWORD_INT`, `IDENTIFIER`, `ASSIGN`, `INT_LITERAL`, `SEMICOLON`).
  ],
  [
    *Phase 2: Syntax Analysis (Parser)*
    - *Tool:* Yacc / GNU Bison
    - *Theoretical Model:* LALR(1) / LR(1) Pushdown Automata driven by Context-Free Grammars (CFG).
    - *Purpose:* Consumes the linear stream of tokens emitted by the scanner, checks whether the tokens satisfy the syntactic structure of the language, reports errors for invalid structures, and executes semantic actions (such as evaluating expressions, creating symbol table entries, or emitting AST nodes).
  ]
)

== How Flex and Yacc Collaborate at Runtime

Rather than reading the entire source file and buffering millions of tokens in memory, Yacc and Flex operate in an elegant *pull-based lockstep producer-consumer architecture*:

#align(center)[
#table(
  columns: (1.2fr, 1.6fr, 1.2fr),
  align: center + horizon,
  stroke: 0.5pt + rgb("#cbd5e0"),
  fill: (col, row) => if row == 0 { rgb("#f1f5f9") } else { none },
  [*Flex (Producer / Lexer)*], [*Communication Mechanism*], [*Bison/Yacc (Consumer / Parser)*],
  [Reads input file `yyin`],
  [Function call `yylex()`],
  [`yyparse()` initiates parsing and requests tokens as needed],
  [Matches regular expressions],
  [Returns integer Token ID (e.g., `NUMBER`)],
  [Determines parser state transition (shift or reduce)],
  [Assigns token attribute (`yylval = atoi(...)`)],
  [Global value communication variable `yylval`],
  [Pushes `$1`, `$2`, etc. onto the semantic value stack],
  [Signals End of File (returns `0`)],
  [Return code `0` from `yylex()`],
  [Completes grammar reduction and finishes parse]
)
]

#callout(title: "Core Architectural Principle")[
The parser (*Yacc*) is always in the driver's seat. The parser's engine `yyparse()` repeatedly invokes `yylex()` whenever it needs the next lookahead token. Flex scans just enough characters from `yyin` to match the next token, updates `yylval`, and returns the integer constant representing that token.
]

---

// -------------------------------------------------------------
// CHAPTER 2
// -------------------------------------------------------------
= 2. Anatomy of Flex & Yacc Specifications

Both Flex (`.l`) and Yacc (`.y`) share a historic, unified structure divided into three distinct sections delineated by the `%%` delimiter:

```
Declarations & Options
%%
Rules & Actions
%%
User C / Auxiliary Code
```

== Detailed Anatomy of a Flex Specification (`.l`)

A Flex input file consists of:
1. *Declarations Section:* Contains C code enclosed in `%{ ... %}` copied directly to the beginning of the generated `lex.yy.c` file. This is where header files like `stdio.h` and the Bison-generated token header (e.g. `calc.tab.h`) must be included. It also includes regex macro aliases (e.g., `DIGIT [0-9]`) and Flex flags such as `%option noyywrap`.
2. *Rules Section:* Contains pattern-action pairs. Each rule begins with a regular expression (left aligned, no leading whitespace) followed by a C code block executed when that pattern matches:
  ```lex
  [0-9]+      { yylval.ival = atoi(yytext); return NUMBER; }
  "+"         { return PLUS; }
  [ \t\r\n]+  { /* Discard whitespace without returning */ }
  .           { printf("Unknown character: %s\n", yytext); }
  ```
3. *User Code Section:* Copied verbatim to the bottom of the generated C file. If you are not using `%option noyywrap`, you implement `int yywrap() { return 1; }` here.

== Detailed Anatomy of a Yacc Specification (`.y`)

A Yacc/Bison file contains:
1. *Declarations Section:* 
   - C headers and function prototypes inside `%{ ... %}`.
   - Grammar terminal symbols declared via `%token TOKEN_NAME`.
   - Operator precedence and associativity declarations (`%left`, `%right`, `%nonassoc`).
   - Semantic type unions via `%union { ... }` and type associations via `%type`.
2. *Rules Section:* Context-Free Grammar productions written in Backus-Naur Form (BNF) variant:
  ```yacc
  expression
      : expression '+' term   { $$ = $1 + $3; }
      | expression '-' term   { $$ = $1 - $3; }
      | term                  { $$ = $1; }
      ;
  ```
3. *User Code Section:* Contains support functions such as `main()`, error reporting functions like `void yyerror(const char *s)`, and symbol table helpers.

== The Magic Variables: Demystifying `$$`, `$1`, `$2`, and `yylval`

Beginners are often confused by how data flows between Flex and Yacc. Let's break it down:

- *`yytext`:* A `char*` pointer managed by Flex that points to the actual string slice matched by the current regex rule.
- *`yyleng`:* The length of `yytext`.
- *`yylval`:* A global variable used by `yylex()` to deliver the token's semantic value to the parser. By default, `yylval` is an `int`, but it can be changed to an arbitrary C `union` to carry floats, strings, or AST pointers.
- *`$$`:* In a Yacc production rule, `$$` represents the resulting value of the symbol on the left-hand side of the colon (`:`).
- *`$1`, `$2`, ..., `$n`:* Represent the semantic values of the 1st, 2nd, up to the $n$-th symbol on the right-hand side of the rule.

#callout(title: "Visualizing Semantic Evaluation")[
Consider the rule: `expr : expr '+' term { $$ = $1 + $3; };`
- `$1` contains the evaluated integer/result of the left `expr`.
- `$2` corresponds to the `'+'` token itself.
- `$3` contains the evaluated integer/result of the `term`.
- `{ $$ = $1 + $3; }` computes the sum and stores it into `$$`, which becomes available to whichever higher-level rule consumes this `expr`.
]

---

// -------------------------------------------------------------
// CHAPTER 3
// -------------------------------------------------------------
= 3. End-to-End Hands-on Project: Interactive Calculator

To cement our understanding, we will build a complete calculator supporting:
- Multi-digit integers
- Binary arithmetic operators: `+`, `-`, `*`, `/`
- Unary minus (`-5`)
- Nested parentheses `((10 + 2) * 3)`
- Error detection for syntax mistakes and division by zero.

== 1. The Parser Implementation: `calc.y`

```yacc
%{
#include <stdio.h>
#include <stdlib.h>

/* Prototypes required for strict C compilation */
int yylex(void);
void yyerror(const char *s);
%}

/* Declare terminal tokens */
%token NUMBER
%token EOL

/* Operator Precedence and Associativity:
   Lines declared later have higher precedence.
   Multiplication and division bind tighter than addition and subtraction. */
%left '+' '-'
%left '*' '/'
%nonassoc UMINUS

%%

/* Grammar rules */

input:
      /* Empty string matches starting empty input */
    | input line
    ;

line:
      EOL                       { /* Ignore empty blank lines */ }
    | expr EOL                  { printf("=> Result: %d\n", $1); }
    | error EOL                 { yyerrok; printf("=> Ready for next input.\n"); }
    ;

expr:
      NUMBER                    { $$ = $1; }
    | expr '+' expr             { $$ = $1 + $3; }
    | expr '-' expr             { $$ = $1 - $3; }
    | expr '*' expr             { $$ = $1 * $3; }
    | expr '/' expr             {
                                  if ($3 == 0) {
                                      yyerror("Division by zero error!");
                                      $$ = 0;
                                  } else {
                                      $$ = $1 / $3;
                                  }
                                }
    | '(' expr ')'              { $$ = $2; }
    | '-' expr %prec UMINUS     { $$ = -$2; }
    ;

%%

/* Error reporting function */
void yyerror(const char *s) {
    fprintf(stderr, "[Parser Error] %s\n", s);
}

int main(void) {
    printf("===========================================\n");
    printf("   Interactive Flex & Bison Calculator\n");
    printf("   Type expressions (e.g. 3 + 4 * 2)\n");
    printf("   Press Enter to evaluate, Ctrl+D to exit\n");
    printf("===========================================\n");
    yyparse();
    return 0;
}
```

== 2. The Lexer Implementation: `calc.l`

```lex
%{
#include "calc.tab.h"  /* Generated by bison -d, contains token definitions */
#include <stdlib.h>
%}

/* Instruct flex not to generate default yywrap(), linking without -lfl */
%option noyywrap

%%

[0-9]+          {
                    /* Convert string representation to actual integer */
                    yylval = atoi(yytext);
                    return NUMBER;
                }

[ \t]           { /* Skip horizontal whitespace silently */ }

\r?\n           { return EOL; }

"+"             { return '+'; }
"-"             { return '-'; }
"*"             { return '*'; }
"/"             { return '/'; }
"("             { return '('; }
")"             { return ')'; }

.               {
                    printf("[Lexer Error] Unexpected character encountered: '%c'\n", yytext[0]);
                }

%%
```

---

// -------------------------------------------------------------
// CHAPTER 4
// -------------------------------------------------------------
= 4. Working with Diverse Data Types: `%union`

In a basic calculator, `yylval` defaults to `int`. However, a real programming language compiler must track identifiers (strings), floating-point constants, and AST pointers.

== Declaring `%union` in Bison

To support multiple types in Bison, we declare a `%union` in the declarations section of `parser.y`:

```yacc
%union {
    int    ival;      /* For integer literals */
    double fval;      /* For floating-point literals */
    char*  sval;      /* For identifiers or string literals */
    struct ASTNode* node; /* For AST nodes */
}

/* Associate tokens with union fields */
%token <ival> INT_LITERAL
%token <fval> FLOAT_LITERAL
%token <sval> IDENTIFIER

/* Associate non-terminals with union fields */
%type <fval> expr
%type <node> statement block
```

== Supplying Values from Flex

When `%union` is used, `yylval` changes from an integer to a C union type. In `lexer.l`, we assign to the specific union member:

```lex
%{
#include "parser.tab.h"
#include <string.h>
#include <stdlib.h>
%}

%%
[0-9]+\.[0-9]+    { yylval.fval = atof(yytext); return FLOAT_LITERAL; }
[0-9]+            { yylval.ival = atoi(yytext); return INT_LITERAL; }
[a-zA-Z_][a-zA-Z0-9_]* {
                      yylval.sval = strdup(yytext);
                      return IDENTIFIER;
                  }
```

#callout(title: "Memory Management Alert", color: rgb("#b91c1c"))[
Notice the use of `strdup(yytext)`. The pointer `yytext` is a temporary buffer reused by Flex on every match. If you store or pass an identifier string into Yacc, you *must* duplicate it (`strdup`) or copy it to your symbol table, and free it later to avoid dangling memory references!
]

---

// -------------------------------------------------------------
// CHAPTER 5
// -------------------------------------------------------------
= 5. Compilation Pipeline & Build Automation

Compiling a compiler front-end requires executing three distinct commands in strict order:

#align(center)[
#table(
  columns: (auto, 1fr, 1.4fr),
  stroke: 0.5pt + rgb("#cbd5e0"),
  fill: (col, row) => if row == 0 { rgb("#f1f5f9") } else { none },
  [*Step*], [*Command*], [*Artifacts Produced & Purpose*],
  [1], [`bison -d -v calc.y`], [`calc.tab.c`, `calc.tab.h`, `calc.output` (grammar report)],
  [2], [`flex calc.l`], [`lex.yy.c` (scanner implementation)],
  [3], [`gcc -Wall -o calc calc.tab.c lex.yy.c`], [Final executable binary `calc`]
)
]

== Why the `-d` flag is mandatory in Bison:
The `-d` flag tells Bison to produce the header file (`calc.tab.h`). This header file contains `#define NUMBER 258` and the definition of `yylval`. Without it, `calc.l` will fail to compile with `error: ‘NUMBER’ undeclared`.

== Production-Ready `Makefile`

Save this file as `Makefile` in the project directory:

```makefile
CC      = gcc
CFLAGS  = -Wall -Wextra -O2
BISON   = bison
FLEX    = flex

TARGET  = calc
YSRC    = calc.y
LSRC    = calc.l

# Generated intermediate C files
YTAB_C  = calc.tab.c
YTAB_H  = calc.tab.h
LSCAN_C = lex.yy.c

all: $(TARGET)

$(TARGET): $(YTAB_C) $(LSCAN_C)
	$(CC) $(CFLAGS) -o $@ $(YTAB_C) $(LSCAN_C)

$(YTAB_C) $(YTAB_H): $(YSRC)
	$(BISON) -d -v $(YSRC)

$(LSCAN_C): $(LSRC) $(YTAB_H)
	$(FLEX) $(LSRC)

clean:
	rm -f $(TARGET) $(YTAB_C) $(YTAB_H) $(LSCAN_C) calc.output

.PHONY: all clean
```

With this `Makefile`, running:
- `make` builds the full executable cleanly.
- `make clean` deletes all generated intermediate files.

---

// -------------------------------------------------------------
// CHAPTER 6
// -------------------------------------------------------------
= 6. Common Pitfalls, Conflicts & Debugging

== 1. Shift/Reduce & Reduce/Reduce Conflicts

- *Shift/Reduce Conflict:* Occurs when the parser cannot decide whether to shift the next input symbol onto the stack or reduce the currently matched tokens to a non-terminal rule. The classic example is the dangling-else ambiguity in `if ... then ... else`.
- *Reduce/Reduce Conflict:* A critical flaw where the parser has two distinct grammar rules that can both validly match the same sequence of tokens. This indicates an ambiguous grammar that must be rewritten.
- *How to diagnose:* Pass the `-v` (verbose) flag to Bison (`bison -d -v calc.y`). This generates a `calc.output` text report showing the exact state machine, conflict states, and conflicting tokens.

== 2. Operator Precedence & Associativity

Without precedence rules, an expression like `2 + 3 * 4` has two valid parse trees:
1. `(2 + 3) * 4 = 20`
2. `2 + (3 * 4) = 14`

By specifying `%left '+' '-'` followed by `%left '*' '/'`, we instruct Bison that `*` has higher binding priority than `+`, producing unambiguous deterministic parses.

== 3. Verbose Error Reporting in Modern Bison

By default, calling `yyerror()` yields the vague string `"syntax error"`. You can instruct Bison to report the exact token expected versus the token received by placing this directive in the parser declarations:

```yacc
%define parse.error verbose
```

With this option, Bison produces helpful messages such as:
`syntax error, unexpected '+', expecting NUMBER or '('`.

---

= 7. Summary & Next Steps in Compiler Construction

Congratulations! You now have a working understanding of:
1. Scanning character streams into tokens using regular expressions in *Flex*.
2. Parsing token streams and enforcing precedence rules with Context-Free Grammars in *Bison*.
3. Passing typed semantic data using `%union` and `yylval`.
4. Automating the build lifecycle with a custom `Makefile`.

*Suggested next lab exercises:*
- Extend the calculator to support variables with a Symbol Table (`x = 10; y = x * 2;`).
- Add boolean operations (`&&`, `||`, `!`) and conditional statements (`if ... else`).
- Construct an explicit Abstract Syntax Tree (AST) node struct instead of evaluating expressions immediately inline.

#v(20pt)
#align(center)[
  #text(10pt, fill: rgb("#64748b"))[*Compiler Design Reference Manual • Generated with Typst*]
]
