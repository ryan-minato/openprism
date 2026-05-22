---
name: review-content
description: >
  Evaluate a draft passage, section, caption, or abstract from the openprism
  manuscript against the project's style, quality, and citation standards.
  Use when asked to review, evaluate, or check any prose that will appear in
  the final document — including when the user says "review this section",
  "check this draft", "evaluate the abstract", "is this writing OK",
  "does this follow our style", or "review this caption".
---

# Review Content

Provides a structured evaluation of draft manuscript text against the
project's standards. Reports findings per axis; does not modify the text
unless explicitly asked to do so.

## Before Starting

Read `STYLE.md` in full before evaluating any text. The review axes below
map directly to its sections. If `STYLE.md` is not in context, load it first.

## Workflow

1. **Identify what is being reviewed** — section prose, a figure caption, a
   table caption, the abstract, or a subsection. Note the label or location
   (e.g., `chapters/02_background.tex §2.1`).

2. **Evaluate on five axes**. For each axis, assign one of:
   - **Pass** — meets the standard; no action needed.
   - **Warning** — partially meets the standard; improvement recommended.
   - **Fail** — does not meet the standard; revision required before submission.

   Follow each rating with a brief, specific observation citing the relevant
   line or phrase. Do not pad with praise.

### Axis 1 — Logical Structure

Check that the argument is coherent and flows:
- Does each sentence follow from the previous without an unstated inferential
  step?
- Does each paragraph have a single identifiable central claim?
- Is the order of ideas the natural reading order for the target audience
  defined in `STYLE.md §1`?
- Are there any orphaned claims — statements that appear without being
  connected to either what precedes or what follows?

### Axis 2 — Factual Accuracy

Check that all cited facts are attributable:
- Every claim backed by a `\citep{}` or `\citet{}` call must have a
  corresponding entry in `references.bib`.
- Apply `QUALITY.md §Citation Verification`: the source must exist, the
  source must actually contain the attributed claim, and the key format
  must match `AuthorYYYYkeyword`.
- Flag any claims that look like they need a citation but have none.
- Flag any statistics or measurements that are inconsistent with values
  stated elsewhere in the manuscript.

### Axis 3 — Style Compliance

Check against `STYLE.md §3 Language and Tone`:
- **Register**: is the prose formal, precise, and direct? Flag over-hedged
  phrases ("it could perhaps be suggested that") and overclaims
  ("this definitively proves").
- **Transitions**: are scaffold connectors used as a substitute for logical
  structure (*first… second… finally… in conclusion*)? If so, flag them —
  the argument should carry the reader, not the labels.
- **Analogies**: is any analogy present? If so, is it necessary, and does
  it hold under the specifics of the claim? A loose or unnecessary analogy
  should be flagged.
- **Contrasts**: is any contrasting case introduced solely for rhetorical
  effect, adding no informational content? Flag it.
- **Language currency**: are any buzzwords or trending terms used outside
  the context of defining them? Flag candidates.

### Axis 4 — Typography

Check that project custom commands are used correctly:
- Species names use `\spname{Tursiops truncatus}` (never plain italic or
  bare `\textit{}`).
- Frequency values use `\kHz` or `\Hz` (never bare `kHz` or `Hz` adjacent
  to a number).
- Acoustic sequence archetype labels use `\aseq{brief-farewell}` etc.
  (never plain text or `\textsc{}` directly).
- Confidence intervals use `\ci{a}{b}` (never manually typed brackets).
- Citation commands: `\citep{}` for parenthetical, `\citet{}` for narrative;
  bare `\cite{}` is not acceptable.
- Cross-references use `\cref{}` (never `\ref{}`).

### Axis 5 — Reader Landing

Read the passage as the target reader would — linearly, as if encountering
it for the first time in the paper:
- Does the argument land without needing supplementary explanation from the
  author?
- Are there any sentences that require re-reading to parse?
- Is the level of technical detail calibrated to the audience in `STYLE.md §1`
  (graduate-level bioacoustics/computational linguistics researcher)?
- Does each passage serve the document purpose stated in `STYLE.md §2` — i.e.,
  advancing the empirical claim, not reviewing the field or speculating beyond
  the data?

## Output Format

Report findings in this structure:

```
## Review: <location or title of passage>

### Axis 1 — Logical Structure: <Pass | Warning | Fail>
<Observation. Cite the specific phrase or sentence if applicable.>

### Axis 2 — Factual Accuracy: <Pass | Warning | Fail>
<Observation.>

### Axis 3 — Style Compliance: <Pass | Warning | Fail>
<Observation.>

### Axis 4 — Typography: <Pass | Warning | Fail>
<Observation.>

### Axis 5 — Reader Landing: <Pass | Warning | Fail>
<Observation.>

### Summary
<One or two sentences on the overall state and the highest-priority item
to address.>
```

If all axes pass, say so briefly and do not invent concerns.

## Gotchas

- **Do not modify the text** unless the user explicitly asks. The review
  output is a report; revision is a separate action.

- **Do not review LaTeX syntax or compilation** — that is the domain of
  `just lint` and `QUALITY.md §Source Formatting`. Focus only on the
  communicative content of the prose.

- **Do not comment on word choices unless a word is genuinely wrong or
  obscure** — per `WORKFLOW.md §Content Creation Workflow §Phase 3 Edit`,
  synonym preferences are not in scope for an editorial review.

- **Axis 4 only applies to LaTeX source** — if the user provides compiled
  PDF text without markup, skip Axis 4 and note the limitation.
