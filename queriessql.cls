% -- Identificação: %
\NeedsTeXFormat{LaTeX2e}
\LoadClass[12pt,a4paper]{article}

\ProvidesClass{queriessql}[
Classe do LaTeX criada em Nov. 2022
]
\usepackage{verbatim} %permite comentar mais de uma linha

% -- Formatação Básica -- %
\RequirePackage[utf8]{inputenc} %passado da main pra cá para o codigo ficar + limpo, e usamos  RequirePackage ao invés de (usepackage)% Esse pacote é o de encodificação

\RequirePackage[T1]{fontenc}
\RequirePackage[portuguese]{babel} %idioma
\RequirePackage[default, scale=0.95]{opensans} %fonte
\RequirePackage[margin=2.5cm]{geometry}%margem
\RequirePackage{amsmath,amsfonts,amssymb} %pacotes matemática
\RequirePackage{newtxmath} %fonte matemática
\RequirePackage{setspace}% pacote espaçamento
%\singlespacing -Pertinente ao espaçamento simples;
\onehalfspacing % Pertinente ao espaçamento de 1,5;
%\doublespacing — Pertinente ao espaçamento duplo;
\setlength{\parindent}{20pt}%identação
\RequirePackage{indentfirst} %indenta o primeiro
\setlength{\parskip}{6pt} % parágrafos (espaçamento)

%---FLOATS---: tabelas e figuras
\RequirePackage{float} %pacote de figuras/tabelas
\RequirePackage{adjustbox} %ajuste automático
\RequirePackage{caption}%legendas
\captionsetup[table]{
labelfont = bf,
labelsep = endash, 
skip = 4pt
}
\captionsetup[figure]{
labelfont = bf,
labelsep = period, %separador ponto
skip = 4pt
}
\setlength{\textfloatsep}{6pt} %separar os floats do texto, espaço cima e em baixo
\renewcommand{\arraystretch}{1.2} %esapçamento (linha tabela)

%--Listas:
\RequirePackage{enumitem}%pacote listas
\setlist{
topsep=2pt,
itemsep=0pt,
partopsep=0pt,
parsep=0pt
}
\setlist[enumerate]{label=\bfseries\arabic*.} %define a enumeração se vai ser Roman/Arabic se vai ser negrito...

%--Cores:
\RequirePackage[dvipsnames]{xcolor}

%--Hyperlink:
\RequirePackage[hidelinks]{hyperref} 
\RequirePackage{url}%url
\urlstyle{same}

% -- Ícone:

\RequirePackage{fontawesome}%fonte icones

%-- CUSTOMIZANDO TÍTULOS:
\RequirePackage{titlesec}%customizar títulos

%--Seção (estilo)
\titleformat{\section}{\bfseries\large}{\faBookmarkO~}{6pt}{}

%---Subseção (estilo)
\titleformat{\subsection}{\bfseries \itshape}{\color{BlueViolet}\faCode~}{0pt}{}

%--Sub-Subseção (estilo):
\titleformat{\subsubsection}{\bfseries \itshape}{}{0pt}{}

%--Espoçamento (títulos): 
\titlespacing{\section}{0pt}{8pt}{4pt}
\titlespacing{\subsection}{0pt}{4pt}{2pt}
\titlespacing{\subsubsection}{0pt}{4pt}{2pt}

%--Cor na linha de cabeçalho:
\RequirePackage{xpatch}

%--- PAGESTYLE: Criando estilos de pagina

\RequirePackage{fancyhdr}
\fancypagestyle{SQLps}{ %define o nome e oq vai fazer
    \fancyhf{}% zera o doc
    \fancyhead[L]{{\color{BlueViolet}\faLinkedinSquare}~ \href{\@urllinkedin}{\@linkedin}}
    \fancyhead[R]{{\footnotesize \color{ForestGreen}\@titulo }}
    \fancyfoot[C]{\footnotesize \thepage} %rodapé, 2ºcomando dentro{} vai colocar a numeração
    \xpretocmd\headrule{\color{gray!85}}{}{} %cor cinza com 85%de transparencia
    \renewcommand{\headrulewidth}{0.2pt}
    \setlength{\headheight}{15pt} %medida do cabeçalho 15pt é o mínimo
}
%\RequirePackage{showframe} % mostra as divisões de espaço da página
%\href{link}{texto}
\pagestyle{SQLps}

%---CODE LISTINGS: Blocos de código

\RequirePackage{listings}

% -- Definindo cores:
\definecolor{codegreen}{rgb}{0,0.6,0} %"criou" as cores
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}

% -- Criando um estilo:
\lstdefinestyle{mystyle}{
    backgroundcolor=\color{gray!5},
    commentstyle=\color{codegreen},
    keywordstyle=\color{BlueViolet},
    numberstyle=\tiny\color{codegray},
    stringstyle=\color{codepurple},
    basicstyle=\ttfamily\footnotesize,
    breakatwhitespace=false,
    breaklines=true,
    captionpos=t,
    keepspaces=true,
    numbers=left,
    numbersep=5pt,
    showspaces=false,
    showstringspaces=false,
    showtabs=false,
    tabsize=2
}

% -- Configurando o estilo:
\lstset{
    style=mystyle,
    framexleftmargin=3.5mm,
    frame=shadowbox,
    rulesepcolor=\color{black},
    linewidth=0.6\linewidth, %tam da caixa
    xleftmargin=12pt,
    aboveskip=12pt, %espaço antes da box
    belowskip=12pt, % // depois da box
    %language=SQL %se definir a linguagem aqui não precisa definir na main se for usar só essa linguagem
}

% -- CAIXAS:
\RequirePackage{tcolorbox}

%---Novas variaveis
\def\titulo#1{ \def\@titulo{#1}} %titulo
\def \@titulo{} %iniciar a variavel como vazia

\def\autor#1{ \def\@autor{#1}} %autor
\def \@autor{} %iniciar a variavel como vazia

\def\linkedin#1{ \def\@linkedin{\itshape#1}} %linkedin (texto)
\def \@linkedin{} %iniciar a variavel como vazia

\def\urllinkedin#1{ \def\@urllinkedin{#1}} %(url
\def \@urllinkedin{} %iniciar a variavel como vazia

%---Novos comandos
\newcommand{\destacar}[1]{{\color{BlueViolet}#1}}

%imprimir titulo na tela no doc e autor
\newcommand{\printtitle}{
    \begin{center}
    {\Large\bfseries~\@titulo}\\ \medskip
    {\large\@autor}

    \end{center}
}

%--- Novos ambientes
\newenvironment{caixa}{
    \begin{tcolorbox}[
    colback=black!2, 
    colframe=white, 
    arc=0pt, 
    outer arc=0pt
    ]
}{
\end{tcolorbox}
}
