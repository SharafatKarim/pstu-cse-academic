# Design Specification: Cross-Platform Mini-C Bytecode Compiler and Portable Stack Virtual Machine (`minic-vm`)

- **Author:** Md. Sharafat Karim (ID: 2102024, Reg: 10151)
- **Course:** CIT-412 (Compiler Design & Automata Theory Sessional)
- **Status:** Approved Design Specification
- **Date:** 2026-11-25

---

## 1. Executive Summary & Purpose

The `minic-vm` project implements a complete, end-to-end multi-pass compiler and virtual machine architecture for a structured imperative C subset ("Mini-C"). It addresses the fundamental architectural limitations of single-pass, immediate-evaluation toy compilers by cleanly separating:
1. Lexical and syntactic analysis (producing an Abstract Syntax Tree)
2. Scope resolution and static semantic analysis (producing an annotated Typed AST)
3. Platform-independent code generation (emitting compact `.mbc` bytecode)
4. Deterministic stack virtual machine interpretation (a lightweight C99 runtime engine)

The system targets **GNU/Linux** and **Android** (via Termux / POSIX C99) as first-class platforms, with zero external runtime dependencies. A program compiled into `.mbc` on Linux executes deterministically and identically on Android.

---

## 2. Compilation Pipeline & Visualization Architecture

```mermaid
flowchart LR
    A["Source (.mc)"] --> B["Lexer / Parser\n(Flex & Bison)"]
    B --> C["Abstract Syntax Tree\n(AST)"]
    C --> D["Semantic Analyzer\n& Symbol Table"]
    D --> E["Typed AST\n(with Type Coercions)"]
    E --> F["Bytecode Generator\n(Constant Pool + Jumps)"]
    F --> G["Binary Bytecode\n(.mbc)"]
    G --> H["Stack VM\n(C99 Runtime)"]
```

### Full-Pipeline Step-by-Step Visualization
To provide visual observability into every compiler phase, the system provides both individual inspection flags and a unified verbose pipeline mode:
- `minic --dump-ast <file.mc>`: Renders the syntactic AST structure with line numbers.
- `minic --dump-sym <file.mc>`: Dumps the nested symbol table hierarchies, data types, and local variable stack slots.
- `minic --dump-typed-ast <file.mc>`: Renders the decorated AST showing inferred types and synthesized `AST_CAST_I2F` promotion nodes.
- `minic --disasm <file.mbc>`: Disassembles the binary `.mbc` bytecode into readable assembly instructions, byte offsets, and constant pool entries.
- `minic-vm --trace <file.mbc>`: Live-traces the VM execution, logging every instruction, PC, and stack snapshot.
- `minic run --verbose <file.mc>`: Automates all stages sequentially with complete visualization of each intermediate phase.

---

## 3. Mini-C Source Language Specification

### Lexical Syntax
- **Keywords:** `int`, `float`, `if`, `else`, `while`, `return`, `print`, `println`.
- **Identifiers:** `[a-zA-Z_][a-zA-Z0-9_]*`
- **Integer Literals:** `[0-9]+`
- **Floating-point Literals:** `[0-9]+\.[0-9]+`
- **Operators:** `+`, `-`, `*`, `/`, `=`, `==`, `!=`, `<`, `>`, `<=`, `>=`, `!`
- **Delimiters:** `(`, `)`, `{`, `}`, `;`
- **Comments:** `// single-line` and `/* multi-line */` (ignored by scanner).

### Grammar
```text
program       := func_def
func_def      := INT IDENTIFIER '(' ')' block
block         := '{' stmt_list '}'
stmt_list     := stmt*
stmt          := decl_stmt
               | assign_stmt
               | if_stmt
               | while_stmt
               | return_stmt
               | print_stmt
               | block

decl_stmt     := type_spec IDENTIFIER ( '=' expr )? ';'
type_spec     := INT | FLOAT
assign_stmt   := IDENTIFIER '=' expr ';'
if_stmt       := IF '(' expr ')' stmt ( ELSE stmt )?
while_stmt    := WHILE '(' expr ')' stmt
return_stmt   := RETURN expr ';'
print_stmt    := (PRINT | PRINTLN) '(' expr ')' ';'

expr          := expr rel_op expr
               | expr add_op expr
               | expr mul_op expr
               | unary_op expr
               | '(' expr ')'
               | IDENTIFIER
               | NUM_INT
               | NUM_FLOAT

rel_op        := '==' | '!=' | '<' | '>' | '<=' | '>='
add_op        := '+' | '-'
mul_op        := '*' | '/'
unary_op      := '-' | '!'
```

---

## 4. AST & Symbol Table Design

