================================================================
================================================================
Working with the command \fbox or \fcolorbox, one has to
handle page breaks by hand. The present package defines the
environment mdframed which automatically deals with page breaks.

Author's name: Marco Daniel and Elke Schubert (supports tikz implementation)
License type: lppl

================================================================
The current development is available at github:
https://github.com/marcodaniel/mdframed

================================================================
The package provides two dtx files, one Makefile and
one documentclass. By running the script `make all` you will
produce the following files:
- README.txt
- mdframed.sty
- mdframed.pdf
- md-frame-0.mdf
- md-frame-1.mdf
- md-frame-2.mdf
- md-frame-3.mdf
- mdframed-examples.pdf
- mdframed-example-default.tex
- mdframed-example-default.pdf
- mdframed-example-tikz.tex
- mdframed-example-tikz.pdf
- mdframed-example-pstricks.tex
- mdframed-example-pstricks.pdf
- mdframed-example-texsx.tex
- mdframed-example-texsx.pdf
- ltxmdf.cls
- donald-duck.jpg

I recommend the following installation in your texmf-tree:

/doc/latex/mdframed/
- README.txt
- mdframed.pdf
- mdframed-example-default.tex
- mdframed-example-default.pdf
- mdframed-example-tikz.tex
- mdframed-example-tikz.pdf
- mdframed-example-pstricks.tex
- mdframed-example-pstricks.pdf
- mdframed-example-texsx.tex
- mdframed-example-texsx.pdf

/source/latex/mdframed/
- Makefile
- mdframed.dtx
- mdframed-examples.dtx
- donald-duck.jpg

/tex/latex/mdframed
- mdframed.sty
- md-frame-0.mdf
- md-frame-1.mdf
- md-frame-2.mdf
- md-frame-3.mdf
- ltxmdf.cls
================================================================
================================================================
