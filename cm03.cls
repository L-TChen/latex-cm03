% Author: Josh Ko and Liang-Ting Chen
% Maintainer: Liang-Ting Chen (ltchen@iis.sinica.edu.tw)

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cm03}[2024/10/21 NSTC LaTeX class]

\def\cmthree@opterrlong{The option "\CurrentOption" from article.cls is not compatible with the format of cm03.}
\newcommand{\cmthree@warning}{\ClassWarning{cm03}{\cmthree@opterrlong}}
\newcommand{\cmthree@info}[1]{\ClassInfo{cm03}{#1}}

\DeclareOption{a5paper}{\cmthree@warning}
\DeclareOption{b5paper}{\cmthree@warning}
\DeclareOption{legalpaper}{\cmthree@warning}
\DeclareOption{executivepaper}{\cmthree@warning}
\DeclareOption{landscape}{\cmthree@warning}
\DeclareOption{10pt}{\cmthree@warning}
\DeclareOption{11pt}{\cmthree@warning}
\DeclareOption{titlepage}{\cmthree@warning}
\DeclareOption{notitlepage}{\cmthree@warning}
\DeclareOption{twocolumn}{\cmthree@warning}

\DeclareOption{libertine}{\let\@libertine\relax}
\DeclareOption{kaiti}{\let\@kaiti\relax}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass[a4paper,12pt,onecolumn,twoside]{article}

\RequirePackage[margin=2cm,bottom=2.4cm]{geometry}

\RequirePackage{iftex,xifthen}
\RequirePackage{amsmath,amsthm}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set up Kai Ti (楷體) as the default Chinese font for cm03
%% BiauKai is available on Windows and macOS (with different font names)
%% AR PL UKai TW is shipped with TeX

\iftutex

\RequirePackage[PunctStyle=plain,no-math]{xeCJK}
\ifx\@kaiti\relax
  \setCJKmainfont{Kaiti TC}[BoldFont = *-Bold]
  \setCJKsansfont{Heiti TC}
  \cmthree@info{使用楷體作為中文字型}
\else
\IfFontExistsTF{BiauKai}{
  % BiauKai is available on macOS and Windows
  \setCJKmainfont{BiauKai}[AutoFakeBold=2.5]
  \cmthree@info{使用標楷體 (BiauKai) 作為中文字型}
}{
  \IfFontExistsTF{BiauKaiTC}{
  % BiauKai is renamed to BiauKaiTC on macOS 13.3 and above
  \setCJKmainfont{BiauKaiTC}[AutoFakeBold=2.5]
  \cmthree@info{使用標楷體繁 (BiauKaiTC) 作為中文字型}
}{
  % AR PL UKai is shipped with TeX
  \setCJKmainfont{bkai00mp.ttf}[AutoFakeBold=2.5]
  \cmthree@info{使用 AR PL UKai TW 作為中文字型}
}}
\fi

\else
  \RequirePackage{CJKutf8}
  \newenvironment{kai}{\begin{CJK*}{UTF8}{bkai}}{\end{CJK*}}
%% CJK's bkai font only provides the `bx` shape (boldface extended) by default.
%% Therefore, we load its font definition `c70bkai.fd` explicitly and declare
%% the boldface shape `b`. 
  \input{c70bkai.fd}
  \DeclareFontShape{C70}{bkai}{b}{n}{<-> CJKb * bkaiu}{\CJKbold}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set up the English font for cm03
%% The alternative `newtx` to New Times Roman is used. 

\ifx\@libertine\relax
  \RequirePackage[tt=false]{libertine}
  \iftutex
    \RequirePackage{unicode-math}
    \setmathfont[Scale=MatchUppercase]{LibertinusMath-Regular.otf}
  \else
    \RequirePackage[libertine]{newtxmath}
  \fi
\else
  \RequirePackage{newtxtext}
  \iftutex
% newtxtexr changes fontspec settings,
% so we revert them to set up the CJK font
    \defaultfontfeatures{} 
  \fi
  \RequirePackage{newtxmath}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set up the line spacing to one and half line
%% 

\RequirePackage{setspace}
\onehalfspacing

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set up Chinese numbering and the format of section title
%% 

\RequirePackage{zhnumber,titlesec}

\titleformat{\section}[runin]{\bfseries\normalsize}{（\zhnum{section}）}{0em}{}
\titleformat{\subsection}[runin]{\bfseries\normalsize}{\thesubsection}{0.5em}{}
\titleformat{\subsubsection}[runin]{\bfseries\normalsize}{\thesubsubsection}{0.5em}{}

\iftutex
  \AddToHook{begindocument/end}{\par\noindent\begingroup\large\bfseries 三、研究計畫內容（以中文或英文撰寫）：\endgroup\par}
\else
  \AddToHook{begindocument/end}{\par\everypar={{\setbox0=\lastbox}\everypar{}}\begingroup\large\begin{kai}\bfseries 三、研究計畫內容（以中文或英文撰寫）：\end{kai}\endgroup\par}
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

\iftutex\else
%% Redefine \section: sections in cm03 are in Chinese, so 
%% they are placed in the CJK environment.
  \let\@section\section
  \newcommand{\@zhsectionstar}[1]{\begin{kai}\@section*{#1}\end{kai}}
  \newcommand{\@zhsection}[2]{\begin{kai}\@section{#1}#2\end{kai}}
  \renewcommand{\section}{\@ifstar{\@zhsectionstar}{\@zhsection}}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set up natbib with the section title for bibliography in Chinese

\RequirePackage[authoryear,square,sort]{natbib}
\renewcommand{\bibsection}{\section*{參考文獻}}
\newcommand{\varcitet}[3][]{\citeauthor{#2}#3~\ifthenelse{\isempty{#1}}{\citeyearpar{#2}}{\citeyearpar[#1]{#2}}}

\RequirePackage[hidelinks,pdfusetitle]{hyperref}
\RequirePackage{doi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set up theorem-like environments
\newtheorem{theorem}{Theorem}[section]
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{corollary}[theorem]{Corollary}
\theoremstyle{definition}
\newtheorem{definition}[theorem]{Definition}
\theoremstyle{remark}
\newtheorem*{remark}{Remark}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set up the inilne enumerate environment
\usepackage[inline]{enumitem}
