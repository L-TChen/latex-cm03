% Author: Josh Ko and Liang-Ting Chen
% Maintainer: Liang-Ting Chen (ltchen@iis.sinica.edu.tw)

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cm03}[2024/10/14 NSTC LaTeX class]

\def\cmthree@opterrshort{Option  "\CurrentOption" not supported}
\def\cmthree@opterrlong{The option "\CurrentOption" from article.cls is not supported by cmthree.cls.}

\DeclareOption{a5paper}{\@latexerr{\cmthree@opterrshort}{\cmthree@opterrlong}}
\DeclareOption{b5paper}{\@latexerr{\cmthree@opterrshort}{\cmthree@opterrlong}}
\DeclareOption{legalpaper}{\@latexerr{\cmthree@opterrshort}{\cmthree@opterrlong}}
\DeclareOption{executivepaper}{\@latexerr{\cmthree@opterrshort}{\cmthree@opterrlong}}
\DeclareOption{landscape}{\@latexerr{\cmthree@opterrshort}{\cmthree@opterrlong}}
\DeclareOption{10pt}{\@latexerr{\cmthree@opterrshort}{\cmthree@opterrlong}}
\DeclareOption{11pt}{\@latexerr{\cmthree@opterrshort}{\cmthree@opterrlong}}
\DeclareOption{titlepage}{\@latexerr{\cmthree@opterrshort}{\cmthree@opterrlong}}
\DeclareOption{notitlepage}{\@latexerr{\cmthree@opterrshort}{\cmthree@opterrlong}}
\DeclareOption{twocolumn}{\@latexerr{\cmthree@opterrshort}{\cmthree@opterrlong}}

\DeclareOption{libertine}{\let\@libertine\relax}
\DeclareOption{kaiti}{\let\@kaiti\relax}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass[a4paper,12pt,onecolumn,twoside]{article}

\RequirePackage[margin=2cm,bottom=2.4cm]{geometry}

\RequirePackage{iftex}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set up the English font for cm03
%% The alternative `newtx` to New Times Roman is used. 

\ifx\@libertine\relax
  \RequirePackage[tt=false]{libertine}
  \iftutex
    \RequirePackage{unicode-math}
    \setmathfont[Scale=MatchUppercase]{LibertinusMath-Regular.otf}
  \else
    \RequirePackage[libertine,amsthm]{newtxmath}
  \fi
\else
  \RequirePackage{newtxtext}
  \iftutex
% newtxtexr changes fontspec settings,
% so we revert them to set up the CJK font
    \defaultfontfeatures{} 
  \fi
  \RequirePackage[amsthm]{newtxmath}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set up Kai Ti (楷體) as the default Chinese font for cm03
%% BiauKai is available on Windows and macOS (with different font names)
%% AR PL UKai TW is shipped with TeX

\iftutex
\RequirePackage[PunctStyle=plain]{xeCJK}
\ifx\@kaiti\relax
  \setCJKmainfont{Kaiti TC}[BoldFont = *-Bold]
  \@latex@warning{使用楷體作為中文字型}
\else
\IfFontExistsTF{BiauKai}{
  % BiauKai is available on macOS and Windows
  \setCJKmainfont{BiauKai}[AutoFakeBold=2.5]
  \@latex@warning{使用標楷體 (BiauKai) 作為中文字型}
}{
  \IfFontExistsTF{BiauKaiTC}{
  % BiauKai is renamed to BiauKaiTC on macOS 13.3 and above
  \setCJKmainfont{BiauKaiTC}[AutoFakeBold=2.5]
  \@latex@warning{使用標楷體繁 (BiauKaiTC) 作為中文字型}
}{
  % AR PL UKai is shipped with TeX
  \setCJKmainfont{bkai00mp.ttf}[AutoFakeBold=2.5]
  \@latex@warning{使用 AR PL UKai TW 作為中文字型}
}}
\fi
\else
  \RequirePackage{CJKutf8}
  \newenvironment{kai}{\begin{CJK*}{UTF8}{bkai}}{\end{CJK*}}
%% CJK's bkai font only supports the `bx` shape (extended boldface)
%% we will use bx as the default boldface inside the CJK environment. 
  \AddToHook{env/CJK*/begin}{\renewcommand{\bfdefault}{bx}}
\fi

\RequirePackage{setspace}
\onehalfspacing

\RequirePackage{zhnumber,titlesec}

\titleformat{\section}[runin]{\bfseries\normalsize}{（\zhnum{section}）}{0em}{}
\titleformat{\subsection}[runin]{\bfseries\normalsize}{\thesubsection}{0.5em}{}
\titleformat{\subsubsection}[runin]{\bfseries\normalsize}{\thesubsubsection}{0.5em}{}

\iftutex
  \AddToHook{begindocument/end}{\par\noindent\begingroup\large\bfseries 三、研究計畫內容（以中文或英文撰寫）：\endgroup\par}
\else
  \AddToHook{begindocument/end}{\par\noindent\begingroup\large\begin{kai}\bfseries 三、研究計畫內容（以中文或英文撰寫）：\end{kai}\endgroup\par}
\fi

\RequirePackage{lastpage,fancyhdr}

\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}
\fancyhead{}
\iftutex
  \lfoot{表\;CM03}
\else
  \lfoot{\begin{kai}表\;CM03\end{kai}}
\fi
\cfoot{}
\iftutex
  \rfoot{共~\pageref{LastPage}~頁\hspace{1em}第~\thepage~頁}
\else
  \rfoot{\begin{kai}共~\pageref{LastPage}~頁\hspace{1em}第~\thepage~頁\end{kai}}
\fi

\RequirePackage[authoryear,square,sort]{natbib}
\renewcommand{\bibsection}{\section*{參考文獻}}

\RequirePackage[hidelinks,pdfusetitle]{hyperref}
\RequirePackage{doi}

\iftutex
\else
  \let\@section\section
  \newcommand{\@zhsectionstar}[1]{\begin{kai}\@section*{#1}\end{kai}}
  \newcommand{\@zhsection}[2]{\begin{kai}\@section{#1}#2\end{kai}}
  \renewcommand{\section}{\@ifstar{\@zhsectionstar}{\@zhsection}}
\fi
