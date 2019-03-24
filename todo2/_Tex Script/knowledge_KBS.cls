%
%  Script for LaTeX usage
%  ============================================================
%  Copyright (c) 2019, Miroslav Román Rosón
% 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DOCUMENT 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{knowledge_KBS}
\LoadClass[11pt,a4paper,oneside,bibliography=totoc,toc=listof]{scrreprt} 

%
% * option "draft" is available, too
%
\newcommand{\setdraft}{} 
\DeclareOption{draft}{\renewcommand{\setdraft}{draft}}

%
% * select [german] or [english]
%
\newcounter{sprache}
\DeclareOption{german}{
  \setcounter{sprache}{1}
  \def\@dept{Titel des Instituts} 
  \def\@type{Deutscher Publikationstyp} 
}  
\DeclareOption{english}{
  \setcounter{sprache}{2}
  \def\@dept{Miroslav Roman Roson}
  \def\@type{Publikationstyp}
}

%
% * use option "alpha" for abbreviated citation (instead of numbers)
%
\newcounter{bstyle}
\setcounter{bstyle}{1}
\DeclareOption{alpha}{
  \setcounter{bstyle}{2}
}
 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PACKAGE SETTING 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
\ProcessOptions
%\RequirePackage[german]{babel}
\RequirePackage[english]{babel}
\RequirePackage[T1]{fontenc} 
\RequirePackage[utf8x]{inputenc}
\RequirePackage{lmodern}
\RequirePackage{ae}
\RequirePackage{amsmath}		% Zusätzliche Mathe-Symbole
\RequirePackage{textcomp}		% µ not in italic = \textmu
\RequirePackage{tabularx}
\RequirePackage{listings}
\RequirePackage{todonotes}
\RequirePackage{glossaries}
\RequirePackage[breaklinks]{hyperref} 
\RequirePackage[\setdraft]{graphicx}
\RequirePackage{ifthen}
\RequirePackage{fancyhdr}
\RequirePackage{url}
\RequirePackage{cite}
\RequirePackage{setspace}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage[printonlyused,withpage]{acronym}
\RequirePackage{enumerate}
\RequirePackage{subfigure}
\RequirePackage{sectsty}
\RequirePackage{makeidx}
\RequirePackage[authoryear,round]{natbib}	% allows the user to easily switch between Harvard or numeric citation
%\RequirePackage{pslatex}
%\RequirePackage[obeyDraft]{todonotes}
%\RequirePackage{bbm} 		% hat irgendwas mit math-characters zu tun
%\RequirePackage{amssymb}	% Zusätzliche Mathe-Symbole


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% REFERENCES 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%\bibliographystyle{plaindin}      % Numerical style
\bibliographystyle{apalike}		   % Harvard style
\makeindex


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DOCUMENT SETTING 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Option "openright" lässt jedes Kapitel auf einer ungeraden Seite starten;
% Problem: ggf. eingefügte Leerseiten haben noch Kopf- und Fusszeilen!!!
% => Lösung:
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
\hbox{}
\thispagestyle{empty}
\newpage
\if@twocolumn\hbox{}\newpage\fi\fi\fi}

% hilft gegen "nur Grafik"-Seiten:
\renewcommand{\floatpagefraction}{.5} % Default: .5, war .9
\renewcommand{\textfraction}{.15}     % Default: .2
\renewcommand{\arraystretch}{1.2}

\headwidth160mm \lhead[\thepage]{\rightmark}
\chead{} \rhead[\leftmark]{\thepage}
\cfoot{\textsc{\@title}}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0pt}

% Textspiegel
\RequirePackage{typearea}
\areaset[0.75cm]{16cm}{22cm}
\addtolength{\topmargin}{1cm}
\RequirePackage[bf,small]{caption}

