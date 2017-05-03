# Initial LaTeX
# Dave McEwan
#
# https://github.com/DaveMcEwan/init-latex
# Template for LaTeX project with Makefile and git hooks.

# Depends on make, grep, cut, tail, rm, ln, echo, git, pdflatex, bibtex.

setup: rminit
setup: mkmod
setup: gitinit
setup: hooks

START := $(shell expr `grep -n HERE Makefile | cut -f1 -d: | tail -n 1` + 1)

rminit:
	rm LICENSE
	rm README.md

mkmod:
	tail -n +$(START) Makefile > Makefile.new
	mv Makefile.new Makefile

gitinit:
	rm -rf .git
	git init
	git add * .hooks .gitignore
	git commit -m "Initial commit by init-latex"
	@echo "REMINDER: git remote add origin <url>"

# The default target is 'setup' so running `make` will remove the files specific
# to init-latex, self-modify this Makefile, and reinitialise a git repository
# with a template LaTeX project.
# The line below is special as it is searched for and used by the
# self-modifying process.
# Everything above HERE including this line should be removed by `make setup`.

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
	rm -f *.bbl
	rm -f *.blg
	rm -f *.lof
	rm -f *.log
	rm -f *.lot
	rm -f *.out
	rm -f *.toc
	rm -f $(MAIN).pdf

.PHONY: hooks
hooks:
	rm -rf .git/hooks
	ln -s .hooks .git/hooks

