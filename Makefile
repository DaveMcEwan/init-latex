# Initial LaTeX
# Dave McEwan
#
# https://github.com/DaveMcEwan/init-latex
# Template for LaTeX project with Makefile and git hooks.

MAIN := main

rebuild:
	pdflatex -quiet $(MAIN)

build: clean
	pdflatex -quiet $(MAIN)
	bibtex          $(MAIN)
	pdflatex -quiet $(MAIN)
	pdflatex -quiet $(MAIN)

.PHONY: clean
clean:
	rm -f *.aux
	rm -f *.log
	rm -f *.out
	rm -f *.toc
	rm -f *.bbl
	rm -f *.blg
	rm -f $(MAIN).pdf

gitinit:
	rm -rf .git
	git init

hooks:
	rm -rf .git/hooks
	ln -s .hooks .git/hooks

setup: gitinit
setup: hooks

