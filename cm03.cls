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

\DeclareOption{libertine}{\let\useLibertine\relax}
\DeclareOption{kaiti}{\let\useKaiti\relax}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass[a4paper,12pt,onecolumn,twoside]{article}

\RequirePackage[margin=2cm,bottom=2.4cm]{geometry}
\RequirePackage{ifplatform}

\RequirePackage{fontspec}
\RequirePackage{unicode-math}

\ifx\useLibertine\relax
  \RequirePackage[tt=false]{libertine}
  \setmathfont[Scale=MatchUppercase]{LibertinusMath-Regular.otf}
\else
  \setmainfont{texgyretermes.otf}[
    UprightFont = *-regular,
    BoldFont = *-bold,
    ItalicFont = *-italic,
    BoldItalicFont = *-bolditalic
    ]
  \setmathfont{texgyretermes-math.otf}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set up KaiTi as the default Chinese font for cm03

\RequirePackage[PunctStyle=plain]{xeCJK}

\ifx\useKaiti\relax
  \setCJKmainfont{Kaiti TC}[BoldFont = *-Bold]
  \@latex@warning{使用楷體作為中文字型}
\else

\ifwindows
  \setCJKmainfont{BiauKai}[AutoFakeBold=2.5]
  \@latex@warning{使用標楷體作為中文字型}
\else

\IfFontExistsTF{BiauKai}{
  % BiauKai is shipped on macOS 13.2
  \setCJKmainfont{BiauKai}[AutoFakeBold=2.5]
  \@latex@warning{使用標楷體 (BiauKai) 作為中文字型}
}{
  \IfFontExistsTF{BiauKaiTC}{
  % After macOS 13.3, BiauKai is renamed to BiauKaiTC
    \setCJKmainfont{BiauKaiTC}[AutoFakeBold=2.5]
    \@latex@warning{使用標楷體繁 (BiauKaiTC) 作為中文字型}
}{
  \IfFontExistsTF{AR PL UKai TW}{
  % AR PL UKai TW is shipped with Ubuntu
  \setCJKmainfont{AR PL UKai TW}[AutoFakeBold=2.5]
    \@latex@warning{使用 AR PL UKai TW 作為中文字型}
}{
  \@latex@warning{使用教育部標準楷書作為中文字型}
  % Try to use 教育部標準楷書
  \setCJKmainfont{TW-MOE-Std-Kai}[AutoFakeBold=2.5]
}}}

\fi\fi

\RequirePackage{setspace}
\onehalfspacing

\RequirePackage{zhnumber,titlesec}

\titleformat{\section}[runin]{\bfseries\normalsize}{（\zhnum{section}）}{0em}{}
\titleformat{\subsection}[runin]{\bfseries\normalsize}{\thesubsection}{0.5em}{}
\titleformat{\subsubsection}[runin]{\bfseries\normalsize}{\thesubsubsection}{0.5em}{}

\AddToHook{begindocument/end}{\par\noindent\begingroup\large\bfseries 三、研究計畫內容（以中文或英文撰寫）：\endgroup\par}

\RequirePackage{lastpage,fancyhdr,fancyvrb}

\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}
\fancyhead{}
\lfoot{表\;CM03}
\cfoot{}
\rfoot{共~\pageref{LastPage}~頁\hspace{1em}第~\thepage~頁}

\RequirePackage[authoryear,square,sort]{natbib}
\renewcommand{\bibsection}{\section*{參考文獻}}

\RequirePackage[hidelinks,pdfusetitle]{hyperref}
\RequirePackage{doi}
