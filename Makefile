################################################################
## Makefile for mdframed project folder
## $Id: Makefile 306 2012-01-07 09:42:34Z marco $
################################################################
## Definitions
################################################################
#.SILENT:
 SHELL     := /bin/bash
################################################################
## Name list
################################################################
PACKAGE   = mdframed
EXAMPLED  = mdframed-example-default
EXAMPLET  = mdframed-example-tikz
EXAMPLEP  = mdframed-example-pstricks
EXAMPLESX = mdframed-example-texsx
EXAMPLLIST =  $(EXAMPLED) $(EXAMPLET) $(EXAMPLEP) $(EXAMPLESX) 
################################################################
## Compilation tools
################################################################
PDFLATEX  = pdflatex
LATEX     = latex
DVIPS     = dvips
PSPDF     = ps2pdf
MAKEIDX   = makeindex
################################################################
## Colordefinition
################################################################
NO_COLOR    = \x1b[0m
OK_COLOR    = \x1b[32;01m
WARN_COLOR  = \x1b[33;01m
ERROR_COLOR = \x1b[31;01m
################################################################
## Colored string-Definition
################################################################
OK_STRING   = $(OK_COLOR)[OK]$(NO_COLOR)
ERROR_STRING= $(ERROR_COLOR)[ERRORS]$(NO_COLOR)
WARN_STRING = $(WARN_COLOR)[WARNINGS]$(NO_COLOR)
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
docsty: $(PACKAGE).dtx
	$(PDFLATEX) $(PACKAGE).dtx
	$(MAKEIDX) -s gglo.ist -o $(PACKAGE).gls $(PACKAGE).glo
	$(MAKEIDX) -s gind.ist $(PACKAGE).idx
	$(PDFLATEX) $(PACKAGE).dtx
	$(PDFLATEX) $(PACKAGE).dtx

examples: $(EXAMPLED).tex $(EXAMPLET).tex $(EXAMPLEP).tex $(EXAMPLESX).tex
#EXAMPLED
	$(PDFLATEX) $(EXAMPLED).tex
	$(PDFLATEX) $(EXAMPLED).tex
#EXAMPLET
	$(PDFLATEX) $(EXAMPLET).tex
	$(PDFLATEX) $(EXAMPLET).tex
#EXAMPLEP
	$(LATEX) $(EXAMPLEP).tex
	$(LATEX) $(EXAMPLEP).tex
	$(DVIPS) $(EXAMPLEP).dvi
	$(PSPDF) $(EXAMPLEP).ps
#EXAMPLESX
	$(PDFLATEX) $(EXAMPLESX).tex
	$(PDFLATEX) $(EXAMPLESX).tex

clean:  
	@echo
	@echo -e "$(ERROR_COLOR)Alle Dateien ausser *.tex, *.sty,"
	@echo -e "*.mdf, *.pdf, README, Makefile und *.zip"
	@echo -e "werden geloescht"
	@echo -e "$(WARN_COLOR)" ;
	@echo -e "Useless files of mdframed will be removed" ;
	for file in $(EXAMPLLIST) ; \
	do \
	 echo -e "Useless files of $$file will be removed" ;\
	 rm -rf $$file.aux $$file.glo $$file.hd $$file.idx $$file.dvi $$file.ps\
	    $$file.log $$file.out $$file.synctex.gz $$file.thm $$file.tmp $$file.toc ; \
	done
	@echo -e "Useless files of mdframed package will be removed" ;
	@rm -rf $(PACKAGE).aux $(PACKAGE).dtxe $(PACKAGE).glo $(PACKAGE).gls $(PACKAGE).hd $(PACKAGE).ins $(PACKAGE).idx \
	    $(PACKAGE).ilg $(PACKAGE).ind $(PACKAGE).log $(PACKAGE).out $(PACKAGE).thm $(PACKAGE).toc ; 
	@echo -e "$(OK_COLOR)Löschvorgang abgeschlossen$(NO_COLOR)"	

all:	docsty examples clean


changeversion:
	@echo 
	@echo -e "$(OK_COLOR)Aktuell wird die folgende Version verwendet"
	@sed '/\\def\\mdversion/!d' $(PACKAGE).sty 
	@echo -e "$(WARN_COLOR)"
	@read -p "Bitte neue Version eingeben: " REPLY &&  sed -rie "s/(\\\\def\\\\mdversion\{).*(})/\1$$REPLY\2/" $(PACKAGE).dtx&&\
	 echo -e "$(OK_COLOR)Version geändert zu $$REPLY$(NO_COLOR)"
	@echo
