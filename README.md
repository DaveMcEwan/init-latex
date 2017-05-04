init-latex
==========
Initial LaTeX document with Makefile and git hooks in place.

Assume you want to start a new LaTeX project called `mynewpaper` where you will
collaborate with other people and you've decided to use git for collaboration.
As the person starting the project there are 5 steps, but the others just need
to run the commands in the fifth step.
The git hooks are setup to catch some common things which make performing a
`diff` more diffcult or introduce unnecessary conflicts such as trailing
whitespace, tabs instead of spaces, and lines which are too long.
Of course, since these hooks are tracked under git the rules can be changed at
any time.
For more info on git hooks and how they work please see <http://githooks.com>

**First**, clone init-latex into an empty directory.

    mkdir mynewpaper
    cd mynewpaper
    git clone https://github.com/DaveMcEwan/init-latex.git .

**Second**, setup the skeleton project and put git hooks in place.

    make

Now several things should have happened:

  1. The `LICENSE` and `README.md` files are gone.
  2. The `Makefile` has self-modified to only contain generic rules for a PDF
     LaTeX project, not anything specific to init-latex.
  3. The git repository now contains a single commit with the message
     `Initial commit by init-latex`.
  4. Git hooks are in place to prevent common mistakes and conflicts.

**Third**, check that the PDF toolchain works. (pdflatex, bibtex, etc...)
This should run without error and produce `main.pdf`.

    make build

You don't *have* to check that your toolchain works just now but it is nice to
know that a minimal set of packages and features work for you.

**Fourth**, now that you have a buildable skeleton project you want to be able to
share access by adding a remote repository.
Exactly how to do this may vary depending on where the remote is.
For GitHub follow these instructions.

    # Sign into github and create a new empty repository.

    git add remote origin https://github.com/<username>/mynewpaper
    git push origin master

Now your skeleton project should be available on GitHub and you can administer
access rights via their website.

**Fifth**, you want to tell your colleagues how to contribute to your new
paper.
They should be instructed to clone the repository, setup the hooks, and test
their toolchain.

    git clone https://github.com/<username>/mynewpaper
    make hooks
    make build

At this point everyone should be setup and able to manage git in the usual
manner and rebuild the PDF with `make` (faster), or build the PDF from scratch
with `make build` (slower).

Happy writing.
