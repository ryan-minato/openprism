---
name: add-chapter
description: >
  Add a new chapter or major section file to the openprism LaTeX project following
  the established naming convention, directory layout, and main.tex registration
  pattern. Use when adding a chapter, creating a new section file, or when asked to
  "add a chapter", "create a new section", "scaffold chapter N", or "add results/
  discussion/conclusion sections".
---

# Add Chapter

Ensures new chapter files follow the `NN_name.tex` naming convention,
are registered in `main.tex` in the correct order, and have a
corresponding `figures/chNN/` directory created.

## Workflow

0. **Read `STYLE.md`** before writing any prose in the new chapter file.
   The Content Creation Workflow in `WORKFLOW.md §Content Creation Workflow`
   defines the four phases (Plan / Write / Edit / Review) to follow when
   filling the skeleton with real content.

1. **Determine the chapter number** by counting existing files in `chapters/`:
   `ls chapters/` — use the next available two-digit number (e.g., `04` if
   `01`–`03` exist). Zero-pad to two digits.

2. **Choose a snake_case file name** that matches the section content
   (e.g., `04_results`, `05_discussion`, `06_conclusion`).

3. **Create the chapter file** at `chapters/NN_name.tex` with this skeleton:

   ```latex
   \section{<Title>}
   \label{sec:<name>}

   % Read STYLE.md before writing prose here.
   % Follow the Content Creation Workflow in WORKFLOW.md §Content Creation Workflow.

   % TODO: write content
   ```

   Where `<name>` is the portion after `NN_` (e.g., `results` for `04_results.tex`).

4. **Register the chapter in `main.tex`**: add `\input{chapters/NN_name}` after
   the last existing `\input{chapters/…}` line and before `\printbibliography`.

5. **Create the figures directory** for this chapter:
   `mkdir -p figures/chNN && touch figures/chNN/.gitkeep`
   (replace `NN` with the two-digit chapter number, e.g., `ch04`).

6. **Verify the build** with `just build` — confirm the new section appears
   in the table of contents and no cross-reference warnings are introduced.

7. **Register the new file in the `justfile` lint command**: open `justfile`
   and add `chapters/NN_name.tex` to the file list in the `lint` recipe.
   The lint recipe lists every source file explicitly; omitting a file means
   chktex will not check it.

## Gotchas

- **Do not add `\usepackage` in the chapter file** — all package loading must
  stay in `preamble.tex`. Adding packages in chapter files causes duplicate
  declaration errors.

- **\label must immediately follow \section** — placing `\label` elsewhere in
  the section makes cleveref produce incorrect references like "subsection" or
  "paragraph" instead of "section".

- **File names in `\input` must omit the `.tex` extension** — write
  `\input{chapters/04_results}`, not `\input{chapters/04_results.tex}`.

- **Chapter numbers in figures/** use the `ch` prefix, not just digits —
  `figures/ch04/`, not `figures/04/`.
