.DEFAULT_GOAL := all

FIGURES = $(wildcard figures/*.svg)

WATCH_SCRIPT = \
	from livereload import Server, shell; \
	server = Server(); \
	server.watch('document.md', shell('make html', cwd = '.')); \
	server.serve(root = '.'); \

watch-html:
	echo "$(WATCH_SCRIPT)" | python

hello:
	@echo ""
	@echo -e " \033[1mSuper awesome Paper Builder v1.0\033[m"
	@echo "-----------------------------------"

all: html pdf

announce-figures-pdf:
	@echo -e "> \033[1minkscape:\033[m SVG => PDF"

pdf: hello latex announce-figures-pdf figures-pdf build-latex
html: hello build-html

latex: fix-bibliography-encoding
	@echo -e "> \033[1mpandoc:\033[m Markdown => Latex"
	@pandoc document.md \
		--from markdown \
		--bibliography bibliography.bib \
		--filter pandoc-crossref \
		--filter resources/pandoc-table.py \
		--filter resources/pandoc-figure.py \
		--template resources/bare-conf.tex \
		--output document.tex \
		--number-sections \
		--natbib \
		--smart

build-html: fix-bibliography-encoding
	@echo -e "> \033[1mpandoc:\033[m Markdown => HTML"
	@pandoc document.md \
		--from markdown \
		--css resources/html.css \
		--template resources/html5.html \
		--bibliography bibliography.bib \
		--filter resources/pandoc-figure.py \
		--filter pandoc-crossref \
		--filter pandoc-citeproc \
		--output document.html \
		--csl resources/ieee.csl \
		--table-of-contents \
		--number-sections \
		--html-q-tags \
		--natbib \
		--webtex \
		--smart

build-latex:
	@echo -e "> \033[1mxelatex:\033[m Latex => PDF"
	@resources/latexrun -O . \
		-Wno-all \
		--latex-cmd pdflatex \
		--bibtex-cmd biber document

fix-bibliography-encoding:
	@echo -e "> fixing bibliography encoding"
	@sed -i -e "s/{\\\_}/_/g" "bibliography.bib"
	@sed -i -e "s/{\\\~}/~/g" "bibliography.bib"

figures-pdf: $(FIGURES:%.svg=%.pdf)

%.pdf: %.svg
	@echo -e "  - $*"
	@inkscape -A $*.pdf $*.svg >/dev/null 2>&1

clean:
	@resources/latexrun --clean-all
	@rm -f figures/*.pdf
	@rm -f document.tex