### AST Node Definitions
```c
typedef enum {
    TYPE_UNKNOWN = 0,
    TYPE_INT,
    TYPE_FLOAT,
    TYPE_VOID
} DataType;

typedef enum {
    NODE_PROGRAM,
    NODE_FUNC_DEF,
    NODE_BLOCK,
    NODE_DECL,
    NODE_ASSIGN,
    NODE_IF,
    NODE_WHILE,
    NODE_RETURN,
    NODE_PRINT,
    NODE_BINARY_OP,
    NODE_UNARY_OP,
    NODE_LITERAL_INT,
    NODE_LITERAL_FLOAT,
    NODE_VAR,
    NODE_CAST_I2F
} ASTNodeType;

typedef struct ASTNode {
    ASTNodeType type;
    DataType data_type; // Annotated during semantic analysis
    int line;
    int col;
    union {
        struct { char *name; struct ASTNode *body; } func;
        struct { struct ASTNode **stmts; int count; int capacity; } block;
        struct { char *name; DataType declared_type; struct ASTNode *init_expr; int slot; } decl;
        struct { char *name; struct ASTNode *rhs; int slot; } assign;
        struct { struct ASTNode *cond; struct ASTNode *then_branch; struct ASTNode *else_branch; } if_stmt;
        struct { struct ASTNode *cond; struct ASTNode *body; } while_stmt;
        struct { struct ASTNode *expr; } return_stmt;
        struct { struct ASTNode *expr; bool newline; } print_stmt;
        struct { int op; struct ASTNode *left; struct ASTNode *right; } binary;
        struct { int op; struct ASTNode *operand; } unary;
        struct { char *name; int slot; } var;
        struct { int64_t val; } lit_int;
        struct { double val; } lit_float;
        struct { struct ASTNode *expr; } cast;
    } as;
} ASTNode;
```

### Scoped Symbol Table
- `Symbol`: `name` (string), `type` (`DataType`), `scope_depth` (`int`), `local_slot` (`int`), `line` (`int`).
- `Scope`: `parent` (`struct Scope *`), `symbols` array/hash table, `scope_depth`.
- Entering a `{ ... }` block pushes a new child scope.
- Local variable slot counter increments sequentially for each local declared in the function, guaranteeing unique indexing for VM registers.
- Inner scopes may shadow variables in outer scopes; re-declaring the same identifier within the identical scope is a semantic error.

---

## 5. Semantic Analysis & Type System

1. **Scope Verification:** Every variable reference must be declared in the current or an enclosing ancestor scope.
2. **Type Compatibility & Promotion:**
   - Arithmetic binary operators (`+`, `-`, `*`, `/`) between two `int`s produce `int`.
   - Arithmetic binary operators between two `float`s produce `float`.
   - Mixed-type arithmetic (`int` + `float` or `float` + `int`) implicitly promotes the `int` operand to `float` by wrapping the operand AST node in an `AST_CAST_I2F` node. The result type is `float`.
   - Division by literal zero (`/ 0` or `/ 0.0`) emits a compile-time warning/error.
   - Relational comparisons (`==`, `!=`, `<`, `>`, `<=`, `>=`) promote `int` to `float` if mixed, and the resulting expression type is statically `int` (evaluating to `1` or `0`).
   - Assignment: assigning `int` to `float` variable inserts implicit promotion (`AST_CAST_I2F`). Assigning `float` to `int` variable produces a semantic type error.
3. **Diagnostics:**
   Errors report exact file, line, and column coordinates:
   `[input.mc:14:9] Semantic Error: Undeclared variable 'total'`.

---

## 6. Bytecode Specification & Instruction Set Architecture

### File Header (`.mbc`) - Fixed 24 Bytes
```text
0x00 - 0x03 : Magic Bytes: 0x7F, 'M', 'B', 'C' ("\x7fMBC")
0x04 - 0x05 : Format Version (0x0001)
0x06 - 0x07 : Flags (Reserved: 0x0000)
0x08 - 0x0B : Constant Pool Entry Count (uint32_t, Little-Endian)
0x0C - 0x0F : Code Stream Length in Bytes (uint32_t, Little-Endian)
0x10 - 0x13 : Total Local Variable Slot Count (uint32_t, Little-Endian)
0x14 - 0x17 : Entry Point Byte Offset (uint32_t, Little-Endian)
```

### Constant Pool
Immediately follows the header:
- `[uint8_t tag]`: `0x01` = Float literal (followed by 8-byte IEEE-754 double precision float).

