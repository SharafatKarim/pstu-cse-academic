# Compiler Project Proposal Sample & Template

This directory contains a sample project proposal and template designed for **CIT-412: Compiler Design & Automata Theory Sessional**.

It features an alternative sample project topic:
> **Optimizing Three-Address Code (TAC) Compiler and RISC-V Target Code Generator for Nano-C (`nanoc-rv`)**

All personal credentials have been generalized into sample placeholders so that anyone can use this as a reference or starting template.

---

## Files Included

- **`proposal.typ`**: The main Typst document containing:
  - **Page 1**: Project title, student details, Executive Summary (Introduction), Problem Statement, and Proposed Architecture with the pipeline diagram.
  - **Page 2**: Blank Progress Update table for tracking weekly sessional milestones.
- **`pipeline.dot`**: Graphviz DOT source definition for the multi-stage compiler architecture pipeline.
- **`pipeline.svg`**: Rendered vector diagram embedded directly into `proposal.typ`.
- **`proposal.pdf`**: Pre-compiled 2-page PDF document ready for viewing and distribution.

---

## How to Customize for Your Project

### 1. Update Student Details
Open `proposal.typ` and replace the placeholder fields in the grid:
```typst
#grid(
  columns: (1fr, 1fr),
  gutter: 0.35em,
  [*Name:* Your Name], [*ID:* 21020XX],
  [*Registration:* 10XXX], [*Course:* CIT-412], [*Course Title:* Compiler Design & Automata Theory Sessional], [*Faculty:* Computer Science and Engineering, PSTU],
)
```

### 2. Update Content & Sections
- Change the **Title** and **Subtitle** to your chosen compiler topic.
- Update **1. Introduction** with your project's scope, language, and goals.
- Customize **2. Problem Statement** to outline the motivation for your compiler stages.
- Adjust **3. Proposed Architecture** to reflect your pipeline stages.
- Fill out or edit the **Progress Update** table on Page 2 with your weekly milestones.

> **Layout Tip:** Keep the main proposal sections (1, 2, and 3 with the diagram) fitting cleanly on Page 1 so that the `#pagebreak()` neatly places the Progress Update table on Page 2.

### 3. Update the Pipeline Diagram (Optional)
If your pipeline stages differ:
1. Edit `pipeline.dot` to rename or add nodes.
2. Regenerate the SVG:
   ```bash
   neato -Tsvg pipeline.dot -o pipeline.svg
   ```

### 4. Compile to PDF
Compile using the [Typst](https://typst.app/) CLI:
```bash
typst compile proposal.typ proposal.pdf
```
To watch for live updates during editing:
```bash
typst watch proposal.typ proposal.pdf
```
