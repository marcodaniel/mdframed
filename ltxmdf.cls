%% documentclass only for the documentation of mdframed
%% This documentclass isn't maintanened or efficient for writing
%%
%%
%% Copyright (c) 2010 Marco Daniel
%%
%% This package may be distributed under the terms of the LaTeX Project
%% Public License, as described in lppl.txt in the base LaTeX distribution.
%% Either version 1.0 or, at your option, any later version.

%%$Id: ltxmdf.cls 220 2011-11-13 17:39:13Z marco $
%%$Rev: 220 $
%%$Author: marco $
%%$Date: 2011-11-13 18:39:13 +0100 (So, 13. Nov 2011) $

%% Allgemeine Angaben
\def\md@maindate@svn$#1: #2 #3 #4-#5-#6 #7 #8${#4/#5/#6\space }
\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{ltxmdf}[\md@maindate@svn$Id: ltxmdf.cls 220 2011-11-13 17:39:13Z marco $ ltxmdf]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions\relax
\LoadClass{scrartcl}
\RequirePackage{etoolbox}
%Required Packages no font / no language
\RequirePackage[nofancy,draft,notoday]{svninfo}
\RequirePackage[left=2.5cm,right=2.5cm,top=3cm,bottom=3cm]{geometry}
\RequirePackage[T1]{fontenc}
\RequirePackage{microtype}
\RequirePackage[french=quotes]{csquotes}
\RequirePackage{xspace}
\begingroup
  \text@command\relax
  \global\let\xspace@check@icr\check@icr
\endgroup
\xspaceaddexceptions{\xspace@check@icr}
\RequirePackage{multicol}\columnseprule0.4pt
\RequirePackage{scrpage2}
\RequirePackage{listings}
\RequirePackage[inline]{enumitem}
\RequirePackage{amsmath}
\RequirePackage[amsmath]{ntheorem}
\RequirePackage{array,booktabs}
\RequirePackage{xcolor,tikz}
\RequirePackage{graphicx}
\AtEndPreamble{%
  \RequirePackage{hyperref}
    \hypersetup{%
        breaklinks=true,
        pdftitle={Documenation of mdframed},%
        pdfauthor={Marco Daniel},%
        colorlinks=true,%
        linkcolor=titleblue,
        urlcolor=cyan,
        bookmarksdepth=4,
    }
}

