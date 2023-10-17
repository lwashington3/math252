%! Class = math252homework
%! Author = Len Washington III
%! Date = 8/21/2023

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{math252homework}[2023/08/21 Len Washington III's Package]

\LoadClass[12pt]{report}

\RequirePackage{alphalph}
\RequirePackage{titling}
\RequirePackage{xkeyval}

\DeclareOptionX{chapter}{
	\setcounter{chapter}{#1}
}
\DeclareOptionX{section}{
	\setcounter{section}{#1}
}
\ProcessOptionsX\relax

\RequirePackage[title={HW Section \arabic{chapter}.\arabic{section}}]{math252}

\titleformat{\section}[block]
{\normalfont\Large\bfseries}	% format
{Section \arabic{chapter}.\arabic{section} }	% label
{0em}	% sec
{}	% before-code


\newcommand{\getenv}[2][]{%
  \CatchFileEdef{\temp}{"|kpsewhich --var-value #2"}{\endlinechar=-1}%
  \ifx\temp\empty\def\temp{UNDEFINED}\fi
  \if\relax\detokenize{#1}\relax\temp\else\let#1\temp\fi
}

\getenv[\Template]{Template}%

\RequirePackage{ifthen}
\RequirePackage{xstring}
\newboolean{istemplate}

\IfSubStr{\Template}{yes}{
	\setboolean{istemplate}{true}
	\newcommand{\answer}[1]{}
	\newcommand{\correction}[1]{}
	\fancyhead[R]{\thepage}
}{
	\setboolean{istemplate}{false}
	\newcommand{\answer}[1]{\textcolor{blue}{#1}}
	\newcommand{\correction}[1]{\textcolor{red}{#1}}
	\fancyhead[R]{\theauthor\ - \thepage}
}

\newcommand{\ontemplate}[1]{\ifthenelse{\boolean{istemplate}}{#1}{}}
\newcommand{\onhomework}[1]{\ifthenelse{\boolean{istemplate}}{}{#1}}

\newlist{problems}{enumerate}{2}
\setlist[problems, 1]
{label=\textbf{\arabic{problemsi}.},
leftmargin=\parindent,
}

\setlist[problems, 2]
{label=\textbf{\alph{problemsii}},
leftmargin=1.5\parindent,}

% region Example
\newcommand{\randomtext}{Hello, here is some text without a meaning. Hello, here is some text without a meaning.}
\newcommand{\shortrandomtext}{Hello, here is some text.}

\newcommand*\makeAlph[1]{\alphalph{\the\numexpr\value{#1}+1}}

\newcommand{\problem}{\pdfbookmark[2] % Level
{Problem \the\numexpr\value{problemsi}+1} % Text
{prb:\number\value{problemsi}}\item\label{prb:\number\value{problemsi}}} % Name/Label

\newcommand{\subproblem}{\pdfbookmark[3] % Level
{Problem \the\numexpr\value{problemsi}\makeAlph{problemsii}} % Text
{prb:\number\value{problemsi}\makeAlph{problemsii}}
\item\label{prb:\number\value{problemsi}\alph{problemsii}}} % Name/Label

%\newcommand{\subproblem}[1]{\pdfbookmark[3]{Problem \the\numexpr\value{enumi}.{\symbol{\numexpr97+\number\value{enumii}}}}{#1}\item\label{#1}}

\newcommand{\customsection}[2]{\vspace*{0.2em}\pdfbookmark[1]{\Large\bfseries Section #1}{#2}{\Large\textbf{Section #1}}\vspace*{2em}}
\newcommand{\ivpsep}{\mbox{{ }{ }}}
