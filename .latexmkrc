# latexmkrc — latexmk configuration for openprism
# Engine: pdflatex; bibliography: biber (via biblatex)
$pdf_mode = 1;          # Use pdflatex to produce PDF
$out_dir  = 'output';   # All output files go to output/
$aux_dir  = 'output';   # Keep .aux and other intermediates in output/ too

# Explicitly set biber as the bibliography backend
$biber = 'biber --input-directory=output --output-directory=output %O %S';

# Never stop for interactive input — treat all errors as non-fatal
$pdflatex = 'pdflatex -interaction=nonstopmode -halt-on-error %O %S';
