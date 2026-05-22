# Default recipe
default: build

# Compile the document to output/main.pdf
build:
    latexmk main.tex

# Watch all source files and rebuild automatically on any change
watch:
    latexmk -pvc main.tex

# Remove intermediate build files (keeps output/main.pdf)
clean:
    latexmk -c main.tex

# Remove all generated files including the compiled PDF
clean-all:
    latexmk -C main.tex

# Display word count statistics for all source files
stats:
    texcount -inc -brief -total main.tex

# Run chktex on all LaTeX source files
lint:
    chktex -wall -n1 -n2 -n3 -n6 -n8 -n22 -n24 -n30 -n46 -q main.tex preamble.tex \
        chapters/01_introduction.tex \
        chapters/02_background.tex \
        chapters/03_methodology.tex \
        tables/comparison_table.tex

# Format all LaTeX source files in-place using latexindent
format:
    latexindent -w -s -g /dev/null main.tex
    latexindent -w -s -g /dev/null preamble.tex
    latexindent -w -s -g /dev/null chapters/01_introduction.tex
    latexindent -w -s -g /dev/null chapters/02_background.tex
    latexindent -w -s -g /dev/null chapters/03_methodology.tex
    latexindent -w -s -g /dev/null tables/comparison_table.tex
