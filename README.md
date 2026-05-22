# openprism

> **An AI-first template for human–AI collaborative academic writing.**
> The goal is the quality and prose clarity of [OpenAI Prism](https://openai.com/research/)—sharp, precise, uncluttered—
> achieved through a self-evolving agent guidance layer called the *harness*.

[![Build](https://github.com/ryan-minato/openprism/actions/workflows/build.yml/badge.svg)](https://github.com/ryan-minato/openprism/actions/workflows/build.yml)

---

## What is this?

openprism is a LaTeX article template designed for a workflow where a human author
and one or more AI agents co-write the manuscript from the first draft to submission.
It is not a passive skeleton—it embeds a living system of guidance files that tell
agents *how* to write, *what* to avoid, and *where* to look when uncertain.

The benchmark for output quality is the writing found in high-caliber research
communications: precise claims, clean structure, no detectable scaffolding,
no hedging noise, no hallucinated citations.

---

## The Harness

The *harness* is the layer of agent guidance that lives alongside the LaTeX source.
It consists of:

| Layer | Files | Purpose |
|---|---|---|
| Entry point | `AGENTS.md` | Project overview, conventions, when-to-read map, validation commands |
| Style guide | `STYLE.md` | Prose standards: tone, register, typography, figures, citations |
| Quality rules | `.agents/knowledge/QUALITY.md` | LaTeX source rules: labels, cross-refs, figures, tables, bibliography |
| Workflow | `.agents/knowledge/WORKFLOW.md` | Runbooks for build, lint, format, content creation, git |
| References | `.agents/knowledge/REFERENCES.md` | External tool docs (latexmk, biblatex, chktex, texcount) |
| Skills | `.agents/skills/` | Step-by-step SOPs for add-chapter, add-figure, add-table, review-content |
| Evolution log | `HARNESS_EVOLUTION.md` | Chronological record of every harness change and its rationale |

### Self-evolution: the 3× rule

When any failure pattern recurs three times without a skill covering it,
a new harness entry is filed and a corrective skill is created.
The harness is meant to improve with the project, not remain static.
Every agent-triggered change is logged in `HARNESS_EVOLUTION.md` with
the trigger, the change, and the rationale.

---

## Suppressing AI-ness

AI agents produce recognizable failure modes even when the output is
technically correct. The harness addresses each one explicitly:

| Pattern | What it looks like | Harness countermeasure |
|---|---|---|
| **Scaffolding connectors** | *"First… second… finally… in conclusion"* substituting for argument structure | `STYLE.md §3`: banned; restructure the argument instead |
| **Over-hedging** | *"It could perhaps be suggested that…"* | `STYLE.md §3`: state uncertainty plainly and only when genuine |
| **Overclaiming** | *"This conclusively proves…"* | `STYLE.md §3`: say only what the data show |
| **Loose analogies** | Analogies imported for rhetorical effect that don't survive scrutiny | `STYLE.md §3`: use only when necessary and verifiable |
| **Hallucinated citations** | Plausible-looking references that don't exist | `QUALITY.md §Citation Verification`: 3-condition check (exists, supports the claim, key in .bib) |
| **Fashionable opacity** | Terms trendy now but opaque in ten years | `STYLE.md §3`: write for a reader in 50 years; define contested terms |
| **Non-semantic line breaks** | Source lines broken mid-phrase at a fixed column count | `STYLE.md §4` + `QUALITY.md §Source Formatting`: break only at semantic boundaries |

The `review-content` skill provides a structured 5-axis audit
(Logical Structure, Factual Accuracy, Style Compliance, Typography, Reader Landing)
that any agent can invoke on any draft passage before it is committed.

---

## How to use

### 1. Open in the dev container

The repository ships with a `.devcontainer/` configuration based on
`texlive/texlive:latest`. Open the folder in VS Code and select
**Reopen in Container**. All tools (latexmk, biber, chktex, just, pre-commit) are
pre-installed.

### 2. Build

```sh
just build      # compile to output/main.pdf
just watch      # continuous rebuild on save
just lint       # chktex on all source files
just stats      # texcount word counts per chapter
```

### 3. Write with an AI agent

Point your agent at `AGENTS.md` as the entry context.
The file's *When to Read What* table directs the agent to the right guidance
for each task. Agents should read `STYLE.md` before writing any prose,
and `QUALITY.md` before modifying any LaTeX source.

### 4. Evolve the harness

When you notice a recurring agent error, log it in `HARNESS_EVOLUTION.md`
and (if it has occurred three times) create or update a skill in `.agents/skills/`.
The harness improves because *you* improve it.

---

## AI-related files

The following files are specific to the human–AI collaboration layer.
If you want a plain LaTeX template with no agent guidance, delete them.

```
AGENTS.md                      ← agent entry point and project conventions
STYLE.md                       ← prose style guide for agents
HARNESS_EVOLUTION.md           ← change log for the harness
.agents/
  knowledge/
    QUALITY.md                 ← LaTeX source quality rules
    REFERENCES.md              ← external tool documentation links
    WORKFLOW.md                ← build, lint, content-creation runbooks
  skills/
    add-chapter/SKILL.md       ← SOP for adding a chapter
    add-figure/SKILL.md        ← SOP for inserting a figure
    add-table/SKILL.md         ← SOP for inserting a table
    review-content/SKILL.md    ← structured 5-axis prose review
```

Deleting the files above leaves a fully functional LaTeX project:
`main.tex`, `preamble.tex`, `chapters/`, `figures/`, `tables/`,
`styles/my_style.sty`, `references.bib`, `justfile`, `.latexmkrc`,
and the CI workflow in `.github/workflows/build.yml`.

---

## License

[MIT](LICENSE)
