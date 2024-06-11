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

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass[a4paper,12pt,onecolumn]{article}
\RequirePackage[hidelinks,pdfusetitle]{hyperref}
\RequirePackage[margin=2cm,bottom=2.4cm]{geometry}
\RequirePackage{ifplatform}

\ifx\useLibertine\relax
\RequirePackage{fontspec}
\usepackage{libertineRoman}
\usepackage{biolinum}
\fi

\RequirePackage[PunctStyle=plain]{xeCJK}
\IfFontExistsTF{BiauKai}{%
  \setCJKmainfont{BiauKai}[AutoFakeBold=3]
}{%
  \IfFontExistsTF{Kaiti TC}{%
    \setCJKmainfont{Kaiti TC}[BoldFont = *-Bold]
  }{%
    \IfFontExistsTF{AR PL UKai TW}{%
      \setCJKmainfont{AR PL UKai TW}[AutoFakeBold=3]
    }{}
  }
}

\renewcommand{\CJKttdefault}{rm}

\RequirePackage{setspace}
\onehalfspacing

\RequirePackage{zhnumber}
\RequirePackage{titlesec}
\titleformat{\section}[runin]{\bfseries\normalsize}{（\zhnum{section}）}{1em}{}
\titleformat{\subsection}[runin]{\bfseries\normalsize}{\thesubsection}{0.5em}{}
\titleformat{\subsubsection}[runin]{\bfseries\normalsize}{\thesubsubsection}{0.5em}{}

\AddToHook{begindocument/end}{\par\noindent\begingroup\large\bfseries 三、研究計畫內容（以中文或英文撰寫）：\endgroup\par}

\RequirePackage{lastpage}
\RequirePackage{fancyhdr}
\RequirePackage{fancyvrb}

\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}
\fancyhead{}
\lfoot{表\;CM03}
\cfoot{}
\rfoot{共~\pageref{LastPage}~頁\hspace{1em}第~\thepage~頁}

\renewcommand{\refname}{\bfseries 參考文獻}

\RequirePackage[authoryear,square]{natbib}
\RequirePackage{url}
\RequirePackage{doi}
\newcommand{\isbn}[1]{{\scshape Isbn}:~\href{http://www.isbnsearch.org/isbn/#1}{\nolinkurl{#1}}}
\newcommand{\urlentry}[1]{{\scshape Url}:~\url{#1}}
\newcommand{\arXiv}[1]{\href{http://arxiv.org/abs/#1}{arXiv:\nolinkurl{#1}}}

\RequirePackage{amsmath,amsthm}

\newtheorem{theorem}{Theorem}[section]
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{corollary}[theorem]{Corollary}
\theoremstyle{definition}
\newtheorem{definition}[theorem]{Definition}
\theoremstyle{remark}
\newtheorem*{remark}{Remark}

\RequirePackage{cleveref}
\RequirePackage[dvipsnames]{xcolor}
