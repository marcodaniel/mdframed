::################################################################
::## Makefile for mdframed project folder (WINDOWS)
::##
::## $Id: mdframedmake.bat 427 2012-06-06 12:24:09Z marco $
::################################################################
@echo off
title Compiling mdframed.dtx (Windows)
::
:: You can use a prompt to call a special mode of this file.
::  mdframedmake all        --  standard mode, run docsty examples clean
::  mdframedmake docsty     --  typesets the documentation and the package
::  mdframemdmake examples  --  all example files
::  mdframedmake clean      --  remove all helpfiles created by mdframed
::
set mode=all
for %%I in (d docsty) do (if /I %%Ix equ %1x set mode=docsty)
for %%I in (e examples) do (if /I %%Ix equ %1x set mode=examples)
for %%I in (cx cleanx) do (if /I %%I equ %1x set mode=clean)
::
call:%mode%
echo.
echo Finished
echo.
pause
goto:eof
::
::############################
::## Subroutines
::############################
::
:all
call:docsty mdframed 
call:examples
call:clean
goto:eof
::
:docsty
  echo.
  echo Typesetting %1.dtx
  pdflatex --draftmode --interaction=nonstopmode %1.dtx >NUL
  if not errorlevel 1 (
    echo  comipilation in draftmode without errors
    if exist %1.glo (
      makeindex -q -t %1.glolog -s gglo.ist -o %1.gls %1.glo >NUL
      if not errorlevel 1 (
        echo  compiliation of glossar without errors
      ) else (
        echo  compilation of glossar with errors
      )
    )
    if exist %1.idx (
      makeindex -q -t %1.idxlog -s gind.ist %1.idx >NUL
      if not errorlevel 1 (
        echo  compiliation of index without errors
      ) else (
        echo  compilation of index with errors
      )
    )
    pdflatex --interaction=nonstopmode %1.dtx >NUL
      if not errorlevel 1 (
        echo  Second pdflatex compiliation without errors
        pdflatex --interaction=nonstopmode %1.dtx >NUL
      ) else (
        echo  Second pdflatex compiliation with errors
      )
  ) else (
    echo compilation in draftmode with errors
  )
  goto:eof
::
:examples
call:pdf mdframed-example-default
call:pdf mdframed-example-tikz
call:ps mdframed-example-pstricks
call:pdf mdframed-example-texsx
goto:eof
::
:pdf
  echo.
  echo Typesetting %1
  pdflatex --draftmode --interaction=nonstopmode %1.tex >NUL
  if not errorlevel 1 (
    echo  compilation in draftmode without errors
    echo  Run pdflatex again on %1.tex
    pdflatex --interaction=nonstopmode %1.tex >NUL
    echo  Typesetting %1 finished
  ) else (
    echo  compilation in draftmode with errors)
goto:eof
::
:ps
  echo.
  echo Typesetting %1
  latex -draftmode -interaction=nonstopmode %1.tex >NUL
  if not errorlevel 1 (
    echo  compilation in draftmode without errors
    echo  Run LaTeX again on %1.tex
    latex -interaction=nonstopmode %1.tex >NUL
    dvips -q %1.dvi
    call ps2pdf %1.ps
    echo  Typesetting %1 finished
  ) else (
    echo  compilation in draftmode with errors)
  goto:eof
::
:clean
  echo.
  echo Removing help files
  ::
  for %%I in (aux dtxe dvi glo glolog gls hd ins idx idxlog ilg ind log out ps thm tmp toc xdv) do (
    if exist mdframed.%%I del mdframed.%%I
    for %%J in (default tikz pstricks texsx) do (
      if exist mdframed-example-%%J.%%I del mdframed-example-%%J.%%I
    )
  )
  echo  Removing finished
  goto:eof
