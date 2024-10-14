\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cm03}[2024/06/10 NSTC LaTeX class]

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

\LoadClass[a4paper,12pt,onecolumn]{article}

\RequirePackage[margin=2cm,bottom=2.4cm]{geometry}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{xifthen}

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

\RequirePackage[PunctStyle=plain]{xeCJK}
\ifx\useKaiti\relax
  \setCJKmainfont{Kaiti TC}[BoldFont = *-Bold]
\else
\IfFontExistsTF{BiauKai}{
  \setCJKmainfont{BiauKai}[AutoFakeBold=2.5]
}{
\IfFontExistsTF{AR PL UKai TW}{
  \setCJKmainfont{AR PL UKai TW}[AutoFakeBold=2.5]
  }{
  \setCJKmainfont{TW-MOE-Std-Kai}[AutoFakeBold=2.5]
  }
}
\fi


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
