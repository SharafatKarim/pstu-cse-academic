# Mini-C Bytecode Compiler and Portable Stack Virtual Machine (`minic-vm`)

Academic project for CIT-412: *Compiler Design & Automata Theory Sessional*.

- **Student:** Md. Sharafat Karim (ID: 2102024, Reg: 10151)
- **Faculty:** Department of Computer Science and Engineering, Patuakhali Science and Technology University (PSTU)

---

## Directory Structure

- [`src/`](file:///home/sharafat/Desktop/xplore/Semester%207%20%28academics%29/compiler/project/src): Full source code, compiler driver (`minic`), virtual machine runtime (`minic-vm`), test suite, and [detailed technical documentation](file:///home/sharafat/Desktop/xplore/Semester%207%20%28academics%29/compiler/project/src/README.md).
- [`proposal/`](file:///home/sharafat/Desktop/xplore/Semester%207%20%28academics%29/compiler/project/proposal): Official project proposal, pipeline architecture graph (`pipeline.dot` / `pipeline.svg`), and Typst document (`proposal.typ`).
- [`docs/superpowers/specs/`](file:///home/sharafat/Desktop/xplore/Semester%207%20%28academics%29/compiler/project/docs/superpowers/specs/2026-11-25-minic-vm-design.md): Complete design specification document.
- [`docs/superpowers/plans/`](file:///home/sharafat/Desktop/xplore/Semester%207%20%28academics%29/compiler/project/docs/superpowers/plans/2026-11-25-minic-vm.md): Implementation plan and verification ledger.

---

## Quick Start

```bash
cd src
make all
make test
```

For complete documentation on grammar, parsing methodology (LALR(1) Bottom-Up Shift-Reduce), data types, identifier rules, bytecode specification, and visualization commands, refer to [`src/README.md`](file:///home/sharafat/Desktop/xplore/Semester%207%20%28academics%29/compiler/project/src/README.md).
