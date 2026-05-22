# Harness Evolution Log

Newest entries first. Each entry records one harness change: what changed,
what triggered it, and why it improves agent quality.

---

## Entry Format

```markdown
## [YYYY-MM-DD] — [Short Change Summary]

**Type:** New Component | Refinement | Removal | Restructure | Governance Change
**Component:** [e.g., `.agents/skills/add-chapter/SKILL.md`]
**Trigger:** [What caused this change]
**Change:** [What was added, modified, or removed]
**Rationale:** [Why this change improves harness quality]
```

---

## Log

## 2026-05-22 — Full harness bootstrap and evolution

**Type:** New Component → Enhancement → Refinement → Bugfix
**Components:** All harness and project source files
**Trigger:** Project initialization through iterative refinement over a single
session: bare repository → full harness → style specification → skill expansion
→ harness audit → table layout fix.
**Change:**

### Phase 1 — Initial bootstrap
- `AGENTS.md`: entry point with directory structure, conventions, when-to-read
  table, and validation commands.
- `.agents/knowledge/REFERENCES.md`: external docs for latexmk, biblatex,
  chktex, latexindent, texcount.
- `.agents/knowledge/QUALITY.md`: label naming, cross-reference, figure/table,
  bibliography, and source formatting rules.
- `.agents/knowledge/WORKFLOW.md`: runbook for all common operations
  (build, watch, lint, format, stats, clean, adding chapters/figures, git).
- `.agents/skills/add-chapter/SKILL.md`: SOP for adding chapter files with
  correct naming, `\input` registration, and label prefixes.
- `.agents/skills/add-figure/SKILL.md`: SOP for float structure, caption/label
  ordering, and `\cref` cross-reference convention.
- `.latexmkrc`, `justfile`, `.pre-commit-config.yaml`, GitHub Actions CI,
  `preamble.tex`, `styles/my_style.sty`, example chapters, `references.bib`.

### Phase 2 — STYLE.md and writing discipline
- `STYLE.md` (new): 7-section style spec covering audience, tone, typography,
  figures, symbols, citations, and mandatory standards.
- `WORKFLOW.md`: added Content Creation Workflow (4 phases) and Git Commit
  (Linux kernel style) sections.
- `QUALITY.md`: added Citation Verification section (3 conditions).
- `AGENTS.md`: added `STYLE.md` row to When to Read What; switched commit
  convention from Conventional Commits to Linux kernel style.

### Phase 3 — Skill expansion and example alignment
- `add-chapter`: added Step 0 (read STYLE.md + Content Creation Workflow)
  and Step 7 (register in justfile lint).
- `add-figure`: added Step 0 (check QUALITY.md §Figure Rules + STYLE.md §5),
  `\fbox{...}` placeholder recipe, caption self-containment Gotcha.
- `review-content` (new): 5-axis structured review (Logical Structure,
  Factual Accuracy, Style Compliance, Typography, Reader Landing); read-only.
- `add-table` (new): inline vs. external decision, column spec rules, booktabs/
  tabularx template, STYLE.md §5 stat formatting, lint registration step.
- Example chapters: added STYLE.md/WORKFLOW.md reference comments; replaced
  `\subsubsection` with `\paragraph` (STYLE.md §4); removed `\centering` and
  `\small` from `tables/comparison_table.tex`.

### Phase 4 — Harness audit: remove explicit skill path references
- `AGENTS.md`: removed 4 skill-path rows from When to Read What table
  (framework handles skill loading; explicit pointers are redundant noise).
- `WORKFLOW.md`: removed two "See .agents/skills/X/ for full SOP" lines.

### Phase 5 — Table column layout fix + makecell
- `preamble.tex`: added `\usepackage{makecell}` (multi-line header cells).
- `tables/comparison_table.tex`: changed column spec from `l r r r X` to
  `X r r r X` (both text columns flexible); wrapped "Peak Freq. (\kHz)"
  header with `\makecell[r]` to reduce that `r` column from ~3.8 cm to
  ~2.1 cm, freeing ~1.7 cm for the Characteristic Feature column (~3 cm →
  ~4.6 cm).
- `add-table` Gotcha: documented `\makecell` pattern for long `r` headers.

**Rationale:** Active governance with skill-based consistency suits this
project because LaTeX workflows are well-defined and error-prone without
explicit guidance. Separating style (STYLE.md), quality rules (QUALITY.md),
and workflow (WORKFLOW.md) lets agents load only what is relevant. Removing
explicit skill pointers from AGENTS.md keeps the entry point concise; the
framework resolves skills by description match. The table fix corrects a
structural layout defect caused by a header-dominated column width.

---

## 3× Rule Reference

When any of the following patterns recur **three times** without a skill covering them,
file a new entry here and create the corresponding skill:

- Agent places `\label` before `\caption` in a figure float
- Agent adds `\usepackage` inside a chapter file
- Agent writes `\ref{}` instead of `\cref{}`
- Agent omits `.gitkeep` when creating a new figures/ subdirectory
- Agent uses `\cite{}` instead of `\citep{}` / `\citet{}`
- Any new pattern observed 3 times without existing guidance

<!-- Add new entries above this line. Oldest entries at the bottom. -->
