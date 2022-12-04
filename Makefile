esej-psychologiczny.pdf: ./esej-psychologiczny/essay.md ./esej-psychologiczny/essay.bib ./default.yaml
	pandoc -C ./esej-psychologiczny/essay.md -o ./esej-psychologiczny.pdf \
		--metadata-file=./default.yaml \
		--pdf-engine=xelatex \
		--template ./eisvogel.tex

esej-psychologiczny.swps.pdf: ./esej-psychologiczny/essay.md ./esej-psychologiczny/essay.bib ./swps.yaml
	pandoc -C ./esej-psychologiczny/essay.md -o ./esej-psychologiczny.swps.pdf \
		--metadata-file=./swps.yaml \
		--pdf-engine=xelatex \
		--template ./eisvogel.tex

all: esej-psychologiczny.pdf esej-psychologiczny.swps.pdf

clean:
	rm -f *.pdf indent.log

format:
	find . -type f -iname '*.md' \
		-exec pandoc -f markdown -s -t markdown-raw_attribute --columns=80 {} -o {} \;

.PHONY: all clean format
