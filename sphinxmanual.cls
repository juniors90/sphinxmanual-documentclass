%
% sphinxmanual.cls for Sphinx (http://sphinx-doc.org/)
%

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{sphinxmanual}[2019/12/01 v2.3.0 Document class (Sphinx manual)]

% chapters starting at odd pages (overridden by 'openany' document option)
\PassOptionsToClass{openright}{\sphinxdocclass}

% 'oneside' option overriding the 'twoside' default
\newif\if@oneside
\DeclareOption{oneside}{\@onesidetrue}
% Pass remaining document options to the parent class.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\sphinxdocclass}}
\ProcessOptions\relax

% Defaults two-side document
\if@oneside
% nothing to do (oneside is the default)
\else
\PassOptionsToClass{twoside}{\sphinxdocclass}
\fi

\LoadClass{\sphinxdocclass}

% Set some sane defaults for section numbering depth and TOC depth.  You can
% reset these counters in your preamble.
%
\setcounter{secnumdepth}{2}
\setcounter{tocdepth}{1}

% Adapt \and command to the flushright context of \sphinxmaketitle, to
% avoid ragged line endings if author names do not fit all on one single line
\DeclareRobustCommand{\and}{%
    \end{tabular}\kern-\tabcolsep
    \allowbreak
    \hskip\dimexpr1em+\tabcolsep\@plus.17fil\begin{tabular}[t]{c}%
}%
% If it is desired that each author name be on its own line, use in preamble:
%\DeclareRobustCommand{\and}{%
%   \end{tabular}\kern-\tabcolsep\\\begin{tabular}[t]{c}%
%}%
% Change the title page to look a bit better, and fit in with the fncychap
% ``Bjarne'' style a bit better.
 
%
\newcommand{\sphinxmaketitle}{%
  \let\sphinxrestorepageanchorsetting\relax
  \ifHy@pageanchor\def\sphinxrestorepageanchorsetting{\Hy@pageanchortrue}\fi
  \hypersetup{pageanchor=false}% avoid duplicate destination warnings
  \begin{titlepage}%
    \let\footnotesize\small
    \let\footnoterule\relax
    \noindent\rule{\textwidth}{4pt}\par
      \begingroup % for PDF information dictionary
       \def\endgraf{ }\def\and{\& }%
       \pdfstringdefDisableCommands{\def\\{, }}% overwrite hyperref setup
       \hypersetup{pdfauthor={\@author}, pdftitle={\@title}}%
      \endgroup
     \begin{flushright}%
      \sphinxlogo
%      \py@HeaderFamily
      {\Huge \@title \par}
%      {\itshape\LARGE \py@release\releaseinfo \par}
      % Draw a line 4pt high
      \par\noindent\rule{\textwidth}{4pt}\\ % agregamos \py@TitleColor
      
      % Subtitle
      % Shaded box from left to right. Text node is midway (centered).
      \begin{tikzpicture}
      \shade[bottom color=britishracinggreen!75,top color=white]
      (0,0) rectangle (\textwidth, 1.5)
      node[midway] {\textbf{\large \textit{\@booksubtitlename}}};
      \end{tikzpicture}
      \setlength{\parskip}{0pt}
      {\itshape\LARGE \py@release\releaseinfo \par}
      \smallskip
      {\LARGE by \par}
      \smallskip
      {\LARGE \textbf{\@author} \par}
      \vfill
      {\large A thesis submitted in partial fulfillment for the \par}
      {\large degree of \@degreename \par}
      \bigskip
      \bigskip
      {\large in the \par}
      {\large \@univname \par}
      {\large \@facname \par}
      {\large \@deptname \par} 
      \bigskip
      \bigskip
      \bigskip
      {\Large \@date \par}
      \smallskip
      {\py@authoraddress \par}
      \bigskip
      
     \begin{center}
     	\includegraphics{book.pdf}                        \\[4pt]
     	\fontfamily{lmtt}\small{Self Publishers Worldwide \\
     		Seattle San Francisco New York                \\
     		London Paris Rome Beijing Barcelona}
     \end{center}
    \end{flushright}%\par
    \@thanks
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \let\thanks\relax\let\maketitle\relax
  %\gdef\@thanks{}\gdef\@author{}\gdef\@title{}
  \clearpage
  \ifdefined\sphinxbackoftitlepage\sphinxbackoftitlepage\fi
  \if@openright\cleardoublepage\else\clearpage\fi
  \sphinxrestorepageanchorsetting
}

