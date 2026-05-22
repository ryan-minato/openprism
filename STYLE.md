# Style Guide

This document defines the presentational and stylistic standards for the
openprism manuscript. Read it whenever writing or editing any text, table,
or figure caption that will appear in the final document.

---

## 1. Target Audience

The primary audience is active researchers in bioacoustics and computational
linguistics at graduate level or above. Readers are assumed to be familiar
with discrete-time hidden Markov models, Fourier-based spectral analysis,
and standard cetacean communication terminology. Methods and notation from
these areas need not be introduced from first principles; terminology from
adjacent fields (e.g., minimalist syntax, principal component analysis)
should be briefly glossed on first use if it is not the paper's primary
focus.

A secondary audience consists of reviewers at journals such as *Animal
Behaviour*, *Journal of the Acoustical Society of America*, and
*Computational Linguistics*, who may read across subfields. The manuscript
should be self-contained enough that a reviewer outside the author's exact
specialization can follow the argument.

---

## 2. Document Purpose

This is an original empirical research article submitted to a peer-reviewed
journal. Its contribution is a computational acoustic characterization of
departure-specific vocalizations in wild *Tursiops truncatus*, supported by
a new annotated corpus (ACFC v1.0). The manuscript makes an empirical claim
backed by quantitative evidence; it is not a review article, a position
paper, or a methods paper, and it should not read like one.

Every section should serve this purpose. Background exists to situate the
claim, not to survey the field exhaustively. Methodology exists to make the
results reproducible. Discussion exists to interpret the results and
acknowledge their limits—not to speculate beyond what the data support.

---

## 3. Language and Tone

**Language.** All manuscript text is in English. Use standard American
English spelling throughout (*analyze*, not *analyse*; *behavior*, not
*behaviour*).

**Register.** Formal academic prose. Precise and direct: say what the data
show, no more and no less. Avoid both over-hedging ("it could perhaps be
suggested that") and overclaiming ("this proves conclusively"). When
uncertainty is genuine, state it plainly.

**Transitions.** Let the logic carry the reader between sentences and
paragraphs. Do not use scaffolding connectors (*first … second … finally …
in conclusion*) to substitute for actual argumentative structure. If the
order of ideas needs to be made explicit, restructure the argument rather
than labeling the steps.

**Analogies.** Use only when the target concept is genuinely abstract and
the analogy illuminates something the plain description does not. Before
introducing one, confirm: (a) is it necessary, and (b) does it hold up
under the specifics of the claim? A loose analogy misleads more than it
helps.

**Contrasts.** Introduce a contrast only when it clarifies something the
reader would otherwise misunderstand. A contrast object imported solely for
rhetorical effect adds words without adding information.

**Language currency.** Avoid terms that are fashionable at the time of
writing but may be opaque or carry different connotations in the future.
Write for a reader in 50 years as much as for one today. If a technical
term is genuinely contested or newly coined, define it on first use.

---

## 4. Typography and Formatting

**Heading hierarchy.** Use `\section` and `\subsection` only; avoid
`\subsubsection` unless absolutely necessary. Heading titles use title
case.

**Fonts and colors.** Defined in `styles/my_style.sty`. Do not introduce
inline `\textcolor`, `\bfseries`, or font-size commands in the manuscript
body; if a new typographic element is needed, add it to `my_style.sty`
instead.

**Sentence spacing.** Single space after periods (LaTeX default; do not add
`\ ` or `\quad` between sentences).

**Numbers in prose.** Spell out integers one through nine; use digits for
10 and above, and always for quantities accompanied by a unit
(e.g., *3 sites*, *42 events*, *96 kHz*).

**LaTeX source line breaks.** Break source lines at logical boundaries, not
at a fixed character count. The appropriate places to break are: after a
complete sentence, or within a long sentence at a clause boundary (after a
comma or semicolon). A blank line between source blocks creates a new
paragraph; a plain newline does not—use it only for readability of the
source.

---

## 5. Figures and Data Standards

**Captions.** A caption must be self-contained: a reader should understand
what the figure shows without consulting the body text. State what is
plotted, what the axes represent (with units), and what encoding (color,
symbol) means. End with a period.

**Axis labels and units.** All axes must be labeled. Units follow the value
with a thin space using `\kHz` or `\Hz` for frequency, and plain text for
dimensionless quantities. Do not use abbreviations in axis labels unless
they have been defined in the body text.

**Color palette.** Use the project palette from `styles/my_style.sty`:
`OceanDeep` for primary data series, `OceanMid` for secondary,
`CoralAccent` for highlights or contrast elements, `NoteGray` for
supplementary information. Do not introduce colors outside this palette
without updating `my_style.sty` first.

**Statistical values.** Report as mean ± standard deviation unless the
distribution is markedly non-normal, in which case use median [IQR] and
state why. Round to one decimal place for frequency (kHz) and duration (s)
values; two significant figures for dimensionless statistics (e.g.,
Cohen's κ).

**Tables.** Use `booktabs` rules only (no vertical lines). Numerical
columns should be right-aligned or aligned on the decimal point. See
`tables/comparison_table.tex` for the reference format.

---

## 6. Symbols and Citations

**Species names.** Always render in italics using `\spname{Tursiops
truncatus}` on first full use; thereafter `\spname{T.\ truncatus}` is
acceptable within the same section.

**Frequency units.** Use `\kHz` and `\Hz` (defined in `preamble.tex`),
which typeset the unit with a preceding thin space. Never write
`kHz` or `Hz` as plain text adjacent to a number.

**Acoustic sequence labels.** Use `\aseq{brief-farewell}`,
`\aseq{extended-farewell}`, `\aseq{urgent-departure}` (renders in small
caps) when referring to the three identified archetypes.

**Inline math.** Use `$...$` for inline mathematical expressions.

**Citations.** Use `\citet{}` when the author name is grammatically part of
the sentence (*Prefect (2025) shows that…*) and `\citep{}` for parenthetical
citations (*…has been documented \citep{Prefect2025syntax}*). Do not use
bare `\cite{}`. Multiple citations in one parenthesis are separated by
commas in a single `\citep{key1,key2}` call.

---

## 7. Other Mandatory Standards

*(No project-specific mandatory standards are defined at this time.
This section is reserved for future additions.)*
