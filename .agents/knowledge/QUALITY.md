# Quality Standards

## Summary

Quality and consistency rules for all LaTeX source files in openprism.
Read before writing, reviewing, or refactoring any `.tex` or `.bib` file.
---

## Label Naming

All `\label{}` values must follow the prefix scheme below.
Use lowercase, hyphen-separated words after the prefix.

| Element | Prefix | Example |
|---|---|---|
| Section / subsection | `sec:` | `\label{sec:methodology}` |
| Figure | `fig:chNN-` | `\label{fig:ch02-spectrogram}` |
| Table | `tab:` | `\label{tab:vocalization-comparison}` |
| Equation | `eq:` | `\label{eq:hmm-likelihood}` |
| Definition | `def:` | `\label{def:departure-event}` |
| Hypothesis | `hyp:` | `\label{hyp:specificity}` |

Always place `\label{}` **immediately after** `\caption{}` in figures and tables.
For sections, place `\label{}` on the line directly after `\section{}`.

## Cross-References

- Always use `\cref{}` (cleveref), never bare `\ref{}`.
- For ranges: `\cref{fig:ch01-a,fig:ch01-b}` — cleveref formats automatically.
- Do not manually write "Figure~\ref{}" or "Section~\ref{}".

## Figure Rules

- Place image files in `figures/chNN/` matching the chapter of first reference.
- Supported formats: PDF, PNG, JPEG (prefer PDF for vector graphics).
- Every `\begin{figure}` block must include: `\centering`, `\includegraphics`,
  `\caption`, and `\label` — in that order.
- Use `[htbp]` as the float specifier unless a specific placement is required.
- Width: use `\linewidth` fractions (e.g., `0.75\linewidth`), not fixed `pt`/`cm`.

## Table Rules

- All tables use `booktabs` rules: `\toprule`, `\midrule`, `\bottomrule`.
- No vertical rules (`|` in column specs).
- Complex tables (> 10 rows or spanning > one page) go in `tables/` as separate files.
- `\caption` before `\label`; caption goes **above** the table (place before `\begin{tabularx}`).
- Use `tabularx` (with `X` column) to fill `\linewidth` for full-width tables.

## Bibliography Rules

- Key format: `AuthorYYYYkeyword` (camel-case author surname, 4-digit year, lower-case keyword).
  Examples: `Dent2024farewell`, `Trillian2023signal`.
- Every entry must include `doi` or `url` when available.
- Do not use `@misc` when a more specific type (`@article`, `@inproceedings`, etc.) applies.
- Cite using `\citep{}` for parenthetical, `\citet{}` for narrative citations.
- Do not use `\cite{}` (plain) — use `\citep` or `\citet` only.

## Package Policy

- All `\usepackage{}` calls go in `preamble.tex` **only**.
- Chapter files (`chapters/*.tex`) and table files (`tables/*.tex`) must not contain
  `\usepackage`, `\documentclass`, or `\begin{document}`.
- Style definitions go in `styles/my_style.sty`; load via `\input{styles/my_style}`
  in `preamble.tex`.

## Source Formatting

- Maximum line length: 120 characters in LaTeX source.
- Break source lines at semantic boundaries. Short consecutive sentences may
  share a line; long sentences may break at a meaningful comma or semicolon.
  Never break mid-phrase (between adjective and noun, inside a parenthetical,
  or between a preposition and its object). See `STYLE.md §4`.
- Use `~` for non-breaking spaces before numeric references: `42~recordings`.
- Indent `\item` content by 8 spaces (two tab stops) inside `itemize`/`enumerate`.
- No trailing whitespace.

## Custom Commands

These project-specific commands are defined in `preamble.tex`:

| Command | Expands to | Use for |
|---|---|---|
| `\spname{name}` | `\textit{name}` | Species names |
| `\kHz` | `\,\text{kHz}` | Frequency unit with thin space |
| `\Hz` | `\,\text{Hz}` | Frequency unit with thin space |
| `\ci{a}{b}` | `[a,\,b]` | Confidence intervals |
| `\aseq{label}` | `\textsc{label}` | Acoustic sequence archetype labels |

Do not redefine these or create alternatives with the same purpose.
Add new commands only in `preamble.tex` and document them here.

## Citation Verification

Every citation that appears in the manuscript must satisfy all three
conditions before it is added to `references.bib` or used in the text:

1. **The source exists.** Search for the paper, book, or report using
   available tools (web search, DOI lookup, library databases) and confirm
   that it is a real, retrievable document. Do not assume a plausible-looking
   reference is genuine.

2. **The source says what the citation claims.** Read enough of the source
   to confirm that the attributed claim, statistic, or methodology is
   actually present. A source that is real but does not support the
   specific claim is not an acceptable citation for that claim.

3. **The entry is in `references.bib`.** Every cited key must have a
   corresponding BibLaTeX entry. Key format: `AuthorYYYYkeyword`. Include
   a `doi` or `url` field when available.

If a claim cannot be attributed to a verified source, it must either be
removed or rephrased as the authors' own observation or interpretation,
making clear that no external evidence is cited.
