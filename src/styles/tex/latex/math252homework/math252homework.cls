%! Class = math252homework
%! Author = Len Washington III
%! Date = 8/21/2023

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{math252homework}[2023/08/21 Len Washington III's Package]

\LoadClass[12pt]{report}

\RequirePackage{alphalph}
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
	\newcommand{\correction}[1]{}
	\fancyhead[R]{\thepage}
}{
	\setboolean{istemplate}{false}
	\newcommand{\correction}[1]{\textcolor{red}{#1}}
	\fancyhead[R]{\theauthor\ - \thepage}
}

\newcommand{\ontemplate}[1]{\ifthenelse{\boolean{istemplate}}{#1}{}}
\newcommand{\onhomework}[1]{\ifthenelse{\boolean{istemplate}}{}{#1}}

%\newcommand{\subproblem}[1]{\pdfbookmark[3]{Problem \the\numexpr\value{enumi}.{\symbol{\numexpr97+\number\value{enumii}}}}{#1}\item\label{#1}}

\newcommand{\customsection}[2]{\vspace*{0.2em}\pdfbookmark[1]{Section #1}{#2}{\Large\textbf{Section #1}}\vspace*{0.5em}}
\newcommand{\customsubsection}[1]{\textcolor{textbook-blue}{\vspace*{0.2em}\pdfbookmark[2]{#1}{subsec:#1}{\large\textbf{#1}}\vspace*{0.5em}}}
\newcommand{\ivpsep}{\mbox{{ }{ }}}

\captionsetup[figure]{labelfont={bf},labelformat={default},name={FIGURE },labelsep=space}
\renewcommand\thefigure{\arabic{chapter}.\arabic{section}.\arabic{problemsi}}

\RequirePackage{environ}
\NewEnviron{newanswer}{
	\ifistemplate%
	\else
	\colorlet{saved}{.}
		\color{blue}
		\BODY
		\color{saved}
	\fi
}
\newcommand{\answer}[1]{\begin{newanswer}#1\end{newanswer}}
