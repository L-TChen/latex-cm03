% Author: Josh Ko and Liang-Ting Chen
% Maintainer: Liang-Ting Chen (ltchen@iis.sinica.edu.tw)

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cm03}[2024/10/29 NSTC LaTeX class]

\def\cmthree@opterrlong{The option "\CurrentOption" from article.cls is not compatible with the format of cm03.}
\newcommand{\cmthree@warning}{\ClassWarning{cm03}{\cmthree@opterrlong}}
\newcommand{\cmthree@info}[1]{\ClassInfo{cm03}{#1}}

%% Title is not required but fine to have `\maketitle`, 
%% if you'd like to change your document to something useful later on.
\DeclareOption{titlepage}{\cmthree@warning}
\DeclareOption{notitlepage}{\cmthree@warning}

%% Only 12 pt is accepted by NSTC
\DeclareOption{10pt}{\cmthree@warning}
\DeclareOption{11pt}{\cmthree@warning}

%% Only a4paper is accepted by NSTC
\DeclareOption{letterpaper}{\cmthree@warning}
\DeclareOption{a5paper}{\cmthree@warning}
\DeclareOption{b5paper}{\cmthree@warning}
\DeclareOption{executivepaper}{\cmthree@warning}
\DeclareOption{legalpaper}{\cmthree@warning}

%% None of the following is accepted by NSTC
\DeclareOption{twocolumn}{\cmthree@warning}

%% cm03 is not a book
\DeclareOption{openright}{\cmthree@warning}

\DeclareOption{libertine}{\let\@libertine\relax}
\DeclareOption{kaiti}{\let\@kaiti\relax}

%% options (inherited from article): `draft`, `fleqn`, `leqno`, `oneside`, `twoside`
%% new options: `kaiti`, `libertine`
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
  \newenvironment{zh}{\begin{CJK*}{UTF8}{bkai}}{\end{CJK*}}
%% CJK's bkai font only provides the `bx` shape (boldface extended) by default.
%% Therefore, we load its font definition `c70bkai.fd` explicitly and declare
%% the boldface shape `b`. 
  \input{c70bkai.fd}
  \DeclareFontShape{C70}{bkai}{b}{n}{<-> CJKb * bkaiu}{\CJKbold}
  \AddToHook{begindocument/end}{\begin{zh}}
  \AddToHook{enddocument}{\end{zh}}
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
%% Set up Chinese numbering and the format of section headings
%% 

\AddToHook{begindocument/end}{\par\everypar={{\setbox0=\lastbox}\everypar{}}\begingroup\large\bfseries 三、研究計畫內容（以中文或英文撰寫）：\endgroup\par}

\RequirePackage{zhnumber,titlesec}

\titleformat{\section}[runin]{\bfseries\normalsize}{（\zhnum{section}）}{0em}{}
\titleformat{\subsection}[runin]{\bfseries\normalsize}{\thesubsection}{0.5em}{}
\titleformat{\subsubsection}[runin]{\bfseries\normalsize}{\thesubsubsection}{0.5em}{}

\RequirePackage{lastpage,fancyhdr}

\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}
\fancyhead{}
\iftutex
  \lfoot{表\;CM03}
\else
  \lfoot{\begin{zh}表\;CM03\end{zh}}
\fi
\cfoot{}
\iftutex
  \rfoot{共~\pageref{LastPage}~頁\hspace{1em}第~\thepage~頁}
\else
  \rfoot{\begin{zh}共~\pageref{LastPage}~頁\hspace{1em}第~\thepage~頁\end{zh}}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set up the section heading for bibliography in Chinese

\AddToHook{begindocument/end}{\renewcommand{\refname}{參考文獻}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Define required sections

\newcommand{\zhsection}[2]{\section{#1}#2\vskip1em}

\newcommand{\ProposalBackground}{\zhsection{研究計畫之背景}{請詳述本研究計畫所要探討或解決的問題、研究原創性、重要性、預期影響性及國內外有關本計畫之研究情況、重要參考文獻之評述等。如為連續性計畫應說明上年度研究進度。}}

\newcommand{\ProposalMethod}{\zhsection{研究方法、進行步驟及執行進度}{請分年列述：1. 本計畫採用之研究方法與原因及其創新性。2. 預計可能遭遇之困難及解決途徑。3. 重要儀器之配合使用情形。4. 如為須赴國外或大陸地區研究，請詳述其必要性以及預期效益等。}}

\newcommand{\ProposalPlan}{\zhsection{預期完成之工作項目及成果}{請分年列述：1. 預期完成之工作項目。2. 對於參與之工作人員，預期可獲之訓練。3. 預期完成之研究成果（如實務應用績效、期刊論文、研討會論文、專書、技術報告、專利或技術移轉等質與量之預期成果）。4. 學術研究、國家發展及其他應用方面預期之貢獻。}}

\newcommand{\ProposalIntegration}{\zhsection{整合型研究計畫說明}{如為整合型研究計畫請就以上各點分別說明與其他子計畫之相關性。}}
