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

psychologia-poznawcza-esej.pdf: ./psychologia-poznawcza/essay.md ./psychologia-poznawcza/essay.bib ./default.yaml
	pandoc -V lang=pl -C ./psychologia-poznawcza/essay.md -o ./psychologia-poznawcza-esej.pdf \
		--metadata-file=./default.yaml \
		--pdf-engine=xelatex \
		--template ./eisvogel.tex

psychologia-poznawcza-esej.swps.pdf: ./psychologia-poznawcza/essay.md ./psychologia-poznawcza/essay.bib ./swps.yaml
	pandoc -V lang=pl -C ./psychologia-poznawcza/essay.md -o ./psychologia-poznawcza-esej.swps.pdf \
		--metadata-file=./swps.yaml \
		--pdf-engine=xelatex \
		--template ./eisvogel.tex

all: esej-psychologiczny.pdf esej-psychologiczny.swps.pdf psychologia-poznawcza-esej.pdf psychologia-poznawcza-esej.swps.pdf

clean:
	rm -f *.pdf indent.log

format:
	find . -type f -iname '*.md' \
		-exec pandoc -f markdown -s -t markdown-raw_attribute --columns=80 {} -o {} \;

.PHONY: all clean format
