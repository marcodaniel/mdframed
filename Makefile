# Makefile for mdframed project folder
# $Id: Makefile 257 2011-12-04 18:38:52Z marco $
SHELL     := /bin/bash
PACKAGE   = mdframed
DOC       = mdframed
EXAMPLEA  = mdframed-examples
EXAMPLED  = mdframed-example-default
EXAMPLET  = mdframed-example-tikz
EXAMPLEP  = mdframed-example-pstricks
EXAMPLESX = mdframed-example-texsx
EXAMPLLIST =  $(EXAMPLEA) $(EXAMPLED) $(EXAMPLET) $(EXAMPLEP) $(EXAMPLESX) 
STYLE     = md-frame-
PDFLATEX  = pdflatex
LATEX     = latex
BACKEND   = biber
DVIPS     = dvips
PSPDF     = ps2pdf
MAKEIDX   = makeindex

NO_COLOR    = \x1b[0m
OK_COLOR    = \x1b[32;01m
WARN_COLOR  = \x1b[33;01m
ERROR_COLOR = \x1b[31;01m

OK_STRING   = $(OK_COLOR)[OK]$(NO_COLOR)
ERROR_STRING= $(ERROR_COLOR)[ERRORS]$(NO_COLOR)
WARN_STRING = $(WARN_COLOR)[WARNINGS]$(NO_COLOR)

doc: $(DOC).dtx
	$(PDFLATEX) $(DOC).dtx
	$(MAKEIDX) -s gglo.ist -o $(DOC).gls $(DOC).glo
	$(MAKEIDX) -s gind.ist $(DOC).idx
	$(PDFLATEX) $(DOC).dtx
	$(PDFLATEX) $(DOC).dtx

examples: $(EXAMPLEA).dtx
#EXAMPLEA
	$(PDFLATEX) $(EXAMPLEA).dtx
	$(PDFLATEX) $(EXAMPLEA).dtx
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



changeversion:
	@echo 
	@echo -e "$(OK_COLOR)Aktuell wird die folgende Version verwendet"
	@sed '/\\def\\mdversion/!d' $(PACKAGE).sty 
	@echo -e "$(WARN_COLOR)"
	@read -p "Bitte neue Version eingeben: " REPLY &&  sed -rie "s/(\\\\def\\\\mdversion\{).*(})/\1$$REPLY\2/" $(PACKAGE).sty&&\
	 echo -e "$(OK_COLOR)Version geändert zu $$REPLY$(NO_COLOR)"
	@echo


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
	@rm -rf $(DOC).aux $(DOC).glo $(DOC).gls $(DOC).hd $(DOC).ins $(DOC).idx \
	    $(DOC).ilg $(DOC).ind $(DOC).log $(DOC).out $(DOC).thm $(DOC).toc ; 
	@echo -e "$(OK_COLOR)Löschvorgang abgeschlossen$(NO_COLOR)"	

all:	doc examples clean