### Opcode Table
| Opcode (Hex) | Mnemonic | Operands | Description |
| :--- | :--- | :--- | :--- |
| `0x00` | `NOP` | None | No operation |
| `0x01` | `POP` | None | Discard top of stack |
| `0x02` | `PUSH_I` | `int64_t` (8B) | Push immediate integer |
| `0x03` | `PUSH_CONST` | `uint16_t` (2B) | Push constant from constant pool by index |
| `0x04` | `LOAD_LOCAL` | `uint16_t` (2B) | Push value from local slot |
| `0x05` | `STORE_LOCAL`| `uint16_t` (2B) | Pop value and store into local slot |
| `0x10` | `ADD_I` | None | Pop `b`, pop `a`, push `(a + b)` [int] |
| `0x11` | `SUB_I` | None | Pop `b`, pop `a`, push `(a - b)` [int] |
| `0x12` | `MUL_I` | None | Pop `b`, pop `a`, push `(a * b)` [int] |
| `0x13` | `DIV_I` | None | Pop `b`, pop `a`, push `(a / b)` [int] |
| `0x14` | `NEG_I` | None | Pop `a`, push `-a` [int] |
| `0x20` | `ADD_F` | None | Pop `b`, pop `a`, push `(a + b)` [float] |
| `0x21` | `SUB_F` | None | Pop `b`, pop `a`, push `(a - b)` [float] |
| `0x22` | `MUL_F` | None | Pop `b`, pop `a`, push `(a * b)` [float] |
| `0x23` | `DIV_F` | None | Pop `b`, pop `a`, push `(a / b)` [float] |
| `0x24` | `NEG_F` | None | Pop `a`, push `-a` [float] |
| `0x30` | `I2F` | None | Pop int, convert to float, push float |
| `0x31` | `F2I` | None | Pop float, convert to int, push int |
| `0x40` | `CMP_EQ_I` | None | Pop `b`, pop `a`, push `(a == b)` |
| `0x41` | `CMP_NE_I` | None | Pop `b`, pop `a`, push `(a != b)` |
| `0x42` | `CMP_LT_I` | None | Pop `b`, pop `a`, push `(a < b)` |
| `0x43` | `CMP_GT_I` | None | Pop `b`, pop `a`, push `(a > b)` |
| `0x44` | `CMP_LE_I` | None | Pop `b`, pop `a`, push `(a <= b)` |
| `0x45` | `CMP_GE_I` | None | Pop `b`, pop `a`, push `(a >= b)` |
| `0x50` | `CMP_EQ_F` | None | Pop `b`, pop `a`, push `(a == b)` (float) |
| `0x51` | `CMP_NE_F` | None | Pop `b`, pop `a`, push `(a != b)` (float) |
| `0x52` | `CMP_LT_F` | None | Pop `b`, pop `a`, push `(a < b)` (float) |
| `0x53` | `CMP_GT_F` | None | Pop `b`, pop `a`, push `(a > b)` (float) |
| `0x54` | `CMP_LE_F` | None | Pop `b`, pop `a`, push `(a <= b)` (float) |
| `0x55` | `CMP_GE_F` | None | Pop `b`, pop `a`, push `(a >= b)` (float) |
| `0x60` | `JMP` | `int32_t` (4B) | Unconditional jump relative to next PC |
| `0x61` | `JZ` | `int32_t` (4B) | Pop value; jump if zero (false) |
| `0x62` | `JNZ` | `int32_t` (4B) | Pop value; jump if non-zero (true) |
| `0x70` | `PRINT_I` | None | Pop and print int to stdout |
| `0x71` | `PRINT_F` | None | Pop and print float to stdout |
| `0x72` | `PRINT_NL` | None | Print newline `\n` to stdout |
| `0xFF` | `HALT` | None | Terminate VM execution |

---

## 7. Stack Virtual Machine (`minic-vm`) Runtime

### Core VM Representation
```c
typedef union {
    int64_t i;
    double f;
} Value;

typedef struct {
    uint8_t *code;
    size_t code_size;
    size_t ip;

    Value *constants;
    size_t constant_count;

    Value *locals;
    size_t locals_count;

    Value stack[1024];
    size_t sp;

    bool trace_mode;
} VM;
```

### Safety & Execution Invariants
- **Stack Underflow / Overflow:** Bound-checked on push/pop.
- **Division by Zero:** Detected dynamically in `DIV_I` and `DIV_F`, terminating with a clean runtime error message and exit code `2`.
- **Exit Code:** When `HALT` is reached, if the stack contains a return value, it is returned as the process exit code; otherwise `0`.

---

## 8. Cross-Platform Strategy & Build System

### Zero-Dependency C99 Architecture
- Both `minic` and `minic-vm` are written exclusively in ISO C99.
- Uses only `<stdio.h>`, `<stdlib.h>`, `<stdint.h>`, `<string.h>`, `<stdbool.h>`, `<inttypes.h>`.
- No OS-specific APIs (`fork`, `windows.h`, `pthread.h`).
- Little-endian byte encoding is standardized across all platforms.

### Android Compatibility
- Builds natively inside Termux on Android using `pkg install clang make flex bison` followed by `make`.
- Compiled `.mbc` bytecode generated on Linux runs identically when copied to an Android device.

---

## 9. Verification & Test Plan

Automated test runner in `Makefile` executes the following test suite under `src/tests/`:
1. `01_arithmetic.mc`: Complex precedence, negative values, integer and floating-point division.
2. `02_variables.mc`: Multi-variable assignment, chained computations, automatic integer-to-float promotion.
3. `03_control_flow.mc`: `if-else` branching, chained comparisons, and iterative calculation (e.g. Factorial and Fibonacci).
4. `04_scoping.mc`: Block scoping `{ ... }`, nested local shadowing, and proper variable slot reuse.
5. `05_errors.mc`: Test negative cases (undeclared variable, duplicate declarations, assigning float to int without cast) verifying that compiler exits with code `1` and clean diagnostics.
6. `06_trace_verification`: Runs `minic-vm --trace` on compiled bytecode and verifies step-by-step PC increments and stack transitions.
