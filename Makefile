essay.pdf: essay.md default.yaml
	pandoc -C essay.md -o essay.pdf \
		--metadata-file=./default.yaml \
		--pdf-engine=xelatex \
		--template ./eisvogel.tex

essay-swps.pdf: essay.md swps.yaml
	pandoc -C essay.md -o essay-swps.pdf \
		--metadata-file=./swps.yaml \
		--pdf-engine=xelatex \
		--template ./eisvogel.tex

clean:
	rm -f essay.pdf essay-swps.pdf indent.log

format:
	pandoc -f markdown -s -t markdown --columns=80 essay.md -o essay.md

.PHONY: clean format
