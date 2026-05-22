---
name: add-table
description: >
  Add a style-consistent table to any chapter in the openprism LaTeX project
  following the booktabs/tabularx conventions, caption-above placement,
  label ordering, and statistical value formatting defined in QUALITY.md and
  STYLE.md. Use when adding a comparison table, data table, or results table,
  or when asked to "add a table", "create a table", "add a comparison table",
  "insert a results table", or "make a table for this data".
---

# Add Table

Ensures all tables follow the project's `booktabs`/`tabularx` conventions,
are placed in the correct location (inline vs. external file), and comply
with the statistical formatting rules in `STYLE.md §5`.

## Before Starting

Check `QUALITY.md §Table Rules` and `STYLE.md §5 Figures and Data
Standards` before choosing a column spec or formatting numerical values.

## Workflow

### Step 1 — Decide: inline or external file

| Condition | Placement |
|---|---|
| ≤ 10 rows AND referenced only once | Inline in the chapter file |
| > 10 rows OR referenced from multiple chapters | External file in `tables/` |

For external files, name the file `tables/<descriptive-name>.tex`
(e.g., `tables/comparison_table.tex`) and include it from the chapter
with `\input{tables/<descriptive-name>}`.

### Step 2 — Choose the column spec

- `l` — left-aligned text (category labels, descriptions)
- `r` — right-aligned numbers (counts, frequencies, durations)
- `X` — stretchable column that fills remaining width (`tabularx` only)
- Do **not** use vertical rules (`|`) in column specs.
- Do **not** use `S[]` columns from `siunitx` — that package is not loaded
  in this project. Use `r` columns with `$\pm$` in math mode for ±.
- For full-width tables, wrap in `tabularx{\linewidth}{...}`.
- For narrow tables that should not span the full width, use plain `tabular`.

### Step 3 — Write the table source

Use this template for an external-file or inline table:

```latex
\begin{table}[htbp]
  \caption{<Caption text describing what the table shows.>}
  \label{tab:<descriptive-name>}
  \begin{tabularx}{\linewidth}{l r r X}
    \toprule
    <Column Head 1> & <Column Head 2> & <Column Head 3> & <Column Head 4> \\
    \midrule
    <row 1 data> & <val> & <val> & <text> \\
    <row 2 data> & <val> & <val> & <text> \\
    \bottomrule
  \end{tabularx}
\end{table}
```

Key rules:
- `\caption` comes **before** `\begin{tabularx}` (above the table).
- `\label` immediately follows `\caption` on the next line.
- Use `\toprule`, `\midrule`, `\bottomrule` only — no `\hline`.
- No vertical rules in column spec.
- Float specifier: `[htbp]` unless a specific placement is required.

### Step 4 — Format statistical values

Apply `STYLE.md §5` formatting rules:

| Value type | Format | Example |
|---|---|---|
| Frequency | 1 decimal place + `\kHz` | `$9.8$\,\kHz` |
| Duration | 1 decimal place + unit | `$1.4$\,s` |
| Count | integer | `18` |
| Proportion / correlation | 2 significant figures | `$0.86$` |
| Mean ± SD | `$\mu \pm \sigma$` | `$9.8 \pm 0.4$` |

Use `$...$` inline math for ± expressions:
```latex
$12.4 \pm 1.2$
```

### Step 5 — Add the cross-reference in the text

Insert a `\cref{}` reference in the body text *before* the float location:

```latex
\Cref{tab:<descriptive-name>}   % At the start of a sentence
\cref{tab:<descriptive-name>}   % Mid-sentence
```

### Step 6 — Register external files in the lint command (external only)

If the table is in `tables/<name>.tex`, open `justfile` and add it to the
file list in the `lint` recipe:

```
chktex ... tables/<name>.tex
```

The lint recipe lists every source file explicitly; omitting a file means
chktex will not check it.

### Step 7 — Verify the build

Run `just build` and confirm:
- The table renders and the caption number is correct.
- `\cref{tab:…}` resolves to the right number in the body text.
- No `Underfull \hbox` or `Overfull \hbox` warnings from the table.

## Gotchas

- **`tabularx` requires the `tabularx` package** — it is already loaded in
  `preamble.tex`. Do not add a second `\usepackage{tabularx}` anywhere.

- **Multi-line headers in `r` columns** — use `\makecell[r]{Line 1\\Line 2}`
  (from the `makecell` package, already loaded in `preamble.tex`) when a
  column header is wider than its data cells. This keeps the column width
  determined by the data, not the header, which preserves space for `X`
  columns. Example: `\makecell[r]{\textbf{Peak Freq.}\\\textbf{(\kHz)}}`.

- **Caption above, not below** — academic convention for tables (per
  `QUALITY.md §Table Rules`) is caption above the table body. Always put
  `\caption`/`\label` before `\begin{tabularx}`.

- **No `\usepackage` in table files** — external table files included via
  `\input{}` must not contain `\usepackage`, `\documentclass`, or
  `\begin{document}`. Package loading belongs in `preamble.tex` only.

- **siunitx `S[]` columns are not available** — `siunitx` is not in
  `preamble.tex`. Do not use `S[...]` column type. Use `r` columns and wrap
  numeric values in `$...$` for math spacing.

- **`\label` key prefix for tables is `tab:`** — not `tbl:` or `table:`.
  Example: `\label{tab:vocalization-comparison}`.

- **Long number columns may need manual alignment** — without `siunitx`,
  decimal alignment must be done by hand if needed. Acceptable to omit
  decimal alignment for tables where values have varying decimal counts;
  just use `r` and ensure consistent precision per `STYLE.md §5`.
