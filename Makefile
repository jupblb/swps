essay.pdf: essay.md
		pandoc -C -o essay.pdf --template ./eisvogel.tex essay.md

clean:
	rm -f essay.pdf

format:
	pandoc -f markdown -s -t markdown --columns=80 essay.md -o essay.md

.PHONY: clean format
