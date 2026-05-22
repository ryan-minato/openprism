# External References

## Summary

External documentation links for all tools in the openprism toolchain.
Read when you need API details, command-line flags, or configuration
syntax for any tool listed below.

---

## latexmk

- Docs (man page): <https://www.cantab.net/users/johncollins/latexmk/latexmk-480b.pdf>
- Key options: `-pdf` (pdflatex), `-pvc` (watch), `-c` (clean), `-C` (clean-all),
  `-output-directory=<dir>`
- Config file: `.latexmkrc` — use `$pdf_mode`, `$out_dir`, `$aux_dir`, `$biber`

## BibLaTeX + Biber

- BibLaTeX manual: <https://mirror.ctan.org/macros/latex/contrib/biblatex/doc/biblatex.pdf>
- Biber docs: <https://mirror.ctan.org/biblio/biber/documentation/biber.pdf>
- This project uses `style=authoryear`, `backend=biber`, `natbib=true`.
- Key commands: `\citep{}`, `\citet{}`, `\printbibliography`, `\addbibresource`.

## chktex

- Docs: <https://www.nongnu.org/chktex/ChkTeX.pdf>
- Flags used in this project:
  - `-wall` — enable all warnings
  - `-n1` — suppress "$…$" vs `\(…\)` warning (intentional style choice)
  - `-n2` — suppress non-breaking space warning (handled by microtype)
  - `-n3` — suppress parenthesis enclosure warning
  - `-q` — quiet mode (suppress progress output)
- Config file: `.chktexrc` (optional, not currently in project)

## latexindent

- Docs: <https://raw.githubusercontent.com/cmhughes/latexindent.pl/refs/heads/main/documentation/index.rst>
- Flags: `-w` (write in place), `-s` (silent), `-g /dev/null` (discard log).
- Config: `localSettings.yaml` (optional, not currently in project).
- Note: latexindent preserves blank lines but may reformat comment indentation.

## texcount

- Docs: <https://app.uio.no/ifi/texcount/documentation.html>
- Flags used: `-inc` (process \input files), `-brief` (compact output), `-total`.
- Does not count content inside `\begin{equation}…\end{equation}` by default.

## LaTeX Wikibook

- Full reference: <https://en.wikibooks.org/wiki/LaTeX>
- Useful sections: Mathematics, Tables (booktabs), Floats (figures), Bibliography.

## Relevant CTAN Package Pages

- `biblatex`: <https://ctan.org/pkg/biblatex>
- `booktabs`: <https://ctan.org/pkg/booktabs>
- `cleveref`: <https://ctan.org/pkg/cleveref>
- `geometry`: <https://ctan.org/pkg/geometry>
- `hyperref`: <https://ctan.org/pkg/hyperref>
- `microtype`: <https://ctan.org/pkg/microtype>
- `titlesec`: <https://ctan.org/pkg/titlesec>
