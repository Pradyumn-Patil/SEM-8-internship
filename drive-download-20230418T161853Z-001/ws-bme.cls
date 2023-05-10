\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ws-bme}[1994/07/13 v1.2u Standard LaTeX document class]
%\immediate\openout12=id.jid
%\immediate\write12{240}
%\immediate\closeout12
\@twosidetrue\@mparswitchtrue\@twocolumnfalse
\newif\if@openright
\@openrighttrue
\newif\if@restonecol
%
\newif\if@draft
%
\newdimen\draftrule
\draftrule=0pt
\AtEndDocument{\label{eof}}
\def\thebepage{\thepage}
\def\theeepage{\pageref{eof}}
%
\DeclareOption{splissue}{\@splissuetrue}
\DeclareOption{draft}{\@drafttrue\setlength\overfullrule{5pt}\draftrule0.01pt}%
%
\DeclareOption{final}{\setlength\overfullrule{0pt}}
%
\ExecuteOptions{a4paper,10pt,twoside,twocolumn,final}
\ProcessOptions
%
\def\appendixname{Appendix\ }
\newcommand\abstractname{Abstract}
\newcommand\bibname{REFERENCES}%
%
\newcommand\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
    \space\number\day, \number\year}
\newcount\minute
\newcount\hour
\def\currenttime{%
    \minute\time
    \hour\minute
    \divide\hour60
    \the\hour:\multiply\hour60\advance\minute-\hour\the\minute}
%
\newdimen\trimheight
\newdimen\trimwidth
\newdimen\typeheight
\newdimen\typewidth
\newdimen\tempdimen
\newdimen\tablewidth
\newdimen\normaltextheight
\newdimen\realtextheight
\newbox\tempbox
\newdimen\tablewd
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Fonts %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\def\ELEVEN{\fontsize{11}{13}\selectfont}
\def\TEN{\fontsize{10}{12}\selectfont}
\def\NINE{\fontsize{9}{11}\selectfont}
\def\EIGHT{\fontsize{8}{10}\selectfont}
\def\foliofont{\fontsize{9}{11}\selectfont}
\def\bibfont{\fontsize{9}{11}\selectfont}
\def\rhfont{\NINE\itshape{}}
\def\catchlinefont{\EIGHT}
\def\abstractfont{\fontsize{8}{10}\selectfont}
\font\tifont=cmbx10 at 12pt
\def\titlefont{\baselineskip14pt\bfseries\boldmath\centering{}\fontsize{14}{16}\selectfont{}}
\def\authorfont{\fontsize{12}{14}\selectfont{}}
\def\affiliationfont{\ELEVEN\itshape}
\def\datefont{\EIGHT}
\def\sectionfont{\fontsize{12}{14}\selectfont\bfseries\boldmath\rightskip2pc plus1fill}
\def\subsectionfont{\fontsize{12}{14}\bfseries\boldmath\rightskip2pc plus1fill{}}
\def\subsubsectionfont{\fontsize{12}{14}\itshape\rightskip2pc plus1fill{}}
\def\paragraphfont{\fontsize{12}{14}\boldmath}
\def\subparagraphfont{\itshape}
\let\figurecaptionfont\EIGHT
\let\tablefont\EIGHT
\def\tablecaptionfont{\EIGHT\bfseries\boldmath}
\def\foot{\small}
%
\font\bfit=cmbxti10 at 10pt
\font\ninerm=cmr9
\font\nineit=cmti9
\font\ninebf=cmbx9
\font\twelverm=cmr10  scaled\magstep1
\font\twelveit=cmti10 scaled\magstep1
\font\twelvebf=cmbx10 scaled\magstep1
\font\twelvebfit=cmbxti10 scaled\magstep1
%
\renewcommand\normalsize{%
   \@setfontsize\normalsize\@xpt{13}%\@xiiipt
   \abovedisplayskip6\p@\@plus4\p@\@minus2\p@
   \abovedisplayshortskip\abovedisplayskip
   \belowdisplayshortskip\abovedisplayshortskip
   \belowdisplayskip\abovedisplayskip
   \let\@listi\@listI}
%\normalsize
%
\newcommand\small{%
   \@setfontsize\small\@ixpt{11}%
   \abovedisplayskip 8\p@ \@plus3\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus2\p@
   \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 4\p@ \@plus2\p@ \@minus2\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip}
%
\newcommand\footnotesize{%
   \@setfontsize\footnotesize\@ixpt{11}%
   \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus\p@
   \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 3\p@ \@plus\p@ \@minus\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip}