\renewcommand{\O}{{\cal O}}
\renewcommand{\leadsto}{\rightsquigarrow}
\newcommand{\V}[1]{\text{\boldmath $#1$}}   	 % Format for "Vector"
\newcommand{\M}[1]{\V{#1}}                 		 % Format for "Matrix"

\newcommand{\R}{\mathbbm{R}}
\newcommand{\N}{\mathbbm{N}}
\newcommand{\C}{\mathbbm{C}}
\newcommand{\1}{\mathbbm{1}}                	 % Einheitsmatrix


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DOCUMENT ADJUSTMENT 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifthenelse{\value{sprache} = 1}{
  \usepackage{parskip}
  %\setlength{\parskip}{5pt plus 2pt minus 1pt}
  %\setlength{\parindent}{0pt}
}{}

\def\type#1{\gdef\@type{#1}}
\def\dept#1{\gdef\@dept{#1}}
\def\signline#1{\gdef\@signline{#1}}
\def\signcity#1{\gdef\@signcity{#1}}
\def\submitdate#1{\gdef\@submitdate{#1}}
 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% HIER ANPASSUGEN VORNEHMEN
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\@title{Chapters}
\def\@subtitle{} 
\def\@author{Miroslav Román Rosón}
\def\@signcity{Rülzheim} 
\def\@email{miroslav.roman.roson@gmail.com}
\def\@submitdate{Sunday, May 12, 2013}

\def\@firstsupervisor{}
%\def\@secondsupervisor{}


% TITLE PAGE

\newcommand{\generatetitle}{
  \pagenumbering{roman}
  \pagestyle{plain}
  \thispagestyle{empty}

\begin{center}

% Unilogo
\begin{figure}[ht]
\begin{center}
\includegraphics[height=5cm]{images/knowledge.jpg}
\end{center}
\end{figure}

\vspace{15mm}

\large{\textsc{\@dept}}
\vspace{30mm}

\Large{\textbf{\@title}}
\vspace{1.5cm}

Computer Vision
\vspace{50mm}

\today 

\vfill
\end{center}
}

\newcommand{\startTextChapters}{
  \cleardoublepage
  \pagestyle{fancy}
  \fancyhead[L]{\nouppercase{\rightmark}}
  \fancyfoot{}%
  \fancyfoot[C] {\footnotesize{\@author}}%
  \pagenumbering{arabic}
}
 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NEW ENVIRONMENT DEFINITION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% erstellt Liste, bei der alle Einträge um <Beispieltext>-Breite eingerückt sind!
% Parameter: {<Beispieltext>}
\newenvironment{liste}[2][\rm]{\begin{list}{}{\settowidth{\labelwidth}{{#1#2}}
  \setlength{\leftmargin}{\labelwidth}\addtolength{\leftmargin}{\labelsep}
  \addtolength{\leftmargin}{3ex}%
  \setlength{\parsep}{.5ex plus0.2ex minus 0.2ex}%
  \setlength{\itemsep}{1ex}%
  \renewcommand{\makelabel}[1]{{#1##1\hfill}}}}
  {\end{list}}%
  

% liste + "Doppelpunkt" (notwendig, damit Doppenpunkt au�erhalb des Stilparameters #1)
\newenvironment{listeDP}[2][\rm]{\begin{list}{}{\settowidth{\labelwidth}{{#1#2}:}
  \setlength{\leftmargin}{\labelwidth}\addtolength{\leftmargin}{\labelsep}
  \addtolength{\leftmargin}{3ex}%
  \setlength{\parsep}{.5ex plus0.2ex minus 0.2ex}%
  \setlength{\itemsep}{1ex}%
  \renewcommand{\makelabel}[1]{{#1##1}:\hfill}}}
  {\end{list}}%


% Erstellt BULLET-Liste, bei der alle Einträge um <Beispieltext>-Breite eingerückt sind!
% Parameter: {<Beispieltext>}
\newenvironment{Liste}[2][\rm]{\begin{list}{}{\settowidth{\labelwidth}{\:$\bullet$\: #1#2}
  \setlength{\leftmargin}{\labelwidth}\addtolength{\leftmargin}{\labelsep}
  \addtolength{\leftmargin}{3ex}%
  \setlength{\parsep}{.5ex plus0.2ex minus 0.2ex}%
  \setlength{\itemsep}{1ex}%
  \renewcommand{\makelabel}[1]{\:$\bullet$\, #1##1\hfill}}}
  {\end{list}}%
\newcommand{\grad}{\ensuremath{^{\circ}}}
 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CUSTOM ENVIRONMENT 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
 
% Custom commands done by riffi
\newcommand{\codeInline}[1]
{\lstinline!#1!}

\newcommand{\includeSection}[1]
{\input{#1}}

\newenvironment{enumerateRoman}
{\begin{enumerate}\renewcommand{\labelenumi}{\textbf{\roman{enumi}.}}}
{\end{enumerate}}
\typeout{^^J*****************************^^J Using Thesis_KBS class v1.72^^J*****************************^^J}


