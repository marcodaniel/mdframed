################################################################
## Makefile for mdframed project folder
## $Id: Makefile 308 2012-01-07 16:55:41Z marco $
################################################################
## Definitions
################################################################
.SILENT:
SHELL     := /bin/bash
.PHONY: all clean
################################################################
## Name list
################################################################
PACKAGE   = mdframed
EXAMPLED  = mdframed-example-default
EXAMPLET  = mdframed-example-tikz
EXAMPLEP  = mdframed-example-pstricks
EXAMPLESX = mdframed-example-texsx
EXAMPLLIST=  $(EXAMPLED) $(EXAMPLET) $(EXAMPLEP) $(EXAMPLESX) 
FILELIST  =  $(PACKAGE) $(EXAMPLED) $(EXAMPLET) $(EXAMPLEP) $(EXAMPLESX)
AUXFILES  = aux dtxe glo gls hd ins idx ilg ind log out ps thm tmp toc 
################################################################
## Colordefinition
################################################################
NO_COLOR    = \x1b[0m
OK_COLOR    = \x1b[32;01m
WARN_COLOR  = \x1b[33;01m
ERROR_COLOR = \x1b[31;01m
################################################################
## make help
################################################################
help:
	@echo 
	@echo -e "$(WARN_COLOR)The following definitions provided by this Makefile"
	@echo -e "$(OK_COLOR)\tmake docsty\t\t--\ttypesets the documenation and the package"
	@echo -e "$(OK_COLOR)\tmake all\t\t--\trun docsty examples clean"
	@echo -e "\tmake examples\t\t--\tcompiles all example files"
	@echo -e "\tmake clean\t\t--\tremove all helpfiles created by mdframed"
	@echo -e "\tmake changeversion\t--\tmaintaner tool to change the version"
	@echo -e "$(WARN_COLOR)End help$(NO_COLOR)"

################################################################
## Compilation
################################################################
%.pdf: %.tex
	NAME=`basename $< .tex` ;\
	echo -e "" ;\
	echo -e "\t$(ERROR_COLOR)Typesetting $$NAME$(NO_COLOR)" ;\
	pdflatex -draftmode -interaction=nonstopmode $< > /dev/null ;\
	if [ $$? = 0 ] ; then \
	  echo -e "\t$(OK_COLOR)compilation in draftmode without erros$(NO_COLOR)" ;\
	  echo -e "\t$(OK_COLOR)Run PDFLaTeX again on $$NAME.tex$(NO_COLOR)" ;\
	  pdflatex -interaction=nonstopmode $< > /dev/null ;\
	else \
	  echo -e "\t$(ERROR_COLOR)compilation in draftmode with erros$(NO_COLOR)" ;\
	  exit 0;\
	fi ;\
	echo -e "\t$(OK_COLOR)Typesetting $$NAME finished $(NO_COLOR)" ;\

%.ps: %.tex
	NAME=`basename $< .tex` ;\
	echo -e "" ;\
	echo -e "\t$(ERROR_COLOR)Typesetting $$NAME$(NO_COLOR)" ;\
	latex -draftmode -interaction=nonstopmode $< > /dev/null ;\
	if [ $$? = 0 ] ; then \
	  echo -e "\t$(OK_COLOR)compilation in draftmode without erros$(NO_COLOR)" ;\
	  echo -e "\t$(OK_COLOR)Run LaTeX again on $$NAME.tex$(NO_COLOR)" ;\
	  latex -interaction=nonstopmode $< > /dev/null ;\
	  dvips -q $$NAME.dvi ;\
	  ps2pdf $$NAME.ps ;\
	else \
	  echo -e "\t$(ERROR_COLOR)compilation in draftmode with erros$(NO_COLOR)" ;\
	  exit 0;\
	fi ;\
	echo -e "\t$(OK_COLOR)Typesetting $$NAME done$(NO_COLOR)" ;\
################################################################
## Compilation
################################################################
docsty: $(PACKAGE).dtx
	echo -e "" ;\
	echo -e "\t$(ERROR_COLOR)Typesetting $(PACKAGE).dtx$(NO_COLOR)" ;\
	pdflatex -draftmode -interaction=nonstopmode $(PACKAGE).dtx > /dev/null ;\
	if [ $$? = 0 ] ; then \
	  echo -e "\t$(OK_COLOR)compilation in draftmode without erros$(NO_COLOR)" ;\
	  makeindex -q -t $(PACKAGE).glolog  -s gglo.ist -o $(PACKAGE).gls $(PACKAGE).glo ;\
	  if [ $$? = 0 ] ; then \
	     echo -e "\t$(OK_COLOR)compilation of Glossar without errors$(NO_COLOR)" ;\
	  fi ;\
	  makeindex -q -t $(PACKAGE).idxlog -s gind.ist $(PACKAGE).idx ;\
	  if [ $$? = 0 ] ; then \
	     echo -e "\t$(OK_COLOR)compilation of Index without errors$(NO_COLOR)" ;\
	  fi ;\
	  pdflatex $(PACKAGE).dtx > /dev/null ;\
	  if [ $$? = 0 ] ; then \
	     echo -e "\t$(OK_COLOR)Second pdflatex compilation without erros$(NO_COLOR)" ;\
	  else \
	     echo -e "\t$(ERROR_COLOR)Second pdflatex compilation with erros$(NO_COLOR)" ;\
	     exit 0;\
	  fi ;\
	  pdflatex $(PACKAGE).dtx > /dev/null ;\
	else \
	  echo -e "\t$(ERROR_COLOR)compilation in draftmode with erros$(NO_COLOR)" ;\
	  exit 0;\
	fi ;\

examples: $(EXAMPLED).pdf $(EXAMPLET).pdf $(EXAMPLEP).ps $(EXAMPLESX).pdf

exampled: $(EXAMPLED).pdf
examplet: $(EXAMPLET).pdf
examplep: $(EXAMPLEP).ps
examplesx:$(EXAMPLESX).pdf

clean:  
	echo  "" ;\
	echo -e "\t$(ERROR_COLOR)Start removing help files$(NO_COLOR)" ;\
	for I in $(FILELIST) ;\
	do \
	  for J in $(AUXFILES) ;\
	  do \
	    rm -rf $$I.$$J ;\
	  done ;\
	done ;\
	echo -e "\t$(OK_COLOR)Removing finished$(NO_COLOR)" ;\

all:	docsty examples clean


changeversion:
	@echo 
	@echo -e "$(OK_COLOR)Aktuell wird die folgende Version verwendet"
	@sed '/\\def\\mdversion/!d' $(PACKAGE).sty 
	@echo -e "$(WARN_COLOR)"
	@read -p "Bitte neue Version eingeben: " REPLY &&  sed -rie "s/(\\\\def\\\\mdversion\{).*(})/\1$$REPLY\2/" $(PACKAGE).dtx&&\
	 echo -e "$(OK_COLOR)Version geändert zu $$REPLY$(NO_COLOR)"
	@echo
