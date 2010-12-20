    \NeedsTeXFormat{LaTeX2e}
    \ProvidesClass{notube}

    \ProcessOptions
    \LoadClass[12pt,oneside,a4paper]{book}
    \RequirePackage{fancyhdr}
    \RequirePackage{graphicx}
    \RequirePackage{epsfig}
    \RequirePackage{color}
    \RequirePackage{url}
    \RequirePackage{ifthen}
    \RequirePackage{amssymb}
    \RequirePackage{longtable}
    \RequirePackage{lastpage}
    %\RequirePackage{sectsty}
    \definecolor{NotubeGreen}{rgb}{0.0,1.0,0.0}
    \definecolor{NotubeBlue}{rgb}{0.0,0.0,1.0}
    \definecolor{NotubeRed}{rgb}{1.0, 0.0, 0.0}

    % Utility commands for writing to .aux file

    \newcommand{\auxwrite}[1]{\protected@write\@auxout{}{#1}}
    \newcommand{\writelabel}[3]{\auxwrite{\string\newlabel{#1}{{#2}{#3}}}}

    % Information about the deliverable
    
    \newcommand{\WPText}{X}
    \newcommand{\WP}[1]{\renewcommand{\WPText}{#1}}
    \newcommand{\WPNameText}{Set WP name using WPName}
    \newcommand{\WPName}[1]{\renewcommand{\WPNameText}{#1}}
    \newcommand{\delIDText}{X.X}
    \newcommand{\delID}[1]{\renewcommand{\delIDText}{#1}}
    \newcommand{\delNameText}{Specify deliverable name using delName}
    \newcommand{\delNameRunningText}{Specify deliverable name using delName}
    \newcommand{\delName}[1]{\renewcommand{\delNameText}{#1}\renewcommand{\delNameRunningText}{#1}}
    \newcommand{\delNameRunning}[1]{\renewcommand{\delNameRunningText}{#1}}

    \newcommand{\delCoordinatorsText}{Specify deliverable coordinators}
    \newcommand{\delCoordinators}[1]{\renewcommand{\delCoordinatorsText}{#1}}

    \newcommand{\delContributorsText}{Specify deliverable contributors}
    \newcommand{\delContributors}[1]{\renewcommand{\delContributorsText}{#1}}

    \newcommand{\delQualityAssessorText}{Specify quality assessor}
    \newcommand{\delQualityAssessor}[1]{\renewcommand{\delQualityAssessorText}{#1}}

    \newcommand{\delQualityControllerText}{Specify quality controller}
    \newcommand{\delQualityController}[1]{\renewcommand{\delQualityControllerText}{#1}}

    \newcommand{\dueContractualText}{M6}
    \newcommand{\dueContractual}[1]{\renewcommand{\dueContractualText}{#1}}
    \newcommand{\dueActualText}{\today}
    \newcommand{\dueActual}[1]{\renewcommand{\dueActualText}{#1}}
    \newcommand{\statusText}{version x}
    \newcommand{\status}[1]{\renewcommand{\statusText}{#1}}

    \newcounter{final}
    \newcommand{\final}{\setcounter{final}{1}}
    
    \newcounter{nature}
    \newcommand{\prototype}{\setcounter{nature}{1}}
    \newcommand{\report}{\setcounter{nature}{2}}
    \newcommand{\dissemination}{\setcounter{nature}{3}}

    \newcounter{dissemination-level}
    \newcommand{\public}{\setcounter{dissemination-level}{1}}
    \newcommand{\consortium}{\setcounter{dissemination-level}{2}}

    \newcommand{\summaryText}{Please fill in the executive summary using the `summary' command.}
    \newcommand{\summary}[1]{\renewcommand{\summaryText}{#1}}

    \newcommand{\abstractText}{Please fill in the dissemination abstract summary using the `abstract' command.}
    \newcommand{\abstract}[1]{\renewcommand{\abstractText}{#1}}

    \newcommand{\keywordsText}{Please fill in the keywords using the `keywords' command.}
    \newcommand{\keywords}[1]{\renewcommand{\keywordsText}{#1}}

    \newcommand{\authorPartnerText}{Author 1 (Partner 1), Auhtor 2 (Partner 2)}
    \newcommand{\authorPartner}[1]{\renewcommand{\authorPartnerText}{#1}}
    
    \newcommand{\responsibleAuthorText}{Responsible Auhtor}
    \newcommand{\responsibleAuthor}[1]{\renewcommand{\responsibleAuthorText}{#1}}

    \newcommand{\responsibleAuthorPartnerText}{Partner}
    \newcommand{\responsibleAuthorPartner}[1]{\renewcommand{\responsibleAuthorPartnerText}{#1}}

    \newcommand{\responsibleAuthorEmailText}{author@somewhere.com}
    \newcommand{\responsibleAuthorEmail}[1]{\renewcommand{\responsibleAuthorEmailText}{#1}}

    \newcommand{\responsibleAuthorPhoneText}{(xxx) xxxx-xxx}
    \newcommand{\responsibleAuthorPhone}[1]{\renewcommand{\responsibleAuthorPhoneText}{#1}}

    \newcounter{version-log-entry}
    \newcommand{\versionLogText}{}
    \newcommand{\versionLog}[1]{\renewcommand{\versionLogText}{#1}}
    \newcommand{\versionLogEntry}[3]{%
        #1 & \addtocounter{version-log-entry}{1}\arabic{version-log-entry} & #2 & #3 \\%
        \hline%
    }
    
        % Page sizes and general layout for the 'report' variant

    \newcommand{\normalLayout}{%
        \setlength{\hoffset}{0.3cm}%
        \setlength{\textwidth}{15.4cm}%
        \setlength{\evensidemargin}{0cm}%
        \setlength{\oddsidemargin}{0cm}%
        %
        \setlength{\textheight}{24.7cm}%
        \setlength{\voffset}{0cm}%
        \setlength{\topmargin}{-2.1cm}%
        \setlength{\headheight}{1.5cm}%
        \setlength{\headsep}{0.8cm}%
        \renewcommand{\headrulewidth}{0.2pt}%
        \renewcommand{\footrulewidth}{0pt}%
    }
    \normalLayout
    \clubpenalty=9999
    \widowpenalty=9999
    \raggedbottom

    % Header setup

    \newcommand{\mainmatterheading}{\begin{small}FP7 -- 231761\\\vspace{0.1cm}Deliverable \delIDText\end{small}}
%    \newcommand{\frontmatterheading}{\begin{small}\textsf{\delNameRunningText}\\\end{small}}
    \newcommand{\frontmatterheading}{\begin{small}FP7 -- 231761\\\vspace{0.1cm}Deliverable \delIDText\end{small}}
    \pagestyle{fancy}
    \fancyhead{}
    \fancyhead[L]{\if@mainmatter \mainmatterheading \else \frontmatterheading \fi}
    \fancyhead[R]{\hspace{1cm}\includegraphics[width=2.5cm]{template-figures/notube-logo}}
    \fancyfoot{}
%    \fancyfoot[L]{\if@mainmatter \else \begin{small}\textsf{Deliverable \delIDText}\end{small}\fi}
    \fancyfoot[C]{\thepage\ of \pageref{LastPage}}

    % Customizations of the book style

    % this command is overridden so that it does not kill the headers and footers
    \renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}

    % this command is overridden so that it formats the chapter as I want
    \def\@makechapterhead#1{{\noindent \sffamily\Large \thechapter. \space  \sffamily #1}\par \vskip 15\p@}
    \def\@makeschapterhead#1{{\noindent \normalfont\Large\scshape #1}\par \vskip 15\p@}

    \renewcommand\section{\@startsection {section}{1}{\z@}{-3.5ex \@plus -1ex \@minus -.2ex}{2.3ex \@plus.2ex}{\sffamily\Large}}

    \renewcommand\subsection{\@startsection {subsection}{2}{1cm}{-3.5ex \@plus -1ex \@minus -.2ex}{2.3ex \@plus.2ex}{\sffamily\normalsize}}

    \renewcommand\subsubsection{\@startsection {subsubsection}{2}{2cm}{-3.5ex \@plus -1ex \@minus -.2ex}{2.3ex \@plus.2ex}{\sffamily\normalsize}}

    \renewcommand{\bibname}{References}
    \renewcommand\contentsname{Table of Contents}
    \renewcommand*\l@chapter[2]{%
    \ifnum \c@tocdepth >\m@ne
        \addpenalty{-\@highpenalty}%
        \vskip 1.0em \@plus\p@
        \setlength\@tempdima{1.5em}%
        \begingroup
        \parindent \z@ \rightskip \@pnumwidth
        \parfillskip -\@pnumwidth
        \leavevmode \scshape
        \advance\leftskip\@tempdima
        \hskip -\leftskip
        #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
        \penalty\@highpenalty
        \endgroup
    \fi}
    
    

    % My sectioning

    \newcommand{\thispart}{}
    \newcommand{\Thispart}{}
    \newcounter{section-offset}
    \newcommand{\sectionup}{\addtocounter{section-offset}{1}}
    \newcommand{\sectiondown}{\addtocounter{section-offset}{-1}}
    \newcounter{temp-section}
    \newcommand{\mysection}[3]{%
        \setcounter{temp-section}{#1}%
        \addtocounter{temp-section}{\value{section-offset}}%
        \ifthenelse{\value{temp-section}=1}{\chapter{#2}\renewcommand{\thispart}{chapter\xspace}\renewcommand{\Thispart}{Chapter\xspace}\writelabel{#3}{Chapter~\thechapter}{\thepage}}
        {\ifthenelse{\value{temp-section}=2}{\section{#2}\renewcommand{\thispart}{section\xspace}\renewcommand{\Thispart}{Section\xspace}\writelabel{#3}{Section~\thesection}{\thepage}}
        {\ifthenelse{\value{temp-section}=3}{\subsection{#2}\renewcommand{\thispart}{subsection\xspace}\renewcommand{\Thispart}{Subsection\xspace}\writelabel{#3}{Subsection~\thesubsection}{\thepage}}
        {\textbf{Unknown Section Number #1:#2}}}}%
    }
    % The title page

    \renewcommand{\and}{\\}
    \newcommand{\notubetitlepage}{%
        \thispagestyle{empty}%
        \setlength{\voffset}{0cm}%
        \setlength{\topmargin}{-1.2cm}%
        \setlength{\headheight}{0cm}%
        \setlength{\headsep}{0cm}%
        \noindent \setlength{\unitlength}{1mm}%
%         \begin{picture}(0,0)%
%             \linethickness{1.5pt} %
%             \put(0,-90){\color{blue}\line(0,-1){167}\line(1,0){156}}%
%         \end{picture}%
        \begin{center}%
            \includegraphics[width=5cm]{template-figures/FP7-gen-RGB.png} \hfill  \includegraphics[width=6cm]{template-figures/notube-logo} \vspace{1.8cm} \\%
%            \includegraphics[width=5cm]{template-figures/FP7-gen-RGB} \hfill  \includegraphics[width=6cm]{template-figures/LarKC-logo-HIGH} \vspace{1.8cm} \\%
            \textbf{\textsf{\Large{NoTube}}} \\%
            \textsl{Networks and Ontologies for the Transformation and Unification of Broadcasting and the Internet} \\
            \textsl{}
            \vspace{0.5cm} \\%
            {\color{NotubeBlue}\Large\bfseries\sffamily FP7 -- 231761} \vspace{2.5cm} \\%
%            Deliverable \vspace{2.5cm} \\
            \hrule \vspace{0.5cm}
            {\Huge\bfseries D\delIDText} %\vspace{0.5cm} \\%
            {\Huge\bfseries \delNameText} 
            \vspace{0.5cm} 
            \hrule 
            \mbox{} \vspace{1.2cm}\\% 
            %{\large\bfseries\sffamily \@author} \vspace{2.5cm} \\%
            {\large\bfseries Coordinator: \delCoordinatorsText}\\
            {\large\bfseries With contributions from: \delContributorsText}\\%
            {\bfseries Quality Assessor: \delQualityAssessorText}\\
            {\bfseries Quality Controller: \delQualityControllerText} \vspace{2.5cm} \\%
                      
%
        {\footnotesize
            \noindent\begin{tabular}{|@{\@spacer}p{3.5cm}@{\@spacer}|@{\@spacer}p{10cm}@{\@spacer}|}%
            \hline%
            Document Identifier: & 
            \@spacer NoTube/2009/D{\delIDText}/{\statusText} \@spacer \\
            \hline%
            Class Deliverable: &
            \@spacer NoTube EU-IST-2009-231761\@spacer \\
            \hline%
            Version: & 
            \@spacer \statusText \@spacer \\
            \hline%
            Date: & 
            \@spacer \@date \@spacer \\
            \hline%
            State: & 
            \@spacer Final \@spacer \\
            \hline%
            Distribution: & 
            \@spacer Public \@spacer \\
            \hline%
            \end{tabular}
       }
       \end{center}%
        \newpage \normalLayout%
    }

    % Document information page
    
    \newcommand{\boolTick}[2]{\ifthenelse{\value{#1}=#2}{$\boxtimes$}{$\Box$}}
    
    \def\@spacer{\hspace{0.1cm}}
    \newcommand{\documentinformation}{%
        \chapter*{Document Information}%
        {\footnotesize
            \noindent\begin{tabular}{|@{\@spacer}p{3.5cm}@{\@spacer}|@{\@spacer}p{5.5cm}@{\@spacer}|@{\@spacer}p{3cm}@{\@spacer}|@{\@spacer}p{2.4cm}@{\@spacer}|}%
            \hline%
            \textbf{IST Project} \par \textbf{Number}      & FP7 -- 231761 & \textbf{Acronym}  & NoTube \\%
            \hline%
            \textbf{Full Title}         & \multicolumn{3}{@{}l@{}|}{Networks and Ontologies for the Transformation and Unification of} \\%
            \textbf{}         & \multicolumn{3}{@{}l@{}|}{ Broadcasting and the Internet} \\%                      
            \hline%
            \textbf{Project URL}        & \multicolumn{3}{@{}l@{}|}{\texttt{http://www.notube.tv/}} \\%
            \hline%
            \textbf{Document URL}       & \multicolumn{3}{@{}l@{}|}{} \\%
            \hline%
            \textbf{EU Project Officer} & \multicolumn{3}{@{}l@{}|}{Leonhard Maqua} \\%
            \hline%
            \end{tabular} \vspace{0.7cm} \par%
            %
            \noindent\begin{tabular}{|@{\@spacer}p{3.5cm}@{\@spacer}|@{\@spacer}p{1.5cm}@{\@spacer}|@{\@spacer}p{0.8cm}@{\@spacer}|@{\@spacer}p{1.2cm}@{\@spacer}|@{\@spacer}p{7.2cm}@{\@spacer}|}%
            \hline%
            \textbf{Deliverable}        & \textbf{Number}   & \delIDText    & \textbf{Title}    & \delNameText \\
            \hline%
            \textbf{Work Package}       & \textbf{Number}   & \WPText       & \textbf{Title}    & \WPNameText \\
            \hline%
            \end{tabular} \vspace{0.7cm} \par%
            %
            \noindent\begin{tabular}{|@{\@spacer}p{3.5cm}@{\@spacer}|@{\@spacer}p{2.5cm}@{\@spacer}|@{\@spacer}p{2.7cm}@{\@spacer}|@{}p{2.5cm}@{\@spacer}|@{\@spacer}p{3.1cm}@{\@spacer}|}%
            \hline%
            \textbf{Date of Delivery}   & \textbf{Contractual}  & \dueContractualText   & \@spacer \textbf{Actual}   & \dueActualText \\
            \hline%
            \textbf{Status}             & \multicolumn{2}{@{}c@{}|}{\statusText}        & \multicolumn{2}{@{\@spacer}l@{}|}{final \boolTick{final}{1}} \\
            \hline%
            \textbf{Nature}             & \multicolumn{4}{@{}l@{}|}{prototype \boolTick{nature}{1} report \boolTick{nature}{2} dissemination \boolTick{nature}{3}} \\
            \hline%
            \textbf{Dissemination} \par \textbf{Level}& \multicolumn{4}{@{}l@{}|}{public \boolTick{dissemination-level}{1} consortium \boolTick{dissemination-level}{2}} \\
            \hline%
            \end{tabular} \vspace{0.7cm} \par%
            %
            \noindent\begin{tabular}{|@{\@spacer}p{3cm}@{\@spacer}|@{}l@{}|}%
            \hline%
            \textbf{Authors (Partner)}  & 
               \@spacer \begin{minipage}{11.5cm} 
                 \authorPartnerText
               \end{minipage} \@spacer \\%
            \hline%
            \textbf{Resp. Author}       & %
                \begin{tabular}{@{\@spacer}p{1.5cm}@{\@spacer}|@{\@spacer}p{2.5cm}@{\@spacer}|@{}p{1.3cm}@{\@spacer}|@{\@spacer}p{6cm}@{\@spacer}}
                    \multicolumn{2}{@{\@spacer}l@{\@spacer}|}{\responsibleAuthorText}       & \@spacer \textbf{E-mail}   & \responsibleAuthorEmailText \\%
                    \hline%
                    \textbf{Partner}    & \responsibleAuthorPartnerText                     & \@spacer \textbf{Phone}    & \responsibleAuthorPhoneText \\%
                \end{tabular} \\%
            \hline%
            \end{tabular} \vspace{0.7cm} \par%
            %
            \noindent\begin{tabular}{|@{\@spacer}p{3.5cm}@{\@spacer}|@{\@spacer}p{11.3cm}@{\@spacer}|}%
            \hline%
            \textbf{Abstract} \par \textbf{(for dissemination)} & 
            \@spacer \begin{minipage}{11cm}
              \abstractText 
            \end{minipage} \@spacer \\
            \hline%
            \textbf{Keywords} &
            \@spacer \begin{minipage}{11cm}
              \keywordsText
            \end{minipage} \@spacer \\
            \hline%
            \end{tabular} \vspace{0.7cm} \par%
            %
            \noindent\begin{tabular}{|@{\@spacer}p{3cm}@{\@spacer}|@{\@spacer}p{1cm}@{\@spacer}|@{\@spacer}p{2.5cm}@{\@spacer}|@{\@spacer}p{7.9cm}@{\@spacer}|}%
            \hline%
            \multicolumn{4}{|l|}{\textbf{Version Log}} \\%
            \hline%
            \textbf{Issue Date} & \textbf{Rev No.}  & \textbf{Author}   & \textbf{Change} \\%
            \hline%
            \versionLogText%
            \end{tabular} \par%
        } 
        \vspace{1cm}
        
        
        \newpage%
    }

    \newcommand{\@partner}[5]{#4 & \centering \par \vspace{-0.3cm} #1 \vspace{0.2cm} \par \includegraphics[width=#3cm]{template-figures/jpg/#2} & #5 \\ \hline}
    \newcommand{\projectconsortiuminformation}{%
        \chapter*{Project Consortium Information}%
        \vspace{0.2cm}%
        {\scriptsize
            \noindent
         \begin{longtable}{|@{\@spacer}p{5.8cm}@{\@spacer}|@{\@spacer}p{2.5cm}@{\@spacer}|@{\@spacer}p{6.4cm}@{\@spacer}|}%
            \hline%
            \textbf{Participant's name}                                                & \textbf{Partner}              & \textbf{Contact} \\%
            \hline%
            \@partner{}{vua}{2.4}{Vrije Universiteit Amsterdam}{Guus Schreiber \par Phone: +31 20 598 7739/7718 \par Email: schreiber@cs.vu.nl}
            \@partner{}{bbc}{2.5}{British Broadcasting Corporation}{Libby Miller \par Phone: +44 787 65 65 561 \par Email: Libby.Miller@bbc.co.uk}
            \@partner{}{as}{2.3}{Asemantics SRL Uninominale}{Alberto Reggiori
\par Phone: +39 0639 7510 78
\par Email:  alberto@asemantics.com
}
            \@partner{}{engin}{2.3}{Engin Medya Hizmetleri A.S.} {Ron van der Heiden
\par Phone: +31 6 2003 2006
\par Email: ron@engin.tv
}
            \@partner{}{irt}{2.5}{Institut fuer Rundfunktechnik GmbH}{Christoph Dosch
\par Phone: +49 89 32399 349
\par Email: dosch@irt.de
}
            \@partner{}{ot}{2.3}{Ontotext AD}{Atanas Kiryakov
\par Phone: +35 928 091 565
\par Email:  naso@sirma.bg
}
            \@partner{}{ou}{2.3}{Open University}{John Domingue
\par Phone: +44 1908 655 014
\par Email: j.b.domingue@open.ac.uk
}
            \@partner{}{rai}{2.3}{RAI Radiotelevisione Italiana SPA}{Alberto Morello
\par Phone: +39 011 810 31 07
\par Email:  a.morello@rai.it
}
            \@partner{}{sti}{2.3}{Semantic Technology Institute International}{Lyndon Nixon
\par Phone: +43 1 23 64 002
\par Email:  lyndon.nixon@sti2.org
}
            \@partner{}{stoneroos}{2.3}{Stoneroos B.V.}{Annelies Kaptein
\par Phone: +31 35 628 47 22
\par Email:  annelies.kaptein@stoneroos
}
            \@partner{}{tgv}{1.3}{Thomson Grass Valley France SA}{Raoul Monnier
\par Phone: +33 2 99 27 30 57
\par Email: raoul.monnier@thomson.net
}
            \@partner{}{txt}{1.3}{TXT Polymedia SPA}{Sergio Gusmeroli
\par Phone: +39 02 2577 1310
\par Email: sergio.gusmeroli@txtgroup.com
}
            \@partner{}{kt}{2.3}{KT Corporation}{Myoung-Wan Koo
\par Phone: +82 2 526 6347
\par Email: mskim@kt.co.kr
}
    
            \end{longtable}%
        }  \par \newpage%
    }

    \renewcommand{\maketitle}{%
        %\frontmatter%
        \notubetitlepage%
        %\setcounter{page}{1}%
        \chapter*{Executive Summary}%
        \summaryText%
        \newpage%
        \documentinformation%
        \projectconsortiuminformation%
        \tableofcontents%
        \listoffigures\addcontentsline{toc}{chapter}{List of figures}%
        \include{abbreviations}
        %\chapterfont{\sffamily}
        %\allsectionsfont{\sffamily}
        %\mainmatter%



% \renewcommand{\section}{%
% \@startsection%
%  {section}%
%  {1}%                          % Level
%  {0pt}%                        % Indentation
%  {-2\baselineskip}%            % Distance before the header (ignore
%                                % the `-` sign. It indicatas that the
%                                % indentation of the paragraph
%                                % following the section is surpressed).
%  {0.5\baselineskip}%           % Distance after the header.
%  {\sffamily\large\bfseries}} % The font used for the header. Add 
%                                % \sffamily if you like a sans-serif font.
%
%        
%\renewcommand{\subsection}{%
% \@startsection%
%  {subsection}%
%  {2}%
%  {1cm}%
%  {\baselineskip}%
%  {0.25\baselineskip}%
%  {\sffamily\normalsize\bfseries}}
    
    }
