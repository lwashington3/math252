%! Class = math252exam
%! Author = Len Washington III
%! Date = 10/18/2023

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{math252exam}[2023/09/15 Len Washington III's Package]

\LoadClass[12pt]{report}

\RequirePackage{alphalph}
\RequirePackage{kvoptions}

\SetupKeyvalOptions{
	family=mathexam,
	prefix=mathexam@
}

\DeclareStringOption{exam}

\ProcessKeyvalOptions

\newcounter{exam}
\setcounter{exam}{\mathexam@exam}
\RequirePackage[title={Practice Test \#\arabic{exam}}]{math252}

\titleformat{\section}[block]
{\normalfont\Large\bfseries}	% format
{\math@title}	% label
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
	\fancyhead[R]{\math@author\ - \thepage}
}

\newcommand{\ontemplate}[1]{\ifthenelse{\boolean{istemplate}}{#1}{}}
\newcommand{\onhomework}[1]{\ifthenelse{\boolean{istemplate}}{}{#1}}

\renewcommand{\maketitle}{\begin{center}
	\textbf{MATH 252.01 \hfill Differential Equations \hfill Test \#\arabic{exam}}\\
	Date: \math@date \hfill Name: \ifthenelse{\boolean{istemplate}}{\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_}{\underline{\math@author}}
	\vspace{0.15em}
\end{center}}