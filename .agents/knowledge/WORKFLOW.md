# Workflow

## Summary

Step-by-step operating procedures for all common tasks in the openprism
LaTeX project. Use this document when running toolchain commands, adding
content, or preparing a release.

---

## Compile the Document

```
just build
```

Output: `output/main.pdf`.
On the first run after a clean checkout, latexmk runs pdflatex three times
and biber once to resolve all cross-references and bibliography entries.
Subsequent runs are incremental.

If the build fails, check `output/main.log` for errors before re-running.

## Watch Mode (Incremental Build)

```
just watch
```

Latexmk monitors all source files (`main.tex`, included files) and recompiles
automatically on any change. Press `Ctrl+C` to stop.

## Lint

```
just lint
```

Runs `chktex` with project-configured suppression flags. Fix all reported
warnings before committing. See `.agents/knowledge/REFERENCES.md §chktex`
for flag documentation.

## Format

```
just format
```

Runs `latexindent -w` on all source files in place.
Review the diff before committing: latexindent may reformat long `align`
environments or verbatim blocks unexpectedly.

## Word Count Statistics

```
just stats
```

Runs `texcount -inc -brief -total main.tex`. Reports total and per-file counts.
Mathematical content is excluded from the count by default.

## Cleaning

| Command | Effect |
|---|---|
| `just clean` | Removes `.aux`, `.log`, `.bbl`, `.bcf` etc. in `output/`. Keeps `output/main.pdf`. |
| `just clean-all` | Removes all generated files including `output/main.pdf`. |

Run `just clean-all` before a fresh build to rule out stale cache issues.

## Adding a New Chapter

Quick reference:
1. Create `chapters/NN_name.tex` (e.g., `chapters/04_results.tex`).
2. Add `\input{chapters/04_results}` to `main.tex` after the last existing `\input`.
3. Create `figures/chNN/` directory with a `.gitkeep` placeholder.
4. Start the file with `\section{Title}\label{sec:name}`.

## Adding a Figure

Quick reference:
1. Place the image in `figures/chNN/` (matching the chapter of first reference).
2. Use the standard float block with `[htbp]`, `\centering`, `\includegraphics`,
   `\caption`, `\label` — in that order.
3. Label format: `fig:chNN-descriptive-name`.
4. Reference with `\cref{fig:chNN-descriptive-name}`.

## Content Creation Workflow

Follow this sequence whenever writing or editing prose, captions, or table
content that will appear in the final document. Read `STYLE.md` before
starting.

**Phase 1 — Plan (broad to specific)**

Before writing a single sentence, answer these questions:

1. *Reader.* Who is reading this passage? What do they already know?
   What are they expecting at this point in the paper?
2. *Central message.* What is the one claim or observation this passage
   must convey? If there is more than one, decide the priority order.
3. *Word budget.* How much space does this passage warrant relative to the
   rest of the section? Allocate accordingly; do not let a supporting point
   grow to the length of a main argument.
4. *Logical density.* Is the chain of reasoning too granular (listing every
   micro-step the reader can infer) or too compressed (skipping a link the
   reader genuinely needs)?
5. *Citations.* Every factual claim that needs support — does a verifiable
   source exist? Search before drafting. See `QUALITY.md §Citation
   Verification` for the verification requirement.

**Phase 2 — Write (first draft)**

Write the passage according to the plan. Apply the style rules in
`STYLE.md §3 Language and Tone`. Do not stop to edit individual sentences;
get the argument down first.

**Phase 3 — Edit (editor role)**

Switch to the editor perspective and review the draft for:

- *Logic structure.* Does the argument flow from the plan? Is any step
  missing or out of order?
- *Factual accuracy.* Does every cited claim have a verified source in
  `references.bib`? Are all statistics and descriptions consistent with
  the data?
- *Reading rhythm.* Does the passage feel over-detailed in some places and
  thin in others? Is the level of explanation appropriate for the
  target audience defined in `STYLE.md §1`?
- *Detail balance.* Cut anything that does not serve the central message
  identified in Phase 1.

Do not spend editor time weighing whether one synonym is preferable to
another; that is not what this review pass is for.

**Phase 4 — Review (reader role)**

Read the passage once more as the target reader would: linearly, without
knowing what the author intended. If a sentence requires re-reading to parse,
or if a transition feels abrupt, revise.

---

## Git Commit

**Before committing**, review the staged diff and confirm no unintended
content is included:

```
git diff --staged
```

The gitleaks pre-commit hook in `.pre-commit-config.yaml` scans
automatically for secrets and tokens on every commit. If you notice
anything resembling a credential, API key, or password in the diff,
unstage that file immediately:

```
git reset HEAD <file>
```

**Commit message format** (Linux kernel style):

```
Short imperative title, ≤72 characters, no trailing period

Explain what the change does and why it was made. Wrap the body at
72 characters. The body is optional for trivial changes but required
when the reason for the change is not obvious from the title alone.
```

- Title: imperative mood (*Add section on HMM training*, not *Added* or
  *Adds*); no type prefix (not `feat:` or `fix:`).
- Body: answers *what* and *why*, not *how*. Reference related issues or
  decisions when relevant.

---

## Preparing a Release

1. Run `just lint` — fix all warnings.
2. Run `just clean-all && just build` — ensure clean compilation.
3. Run `just stats` — record word count in the commit message body.
4. Commit following the Git Commit format above (e.g., *Release v1.0*).
5. Push to `main`; GitHub Actions will build and upload the PDF artifact.

## Troubleshooting

**Bibliography not updating**: Run `just clean-all && just build` to force biber re-run.

**Cross-reference warnings (`?`)**: Run build twice; latexmk should handle this
automatically via its dependency tracking.

**latexindent mangled a file**: Restore from git (`git checkout -- <file>`) and
investigate `latexindent`'s `localSettings.yaml` for fine-tuned rules.
