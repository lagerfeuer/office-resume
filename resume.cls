\ProvidesClass{resume}[2020/2/29 Resume class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

\RequirePackage{geometry}
\geometry{left=1.5cm, top=1.0cm, right=1.5cm, bottom=1.0cm, footskip=.5cm}
\RequirePackage{parskip}
\RequirePackage{titlesec}
\RequirePackage{multicol}
\RequirePackage{ragged2e}
\RequirePackage[inline]{enumitem}
\RequirePackage{graphicx}

\input{common/colors.tex}
\input{common/fonts.tex}
\input{common/header.tex}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COVER LETTER
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% address to
% Usage: sendto{<address>}{<date-and-location>}
\newcommand{\sendto}[2]{
  \vspace{2em}
  {#1}
  {\hfill #2}
  \vspace{2em}
}

% opening
% Usage: opening{<line>}
\newcommand{\opening}[1]{
  {\bfseries #1}
}
% closing
% Usage: closing{<line>}
\newcommand{\closing}[1]{
  \vspace{2em}
  #1
  \par
}

% signature
% Usage: signature{<image-path>}
\newcommand{\signature}[1]{
  \vspace{2em}
  \begin{center}
    \includegraphics[keepaspectratio,height=3\baselineskip]{#1}\\
    \@firstname~\@lastname
  \end{center}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% RESUME
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@sectioncolor{oxford}
\def\@secondarycolor{\color{darkgray!80}}

\newenvironment{tightitemize}{
  \vspace{-\topsep}\begin{itemize}\itemsep1pt\parskip0pt\parsep0pt
  }{
  \end{itemize}\vspace{-\topsep}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SECTIONS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% \titlespacing{command}{left spacing}{before spacing}{after spacing}[right]
\titlespacing{\section}{0pt}{0pt}{.5em}
\titleformat{\section}{
  \color{\@sectioncolor}\RaggedLeft\subheaderfont\LARGE\bfseries
}{}{0em}{\@secondarycolor\titlerule[2pt]}
\titlespacing{\subsection}{0pt}{-.2em}{0pt}
\titleformat{\subsection}[runin]{\subheaderfont\large\bfseries}{}{0em}{}[\enspace]

\newcommand*{\rulercolor}[1]{\def\@rulercolor{\color{#1}}}

\newcommand*{\sectionstyle}[1]{
  \color{black!70} #1
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SKILLS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{skills}{
  % \begin{multicols}{3}
}{
  % \end{multicols}
  % \vspace{-1em}
  % \par\noindent\makebox[\linewidth]{\color{black}\rule{\paperwidth}{0.4pt}}
}

\newenvironment{languages}{
  \begin{itemize*}[itemjoin=\quad]
  }{
  \end{itemize*}
}

\newenvironment{programming}{
  \begin{itemize*}[itemjoin=\quad]
  }{
  \end{itemize*}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EDUCATION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{education}{
  \let\@tmpparskip\parskip
  \setlength{\parskip}{0pt}
}{
  \setlength{\parskip}{\@tmpparskip}
}
% EDUCATION
% Usage: \education{<name>}{<degree>}{<location>}{<duration>}{<text>}
\newcommand{\degree}[5]{
  {\subheaderfont\bfseries\Large{#1}}
  \small
  {\hfill\@secondarycolor\faCalendar\enspace #4}
  \par
  {\@secondarycolor\faBook\bfseries\enspace #2}{\hfill\@secondarycolor\faMapMarker\enspace #3}
  \vspace{-.5em}
  \par
  #5
  \par\vspace{1em}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EXPERIENCE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{experience}{
  \let\@tmpparskip\parskip
  \setlength{\parskip}{0pt}
}{
  \setlength{\parskip}{\@tmpparskip}
  \vspace{-1em}
}
% EXPERIENCE
% Usage: \position{<company>}{<job>}{<location>}{<duration>}{<text>}
\newcommand{\job}[5]{
  {\subheaderfont\bfseries\Large{#1}}
  {\hfill\small\@secondarycolor\faCalendar\enspace #4}
  \par
  {\@secondarycolor\faSuitcase\bfseries\enspace #2}{\hfill\small\@secondarycolor\faMapMarker\enspace #3}
  \par
  #5
  \par\vspace{1em}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PROJECTS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{projects}{
  \begin{tightitemize}
  }{
  \end{tightitemize}
}
% Project
% Usage: \project{<name>}{<description>}
\newcommand{\project}[2]{
\item[\faArchive] {\subheaderfont\bfseries{#1}}\enspace
  #2
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% AWARDS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{awards}{
  \begin{tightitemize}
  }{
  \end{tightitemize}
}
% Awards
% Usage: \award{<name>}{year}{<description>}
\newcommand{\award}[3]{
\item[\faTrophy] {\subheaderfont\bfseries{#1}}\enspace
  {\hfill\small\@secondarycolor\faCalendar\enspace #2}\\
  #3
}