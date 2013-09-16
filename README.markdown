### Introduction

Working with the command \fbox or \fcolorbox, one has to
handle page breaks by hand. The present package defines the
environment mdframed which automatically deals with page breaks.

### License

Author's name: Marco Daniel and Elke Schubert (supports tikz implementation)

License type: [LPPL-LaTeX project public license](http://www.latex-project.org/lppl/)

### Revision history
The revision history is printed in the documentation.

### Documenation // Examples

Examples are uploaded at GitHub:
[DOWNLOAD-PAGE](https://github.com/marcodaniel/mdframed/downloads)

### Installation -- 1
I provide the file `mdframed.tar.gz` with the correct TDS structure. It can be 
downloaded at GitHub. Unpack the file and move the folders to TEXMFHOME or 
TEXMFLOCAL

[DOWNLOAD-PAGE](https://github.com/marcodaniel/mdframed/downloads)


### Installation -- 2
If you are using Linux you can simple run `make localinstall`. This will install
the package `mdframed` in your local TEXMF-tree.

### Installation -- 3
The package provides
 * one `dtx` files,
 * one `Makefile` (compiling for Linux/Mac),
 * one `mdframedmake.bat` (compiling for Windows)
 * one personal documentclass `ltxmdf.cls`
 * one example picture `donald-duck.jpg`

By running the script `make all` you will
produce the following files:
- `README.txt`
- `mdframed.sty`
- `mdframed.pdf`
- `md-frame-0.mdf`
- `md-frame-1.mdf`
- `md-frame-2.mdf`
- `md-frame-3.mdf`
- `mdframed-example-default.tex`
- `mdframed-example-default.pdf`
- `mdframed-example-tikz.tex`
- `mdframed-example-tikz.pdf`
- `mdframed-example-pstricks.tex`
- `mdframed-example-pstricks.pdf`
- `mdframed-example-texsx.tex`
- `mdframed-example-texsx.pdf`

I recommend the following installation in your texmf-tree:

`.../doc/latex/mdframed/`
- `README.txt`
- `mdframed.pdf`
- `mdframed-example-default.tex`
- `mdframed-example-default.pdf`
- `mdframed-example-tikz.tex`
- `mdframed-example-tikz.pdf`
- `mdframed-example-pstricks.tex`
- `mdframed-example-pstricks.pdf`
- `mdframed-example-texsx.tex`
- `mdframed-example-texsx.pdf`


`.../source/latex/mdframed/`
- `Makefile`
- `mdframed.dtx`
- `donald-duck.jpg`

`.../tex/latex/mdframed`
- `mdframed.sty`
- `md-frame-0.mdf`
- `md-frame-1.mdf`
- `md-frame-2.mdf`
- `md-frame-3.mdf`
- `ltxmdf.cls`

