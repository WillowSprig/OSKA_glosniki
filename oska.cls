%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% File:     oska.cls           (LaTeX Document class option "oska")
%          
% Authors: Teresa Makuch      (tesiamakuch@gmail.com)
%          Szymon Mikulicz    (szymon.mikulicz@posteo.net)
%          Marcel Piszak      (marcel.piszak@wp.pl)
%          AGH University of Science and Technology, Kraków, POLAND
% 
% Based on aghdpl.cls by  Marcin Szpyrka     (mszpyrka@agh.edu.pl)
%                         Grzegorz J. Nalepa (gjn@agh.edu.pl)
%                         Paweł Kłeczek      (p.l.kleczek@gmail.com)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\message{*** [oska.cls] ---  (SM, MP, TM)  v1.0.3 <17.01.2019>  ***}  

\newif\ifpdflatex\pdflatexfalse
\NeedsTeXFormat{LaTeX2e} % 
\ProvidesClass{oska} 
\DeclareOption{pdflatex}{\pdflatextrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}} 
\ProcessOptions\LoadClass[a4paper,twoside]{article} 

\RequirePackage{newtxtext}
\RequirePackage{anyfontsize}
\RequirePackage[T1]{fontenc}
\RequirePackage{graphicx}
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{url}
\RequirePackage{etoolbox}
\RequirePackage{titlesec}
\RequirePackage{tocloft}
\RequirePackage{mfirstuc}
\RequirePackage{setspace}

\RequirePackage[font=small, labelfont=bf, labelsep=quad]{caption}
\RequirePackage{subcaption}
\RequirePackage[detect-weight=true, detect-family=true]{siunitx}
\RequirePackage{enumerate}
\RequirePackage{enumitem}
\RequirePackage[all,defaultlines=2]{nowidow} % Kontrola sierot i wdów - działa lepiej niż \widowpenalty i \clubpenalty

\geometry{lmargin=25mm, rmargin=25mm, tmargin=25mm, bmargin=25mm, foot=12.5mm, head=0mm}
\setlength{\parindent}{10mm}

\def\namem#1			    {\gdef\@namem{#1}}
\def\surnamem#1 		    {\gdef\@surnamem{#1}}
\def\namei#1			    {\gdef\@namei{#1}}
\def\surnamei#1 		    {\gdef\@surnamei{#1}}
\def\nameii#1			    {\gdef\@nameii{#1}}
\def\surnameii#1 		    {\gdef\@surnameii{#1}}
\def\nameiii#1			    {\gdef\@nameiii{#1}}
\def\surnameiii#1 		    {\gdef\@surnameiii{#1}}
\def\nameiiii#1			    {\gdef\@nameiiii{#1}}
\def\surnameiiii#1 		    {\gdef\@surnameiiii{#1}}
\def\nameiiiii#1		    {\gdef\@nameiiiii{#1}}
\def\surnameiiiii#1                 {\gdef\@surnameiiiii{#1}}
\def\email#1		            {\gdef\@email{#1}}
\def\titlePL#1                      {\gdef\@titlePL{#1}}
\def\titleEN#1                      {\gdef\@titleEN{#1}}
\def\affiliation#1                  {\gdef\@affiliation{#1}}
\def\email#1        	            {\gdef\@email{#1}}
\def\summaryPL#1                    {\gdef\@summaryPL{#1}}
\def\summaryEN#1                    {\gdef\@summaryEN{#1}}

\ProcessOptions

%---------------------------------------------------------------------------
% Nagłówek artykułu
%---------------------------------------------------------------------------

\newcommand{\maketitles}{
  \begin{flushleft}
    \textbf{\@namem\ \MakeUppercase{\@surnamem}}%
    \textbf{\ifdefempty{\@namei}{}{, \@namei\ \MakeUppercase{\@surnamei}}}%
    \textbf{\ifdefempty{\@nameii}{}{, \@nameii\ \MakeUppercase{\@surnameii}}}%
    \textbf{\ifdefempty{\@nameiii}{}{, \@nameiii\ \MakeUppercase{\@surnameiii}}}%
    \textbf{\ifdefempty{\@nameiiii}{}{, \@nameiiii\ \MakeUppercase{\@surnameiiii}}}%
    \textbf{\ifdefempty{\@nameiiiii}{}{, \@nameiiiii\ \MakeUppercase{\@surnameiiiii}}}%
    \\\vspace{5mm}
    \textbf{\MakeUppercase{\@titlePL}}\\
    \textbf{\MakeUppercase{\@titleEN}} \\\vspace{5mm}
    \@affiliation \\
    \@email \\\vspace{8mm}
  \end{flushleft}
    \noindent\textbf{Streszczenie} \\
    \@summaryPL \\\vspace{8mm}

    \noindent\textbf{Abstract} \\
    \@summaryEN
}

%---------------------------------------------------------------------------
% Brak nagłówka i stopki na stronach
%---------------------------------------------------------------------------

\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\fancyhf{}
\fancyhead{}


\frenchspacing
\sloppy 
\flushbottom
\onehalfspacing

\captionsetup{justification=centering}

%---------------------------------------------------------------------------
% Ustawienia wyświetlania liczb (zgodne z polskimi zwyczajami typograficznymi)
%---------------------------------------------------------------------------

\sisetup{
  output-decimal-marker = {,},
  %	round-mode=places,
  %	round-precision=4,
  group-separator={~},
}

%---------------------------------------------------------------------------
% Zmiana kroju czcionki URL-i z czcionki o stałej szerokości na szeryfową z kursywą.
%---------------------------------------------------------------------------
\renewcommand\UrlFont{\rmfamily\itshape}

%---------------------------------------------------------------------------
% Ustawienia parametrów tytułów rozdziałów, podrozdziałów, itd.
%---------------------------------------------------------------------------

%odstępy: lewy, góra, dół
\titleformat{\section}[block]
{\bfseries\normalsize}{\filright \normalsize\thesection. }{0ex}{}
\titlespacing{\section}{0mm}{8mm plus 0mm minus 1mm}{4mm plus 0mm minus 1mm}
\titleformat{\subsection}[block]
{\bfseries\normalsize}{\filright \normalsize\thesubsection. }{0ex}{}
\titlespacing{\subsection}{3mm}{6mm}{2.5mm}
\titleformat{\subsubsection}[block]
{\bfseries\normalsize}{\filright \normalsize\thesubsubsection. }{0ex}{}
\titlespacing{\subsubsection}{6mm}{3mm}{1.5mm}