\newcommand{\sphinxcopyright}{%
  \let\sphinxrestorepageanchorsetting\relax
  \ifHy@pageanchor\def\sphinxrestorepageanchorsetting{\Hy@pageanchortrue}\fi
  \hypersetup{pageanchor=false}% avoid duplicate destination warnings
  \begin{flushleft}
	\textit{\large \@title }.
	
	Copyright \copyright{} \@yearcopyrightname, \@author.
	
	\MakeUppercase{\@deptname}
	
	\@printerfromname    % printerfrom
	
	Publicado por \@publishername, \@adresspublishername, \@citypublishername. \@postalcodename.
	
	Los libros de \@publishername se pueden comprar con fines educativos,
    comerciales o promocionales de ventas.

	Las ediciones online también está disponible en \@availableinname.
	
    Para más información, contactar nuestro departamento de ventas:
    XXX-XXX-XXXX o xyz@gmail.com.
	
	\vspace*{\fill}
	
	Este libro fue escrito usando los softwares \LaTeX{} y
    \href{https://www.sphinx-doc.org/en/master/}{Sphinx}.\\
	
	\vspace*{\fill}
	
	\noindent{\small
		\begin{tabular}[t]{llll}
			% ---------------------------- %
			\@editorname            &&& \\
			\@productioneditorname  &&& \\
			\@copyeditorname        &&& \\
			\@proofreadername       &&& \\
			\@indexername           &&& \\
			\@interiordesignername  &&& \\
			\@coverdesignername     &&& \\
			\@illustratorname       &&& \\
	                                &&& \\
                                    &&& \\
			Septiembre 2021:        &
            Primera Edición         &&  \\
			                        &&& \\
			                        &&& \\
			Revisión Histórica:     &&& \\
			Septiembre 2021:        &
            Primera Edición         &&  \\                                           
		\end{tabular}\kern-\tabcolsep
		\par
	}
	\vspace{\fill}
	Copyright \textcopyright{} \the\year{}  \@author.
    Todos los derechos reservados.\\
	Licencia: \@booklicensename\\
	ISBN: XXXXXXXXXXXX
	\end{flushleft}
  \setcounter{footnote}{0}%
  \let\thanks\relax\let\maketitle\relax
  %\gdef\@thanks{}\gdef\@author{}\gdef\@title{}
  \clearpage
  \ifdefined\sphinxbackoftitlepage\sphinxbackoftitlepage\fi
  \if@openright\cleardoublepage\else\clearpage\fi
  \sphinxrestorepageanchorsetting
}

% Table of contents
\newcommand{\sphinxtableofcontents}{%
  \pagenumbering{roman}%
  \begingroup
    \parskip \z@skip
    \sphinxtableofcontentshook
    \tableofcontents
    \addcontentsline{toc}{chapter}{List of Figures}
    \listoffigures
    \addcontentsline{toc}{chapter}{List of Tables}
    \listoftables
  \endgroup
}

% Acknowledgements
\newcommand\acknowledgements[1]{
    \begin{center}
        {\huge{\textit{Acknowledgements}} \par}
    \end{center}
    {\normalsize #1}
    \vfil\vfil\null
}
\newcommand\sphinxcontact{
	\section*{Contacto y Redes Sociales}
	Dirija sus comentarios y preguntas sobre este libro al editor:
	
	
	
	\noindent{\small
		\begin{tabular}[t]{llll}
			% ---------------------------- %
			\@publishername         &&& \\
			\@adresspublishername   &&& \\
			\@citypublishername. \@postalcodename. &&& \\
			\@localcontactname &&& \\
			\@exteriorcontactname &&& \\
			\@faxcontactname                                        
		\end{tabular}\kern-\tabcolsep
		\par
	}

	Tenemos una página web para este libro, donde enumeramos erratas, ejemplos y cualquier información adicionalin. Puede acceder a esta página en 
	
	Para comentar o hacer preguntas técnicas sobre este libro, envíe un correo electrónico a 
	
	Para obtener más información sobre nuestros libros, cursos, conferencias y noticias, consulte nuestro sitio web en
	
	\@localcontactname
	
	\@exteriorcontactname
	
	\@faxcontactname
	
	\@youtubename
	
	\@facebookname
	
	\@instagramname
	
	\@twittername
	
	\@telegramchannelname
	
	\@redditname
	
	\@discordservername
	
	\@githubname
	
	\@linkedinname
	
	\@gmailname
%	1005 Gravenstein Highway North
%	Sebastopol, CA 95472
%	800-998-9938 (in the United States or Canada)
%	707-829-0515 (international or local)
%	707-829-0104 (fax)
%	We have a web page for this book, where we list errata, examples, and any additional information. You can access this page at http://bit.ly/flsk-web-dev2.
%	To comment or ask technical questions about this book, send email to bookquestions@oreilly.com.
%	For more information about our books, courses, conferences, and news, see our website at http://www.oreilly.com.
%	Find us on Facebook: http://facebook.com/oreilly
%	Follow us on Twitter: http://twitter.com/oreillymedia
%	Watch us on YouTube: http://www.youtube.com/oreillymedia
}


% Preface
\newcommand\preface[1]{
	\addcontentsline{toc}{chapter}{Preface}
	\chapter*{Preface}
	{\normalsize #1}
	
	\sphinxcontact
	% before resetting page counter, let's do the right thing.
	\if@openright
	    \cleardoublepage
	\else
	    \clearpage
	\fi
	\pagenumbering{arabic}%
}


% This is needed to get the width of the section # area wide enough in the
% library reference.  Doing it here keeps it the same for all the manuals.
%
\newcommand{\sphinxtableofcontentshook}{%
  \renewcommand*\l@section{\@dottedtocline{1}{1.5em}{2.6em}}%
  \renewcommand*\l@subsection{\@dottedtocline{2}{4.1em}{3.5em}}%
}

% Fix the bibliography environment to add an entry to the Table of
% Contents.
% For a report document class this environment is a chapter.
%
\newenvironment{sphinxthebibliography}[1]{%
  \if@openright\cleardoublepage\else\clearpage\fi
  % \phantomsection % not needed here since TeXLive 2010's hyperref
  \begin{thebibliography}{#1}%
  \addcontentsline{toc}{chapter}{\bibname}}{\end{thebibliography}}

% Same for the indices.
% The memoir class already does this, so we don't duplicate it in that case.
%
\@ifclassloaded{memoir}
 {\newenvironment{sphinxtheindex}{\begin{theindex}}{\end{theindex}}}
 {\newenvironment{sphinxtheindex}{%
    \if@openright\cleardoublepage\else\clearpage\fi
    \phantomsection % needed as no chapter, section, ... created
    \begin{theindex}%
    \addcontentsline{toc}{chapter}{\indexname}}{\end{theindex}}}
