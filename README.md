init-latex
==========
Initial LaTeX document with Makefile and git hooks in place.

After obtaining this through either a copy or a clone you should run the
command `make setup` once.
This will re-initialise the git repository with a single commit and symlink the
hooks to allow them to be version controlled.
You can then use git as normal to manage your LaTeX project.
If working with others they should run `make hooks` immediately after cloning.

The default make target is `rebuild` which only runs pdflatex once.

To perform a full build with bibliography and references resolved run
`make build`.

