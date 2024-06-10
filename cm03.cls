\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cm03}[2024/06/10 NSTC LaTeX class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass[a4paper,12pt,onecolumn]{article}

\RequirePackage[margin=2cm,bottom=2.4cm]{geometry}
\RequirePackage{fontspec}
\RequirePackage{unicode-math}

\RequirePackage[PunctStyle=plain]{xeCJK}
\RequirePackage{zhnumber}

\setmainfont{texgyretermes.otf}[
  UprightFont = *-regular,
  BoldFont = *-bold,
  ItalicFont = *-italic,
  BoldItalicFont = *-bolditalic
  ]

\IfFontExistsTF{Kaiti TC}{%
  \setCJKmainfont{Kaiti TC}[BoldFont = *-Bold]%
}{%
  \IfFontExistsTF{BiauKai}{%
    \setCJKmainfont{BiauKai}[AutoFakeBold=3]%
  }{%
    \setCJKmainfont{AR PL UKai TW}[AutoFakeBold=3]
  }
}
\IfFontExistsTF{PragmataPro Mono}{%
  \setmonofont{PragmataPro Mono}[Scale=0.81]
  \setCJKmonofont{PragmataPro Mono}[Scale=0.81]
}{}
\setmathfont{texgyretermes-math.otf}

\RequirePackage{setspace}
\onehalfspacing

\RequirePackage{titlesec}
\titleformat{\section}{\normalfont\normalsize}{（\zhnum{section}）}{0em}{}
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

\RequirePackage[hidelinks,pdfusetitle]{hyperref}
\RequirePackage[authoryear,square]{natbib}
\RequirePackage{url}
\RequirePackage{doi}
\newcommand{\isbn}[1]{{\small ISBN}:~\href{http://www.isbnsearch.org/isbn/#1}{\nolinkurl{#1}}}
\newcommand{\urlentry}[1]{\textsc{Url}:~\url{#1}}
\newcommand{\arXiv}[1]{\href{http://arxiv.org/abs/#1}{arXiv:\nolinkurl{#1}}}

\RequirePackage[dvipsnames]{xcolor}
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
