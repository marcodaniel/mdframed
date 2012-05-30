::################################################################
::## Makefile for mdframed project folder (WINDOWS)
::##
::## $Id: mdframedmake.bat 391 2012-05-19 11:10:49Z marco $
::################################################################
title Entpacken mdframed.dtx unter windows
@echo off
::
pdflatex mdframed.dtx
makeindex -s gglo.ist -o mdframed.gls mdframed.glo
makeindex -s gind.ist mdframed.idx
pdflatex mdframed.dtx
pdflatex mdframed.dtx
::
pdflatex mdframed-example-default.tex
pdflatex mdframed-example-default.tex
::
pdflatex mdframed-example-tikz.tex
pdflatex mdframed-example-tikz.tex
::
latex mdframed-example-pstricks.tex
latex mdframed-example-pstricks.tex
dvips mdframed-example-pstricks.dvi
call ps2pdf mdframed-example-pstricks.ps
::
pdflatex mdframed-example-texsx.tex
pdflatex mdframed-example-texsx.tex
::
for %%I in (aux glo hd idx dvi log out ps syntex.gz thm tmp toc) do (
	for %%J in (default tikz pstricks texsx) do (del mdframed-example-%%J.%%I)
)
::
for %%I in (aux dtxe glo gls hd idx ilg ind ins log out thm toc) do (del mdframed.%%I)
