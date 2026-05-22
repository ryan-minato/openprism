# openprism

## Purpose

Academic LaTeX project: research article on pre-departure acoustic
farewell sequences in *Tursiops truncatus*, analyzing 42 departure events
from three Atlantic populations with HMM and spectral envelope methods.

## Structure

```
openprism/
├── main.tex            ← Document root: class, \input{preamble}, chapter calls
├── preamble.tex        ← All \usepackage calls and custom commands (\spname, \kHz …)
├── references.bib      ← BibLaTeX database; key format: AuthorYYYYkeyword
├── .latexmkrc          ← latexmk config: pdflatex engine, output/ dir, biber
├── justfile            ← Toolchain: build, watch, clean, clean-all, stats, lint, format
├── chapters/           ← One .tex file per section; filename: NN_name.tex
├── figures/            ← Images organized by chapter: figures/chNN/name.ext
├── tables/             ← Stand-alone table files included via \input{}
├── styles/             ← my_style.sty: color palette, theorem envs, section headings
└── output/             ← Compiled output; tracked only via .gitkeep (gitignored)
```

## Core Conventions

- **Language**: All project files (source, comments, commit messages, docs) are in English.
- **Engine**: pdflatex via `latexmk`; bibliography backend: `biber`.
- **Bibliography**: BibLaTeX `authoryear` style; key format `AuthorYYYYkeyword`.
- **Labels**: `sec:name`, `fig:chNN-name`, `tab:name`, `eq:name`, `def:name`, `hyp:name`.
- **Figures**: Place in `figures/chNN/`; include with `\includegraphics`; caption then `\label`.
- **Tables**: Complex tables go in `tables/`; reference with `\cref{tab:name}`.
- **References**: Cross-reference with `\cref{}` (cleveref), not `\ref{}`.
- **Commits**: Linux kernel style — imperative title (≤72 chars), blank line, body explaining what and why.
- **Line length**: ≤ 120 characters in source; prefer one sentence per source line in prose.

## When to Read What

| Read | When |
|---|---|
| `STYLE.md` | writing or editing any prose that will appear in the final document |
| `.agents/knowledge/QUALITY.md` | writing or reviewing any LaTeX source |
| `.agents/knowledge/REFERENCES.md` | needing latexmk, biblatex, chktex, or texcount docs |
| `.agents/knowledge/WORKFLOW.md` | running toolchain commands or planning a release |
| `HARNESS_EVOLUTION.md` | proposing harness improvements or filing a 3× rule trigger |

## Validation

| Command | Scope |
|---|---|
| `just build` | Full document compiles to `output/main.pdf` |
| `just lint` | chktex passes on all source files |
| `just stats` | texcount reports per-chapter word counts |
| `just clean` | Removes intermediates; `just clean-all` also removes the PDF |

## Harness Governance

Active mode. The **3× rule** applies: when a recurring agent behavior
pattern is observed three times, distill it into a skill. Log all harness
changes in `HARNESS_EVOLUTION.md`.
