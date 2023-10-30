%! PackagClass = math252notes
%! Author = Len Washington III
%! Date = 8/23/2023

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{math252notes}[2023/08/23 Len Washington III's Package]

\LoadClass[12pt]{report}

\RequirePackage{titling}
\RequirePackage{xkeyval}

\DeclareOptionX{title}{
	\title{#1}
}
\ProcessOptionsX\relax

\RequirePackage{math252}
%\title{\thesubject\ Notes}

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