\newcommand\theoremsize{%
   \@setfontsize\theoremsize\@xpt{12}%\@xiiipt
   \abovedisplayskip 4pt plus 4pt minus 2pt
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI\baselineskip13pt plus 0.33pt minus 0.25pt\relax}
%
\newcommand\scriptsize{\@setfontsize\scriptsize\@viipt\@viiipt}
\newcommand\tiny{\@setfontsize\tiny\@vpt\@vipt}
\newcommand\large{\@setfontsize\large\@xiipt{14}}%
\newcommand\Large{\@setfontsize\Large\@xivpt{16}}%%
\newcommand\LARGE{\@setfontsize\LARGE\@xviipt{20}}
\newcommand\huge{\@setfontsize\huge\@xxpt{25}}
\newcommand\Huge{\@setfontsize\Huge\@xxvpt{30}}
\setlength\smallskipamount{3\p@ \@plus 1\p@ \@minus 1\p@}
\setlength\medskipamount{6\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\bigskipamount{12\p@ \@plus 4\p@ \@minus 4\p@}
%
\DeclareOldFontCommand{\rm}{\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\scshape}{\@nomath\sc}
\DeclareOldFontCommand{\bi}{\bfseries\itshape}{\bfseries\itshape}
\renewcommand{\rmdefault}{cmr}%
%
\DeclareMathSizes{28}{28}{25}{20}
\DeclareMathSizes{24}{24}{21}{18}
\DeclareMathSizes{22}{22}{19}{17}
\DeclareMathSizes{20}{20}{17}{15}
\DeclareMathSizes{18}{18}{15}{10}
\DeclareMathSizes{12}{11}{8}{5}
\DeclareMathSizes{11}{11}{8}{5}
\DeclareMathSizes{10}{10}{7}{5}
\DeclareMathSizes{9.5}{9}{7}{5}
\DeclareMathSizes{9}{9}{7}{5}
\DeclareMathSizes{8}{8}{6}{5}
\DeclareMathSizes{7}{7}{5}{5}
\DeclareMathSizes{6}{6}{5}{5}
\DeclareMathSizes{5}{5}{5}{5}
\def\bm#1{\mathchoice
    {\mbox{\boldmath$#1$}}%
          {\mbox{\boldmath$#1$}}%
          {\mbox{\boldmath$\scriptstyle#1$}}%
          {\mbox{\boldmath$\scriptscriptstyle#1$}}}%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%Initializations %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\trimheight11truein
\trimwidth8.5truein
%\typeheight9.37truein
\typeheight55.9pc
\typewidth41.4pc
\setlength\realtextheight{55.9pc}
%
\setlength\parindent{12\p@}
\setlength\headheight{5\p@}
\setlength\headsep   {17pt}%15
\setlength\topskip   {7\p@}%{10\p@}
\setlength\footskip{10pt}%18pt
\setlength\maxdepth{4\p@}
\setlength\@maxdepth\maxdepth
\setlength\textwidth{41.4pc}
%\setlength\textwidth{7.0truein}
\setlength\textheight\typeheight
\advance\textheight-\headheight
\advance\textheight-\headsep
\setlength\normaltextheight{\textheight}
\setlength\oddsidemargin{20mm}
\setlength\evensidemargin{\trimwidth}
\addtolength\evensidemargin{-\textwidth}
\addtolength\evensidemargin{-\oddsidemargin}
\setlength\marginparwidth{.75in}
\setlength\marginparsep{7\p@}
\setlength\marginparpush{5\p@}
%\setlength\topmargin{.85926in}
\setlength\topmargin{.65in}
\setlength\footnotesep{6\p@}
\setlength{\skip\footins}{18\p@ \@plus 5\p@ \@minus 2\p@}
\setlength\floatsep    {18\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\textfloatsep{18\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\intextsep   {18\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\dblfloatsep    {18\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\dbltextfloatsep{18\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\@fptop{0\p@}
\setlength\@fpsep{8\p@ \@plus 2fil}
\setlength\@fpbot{0\p@ \@plus 1fil}
\setlength\@dblfptop{0\p@ \@plus 1fil}
\setlength\@dblfpsep{8\p@ \@plus 2fil}
\setlength\@dblfpbot{0\p@ \@plus 1fil}
\setlength\partopsep{0\p@}
%
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Title %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\def\title#1{
\gdef\@title{
\def\@makefnmark{\rlap{\ifnum\c@footnote=1{\raise7pt\hbox{\rm{\foot*}\,}}\else
           \@textsuperscript{{\foot\@thefnmark}}\fi}}\vspace*{-45.6pt}{#1}}}
\def\subtitle#1{{\titlefont :~#1}}
\newcommand\maketitle{\par
  \begingroup
   \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
   \def\@makefnmark{\rlap{\ifnum\c@footnote=1{\raise3pt\hbox{\rm{\foot*}\,}}\else
           \@textsuperscript{{\foot\@thefnmark}}\fi}}%
    \long\def\@makefntext##1{\noindent
%   \@textsuperscript{\normalfont\@thefnmark}{\lowercase{##1}}}%
    \@textsuperscript{\normalfont\@thefnmark}{##1}}%
      %\newpage
      \global\@topnum\z@
      \@maketitle
    \thispagestyle{plain}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\@author\@empty
  \global\let\author\relax
}

\def\@maketitle{%
  \newpage
  \null
  \vspace*{-10pt}
   \vspace*{-25pt}% to have the bylines on the beginning of the page
  \@clinebuf
%  \vspace*{70pt}
%  \begin{center}%
%  \let\footnote \thanks
%  {\titlefont\@title}
%  \@aabuffer\par
%  \end{center}%
  \vspace*{52pt}
  \begin{center}%
  \let\footnote \thanks
  {\titlefont\@title\par}%
  \vspace*{28pt}
  \@aabuffer\par
  \end{center}%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End Title %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Local Definitions %%%%%%%%%%%%%%%%%%%%%%
%
\def\uc#1{\uppercase{#1}}
\newcommand{\cal}{\protect\pcal}
\newcommand{\pcal}{\@fontswitch{\relax}{\mathcal}}
%
\def\mtb{\fboxsep=0pt\fbox{\phantom{e}}}
\def\breakhere{\par\vskip-\lastskip
            \pagebreak}
\def\forcebreak{\vadjust{\pagebreak}}
%
\def\thebepage{\thepage}
\def\theeepage{\pageref{eof}}
%
\def\pub#1#2{\par%
    \addvspace{-2pt plus-2pt minus-2pt}
    {\centering{
    \authorfont #1\par
    #2\par}\par}
    \addvspace{15pt plus2pt minus2pt}}%
%
\def\@clinebuf{}
%
\newcount\clcount
\def\@clinebuf{}

\def\catchline#1#2#3{\expandafter\def\expandafter\@clinebuf\expandafter
    {\@clinebuf\catchlinefont
    \vspace*{3pt}
    \noindent Biomedical Engineering: Applications, Basis and Communications, Vol.\ {#1}, \No\ {#2} (#3)\ \thebepage--\theeepage\par
    %\noindent \copyright\ National Taiwan University\par
    \vspace*{-9pt}
    \hfill\includegraphics[scale=.43]{wlogo.eps}
    }\relax\par
    }%

\def\No{No.}
%
\def\and{\hbox{\lowercase{and }}}
\def\aand{\\[10pt]{\upshape{and}}\\[-3pt]}
\def\@aabuffer{}
\newcounter{aut}
\def\author#1{\refstepcounter{aut}
\ifnum\theaut=1
    \expandafter\def\expandafter\@aabuffer\expandafter
    {\@aabuffer{\vskip.4pt\par{\authorfont#1}}\relax\par}
\else
    \expandafter\def\expandafter\@aabuffer\expandafter
    {\@aabuffer{\vskip8pt\par{\authorfont#1}}\relax\par}
\fi}
\def\address#1{\expandafter\def\expandafter\@aabuffer\expandafter
    {\@aabuffer{\vskip0pt\par{\affiliationfont#1\par}}\relax\par}}
%
\newenvironment{history}{%
\vspace*{1pt}
   \leftskip.65in\rightskip\leftskip
\begin{center}
   \begingroup
    \ELEVEN
    \parindent0pt\ignorespaces\par}
{\endgroup\end{center}\par}
%
\newenvironment{abstract}{\par%
\vspace*{14.5pt}\par
\leftskip.65in\rightskip\leftskip
   \abstractfont
   \begingroup
   \parindent0pt\ignorespaces
   \begin{center}{\fontsize{10}{12}\selectfont\bf ABSTRACT\\}\end{center}\vspace*{-5.5pt}
   }
{\endgroup\par\vspace*{37pt}}
%
\def\keywords#1{\par%
\vspace*{-31.5pt}
\begingroup
\begin{center}\begin{minipage}[t]{5.58in}\abstractfont{\it Keywords}\/:\ #1\end{minipage}\end{center}
\endgroup\ignorespaces\par\vspace*{28pt}}
%
\def\email#1{\it #1}
\def\http#1{\it http://#1\par}
\def\url#1{\it #1\par}
\def\received#1{Received #1\par}
\def\revised#1{Revised #1\par}
\def\accepted#1{Accepted #1}
%
%%%%%%%%%%%%%%%% LIST OF FIGURES & TABLES & TABLE OF CONTENTS %%%%%%%%%%%%%%%%
%
\def\@pnumwidth{1.55em}
\def\@tocrmarg{2.55em}
\def\@dotsep{4.5}
\setcounter{tocdepth}{3}
%
\def\tableofcontents{\section*{Contents}\@starttoc{toc}}
%  #1:level #2:labelindent #3:labelsep
\def\l@section#1#2{\addpenalty{\@secpenalty}\addvspace{1.0em plus 1pt}%
    \@tempdima 2.75em \begingroup \parindent \z@ \rightskip \@pnumwidth%
    \parfillskip-\@pnumwidth {\bfseries\leavevmode #1}\hfil\hbox to\@pnumwidth{\hss #2}\par%
    \endgroup}
\def\l@subsection{\@dottedtocline{2}{2.75em}{3.75em}}
\def\l@subsubsection{\@dottedtocline{3}{6.5em}{4.5em}}
\def\l@paragraph{\@dottedtocline{4}{6.5em}{5.5em}}
\def\l@subparagraph{\@dottedtocline{5}{6.5em}{6.5em}}
\def\listoffigures{\section*{List of Figures}\@starttoc{lof}}
\def\l@figure{\@dottedtocline{1}{0em}{2.75em}}
\def\listoftables{\section*{List of Tables}\@starttoc{lot}}
\let\l@table\l@figure
\def\l@appendix#1#2{\addpenalty{\@secpenalty}\addvspace{1.0em plus 1pt}%
    \@tempdima 2.75em \begingroup \parindent \z@ \rightskip \@pnumwidth%
    \parfillskip-\@pnumwidth {\bfseries\leavevmode #1}\hfil\hbox to\@pnumwidth{\hss #2}\par%
    \endgroup}
\def\l@subappendix{\@dottedtocline{2}{7.25em}{7.25em}}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End TOC %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\def\category#1#2{\par
    \vspace*{8pt}
    {\authorfont{\leftskip18pt\rightskip\leftskip
    \noindent{\it Categories}\/:\ #1:\ #2\par}}\par}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Cite %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\newcount\@tempcntc
\def\@citex[#1]#2{\if@filesw\immediate\write\@auxout{\string\citation{#2}}\fi
 \@tempcnta\z@\@tempcntb\m@ne\def\@citea{}\@cite{\@for\@citeb:=#2\do
  {\@ifundefined
   {b@\@citeb}{\@citeo\@tempcntb\m@ne\@citea\def\@citea{,}%
     {\mbox{\bfseries ?}}\@warning
   {Citation `\@citeb' on page \thepage \space undefined}}%
  {\setbox\z@\hbox{\global\@tempcntc0\csname b@\@citeb\endcsname\relax}%
   \ifnum\@tempcntc=\z@ \@citeo\@tempcntb\m@ne
    \@citea\def\@citea{,}\hbox{\csname b@\@citeb\endcsname}%
   \else
    \advance\@tempcntb\@ne
    \ifnum\@tempcntb=\@tempcntc
    \else\advance\@tempcntb\m@ne\@citeo
    \@tempcnta\@tempcntc\@tempcntb\@tempcntc\fi\fi}}\@citeo}{#1}}
\def\@citeo{\ifnum\@tempcnta>\@tempcntb\else\@citea\def\@citea{,}%
  \ifnum\@tempcnta=\@tempcntb\the\@tempcnta\else
  {\advance\@tempcnta\@ne\ifnum\@tempcnta=\@tempcntb \else \def\@citea{\hbox{--}}\fi
  \advance\@tempcnta\m@ne\the\@tempcnta\@citea\the\@tempcntb}\fi\fi}
\def\@cite#1#2{{$^{#1}$\if@tempswa\typeout
  {WSPC warning: optional citation argument
  ignored: `#2'} \fi}}
\newcommand{\citeup}{\cite}
%

%THIS IS FOR NORMAL-SIZED CITES LIKE (REF. 5).      %1/10/97
%CALLED BY "\CITE{X}".
\def\@refcitex[#1]#2{\if@filesw\immediate\write\@auxout
    {\string\citation{#2}}\fi
\def\@citea{}\@refcite{\@for\@citeb:=#2\do
    {\@citea\def\@citea{, }\@ifundefined
    {b@\@citeb}{{\bf ?}\@warning
    {Citation `\@citeb' on page \thepage \space undefined}}
    \hbox{\csname b@\@citeb\endcsname}}}{#1}}

\def\@refcite#1#2{{#1\if@tempswa\typeout
        {IJCGA warning: optional citation argument
    ignored: `#2'} \fi}}

\def\refcite{\@ifnextchar[{\@tempswatrue
    \@refcitex}{\@tempswafalse\@refcitex[]}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Lists %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\def\@listI{\leftmargin\leftmargini
            \listparindent\itemindent
            \parsep \z@\labelsep.5em
            \topsep 6.5\p@ \@plus3\p@% \@minus2\p@
            \itemsep0\p@}
%
\let\@listi\@listI
\@listi
%
\def\@listii {\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \topsep    3.5\p@ \@plus2\p@ \@minus\p@
              \parsep    \z@
              \itemsep\z@}
\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep
              \topsep 3.5\p@ \@plus\p@\@minus\p@
              \parsep \z@
              \itemsep0\p@}%
\def\@listiv {\leftmargin\leftmarginiv
              \labelwidth\leftmarginiv
              \advance\labelwidth-\labelsep}
\def\@listv  {\leftmargin\leftmarginv
              \labelwidth\leftmarginv
              \advance\labelwidth-\labelsep}
\def\@listvi {\leftmargin\leftmarginvi
              \labelwidth\leftmarginvi
              \advance\labelwidth-\labelsep}
%
\setlength\leftmargini{3pc}
\setlength\leftmarginii{2.2em}
\setlength\leftmarginiii{1.87em}
\setlength\leftmarginiv{1.7em}
\setlength\leftmarginv{1em}
\setlength\leftmarginvi{1em}
\setlength\leftmargin{\leftmargini}
\setlength\listparindent{\parindent}
\setlength\labelsep{2.5em}
\setlength\labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
%\setlength\labelwidth{-5pt} %%%
\renewcommand\theenumi{\arabic{enumi}}
\renewcommand\theenumii{\alph{enumii}}
\renewcommand\theenumiii{\roman{enumiii}}
\renewcommand\theenumiv{\Alph{enumiv}}
\newcommand\labelenumi{(\theenumi)}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{$\m@th\bullet$}
\newcommand\labelitemii{\normalfont\bfseries --}
\newcommand\labelitemiii{$\m@th\ast$}
\newcommand\labelitemiv{$\m@th\cdot$}
%
\newskip\topsepm@th
\newif\if@wslist
\newif\if@margspec
\if@wslist
  \def\wsitemargs{%
   \topsep        \z@ \@plus 1pt
   \partopsep     \z@ \@plus 1pt
   \itemsep       \z@ \@plus \z@
   \parsep        \z@ \@plus 1pt
   \if@margspec \else \leftmargini   \z@ \fi
   \if@margspec \else \leftmarginii  1em \fi
   \if@margspec \else \leftmarginiii 1em \fi
   \if@margspec \else \leftmarginiv  1em \fi
   \if@margspec
     \leftmargin\csname leftmargin\romannumeral\@itemdepth\endcsname
     \labelwidth\leftmargin
     \advance\labelwidth-\labelsep
   \fi
   \rightmargin   \z@
   \listparindent \z@
   \itemindent    \z@
  }
  \def\wsenumargs{%
   \topsep        \z@ \@plus 1pt
   \partopsep     \z@ \@plus 1pt
   \itemsep       \z@ \@plus \z@
   \parsep        \z@ \@plus 1pt
   \if@margspec \else \leftmargini   1em \fi
   \if@margspec \else \leftmarginii  1em \fi
   \if@margspec \else \leftmarginiii 1em \fi
   \if@margspec \else \leftmarginiv  1em \fi
   \if@margspec
     \leftmargin\csname leftmargin\romannumeral\@enumdepth\endcsname
     \labelwidth\leftmargin
     \advance\labelwidth-\labelsep
   \fi
   \rightmargin   \z@
   \listparindent \z@
   \itemindent    \z@
  }
  \renewcommand{\@mklab}[1]{#1}
\else
\def\wsenumargs{}
\def\wsitemargs{}
\fi
\def\@@enum@label#1{\hss\llap{#1}}
\def\@@item@label#1{\hss#1\hfil}
\def\enumerate{\@ifnextchar[%
    {\ws@enumerate}%
    {\if@margspec \ws@enumerate[] \else \ws@enumerate[\csname label\@enumctr\endcsname] \fi }}
\def\ws@enumerate[#1]{%
     \ifnum \@enumdepth >3 \@toodeep\else
       \advance\@enumdepth \@ne
       \edef\@enumctr{enum\romannumeral\the\@enumdepth}
       \list{\csname label\@enumctr\endcsname}{%
         \topsepm@th\topsep
         \wsenumargs
         \usecounter{\@enumctr}
         \settowidth\labelwidth{#1}
         \setlength{\@tempdima}{\labelwidth}
         \addtolength{\@tempdima}{\labelsep}
         \if@margspec
           \ifdim \@tempdima > \leftmargin
             \setlength{\leftmargin}{\@tempdima}
           \fi
         \else
             \setlength{\leftmargin}{\@tempdima}
         \fi
         \let\makelabel\@@enum@label}
     \fi
   }
  \let\endenumerate\endlist
%
\let\Item\item
\newenvironment{enumeroman}{%
  \def\theenumi{\roman{enumi}}\def\theenumii{\alph{enumii}}%
  \def\labelenumi{(\theenumi)}\def\labelenumii{(\theenumii)}%
        \let\item\Item
  \begin{enumerate}%
}{%
  \end{enumerate}}
%
\newenvironment{alphlist}{%
  \def\theenumi{\alph{enumi}}\def\theenumii{\roman{enumii}}%
  \def\labelenumi{(\theenumi)}\def\labelenumii{(\theenumii)}%
        \let\item\Item
  \begin{enumerate}%
}{%
  \end{enumerate}}
%
\newenvironment{arabiclist}{%
    \def\theenumi{\arabic{enumi}}\def\theenumii{\alph{enumii}}
    \def\labelenumi{\upshape{(\theenumi)}}\def\labelenumii{\upshape{(\theenumii)}}%
    \let\item\Item
    \begin{enumerate}
    }{\def\makelabel##1{\rlap{##1}\hss}%
    \end{enumerate}}
%
\newenvironment{romanlist}{%
    \def\theenumi{\roman{enumi}}\def\theenumii{\alph{enumii}}
    \def\labelenumi{\upshape{(\theenumi)}}\def\labelenumii{\upshape{(\theenumii)}}%
    \let\item\Item
    \begin{enumerate}
    }{%
    \end{enumerate}}
%
\newcounter{itemlistc}
\newenvironment{itemlist}
        {\setcounter{itemlistc}{0}
     \begin{list}{$\bullet$}
    {\usecounter{itemlistc}
     \leftmargin10pt
     \setlength{\labelwidth}{5pt}
     \setlength{\parsep}{0pt}
     \setlength{\itemsep}{0pt}
    }}{\end{list}}
%
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}
%
\newenvironment{unnumlist}{%
    \let\item\Item
    \leftmargini2pc
    \ifnum \@enumdepth >3 \@toodeep\else
        \advance\@enumdepth \@ne
        \list{}{\itemindent-2pc\topsep6pt
              \def\makelabel##1{\hss\llap{##1}}}%
   \fi
}{%
  \endlist}
%
\newenvironment{quote}
               {\list{}{\rightmargin18pt\leftmargin18pt}%
                \item[]}
               {\endlist}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% Sections %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\setcounter{secnumdepth}{3}
\newcounter {section}
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand\thesection      {\arabic{section}}
\renewcommand\thesubsection   {\thesection.\arabic{subsection}}
\renewcommand\thesubsubsection{\thesubsection.\arabic{subsubsection}}
\renewcommand\theparagraph    {\thesubsubsection.\arabic{paragraph}}
\renewcommand\thesubparagraph {\theparagraph.\arabic{subparagraph}}
%
\newcommand\section{\@startsection{section}{1}{\z@}
                   {-18pt \@plus-3pt minus-6pt}%
                   {5pt}%
                   {\sectionfont}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}{-18pt \@plus-3pt minus-6pt}{5pt}{\subsectionfont}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}{-18pt \@plus-3pt minus-3pt}{5pt}{\subsubsectionfont}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}{12pt \@plus -3pt}{-.5em}{\paragraphfont}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}{3.25ex \@plus1ex}{-1em}{\subparagraphfont}}

\newcommand{\nonumsection}[1]{\par\addvspace{24pt plus2pt minus2pt}
    \noindent{\twelvebf #1}\par
    \vspace*{8pt}}
\newcommand{\nonumsubsection}[1]{\par\addvspace{18pt plus2pt minus2pt}
    \noindent{\twelvebfit #1}\par
    \vspace*{8pt}}
%
\def\@seccntformat#1{{\upshape{\csname the#1\endcsname.}}\hskip10pt}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Floats %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\setcounter{topnumber}{3}
\def\topfraction{.98}
\setcounter{bottomnumber}{3}
\def\bottomfraction{.98}
\setcounter{totalnumber}{6}%4
\def\textfraction{.01}
\def\floatpagefraction{.98100}
\setcounter{dbltopnumber}{2}
\def\dbltopfraction{.981}
\def\dblfloatpagefraction{.99}
%
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{6\p@}% plus3pt minus3pt}
\setlength\belowcaptionskip{-1\p@}
%
\def\FigName{figure}%
%
\InputIfFileExists{psfig.sty}{\typeout{^^Jpsfig.sty inputed...ok}}{\typeout{^^JWarning: psfig.sty could not be found.^^J}}
%\InputIfFileExists{epsfsafe.tex}{\typeout{^^Jepsfsafe.tex inputed...ok}}{\typeout{^^JWarning: epsfsafe.tex could not be found.^^J}}
\InputIfFileExists{epsfig.sty}{\typeout{^^Jepsfig.sty inputed...ok}}{\typeout{^^JWarning: epsfig.sty could not be found.^^J}}
\InputIfFileExists{epsf.sty}{\typeout{^^Jepsf.sty inputed...ok}}{\typeout{^^JWarning: epsf.sty could not be found.^^J}}%
%
\newbox\captionbox

\long\def\@makecaption#1#2{%
  \ifx\FigName\@captype
        \vskip\abovecaptionskip
    \setbox\captionbox\hbox{%
    {\figurecaptionfont#1\unskip\ignorespaces\hskip1em#2\par}}
    \ifdim\wd\captionbox>\hsize
    {\figurecaptionfont#1\unskip\ignorespaces\hskip1em#2\par}\par
    \else
    \centerline{\figurecaptionfont#1\unskip\ignorespaces\hskip1em#2}\par
    \fi\else\global\setbox\captionbox\hbox{%
    {\tablecaptionfont#1\ignorespaces\hskip1em#2\par}}
    \fi
}

\def\tcaption#1{\vskip10pt\addtocounter{figure}{1}
\par\centering\begin{minipage}{5.5in}%
\figurecaptionfont\selectfont{\figurename~\thefigure\unskip\ignorespaces\hskip1em%
\normalfont\selectfont{#1}}
    \end{minipage}
}


%
\def\figurename{\bf Fig.}
\newcounter{figure}
\renewcommand\thefigure{\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{{\bf \figurename~\thefigure}\rm}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
%
\def\ArtDir{\jobname/}
\def\figurebox#1#2#3{%
        \def\arg{#3}%
        \ifx\arg\empty
        {\hfill\vbox{\hsize#2\hrule\hbox to #2{%
                \vrule\hfill\vbox to #1{\hsize#2\vfill}\vrule}\hrule}\hfill}%
        \else
        \hbox to \hsize{\hfill\epsfbox{\ArtDir#3.eps}\hfill}
        \fi}
%
\def\PSFIG#1#2#3{\par
  {\hbox to \hsize{%
    \hfill{\psfig{file=\ArtDir#1.eps,width=#2,angle=#3}}\hfill}\par}}%

\newenvironment{figurehere}
  {\parskip0pt\topskip 13pt plus 2pt minus 1pt\def\@captype{figure}}
  {\vskip 13pt plus 2pt minus 1pt}
%
\newcounter{table}
\def\tablename{Table}
\renewcommand\thetable{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{{\bf \tablename~\thetable}}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
%
\long\def\tbl#1#2{%
    \parindent\z@\ignorespaces\noindent
    {\EIGHT
    \caption{#1}%
    \par\setbox\tempbox\hbox{#2}%
    \tablewd\hsize\advance\tablewd-\wd\tempbox\global\divide\tablewd\tw@
    \ifdim\wd\captionbox<\wd\tempbox\centerline{\unhbox\captionbox}
    \else\leftskip\tablewd\rightskip\leftskip{\unhbox\captionbox}\par
    \fi\vskip5pt\centerline{\box\tempbox}}
}%
\long\def\ttbl#1#2#3{%
    \parindent\z@
    \noindent
    \tablecaptionfont
    \caption{#2}%
    \tablewd\hsize
    \advance\tablewd-#1
    \global\divide\tablewd\tw@
    \ifdim \wd\captionbox<#1
    \centerline{\unhbox\captionbox}
    \else
    {\leftskip\tablewd% plus1fill{}
    \rightskip\tablewd% plus1fill{}
    \unhbox\captionbox\par}
    \fi
    \vskip-8pt
    \centerline{#3}
}
%
\newenvironment{InTextTable}{%
    \par\addvspace{16pt plus6pt minus6pt}%
    \begin{center}
    \tablecaptionfont\noindent\ignorespaces
}{\end{center}\par\addvspace{17pt plus6pt minus6pt}}
%
\newenvironment{tabnote}{%
    \par\vskip5pt\footnotesize%
    \@ifnextchar[{\@tabnote}{\@tabnote[Note]}}{%
    \par\vskip-5pt}
%
\def\@tabnote[#1]{%
    \leftskip\tablewd\rightskip\leftskip {\it #1}\/:\ \ignorespaces}
%
\def\Hline{%
  \noalign{\ifnum0=`}\fi\hrule \@height 2\arrayrulewidth \futurelet
   \@tempa\@xhline}
%
\newenvironment{tablehere}
  {\parskip0pt\topskip 13pt plus 2pt minus 1pt\def\@captype{table}\begin{small}\begin{center}}
  {\end{center}\end{small}\vskip 13pt plus 2pt minus 1pt}
%
\def\x{@{\extracolsep{\fill}}}
\def\toprule{\Hline\\[-6.5pt]}
\def\colrule{\\[-7pt]\hline\\[-6pt]}
\def\TMcolrule{\\[-9.5pt]\hline\\[-9.5pt]}
\def\botrule{\\[-7pt]\Hline}
\def\crule#1{\\[-7pt]#1\\[-6pt]}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Maths %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\setlength\arraycolsep{1.5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\renewcommand\theequation{\arabic{equation}}
%
\setlength\columnsep{0.25truein}
\setlength\columnseprule{0\p@}
%
\def\bstrut{\vrule width0pt depth5pt}
\def\tstrut{\vrule width0pt height10pt}
\jot=3pt
%
\renewcommand{\[}{\relax\ifmmode\@badmath\else\bgroup\let\eqnnum\relax\let\refstepeqcnt\relax\@equation\fi}
\renewcommand{\]}{\relax\ifmmode\end@equation\egroup\@endparenv\@doendpe\else\@badmath\fi}
%
%\@namedef{equation*}{\let\eqnnum\relax\let\refstepeqncnt\relax\@equation}
%\@namedef{endequation*}{\end@equation}
\renewenvironment{equation}{\@equation}{\end@equation}
%
\def\refstepeqcnt{\refstepcounter{equation}}
\def\eqnnum{\displaywidth\linewidth\hbox{\@eqnnum}}
%
\def\@equation{\let\topsep\abovedisplayskip\@beginparpenalty\predisplaypenalty\@endparpenalty\postdisplaypenalty
     \refstepeqcnt
     \trivlist \item[]\leavevmode
       \hbox to\linewidth\bgroup\hfill $\m@th% $
       \displaystyle}%
\def\end@equation{$\hfill\eqnnum\egroup\endtrivlist}
%
\renewenvironment{eqnarray}{%
   \stepcounter{equation}%
   \def\@currentlabel{\p@equation\theequation}%
   \global\@eqnswtrue
   \m@th
   \global\@eqcnt\z@
   \tabskip\@centering
   \let\\\@eqncr
   $$\everycr{}\halign to\displaywidth\bgroup
       \hskip\@centering$\displaystyle\tabskip\z@skip{##}$\@eqnsel
      &\global\@eqcnt\@ne\hskip \tw@\arraycolsep \hfil${##}$\hfil
      &\global\@eqcnt\tw@ \hskip \tw@\arraycolsep
         $\displaystyle{##}$\hfil\tabskip\@centering
      &\global\@eqcnt\thr@@ \hb@xt@\z@\bgroup\hss##\egroup
         \tabskip\z@skip
      \cr}
        {%
      \@@eqncr
      \egroup
      \global\advance\c@equation\m@ne
   $$\global\@ignoretrue
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Footnote %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule depth0pt height.5pt \@width7.1cm
%  \hrule width 7.1cm
  \kern2.6\p@}
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
     \@makefnmark#1}
%
\def\@fnsymbol#1{\ensuremath{\ifcase#1\or *\or \dagger\or \ddagger\or
    \mathchar "278\or \mathchar "27B\or \|\or **\or \dagger\dagger
    \or \ddagger\ddagger \else\@ctrerr\fi}}
%
\def\thefootnote{\alph{footnote}}
\def\@makefnmark{{$^{\rm \@thefnmark}$}}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Page Style %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\mark{{}{}}
%
\def\ps@plain{%
    \global\textheight\realtextheight\relax
     \let\@mkboth\@gobbletwo
     \let\@oddhead\@empty
     \let\@evenhead\@empty
     \def\@oddfoot{\hfill\mbox{\lower17.5pt\hbox{\foliofont\thepage}}\hfill}%
     \let\@evenfoot\@oddfoot
     }
%
\def\RightMark{}
%
\def\ps@headings{%
    \global\textheight9.2truein\relax
    \let\@oddfoot\@empty
    \let\@evenfoot\@empty
    \def\@evenhead{\rhfont{\upshape{\thepage}}\hskip1em\leftmark\hfill}%
    \def\@oddhead{\hfill\rhfont\rightmark\hskip1em{\upshape{\thepage}}}%
    \let\@mkboth\markboth
    \def\authormark##1{\markboth{##1}{\RightMark}}%
    \def\chaptermark##1{\gdef\RightMark{##1}\markright{##1}}}
%
\def\ps@myheadings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\rlap{\foliofont \thepage}\hfill{\rhfont\leftmark}\hfill}%
    \def\@oddhead{\hfill{\rhfont\rightmark}\hfill{\foliofont\thepage}}%
    \let\@mkboth\@gobbletwo
    \let\chaptermark\@gobble
    \let\sectionmark\@gobble}
%
\def\ps@pblind{%
    \let\@mkboth\@gobbletwo
    \def\@evenhead{}%
    \def\@oddhead{}
    \def\@oddfoot{\hfill\mbox{\lower8pc\hbox{}}\hfill}
   \let\@evenfoot\@oddfoot}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% theorem environments %%%%%%%%%%%%%%%%%%%%
%
\def\@xthm#1#2{\@begintheorem{#2}{\csname the#1\endcsname}{}\ignorespaces}
\def\@ythm#1#2[#3]{\@opargbegintheorem{#2}{\csname the#1\endcsname}{#3}\ignorespaces}
\def\@opargbegintheorem#1#2#3{\trivlist
      \item[\hskip \labelsep{\bfseries #1\ #2\ (#3).}]\ \itshape}
%
\let\Definitionfont\upshape%
\let\Theoremfont\itshape
\let\Corollaryfont\itshape
\let\Propositionfont\itshape
\let\Lemmafont\itshape
\let\Examplefont\upshape
\let\Stepfont\upshape
\let\Remarkfont\upshape
\def\Theoremheadfont{\TEN\bfseries}
\def\Corollaryheadfont{\TEN\bfseries}
\def\Propositionheadfont{\TEN\bfseries}
\def\Lemmaheadfont{\TEN\bfseries}
\def\Definitionheadfont{\TEN\bfseries}
\def\Exampleheadfont{\TEN\bfseries}
\def\Remarkheadfont{\TEN\bfseries}
\def\Stepheadfont{\TEN\bfseries}
%
\def\@begintheorem#1#2#3{\par\addvspace{8pt plus3pt minus2pt}%
              \noindent{\csname#1headfont\endcsname#1\ \ignorespaces#3 #2.}%
              \csname#1font\endcsname\hskip10pt\ignorespaces}
\def\@endtheorem{\par\addvspace{8pt plus3pt minus2pt}\@endparenv}

\newcounter{lemma}
\newcounter{corollary}
\newcounter{proposition}
\newcounter{definition}
\newcounter{example}
\newcounter{remark}
\newcounter{question}
\newcounter{notation}
%
\newtheorem{theorem}{Theorem}
\newtheorem{corollary}[theorem]{Corollary}%[section]
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{proposition}[theorem]{Proposition}%[section]
\newtheorem{definition}[theorem]{Definition}%[section]
\newtheorem{example}[theorem]{Example}%[section]
\newtheorem{remark}[theorem]{Remark}%[section]
\newtheorem{notation}[theorem]{Notation}%[section]
\newtheorem{question}[theorem]{Question}%[section]
%
\newenvironment{stheorem}[2]{\parskip0pt\topsep=13pt plus 2pt minus 1pt
\begin{trivlist}\item[]
{\theoremsize #1}\enskip #2}
{\end{trivlist}%\vskip 6pt plus 2pt minus 1pt
}
%
\newif\iflogo
\def\prbox{\hbox to \hsize{\hfill\fboxsep0pt\fbox{\phantom{\vrule width5pt height5pt depth0pt}}}\global\logofalse}%
%
\newenvironment{proof}{%
\par\addvspace{12pt plus3pt minus3pt}\global\logotrue%
\noindent{\TEN\bf Proof.\hskip10pt}\ignorespaces}{%
    \par\iflogo\vskip-\lastskip
    \vskip-\baselineskip\prbox\par
    \addvspace{12pt plus3pt minus3pt}\fi}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Bibliography %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\newdimen\bibindent
\bibindent=2em
\def\@biblabel#1{#1.}
\newenvironment{thebibliography}[1]
     {\section*{\bibname}\bibfont%
      \list{\@biblabel{\arabic{enumiv}}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
        \labelsep6pt%.33em
            \advance\leftmargin\labelsep
        \itemsep0pt\parsep0pt
            \usecounter{enumiv}%
            \renewcommand\theenumiv{\arabic{enumiv}}}%
      \sloppy\clubpenalty4000\widowpenalty4000%
      \sfcode`\.=\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newcommand\newblock{}
%
%%%%%%%%%%%%%%%%%%%%%%%%Appendix %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\newcounter{appendixc}
\newcounter{subappendixc}[appendixc]
\newcounter{subsubappendixc}[subappendixc]
\renewcommand{\thesubappendixc}{\Alph{appendixc}.\arabic{subappendixc}}
\renewcommand{\thesubsubappendixc}
    {\Alph{appendixc}.\arabic{subappendixc}.\arabic{subsubappendixc}}
%
\newcommand{\appendix}[1]{
        \vspace{14pt}
        \refstepcounter{appendixc}
        \setcounter{figure}{0}
        \setcounter{table}{0}
        \setcounter{lemma}{0}
        \setcounter{theorem}{0}
        \setcounter{corollary}{0}
        \setcounter{definition}{0}
        \setcounter{equation}{0}
        \renewcommand{\thefigure}{\Alph{appendixc}.\arabic{figure}}
        \renewcommand{\thetable}{\Alph{appendixc}.\arabic{table}}
        \renewcommand{\theappendixc}{\Alph{appendixc}}
        \renewcommand{\thelemma}{\Alph{appendixc}.\arabic{lemma}}
        \renewcommand{\thetheorem}{\Alph{appendixc}.\arabic{theorem}}
        \renewcommand{\thedefinition}{\Alph{appendixc}.\arabic{definition}}
        \renewcommand{\thecorollary}{\Alph{appendixc}.\arabic{corollary}}
        \renewcommand{\theequation}{\Alph{appendixc}.\arabic{equation}}
        \noindent{\bf \appendixname \theappendixc\enskip\boldmath #1}\par\vspace{5pt}
        \addcontentsline{toc}{appendix}{Appendix \theappendixc.\enskip #1}}
\newcommand{\subappendix}[1] {\vspace{14pt}
        \refstepcounter{subappendixc}
        \noindent{\bf \appendixname \thesubappendixc. {\kern1pt \bfit\boldmath #1}}
        \par\vspace{8pt}
        \addcontentsline{toc}{subappendix}{Appendix \thesubappendixc.\enskip #1}}
\newcommand{\subsubappendix}[1] {\vspace{14pt}
        \refstepcounter{subsubappendixc}
        \noindent{\rm \appendixname \thesubsubappendixc. {\kern1pt \it #1}}
        \par\vspace{8pt}}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End Appendix %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %                                                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Contents pages %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\def\journalname{\uppercase{\large\bf XXX}}
\def\No{No.}
\def\chead#1#2#3{\par
\thispagestyle{empty}
{\centering{%
{\titlefont\journalname}\par
\vspace*{6pt}
{\large\bf Volume~#1 $\bullet$ Number~#2 $\bullet$ #3}\par
\vspace*{34pt}
\noindent\large\bf CONTENTS\hfill\break\par}}
\vspace*{-8pt}}
\def\leaderfill{\leaders\hbox to 0.5em{\hss.\hss}\hfill}
\def\centry#1#2#3{\par
    {\ELEVEN
    \setbox\tempbox\hbox{#3}
    {\rightskip3.5pc plus1fil
    \noindent{{#1}}\par}
    {\leftskip12pt{\rightskip1pc plus1fil
    \ignorespaces\noindent\it #2\leaderfill\hspace*{10pt}\hskip\wd\tempbox\par}\par}\par
    \vskip-\lastskip
    \vskip-\baselineskip
    \hbox to \hsize{\hfill#3}\par}
    \addvspace{8pt plus1pt minus1pt}\par}
%%
\def\cent#1#2#3{\par{\ELEVEN
    {\rightskip2pc plus1fil
    \noindent\par}
    {\noindent{\bf {#1}}\ignorespaces#2\leaderfill\hspace*{2pt}#3\par}}\par
   \addvspace{8pt plus1pt minus1pt}\par
    }
%
%\def\cent#1#2#3{\par
%   {\foliofont
%   \setbox\tempbox\hbox{#3}
%   {\rightskip3.5pc plus1fil
%   \noindent{\uppercase{#1}}\par}
%   {\leftskip12pt{\rightskip1pc plus1fil
%   \ignorespaces\noindent#2\leaderfill\hspace*{2pt}\hskip\wd\tempbox\par}\par}\par
%   \vskip-\lastskip
%   \vskip-\baselineskip
%   \hbox to \hsize{\hfill#3}\par}
%   \addvspace{8pt plus1pt minus1pt}\par}
%
%\def\cent#1#2#3{\par\bibfont\addvspace{10pt plus2pt minus2pt}
%   {\foliofont{\rightskip4pc plus1fil
%   \noindent#1\par}\par
%   \vskip-\lastskip\vskip-\baselineskip
%   \hbox to \hsize{\hfill#3}\par
%   {\noindent\leftskip15pt{\rightskip4pc plus1fil{\it #2}\par}}}\par}
%
\def\ehead#1#2#3{\par
    \addvspace{12pt plus1pt minus1pt}
    {\ELEVEN\bf\rightskip4pc plus1fil
    \noindent{\bf #1{#2}{#3}\par}
    \vspace*{4pt}}\par}
%
\def\eehead#1#2#3{\par
%   \addvspace{6pt plus1pt minus1pt}
    \addvspace{12pt plus1pt minus1pt}
    {\foliofont\rightskip4pc plus1fil
    \noindent{\bf #1{#2}{#3}\par}
    \vspace*{4pt}}\par}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Trim Marks %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\def\draftnote{\qquad\today\quad\currenttime\quad\jobname}%
%
\def\cropmarks{\nointerlineskip%
     \vbox to 0pt{\vskip-8.6pt
    \parindent0pt\hspace*{6pt}\draftnote
     \par\advance\trimheight by 2pc
     \vbox to \trimheight{\offinterlineskip\parindent0pt\vskip-2pc
     \hbox to \trimwidth{\raise2.6pc\hbox{\vrule height2pc width0.3pt}\raisebox{2pc}
   {\hspace*{-2.6pc}\vrule width2pc height0.3pt}\hfill\raisebox{2pc}
   {\vrule width2pc height0.3pt}\hspace*{-2.6pc}\raise2.6pc\hbox{\vrule height2pc width0.3pt}}\vfill
     \hbox to \trimwidth{\lower1.2pc\hbox{\vrule height2pc width1.3pt}\raisebox{1.4pc}
        {\hspace*{-2.6pc}\vrule width2pc height0.3pt}\hfill
    \lower1.2pc\hbox{\vrule height2pc width0.3pt}\rlap{\hspace*{0.6pc}\raisebox{1.4pc}{\vrule width2pc height0.3pt}}}}}
     \vbox to 0pt{\offinterlineskip\parindent0pt\vskip\topmargin%\vskip1.3pt
     \tempdimen\normaltextheight
     \advance\tempdimen24pt
     \moveright\@themargin
     \vbox to \tempdimen{\hrule height\draftrule
     \vbox to 0pt{\vskip\headheight\vskip\headsep%\vskip3pt
                \vrule height\draftrule width\textwidth}%
      \hbox to \textwidth{\vrule width\draftrule \hfill\vrule height\tempdimen width\draftrule}%
           \hrule height\draftrule}}}%%
\def\xcropmarks{\nointerlineskip%
     \vbox to 0pt{\vskip-8.6pt
    \parindent0pt\hspace*{6pt}\draftnote
     \par\advance\trimheight by 2pc
     \vbox to \trimheight{\offinterlineskip\parindent0pt\vskip-2pc
     \hbox to \trimwidth{\raise2.6pc\hbox{\vrule height2pc width0.3pt}\raisebox{2pc}
   {\hspace*{-2.6pc}\vrule width2pc height0.3pt}\hfill\raisebox{2pc}
   {\vrule width2pc height0.3pt}\hspace*{-2.6pc}\raise2.6pc\hbox{\vrule height2pc width0.3pt}}\vfill
     \hbox to \trimwidth{\lower1.2pc\hbox{\vrule height2pc width0.3pt}\raisebox{1.4pc}
        {\hspace*{-2.6pc}\vrule width2pc height0.3pt}\hfill
    \lower1.2pc\hbox{\vrule height2pc width0.3pt}\rlap{\hspace*{0.6pc}\raisebox{1.4pc}{\vrule width2pc height0.3pt}}}}}
     \vbox to 0pt{\offinterlineskip\parindent0pt\vskip\topmargin%\vskip1.3pt
     \tempdimen\normaltextheight
     \advance\tempdimen27pt
     \moveright\@themargin
     \vbox to \tempdimen{\hrule height\draftrule
     \vbox to 0pt{\vskip\headheight\vskip\headsep%\vskip3pt
                \vrule height\draftrule width\textwidth}%
      \hbox to \textwidth{\vrule width\draftrule \hfill\vrule height\tempdimen width\draftrule}%
           \hrule height\draftrule}}}%%
%
\let\trimmarks\cropmarks
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% Output Routine %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\def\@outputpage{%
\begingroup           % the \endgroup is put in by \aftergroup
  \let \protect \noexpand
  \@resetactivechars
  \let\-\@dischyph
  \let\'\@acci\let\`\@accii\let\=\@acciii
  \let\\\@normalcr
  \let\par\@@par          %% 15 Sep 87
  \shipout \vbox{%
    \set@typeset@protect
    \aftergroup \endgroup
    \aftergroup \set@typeset@protect
                                % correct? or just restore by ending
                                % the group?
  \if@specialpage
    \global\@specialpagefalse\@nameuse{ps@\@specialstyle}%
  \fi
  \if@twoside
    \ifodd\count\z@ \let\@thehead\@oddhead \let\@thefoot\@oddfoot
         \let\@themargin\oddsidemargin
    \else \let\@thehead\@evenhead
       \let\@thefoot\@evenfoot \let\@themargin\evensidemargin
    \fi
  \fi
  \reset@font
  \normalsize
  \baselineskip\z@skip \lineskip\z@skip \lineskiplimit\z@
    \@begindvi\trimmarks
    \vskip \topmargin
    \moveright\@themargin \vbox{%
      \setbox\@tempboxa \vbox to\headheight{%
        \vfil
        \color@hbox
          \normalcolor
          \hb@xt@\textwidth {%
            \let \label \@gobble
            \let \index \@gobble
            \let \glossary \@gobble %% 21 Jun 91
            \@thehead
            }%
        \color@endbox
        }%                        %% 22 Feb 87
      \dp\@tempboxa \z@
      \box\@tempboxa
      \vskip \headsep
      \box\@outputbox
      \baselineskip \footskip
      \color@hbox
        \normalcolor
        \hb@xt@\textwidth{%
          \let \label \@gobble
          \let \index \@gobble      %% 22 Feb 87
          \let \glossary \@gobble   %% 21 Jun 91
          \@thefoot
          }%
      \color@endbox
      }%
    }%
\global \@colht \textheight
\stepcounter{page}%
\let\firstmark\botmark
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\hruleup{\raise4pt\hbox to\hsize{\hrulefill\hbox{\vrule height6pt}}\unskip}
\def\hruledown{\noindent\leavevmode\kern-3pt\lower2pt\hbox{\hbox{\vrule
height6pt}\raise5.5pt\hbox to\hsize{\hrulefill}}\ }

\def\imgdir{/usr/lib/teTeX/texmf/tex/latex/wspc_local/frack}

\def\fracrule{\par
    \vglue6pc
    \vglue3.3pc
    \hbox to 48.9pc{}
    \vglue2.3pc
    \leftline{\hskip-0.1cm\vbox{\hrule width48.9pc height0.15cm}\hfill}}%%

\def\ARTS{15}                       %Default: hrule with out gray image
\def\article{\def\ARTS{0}}
\def\articles{\def\ARTS{1}}
\def\letter{\def\ARTS{2}}
\def\letters{\def\ARTS{3}}
\def\editorial{\def\ARTS{4}}
\def\foreword{\def\ARTS{5}}
\def\bkreview{\def\ARTS{6}}
\def\bkreviews{\def\ARTS{7}}
\def\contents{\def\ARTS{8}}
\def\Rarticle{\def\ARTS{9}}
\def\Rarticles{\def\ARTS{10}}
\def\Creport{\def\ARTS{11}}
\def\Creports{\def\ARTS{12}}
\def\carticles{\def\ARTS{13}}
\def\Rearticles{\def\ARTS{14}}
\def\news{\def\ARTS{16}}

\def\BOXART{
\ifnum\ARTS = 0
    \boxart{article}
\fi
\ifnum\ARTS = 1
    \boxart{articles}
\fi
\ifnum\ARTS = 2
    \boxart{letter}
\fi
\ifnum\ARTS = 3
    \boxart{letters}
\fi
\ifnum\ARTS = 4
    \boxart{editorial}
\fi
\ifnum\ARTS = 5
    \boxart{forward}
\fi
\ifnum\ARTS = 6
    \boxart{bkreview}
\fi
\ifnum\ARTS = 7
    \boxart{bkreviews}
\fi
\ifnum\ARTS = 8
    \boxart{contents}
\fi
\ifnum\ARTS = 9
    \boxart{rarticle}
\fi
\ifnum\ARTS = 10
    \boxart{rarticles}
\fi
\ifnum\ARTS = 11
    \boxart{creport}
\fi
\ifnum\ARTS = 12
    \boxart{creports}
\fi
\ifnum\ARTS = 13
    \boxart{carticle}
\fi
\ifnum\ARTS = 14
    \boxart{rearticles}
\fi
\ifnum\ARTS = 15
    \par\vglue2.8pc
%    \leftline{\hskip-2cm\vbox{\hrule width48.9pc height0.15cm}\hfill}
%%%changed to extend the rule before title till trim--ch
     \leftline{\hspace*{-6pc}\vbox{\hrule width53pc height1pt}\hspace*{-3pc}}
    \par
\fi
\ifnum\ARTS = 16
    \boxart{news}
\fi
}
%
\def\boxart#1
{\par
    \vglue6pc
    \hbox to 48.9pc{\hfill\epsfbox{\imgdir/#1.eps}}
    \vglue2.75pc
    \leftline{\hskip-2cm\vbox{\hrule width48.9pc height0.10cm}\hfill}\par\vglue4pt}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Process Options %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\pagestyle{headings}
\pagenumbering{arabic}
\frenchspacing
\def\sloppy{\tolerance=100000\hfuzz=\maxdimen \vfuzz=\maxdimen}
\sloppy
\vbadness=12000
\hbadness=12000
\usepackage{amsfonts,amssymb,amsmath}
\usepackage[figuresright]{rotating}
\usepackage{dcolumn,array,multicol}
\usepackage{multicol}
\usepackage{stfloats}
\flushbottom

\typeheight53.6pc
\textheight54.6pc 

%\input clsdir.tex
%\input wspcdef.tex

\hoffset=-3cm
\voffset=-1cm


\def\tra#1{\spaceskip0.#1em plus 0.15em minus 0.09em}
\def\fbase{\baselineskip 13pt plus.6pt}
\def\figurebox#1#2#3{\centerline{\includegraphics{\ArtDir #3}}}


\newcolumntype{d}[1]{D{.}{.}{#1}}


\endinput
%
%% End of file
