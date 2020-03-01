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

\input{common/colors.tex}
\input{common/fonts.tex}
\input{common/header.tex}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% RESUME
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
\titlespacing{\section}{0pt}{1em}{1em}
\titleformat{\section}{
  \color{\@sectioncolor}\RaggedLeft\Quicksand\LARGE\bfseries
}{}{0em}{\@secondarycolor\titlerule[1pt]}
\titlespacing{\subsection}{0pt}{-.2em}{0pt}
\titleformat{\subsection}[runin]{\Quicksand\large\bfseries}{}{0em}{}[\enspace]

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