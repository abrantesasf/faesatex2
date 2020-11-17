%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                         faesaTeX2 (faesatex2)                              %%
%%                                                                            %%
%% Modelos de Monografias (TCC, dissertação, tese, etc.) para as áreas de     %%
%% Ciência da Computação e Engenharia(s) da FAESA Centro Universitário        %%
%% (https://www.faesa.br).                                                    %%
%%                                                                            %%
%% Este modelos foram baseados na classe abnTeX2 (http://www.abntex.net.br/), %%
%% para a formatação de monografias acadêmicas conforme as normas da ABNT, e  %%
%% adaptados para o padrão específico utilizado na FAESA.                     %%
%%                                                                            %%
%% This work may be distributed and/or modified under the conditions of the   %%
%% LaTeX Project Public License (LPPL), either version 1.3 of this license or %%
%% (at your option) any later version. The latest version of this license is  %%
%% in http://www.latex-project.org/lppl.txt and version 1.3 or later is part  %%
%% of all distributions of LaTeX version 2005/12/01 or later.                 %%
%%                                                                            %%
%% This work has the LPPL maintenance status `maintained'.                    %%
%%                                                                            %%
%% Original author: Abrantes Araújo Silva Filho                               %%
%%                  abrantesasf@gmail.com                                     %%
%%                                                                            %%
%% Current maintainer: Abrantes Araújo Silva Filho                            %%
%%                     abrantesasf@gmail.com                                  %%
%%                                                                            %%
%% Further information about faesaTeX2 are available on:                      %%
%%   https://github.com/abrantesasf/faesatex2                                 %%
%%                                                                            %%
%% Further information about abnTeX2 are available on:                        %%
%%   http://www.abntex.net.br/                                                %%
%%   https://github.com/abntex/abntex2                                        %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%===============================================================================
% Definição inicial da classe e packages iniciais para configuração
%===============================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{classe/faesatex2}[2020/02/24 v1.0.0 Classe faesaTeX2]
\RequirePackage{xifthen}


%===============================================================================
% Variáveis e opções:
%===============================================================================
% Opções:
%   tcc1         formata a monografia para o projeto de trabalho de conclusão de
%                curso (TCC)
%   tcc2         formata a monografia para o trabalho de conclusão de curso (TCC)
%   mestrado     formata a monografia para a dissertação de mestrado
%   doutorao     formata a monografia para a tese de doutorado
%
%   licenciatura curso de licenciatura
%   bacharelado  curso de bacharelado
%   tecnologo    curso de tecnologo
%-------------------------------------------------------------------------------

% Opção passada é desconhecida?
\DeclareOption*{%
    \PackageWarning{faexatex2}{Unknown option ‘\CurrentOption’}%
}

% Contadores a serem utilizados nas veirificações de opções:
\newcounter{tipgrad}
\setcounter{tipgrad}{0}
\newcounter{tipposgrad}
\setcounter{tipposgrad}{0}

% Indica se o autor é homem:
\newcounter{autorhomem}
\setcounter{autorhomem}{1}

% Nível do curso superior: graduação
\newboolean{opt-grad}
\setboolean{opt-grad}{false}
\DeclareOption{grad}{
  \setboolean{opt-grad}{true}
}

% Nível do curso superior: pós-graduação
\newboolean{opt-posgrad}
\setboolean{opt-posgrad}{false}
\DeclareOption{posgrad}{
  \setboolean{opt-posgrad}{true}
}

% Tipo de graduação: licenciatura
\newboolean{opt-licenciatura}
\setboolean{opt-licenciatura}{false}
\DeclareOption{licenciatura}{
  \setboolean{opt-licenciatura}{true}
  \stepcounter{tipgrad}
}

% % Tipo de graduação: bacharelado
\newboolean{opt-bacharelado}
\setboolean{opt-bacharelado}{false}
\DeclareOption{bacharelado}{
  \setboolean{opt-bacharelado}{true}
  \stepcounter{tipgrad}
}

% Tipo de graduação: tecnólogo
\newboolean{opt-tecnologo}
\setboolean{opt-tecnologo}{false}
\DeclareOption{tecnologo}{
  \setboolean{opt-tecnologo}{true}
  \stepcounter{tipgrad}
}

% Tipo de monografia de graduação: tcc1
\newboolean{opt-tcc1}
\setboolean{opt-tcc1}{false}
\DeclareOption{tcc1}{
  \setboolean{opt-tcc1}{true}
}

% Tipo de monografia de graduação: tcc2
\newboolean{opt-tcc2}
\setboolean{opt-tcc2}{false}
\DeclareOption{tcc2}{
  \setboolean{opt-tcc2}{true}
}

% Tipo de pós-graduação: mestrado
\newboolean{opt-mestrado}
\setboolean{opt-mestrado}{false}
\DeclareOption{mestrado}{
  \setboolean{opt-mestrado}{true}
  \stepcounter{tipposgrad}
}

% Tipo de pós-graduação: doutorado
\newboolean{opt-doutorado}
\setboolean{opt-doutorado}{false}
\DeclareOption{doutorado}{
  \setboolean{opt-doutorado}{true}
  \stepcounter{tipposgrad}
}

% Tipo de pós-graduação: pós-doutorado
\newboolean{opt-posdoc}
\setboolean{opt-posdoc}{false}
\DeclareOption{posdoc}{
  \setboolean{opt-posdoc}{true}
  \stepcounter{tipposgrad}
}


%===============================================================================
% Repassa as configurações iniciais para a classe abntex2 e babel
%===============================================================================

% Repassa as opções para a classe abntex2:
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{abntex2}%
}

% Repassa as opções de linguagem para o package babel:
\PassOptionsToPackage{french, spanish, english, brazil}{babel}

% Executa o código para cada opção:
\ProcessOptions\relax


%===============================================================================
% Herda a classse abntex2 e ajusta as opções corretas para a FAESA
%===============================================================================
\LoadClass[%
  % ------------------------
  % Opções da classe memoir:
  % ------------------------
    12pt,                 % tamanho da fonte
    twoside,              % imprimir em frente e verso
    openright,            % capítulos começam sempre na direita
    a4paper,              % tamanho do papel
  % -------------------------
  % Opções da classe abnTeX2:
  % -------------------------
    %chapter=TITLE,		  % em letras maiúsculas
	%section=TITLE,		  % em letras maiúsculas
	%subsection=TITLE,	  % em letras maiúsculas
	%subsubsection=TITLE, % em letras maiúsculas
  % ------------------------
  % Opções do package babel:
  % ------------------------
    french,               % idioma adicional
    spanish,              % idioma adicional
    english,              % idioma adicional
    brazil                % idioma PRINCIPAL
]{abntex2}


%===============================================================================
% Faz algumas verificações bem básicas das opções que foram passadas
% TODO: melhorar essas verificações!
%===============================================================================

% Graduação e pós-graduação ao mesmo tempo:
\ifthenelse{\boolean{opt-grad} \AND \boolean{opt-posgrad}}{
   \PackageError{faesatex2}{Opcoes incompativeis para a classe faesaTeX2. Digite
      "H <ENTER>" para ajuda.}{%
      Ao informar o nivel do curso superior, voce escolheu simultaneamente as
      opcoes "grad" e "posgrad", mas elas sao mutuamente exclusivas. Por favor
      informe somente uma das opcoes.
      Digite "X <ENTER>" para abortar, faca as correcoes necessarias, e depois
      compile novamente o documento.
   }
   \stop
}

% Graduação sem nenhum tipo de graduação ou com mais de um tipo de graduação:
\ifthenelse{\boolean{opt-grad} \AND \( \value{tipgrad}>1 \OR \value{tipgrad}=0 \)}{
   \PackageError{faesatex2}{Opcoes incompativeis para a classe faesaTeX2. Digite
      "H <ENTER>" para ajuda.}{%
      Voce nao informou o tipo de graduacao, ou informou mais de um tipo de
      graduacao simultaneamente. Por favor, informe somente um unico tipo de
      graduacao.
      Digite "X <ENTER>" para abortar, faca as correcoes necessarias, e depois
      compile novamente o documento.
   }
   \stop
}

% Graduação com monografia de mestrado ou doutorado:
\ifthenelse{\boolean{opt-grad} \AND \(\boolean{opt-mestrado} \OR \boolean{opt-doutorado} \OR \boolean{opt-posdoc} \)}{
   \PackageError{faesatex2}{Opcoes incompativeis para a classe faesaTeX2. Digite
      "H <ENTER>" para ajuda.}{%
      Voce informou graduacao como nivel de curso superior, mas escolheu monografia
      de mestrado e/ou doutorado. Para a graduacao, escolha tcc1 ou tcc2.
      Digite "X <ENTER>" para abortar, faca as correcoes necessarias, e depois
      compile novamente o documento.
   }
   \stop
}

% Graduação com os dois TCCs:
\ifthenelse{\boolean{opt-grad} \AND \boolean{opt-tcc1} \AND \boolean{opt-tcc2}}{
   \PackageError{faesatex2}{Opcoes incompativeis para a classe faesaTeX2. Digite
      "H <ENTER>" para ajuda.}{%
      Voce informou graduacao como nivel de curso superior, mas informou os dois
      tipos de monografia "tcc1" e "tcc2" ao mesmo tempo. Para a graduacao, 
      escolha "tcc1" OU "tcc2".
      Digite "X <ENTER>" para abortar, faca as correcoes necessarias, e depois
      compile novamente o documento.
   }
   \stop
}

% Pós-graduação com monografia de graduação:
\ifthenelse{\boolean{opt-posgrad} \AND \(\boolean{opt-tcc1} \OR \boolean{opt-tcc2} \)}{
   \PackageError{faesatex2}{Opcoes incompativeis para a classe faesaTeX2. Digite
      "H <ENTER>" para ajuda.}{%
      Voce informou pos-graduacao como nivel de curso superior, mas escolheu uma
      monografia de graduacao (tcc1 e/ou tcc2). Para a pos-graduacao, escolha
      mestrado, doutorado ou posdoc.
      Digite "X <ENTER>" para abortar, faca as correcoes necessarias, e depois
      compile novamente o documento.
   }
   \stop
}

% Pós-graduação com tipo de graduação
\ifthenelse{\boolean{opt-posgrad} \AND \(\boolean{opt-licenciatura} \OR \boolean{opt-bacharelado} \OR \boolean{opt-tecnologo} \)}{
   \PackageError{faesatex2}{Opcoes incompativeis para a classe faesaTeX2. Digite
      "H <ENTER>" para ajuda.}{%
      Voce informou pos-graduacao como nivel de curso superior, mas informou
      erroneamente algum tipo de graduacao (licenciatura, bachareado, tecnologo).
      Ao informar pos-graduacao, escolha apenas mestrado, doutorado ou posdoc.
      Digite "X <ENTER>" para abortar, faca as correcoes necessarias, e depois
      compile novamente o documento.
   }
   \stop
}

% Pós-graduação sem nenhum tipo de monografia ou com mais de um tipo:
\ifthenelse{\boolean{opt-posgrad} \AND \( \value{tipposgrad}>1 \OR \value{tipposgrad}=0 \)}{
   \PackageError{faesatex2}{Opcoes incompativeis para a classe faesaTeX2. Digite
      "H <ENTER>" para ajuda.}{%
      Voce nao informou o tipo de pos-graduacao, ou informou mais de um tipo de
      pos-graduacao simultaneamente. Por favor, informe somente um unico tipo de
      pos-graduacao (mestrado, doutorado ou posdoc).
      Digite "X <ENTER>" para abortar, faca as correcoes necessarias, e depois
      compile novamente o documento.
   }
   \stop
}


%===============================================================================
% Carrega preâmbulo com as chamadas de todos os packages identificados como
% importantes e necessários para a área de computação e engenharia na FASESA.
% As configurações específicas de cada package devem ser feitas nos arquivos
% correspondentes dentro do diretório "utils".
%===============================================================================
\input{utils/preambulo.tex}


%===============================================================================
% Declara novos comandos a serem utilizados em diversas partes do documentos,
% mas principalmente no preâmbulo
%===============================================================================

% Comandos para o gênero do autor:
%\providecommand{\imprimirgenero}{}
%\providecommand{\genero}[1]{%
%   \renewcommand{\imprimirgenero}{#1}
%   \IfEq{\imprimirgenero}{M}{}{
%      \IfEq{\imprimirgenero}{F}{\stepcounter{autorhomem}}{
%          \PackageError{faesatex2}{Erro na definicao do sexo do autor. Digite
%              "H <ENTER>" para ajuda.}{%
%              Sexo desconhecido: "#1".
%              Use apenas "M" ou "F" (em maiusculas).
%              Digite "X <ENTER>" para abortar, faca as correcoes necessarias, e depois
%              compile novamente o documento.
%          }
%          \stop
%      }
%   }
%}

\providecommand{\imprimirgenero}{}
\providecommand{\genero}[1]{%
   \renewcommand{\imprimirgenero}{#1}
   \ifthenelse{\equal{#1}{M}}{}{\stepcounter{autorhomem}}
   \IfEq{\imprimirgenero}{M}{}{
      \IfEq{\imprimirgenero}{F}{}{
          \PackageError{faesatex2}{Erro na definicao do sexo do autor. Digite
              "H <ENTER>" para ajuda.}{%
              Sexo desconhecido: "#1".
              Use apenas "M" ou "F" (em maiusculas).
              Digite "X <ENTER>" para abortar, faca as correcoes necessarias, e depois
              compile novamente o documento.
          }
          \stop
      }
   }
}

% Comandos para a universidade:
\providecommand{\universidade}{FAESA Centro Universit{\'a}rio}
\providecommand{\imprimiruniversidade}{\universidade}

% Comandos para a unidade (departamento, instituto, etc.):
\providecommand{\unidade}{Unidade de Engenharia e Computa{\c c}{\~a}o}
\providecommand{\imprimirunidade}{\unidade}

% Comandos para o programa:
\providecommand{\programa}{Programa}
\providecommand{\imprimirprograma}{\programa}

% Comandos para o nível do curso superior:
\ifthenelse{\boolean{opt-grad}}{
   \providecommand{\nivelcursosuperior}{gradua{\c c}{\~a}o}
   \providecommand{\Nivelcursosuperior}{Gradua{\c c}{\~a}o}
}{
   \providecommand{\nivelcursosuperior}{p{\'o}s-gradua{\c c}{\~a}o}
   \providecommand{\nivelcursosuperior}{P{\'o}s-gradua{\c c}{\~a}o}
}
\providecommand{\imprimirnivelcursosuperior}{\nivelcursosuperior}

% Comandos para o grau:
\providecommand{\grau}{}
\providecommand{\imprimirgrau}{\grau}

% Comandos para o tipo de graduação:
\newboolean{autorbol}
\ifnum\pdfstrcmp{autorhomem}{1}=0
  \setboolean{autorbol}{true}
\fi
\ifnum\pdfstrcmp{autorhomem}{2}=0
  \setboolean{autorbol}{false}
\fi

\ifthenelse{ \boolean{opt-bacharelado} \AND \boolean{autorbol} }{
   \providecommand{\tipograduacao}{bacharelado}
   \renewcommand{\grau}{Bacharel \theautorhomem}
}{
   \providecommand{\tipograduacao}{bacharelado}
   \renewcommand{\grau}{Bacharela \theautorhomem}
}

\ifthenelse{\boolean{opt-licenciatura}}{
   \providecommand{\tipograduacao}{licenciatura}
   \ifthenelse{\equal{\imprimirgenero}{M}}{\renewcommand{\grau}{Licenciado}}{\renewcommand{\grau}{Licenciada}}
}{}
\ifthenelse{\boolean{opt-tecnologo}}{
   \providecommand{\tipograduacao}{tecn{\'o}logo}
   \ifthenelse{\equal{\imprimirgenero}{M}}{\renewcommand{\grau}{Tecn{\'o}logo}}{\renewcommand{\grau}{Tecn{\'o}loga}}
}{}
\providecommand{\imprimirtipograduacao}{\tipograduacao}

% Comandos para o tipo de pós-graduação:
\ifthenelse{\boolean{opt-mestrado}}{
   \providecommand{\tipoposgraduacao}{mestrado}
   \ifthenelse{\equal{\imprimirgenero}{M}}{\renewcommand{\grau}{Mestre}}{\renewcommand{\grau}{Mestra}}
}{}
\ifthenelse{\boolean{opt-doutorado}}{
   \providecommand{\tipoposgraduacao}{doutorado}
   \ifthenelse{\equal{\imprimirgenero}{M}}{\renewcommand{\grau}{Doutor}}{\renewcommand{\grau}{Doutora}}
}{}
\ifthenelse{\boolean{opt-posdoc}}{
   \providecommand{\tipoposgraduacao}{p{\'o}s-doutorado}
   \ifthenelse{\equal{\imprimirgenero}{M}}{\renewcommand{\grau}{P{\'o}s-doutor}}{\renewcommand{\grau}{P{\'o}s-doutora}}
}{}
\providecommand{\imprimirtipoposgraduacao}{\tipoposgraduacao}

% Comandos para o tipo de monografia:
\ifthenelse{\boolean{opt-tcc1}}{
   \providecommand{\tipomonografia}{Projeto de trabalho de conclus{\~a}o do curso}
   \providecommand{\imprimirapresentado}{apresentado à}
}{}
\ifthenelse{\boolean{opt-tcc2}}{
   \providecommand{\tipomonografia}{Trabalho de conclus{\~a}o do curso}
   \providecommand{\imprimirapresentado}{apresentado à}
}{}
\ifthenelse{\boolean{opt-mestrado}}{
   \providecommand{\tipomonografia}{Disserta{\c c}{\~a}o}
   \providecommand{\imprimirapresentado}{apresentada à}
}{}
\ifthenelse{\boolean{opt-doutorado}}{
   \providecommand{\tipomonografia}{Tese}
   \providecommand{\imprimirapresentado}{apresentada à}
}{}
\providecommand{\imprimirtipomonografia}{\tipomonografia}

% Comandos para os requisitos de colação de grau:
\providecommand{\requisitos}{como parte dos requisitos para obten{\c c}{\~a}o do t{\'i}tulo de}
\providecommand{\imprimirrequisitos}{\requisitos}

% Comandos específicos para pós-graduação:
\providecommand{\especialidade}{}
\providecommand{\arealabel}{}

% Comandos para o curso:
\newcommand{\curso}[1]{
   \ifthenelse{\equal{#1}{CC}}{
      \providecommand{\imprimircurso}{Ci{\^e}ncia da Computa{\c c}{\~a}o}
   }{
       \ifthenelse{\equal{#1}{ECP}}{
          \providecommand{\imprimircurso}{Engenharia da Computa{\c c}{\~a}o}
       }{
           \ifthenelse{\equal{#1}{EC}}{
              \providecommand{\imprimircurso}{Engenharia Civil}
           }{
               \ifthenelse{\equal{#1}{EE}}{
                  \providecommand{\imprimircurso}{Engenharia da El{\'e}trica}
               }{
                   \ifthenelse{\equal{#1}{EP}}{
                       \providecommand{\imprimircurso}{Engenharia de Produ{\c c}{\~a}o}
                   }{
                       \ifthenelse{\equal{#1}{SI}}{
                          \providecommand{\imprimircurso}{Sistemas de Informa{\c c}{\~a}o}                     
                       }{
                           \PackageError{faesatex2}{Opcao ilegal para o curso!}{
                           Erro na escolha do codigo do curso. Codigo desconhecido: "#1".
                           Por favor, verifique as opcoes corretas.
                           }
                           \stop
                        }
                    }
                }
            }
        }
    }
}


%===============================================================================
% Configuracao do texto impresso no Preambulo
%===============================================================================
\renewcommand{\imprimirpreambulo}{%
   \nohyphens{
      \imprimirtipomonografia\ de \nivelcursosuperior\ em \imprimircurso,
      \imprimirapresentado\ \imprimirunidade, \imprimirrequisitos\ \imprimirgrau\
      em \imprimircurso.
   }
}
%\addto\captionsbrazil{% portugues-brasil
%    \renewcommand{\imprimirpreambulo}{\nohyphens{\imprimirtipotrabalho\ de \tipodocurso\ em \imprimirarea\ \imprimirapresentadoa\ %\imprimirinstituicao,\exam~\degree~\imprimirespecialidade.}}
%    \renewcommand{\arealabel}{{\'A}rea de Concentra{\c c}{\~a}o}
%}


% Imrpimir apresentado ou apresentada:
%\ifthenelse{\boolean{opt-tcc1} \OR \boolean{opt-tcc2}}{
%  \providecommand{\imprimirapresentado}{apresentado à}
%}{
%  \providecommand{\imprimirapresentadoa}{apresentada à}
%}

% Impressão do nome do programa:
%\providecommand{\imprimirprograma}{}
%\providecommand{\imprimirsiglaprograma}{}
%\newcommand{\programa}[2]{
%    \renewcommand{\imprimirsiglaprograma}{#1}
%    \renewcommand{\imprimirprograma}{#2}
%}

% Impressão da especialidade da titulação:
%\providecommand{\imprimirespecialidade}{}
%\newcommand{\especialidade}[1]{\renewcommand{\imprimirespecialidade}{#1}}

%% Imprimir área de concentração:
%\providecommand{\imprimirarea}{}
%\newcommand{\area}[1]{\renewcommand{\imprimirarea}{#1}}

% Imprimir o programa de pós-graduação, a especialidade da titulação e a
% instituição:
%\newcommand
