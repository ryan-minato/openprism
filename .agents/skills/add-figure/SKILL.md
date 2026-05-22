---
name: add-figure
description: >
  Add a figure to any chapter in the openprism LaTeX project following the
  established directory layout, float structure, caption/label ordering, and
  cleveref cross-reference convention. Use when inserting an image, plot, or
  diagram, or when asked to "add a figure", "include an image", "add a plot",
  "insert a diagram", or "reference figure N".
---

# Add Figure

Ensures figures are placed in the correct `figures/chNN/` subdirectory,
follow the standard float template, and are consistently cross-referenced
with `\cref{}`.

## Workflow

0. **Check the relevant standards** before proceeding:
   - `QUALITY.md §Figure Rules` — float structure, file formats, specifier,
     width convention.
   - `STYLE.md §5 Figures and Data Standards` — caption self-containment,
     color palette, axis labels, statistical value formatting.

1. **Identify the chapter of first reference**: the figure's directory
   corresponds to the chapter where it is *first cited*, not where the
   image logically belongs (e.g., if a figure is first cited in
   `chapters/02_background.tex`, place it in `figures/ch02/`).

2. **Place the image file** in `figures/chNN/<descriptive-name>.<ext>`.
   - Use PDF for vector graphics; PNG or JPEG for raster.
   - Use lower-case, hyphen-separated file names (e.g., `spectrogram-site-a.pdf`).

3. **Insert the float block** in the chapter file at the desired location:

   ```latex
   \begin{figure}[htbp]
     \centering
     \includegraphics[width=0.75\linewidth]{chNN/<descriptive-name>}
     \caption{<Caption text.>}
     \label{fig:chNN-<descriptive-name>}
   \end{figure}
   ```

   **If the image file is not yet available**, use a placeholder instead of
   `\includegraphics` so the build does not fail:

   ```latex
   \begin{figure}[htbp]
     \centering
     \fbox{\rule{0pt}{4cm}\hspace{8cm}}%
     \caption{<Caption text. Replace placeholder with actual figure.>}
     \label{fig:chNN-<descriptive-name>}
   \end{figure}
   ```

   Replace the `\fbox` block with `\includegraphics` once the image file is
   placed in `figures/chNN/`.

   - `\graphicspath{{figures/}}` is already set in `preamble.tex`, so the
     path inside `\includegraphics` starts from `figures/` — write
     `{chNN/filename}`, not `{figures/chNN/filename}`.
   - Width: use `\linewidth` fractions (`0.75\linewidth`), not fixed units.
   - Order is mandatory: `\centering` → `\includegraphics` → `\caption` → `\label`.

4. **Add the cross-reference** in the text *before* the float, using:
   ```latex
   \Cref{fig:chNN-<descriptive-name>}   % At the start of a sentence
   \cref{fig:chNN-<descriptive-name>}   % Mid-sentence
   ```

5. **Verify the build** with `just build` — confirm the figure renders,
   the caption number is correct, and the cross-reference resolves.

## Gotchas

- **`\label` must come after `\caption`** — placing `\label` before `\caption`
  causes the caption counter to be one behind the label, producing wrong numbers.

- **`\graphicspath` is already configured** — do not write `figures/chNN/filename`
  inside `\includegraphics`; the `figures/` prefix is added automatically.
  This is set in `preamble.tex` via `\graphicspath{{figures/}}`.

- **Do not use `[h!]` or `[H]` specifiers** unless absolutely necessary;
  always use `[htbp]`. Forcing placement (`[H]`) breaks LaTeX's float
  balancing and commonly causes overfull vbox warnings.

- **File extension in `\includegraphics` must be omitted** when the format
  could vary — write `{ch01/spectrogram}`, not `{ch01/spectrogram.pdf}`.
  This lets pdflatex auto-select the best available format.

- **Label prefix must match chapter number** — a figure first cited in
  chapter 3 must have label `fig:ch03-…`, even if the image file is stored
  in `ch01/` for thematic reasons. Consistency is with first citation, not
  file location.

- **Caption must be self-contained** — per `STYLE.md §5`, a reader should
  understand the figure without consulting the body text. Include: what is
  plotted, what the axes or encoding mean, and units. Use `\kHz` / `\Hz`
  for frequency units; use `OceanDeep`/`OceanMid`/`CoralAccent` color names
  if referring to series encoding.