%Kopf- und Fusszeilen
\clearscrheadfoot
\pagestyle{scrheadings}
\automark[subsection]{section}
\renewcommand{\sectionmark}[1]{\markboth{\sectionmarkformat #1}{}}%
\renewcommand{\subsectionmark}[1]{\markright{\subsectionmarkformat #1}} %nur Titel ohne Nr.
\ihead{\rightmark}
\ohead{\leftmark}
\ofoot{\pagemark} 
\ifoot{\svnId}


%Tikz und Farbe
\usetikzlibrary{calc,backgrounds,arrows,matrix}
\colorlet{titleblue}{blue!30!black}

\lstset{keywordstyle=\bfseries}
\lstdefinestyle{lstmdframed}{%
     basicstyle=\small\ttfamily,
     language={[LaTeX]TeX},
     basicstyle=\small,%
     xleftmargin=20pt,%
     xrightmargin=20pt,%
     frame=single,%
     rulecolor=\color{titleblue},%
     framesep=5pt,%
     framerule=1pt,%
     texcsstyle=*\color{red!50!black}\bfseries,
     moretexcs=intertext,
     keywordstyle=\color{blue!60!black}\bfseries,%
     columns=fixed,%
     fontadjust=true,%
     basewidth=0.65em,%
     breakatwhitespace=true,
     morekeywords=[2]{@length},
     keywordstyle=[2]\color{red!50!black}\bfseries,
     morekeywords={outerlinewidth,leftmargin,rightmargin,backgroundcolor,%
                   outerlinecolor,innertopmargin,splittopskip,skipbelow,%
                   skipabove,ntheorem,theorem,lemma,mdframed,linecolor,%
                   frametitle,infobox,innerlinewidth,roundcorner,leftline,topline,%
                   splitbottomskip,middlelinewidth,middlelinecolor,tikzsetting,%
                   rightline,bottomline,innerrightmargin,style,linewidth,lem,section,%
                   definedstyle,mdfapptodefinestyle,needspace,mdf@globalstyle@cnt,framemethod,%
                   ExampleText,titregris,draw,gray,thick,fill,white,shading,exersicetitle,
                   exersicebackground,color,green,black,exercise,exercisepoints,
                   text,rectangle,rounded,corners,right,minimum,height,xshift,at,
                   exercisestyle,settings,frametitlefont},%
     moretexcs={newmdtheoremenv,newmdenv,theoremstyle,mdfsetup,@length,%
                   md@putbox@single,@tempboxa,mdf@,%
                   mdf@linewidth,mdf@leftmargin@length,interruptlength,%
                   setlength,newrobustcmd,overlaplines,appto,md@frame@leftline@singe,%
                   color,md@frame@leftline@single,mdf@innerbottommargin@length,%
                   mdf@middlelinewidth@length,mdfboundingboxheight,%
                   md@frame@rightline@single,mdfboundingboxwidth,%
                   mdf@innerrightmargin@length,mdfdefinestyle,mdfapptodefinestyle,defcounter,
                   tikzstyle,pgfdeclarehorizontalshading,theexercise,mdf@@exercisepoints,
                   define@key,renewrobustcmd,mdfcreateextratikz,node,ifdefempty,
                   mdf@frametitlefont,dimexpr,mdframedtitleenv,ifstrempty},%
}


\lstnewenvironment{mdexample}[1][]
  {\lstset{style=lstmdframed,#1}}%
  {}

%table of contens anpassen:
\renewcommand\tableofcontents{%
\setcounter{tocdepth}{2}%
 \begin{multicols}{2}[\centering\textbf{\sffamily\Large\contentsname}]
        \@starttoc{toc}
 \end{multicols}
}


%Anweisung zur Darstellung
\newcommand*\mdoption[1]{\textsf{\color{titleblue}#1}}
\newcommand*\mdname{\textsf{mdframed}\xspace}
\newcommand*\mdpack[1]{\texttt{#1}\xspace}
\newcommand*\mdsetting[1]{\textsf{#1}\xspace}
\newcommand*\mdcommand[1]{\texttt{\textbackslash #1}\xspace}

\newcommand*\mdDescribeMacro[2][]{\par\kern\baselineskip%
                                   \noindent\makebox[0pt][l]{\kern-2em%
                                   \textsf{\bfseries\color{titleblue}#2}%
                                   }\hfill\mbox{\mdDefault{#1}}\par\kern.5ex\noindent\ignorespaces}
\newcommand*{\mdDefault}[1]{%
 \ifx\relax#1\relax\else{\small\mdsetting{default=#1}}\fi}

\newcommand*\mdDescribeCmd[2][]{\par\kern\baselineskip%
                                   \noindent\makebox[0pt][l]{\kern-2em%
                                   \textsf{\bfseries\color{titleblue}\textbackslash #2}%
                                   }{#1}\hfill\mbox{\mdDefault{#1}}\par\kern.5ex\noindent\ignorespaces}


\newcommand\NOTE{\minisec{Note}}

\newcommand\limitation[1][TikZ]{\newline{\small This works only with \mdoption{framemethod=#1}.}}

%%Maketitle angepasst:
\def\title#1{\def\@title{#1}}
\def\subtitle#1{\def\@subtitle{#1}}
\def\author#1{\def\@author{#1}}
\def\version#1{\def\@version{#1}}
\def\date#1{\def\@date{#1}}
\long\def\introduction#1{\def\@introduction{#1}}

\def\maketitle{%
 \clearpage
 \thispagestyle{empty}
 \begingroup
  \begingroup
    \parindent\z@
    \centering
     \color{titleblue}\Large\bfseries\sffamily\@title
     \par\kern.5\baselineskip
     \normalfont\large\normalcolor\@subtitle
     \par\kern.5\baselineskip
     \null\quad\@author\hfill\@version\hfill\@date\quad\null
  \endgroup
     \par\kern.5\baselineskip
  \begin{abstract}
     \@introduction
  \end{abstract}
     \par\kern.2\baselineskip
  \pdfbookmark[1]{\contentsname}{tocbook}
  \tableofcontents
 \endgroup
}



