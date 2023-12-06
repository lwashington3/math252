%! PackagClass = math252notes
%! Author = Len Washington III
%! Date = 8/23/2023

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{math252notes}[2023/08/23 Len Washington III's Package]

\LoadClass[12pt]{report}

\RequirePackage{kvoptions}

\SetupKeyvalOptions{
	family=mathnotes,
	prefix=mathnotes@
}

\DeclareStringOption[\math@subject\ Notes]{title}

\ProcessKeyvalOptions*

\RequirePackage[title=\mathnotes@title]{math252}

\fancyhead[L]{\leftmark}

\newcommand{\definition}[2]{\textcolor{red}{#1} -- {#2}}

\titleformat{\section}
{\normalfont\Large\bfseries}	% format
{\arabic{chapter}.\arabic{section} }	% label
{0em}	% sec
{}	% before-code
%[\vspace{-2em}\rule{\titlewidth}{1pt}]	% after-code

\titleformat{\subsection}
{\normalfont\large\bfseries}	% format
{\arabic{chapter}.\arabic{section}.\arabic{subsection} -- }	% label
{0em}	% sec
{}	% before-code
[] % after-code

\newcommand{\theorem}[1]{\textbf{Theorem: } #1}
\newcommand{\conjecture}[1]{\textbf{Conjecture: } #1}

\newcommand{\example}{\subsection{Example}}
\newcommand{\answer}[1]{\textcolor{blue}{#1}}

\renewcommand{\maketitle}{\begin{titlepage}%
	\let\footnotesize\small
	\let\footnoterule\relax
	\null\vfil
	\vskip 60\p@
	\begin{center}%
		{\LARGE \math@title \par}%
		\vskip 3em%
		{\large
			\lineskip .75em%
			\begin{tabular}[t]{c}%
			\math@author
			\end{tabular}\par}%
		\vskip 1.5em%
		{\large \@date \par}%       % Set date in \large size.
		\end{center}\par
	\vfil\null
	\end{titlepage}%
}