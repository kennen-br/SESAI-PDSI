# SESAI-PDSI #

Software para para coleta e consolidação da família de dados destinados à elaboração do Plano Distrital de Saúde Indígena.

## Visão geral ##

<<<<<<< .mine
A SESAI é a área do Ministério da Saúde criada para coordenar e executar o processo de gestão do Subsistema de Atenção à Saúde Indígena em todo Território Nacional. Com esforços voltados para a implementação do Subsistema de Atenção à Saúde Indígena constitui-se o Plano Distrital de Saúde Indígena, de forma que sua construção é iniciada nos Conselhos Locais de Saúde Indígena (CSLI), com consolidação pelos Distritos Sanitários Especiais Indígenas (DSEI) e aprovação no Conselho Distrital de Saúde Indígena (CONDISI) sendo posteriormente encaminhado à Secretaria Especial de Saúde Indígena (SESAI) para homologação.

O Plano Distrital tem por si só o papel de aprimorar o planejamento, tanto do orçamento quanto da gestão, através também do monitoramento e avaliação, dentro dos respectivos Distritos Sanitários Especiais Indígenas (DSEI) viabilizando uma maior aderência ao Plano Nacional de Saúde/ Plano Plurianual e o Planejamento Estratégico da Secretaria Especial de Saúde Indígena.

Diante das necessidades previstas para a aplicação do Plano Nacional de Saúde/ Plano Plurianual de 2016-2019, entende-se como vital a análise situacional dos Conselhos Locais de Saúde Indígena (CSLI) e Distritos Sanitários Especiais Indígenas (DSEI), contemplando informações acerca das respectivas condições socioeconômicas, epidemiológicas e de gestão e também, os objetivos, as diretrizes e as metas pretendidas no período, tanto em relação à atenção à saúde propriamente dita quanto à gestão SUS no âmbito correspondente.

Desta forma, recai a responsabilidade do processo sobre os respectivos Conselhos Locais de Saúde Indígena (CSLI), onde Plano Distrital de Saúde Indígena iniciará sua construção, e também, pelos Distritos Sanitários Especiais Indígenas (DSEI), através da coleta de tal família de dados, sendo descritos como:

### CARACTERIZAÇÃO DOS DSEI ###
| PLANILHA | DESCRIÇÃO | STATUS |
| :------- | :-------: | :----:|
| **3.1** | **TERRITÓRIO E POPULAÇÃO**|  **33%** |
| - QUADRO 3.1A | *Mapa do território* | OK |
| - QUADRO 3.1B | *Resumo Geral *| PENDENTE |
| - QUADRO 3.1C | *Caracterização sócio demográfica, étnico-cultural e linguística dos povos indígenas que habitam o território sob responsabilidade do DSEI* | PENDENTE |
| **3.2** | **GESTÃO** | **40%** |
| - QUADRO 3.2A | *Meios de Transporte para acesso dos povos indígenas aos serviços de saúde* | PENDENTE |
| - QUADRO 3.2B | *Demonstrativo de recursos humanos existentes vinculados ao DSEI* | PENDENTE |
| - QUADRO 3.2C | *Capacidade instalada e oferta de ações programadas (recursos humanos atualmente vinculados ao trabalho das EMSI no distrito)* | PENDENTE |
| - QUADRO 3.2D | *Rede de serviços do Sistema Único de Saúde para a complementariedade da atenção básica, média e de alta complexidade.* | OK |
| - QUADRO 3.2E | *Infraestrutura de Saúde - Edificações *| OK |
| - QUADRO 3.2F | *Infraestrutura de Saúde - Saneamento* | OK |
| - QUADRO 3.2G | *Infraestrutura de Saúde - CAPAIS* | PENDENTE |
| **4**| **ANÁLISE SITUACIONAL**|  **33%** |
| - QUADRO 4.A | *Balanço do PDSI 2012-2015* | OK |
| - QUADRO 4.B | *Indicadores da saúde indígena* | OK |
| - QUADRO 4.C | *Dimensionamento de necessidades* | OK |
| **5** | **RESULTADOS ESPERADOS 2016 A 2019**| **0%** |
| - | *Planilha com resultados esperados* | PENDENTE |
| **6** | **ORÇAMENTO 2016 A 2019**| **0%** |
| - | *Planilha de orçamento* | PENDENTE |

## Solução ##

Dado o início das coletas em território, que vem sendo realizado de forma sistemática, compreendendo um padrão processual já determinado em planejamento, percebe-se a oportunidade de informatizar e sistematizar tal processo através de uma ferramenta para a coleta da família de dados e consolidação das informações em banco de dados, para posterior verificação e consulta por meio de painéis de visualização online, relatórios e gráficos.

Com a entrada em operação desta ferramenta de coleta de dados e consequente desativação do modelo de controle de coleta de dados em planilhas considera-se o proveito de se centralizar o controle destes processos, desenvolvendo um novo sistema, de propriedade da Pacto Desenvolvimento Institucional, que possuísse as funcionalidades para tal, mas que permitisse uma maior flexibilidade e agilidade para a evolução das atividades de gestão e monitoramento dentro dos Conselhos Locais de Saúde Indígena (CSLI) e Distritos Sanitários Especiais Indígenas (DSEI), além de a possibilidade de desenvolvimento de funcionalidades que venham de encontro às necessidades tanto no âmbito operacional quanto executivo.

Do ponto de vista puramente sistêmico, o desenvolvimento desta ferramenta deve considerar prontamente a necessidade de coleta de dados em ambiente sem conectividade em redes de computadores, e consequentemente, sem acesso à Internet. Parte de suas funcionalidades, portanto, prevê a interface de dados, coletados em ambiente off-line, para posterior consolidação em banco de dados em meio digital.

....(SEGUE)....detalhar

## Modelo proposto ##

A coleta de dados, tem sua como sua atividade central o preenchimento do formulário com perguntas, em diferentes níveis de acesso, levando em consideração o direcionamento das questões de acordo com o usuário e as instâncias da Saúde Indígena. Tal processo também deverá ter como prevista a opção para upload da planilha de dados coletados, sendo opção a ser utilizada enquanto a ferramenta não estiver em produção.

O painel de visualização e controle da informação, ambos também com diferentes níveis de acesso. O perfil Gerencial, permitindo a funcionalidades de gerenciamento dos processos de coleta de informação realizados em território e o perfil Executivo, com funcionalidades para análises quantitativas, gráficos e relatórios.

O painel administrativo permite a gestão e controle da ferramenta como um todo. Controle de acessos e usuários, informações técnicas acerca da aplicação, logs de ações, entre outras funcionalidades para gerenciamento da aplicação. 

Para descrição do Modelo proposto o estaremos abordando em três aspectos fundamentais:
- A coleta de dados, o fluxo de tratamento e arquitetura das informações armazenadas;
- A consolidação dos dados;
- Geração do documento PDSI.
....(SEGUE)....


## Regras de Negócio ##

* **RN.01:** I/O de dados
	* **RN.01.01:** Análise planilha mapa de indicadores
	* **RN.01.02:** Analise planilha de necessidades
	* **RN.01.02:** Análise planilhas caracterização

* **RN.02:** Consolidação dos dados para geração automática do documento PDSI pela ferramenta

* **RN.03:**

* **RN.04:**

* **RN.05:**

## Especificação de Requisitos ##

### Requisitos de Funcionais

* **RF.01:** Ferramenta de coleta online e consolidação em banco de dados

* **RF.02:** Ferramenta de coleta offline e posterior consolidação em banco de dados

* **RF.03:** Painel de visualização dos dados coletados com filtros por eixos de coleta e DSEI

* **RF.04:** Painel de administração da ferramenta (Cadastro e logs de manutenção de usuários + Logs de coleta de dados)

* **RF.05:** Distribuição de usuários por DSEI e com diferentes níveis de acesso (Admin, Executivo e Operacional)

* **RF.06:** Integração dos dados coletados entre os diversos eixos (indicadores, dados demográficos, orçamento, etc.) – BI

* **RF.07:** Interface de dados com sistemas legados

* **RF.08:** Gerador do documento PDSI (pdf)
______________

### Requisitos do Sistema

* **RS.01:**

* **RS.02:**

* **RS.03:**

* **RS.04:**

* **RS.05:**

=======
A SESAI é a área do Ministério da Saúde criada para coordenar e executar o processo de gestão do Subsistema de Atenção à Saúde Indígena em todo Território Nacional. Com esforços voltados para a implementação do Subsistema de Atenção à Saúde Indígena constitui-se o Plano Distrital de Saúde Indígena, de forma que sua construção é iniciada nos Conselhos Locais de Saúde Indígena (CSLI), com consolidação pelos Distritos Sanitários Especiais Indígenas (DSEI) e aprovação no Conselho Distrital de Saúde Indígena (CONDISI) sendo posteriormente encaminhado à Secretaria Especial de Saúde Indígena (SESAI) para homologação.

O Plano Distrital tem por si só o papel de aprimorar o planejamento, tanto do orçamento quanto da gestão, através também do monitoramento e avaliação, dentro dos respectivos Distritos Sanitários Especiais Indígenas (DSEI) viabilizando uma maior aderência ao Plano Nacional de Saúde/ Plano Plurianual e o Planejamento Estratégico da Secretaria Especial de Saúde Indígena.

Diante das necessidades previstas para a aplicação do Plano Nacional de Saúde/ Plano Plurianual de 2016-2019, entende-se como vital a análise situacional dos Conselhos Locais de Saúde Indígena (CSLI) e Distritos Sanitários Especiais Indígenas (DSEI), contemplando informações acerca das respectivas condições socioeconômicas, epidemiológicas e de gestão e também, os objetivos, as diretrizes e as metas pretendidas no período, tanto em relação à atenção à saúde propriamente dita quanto à gestão SUS no âmbito correspondente.

Desta forma, recai a responsabilidade do processo sobre os respectivos Conselhos Locais de Saúde Indígena (CSLI), onde Plano Distrital de Saúde Indígena iniciará sua construção, e também, pelos Distritos Sanitários Especiais Indígenas (DSEI), através da coleta de tal família de dados, sendo descritos como:

### CARACTERIZAÇÃO DOS DSEI ###
| PLANILHA | DESCRIÇÃO | STATUS |
| :------- | :-------: | :----:|
| **3.1.** | **Território e população**|  **33%** |
| - QUADRO 3.1A | *Mapa do território* | OK |
| - QUADRO 3.1B | *Resumo Geral *| PENDENTE |
| - QUADRO 3.1C | *Caracterização sócio demográfica, étnico-cultural e linguística dos povos indígenas que habitam o território sob responsabilidade do DSEI* | PENDENTE |
| **3.2.** | **Gestão** | **40%** |
| - QUADRO 3.2A | *Meios de Transporte para acesso dos povos indígenas aos serviços de saúde* | PENDENTE |
| - QUADRO 3.2B | *Demonstrativo de recursos humanos existentes vinculados ao DSEI* | PENDENTE |
| - QUADRO 3.2C | *Capacidade instalada e oferta de ações programadas (recursos humanos atualmente vinculados ao trabalho das EMSI no distrito)* | PENDENTE |
| - QUADRO 3.2D | *Rede de serviços do Sistema Único de Saúde para a complementariedade da atenção básica, média e de alta complexidade.* | OK |
| - QUADRO 3.2E | *Infraestrutura de Saúde - Edificações *| OK |
| - QUADRO 3.2F | *Infraestrutura de Saúde - Saneamento* | OK |
| - QUADRO 3.2G | *Infraestrutura de Saúde - CAPAIS* | PENDENTE |
| **4.**| **ANÁLISE SITUACIONAL**|  **33%** |
| - QUADRO 4.A | *Balanço do PDSI 2012-2015* | OK |
| - QUADRO 4.B | *Indicadores da saúde indígena* | OK |
| - QUADRO 4.C | *Dimensionamento de necessidades* | OK |
| **5.** | **RESULTADOS ESPERADOS 2016 A 2019**| **0%** |
| - | *Planilha com resultados esperados* | PENDENTE |
| **6.** | **ORÇAMENTO 2016 A 2019**| **0%** |
| - | *Planilha de orçamento* | PENDENTE |

## Solução ##

Dado o início das coletas em território, que vem sendo realizado de forma sistemática, compreendendo um padrão processual já determinado em planejamento, percebe-se a oportunidade de informatizar e sistematizar tal processo através de uma ferramenta para a coleta da família de dados e consolidação das informações em banco de dados, para posterior verificação e consulta por meio de painéis de visualização online, relatórios e gráficos.

Com a entrada em operação desta ferramenta de coleta de dados e consequente desativação do modelo de controle de coleta de dados em planilhas considera-se o proveito de se centralizar o controle destes processos, desenvolvendo um novo sistema, de propriedade da Pacto Desenvolvimento Institucional, que possuísse as funcionalidades para tal, mas que permitisse uma maior flexibilidade e agilidade para a evolução das atividades de gestão e monitoramento dentro dos Conselhos Locais de Saúde Indígena (CSLI) e Distritos Sanitários Especiais Indígenas (DSEI), além de a possibilidade de desenvolvimento de funcionalidades que venham de encontro às necessidades tanto no âmbito operacional quanto executivo.

Do ponto de vista puramente sistêmico, o desenvolvimento desta ferramenta deve considerar prontamente a necessidade de coleta de dados em ambiente sem conectividade em redes de computadores, e consequentemente, sem acesso à Internet. Parte de suas funcionalidades, portanto, prevê a interface de dados, coletados em ambiente off-line, para posterior consolidação em banco de dados em meio digital.

....(SEGUE)....detalhar

## Modelo proposto ##

A coleta de dados, tem sua como sua atividade central o preenchimento do formulário com perguntas, em diferentes níveis de acesso, levando em consideração o direcionamento das questões de acordo com o usuário e as instâncias da Saúde Indígena. Tal processo também deverá ter como prevista a opção para upload da planilha de dados coletados, sendo opção a ser utilizada enquanto a ferramenta não estiver em produção.

O painel de visualização e controle da informação, ambos também com diferentes níveis de acesso. O perfil Gerencial, permitindo a funcionalidades de gerenciamento dos processos de coleta de informação realizados em território e o perfil Executivo, com funcionalidades para análises quantitativas, gráficos e relatórios.

O painel administrativo permite a gestão e controle da ferramenta como um todo. Controle de acessos e usuários, informações técnicas acerca da aplicação, logs de ações, entre outras funcionalidades para gerenciamento da aplicação. 

Para descrição do Modelo proposto o estaremos abordando em três aspectos fundamentais:
- A coleta de dados, o fluxo de tratamento e arquitetura das informações armazenadas;
- A consolidação dos dados;
- Geração do documento PDSI.
....(SEGUE)....

## Regras de Negócio ##

* RN.01:
* RN.02:
* RN.03:
* RN.04:
* RN.05:

## Especificação de Requisitos ##

### Requisitos de Funcionais

* RF.01:
* RF.02:
* RF.03:
* RF.04:
* RF.05:
______________

### Requisitos do Sistema

* RS.01:
* RS.02:
* RS.03:
* RS.04:
* RS.05:























>>>>>>> .theirs
Acesse o levantamento de requisitos do sistema clicando [Aqui](LevantamentoDeRequisitos.markdown)
______________

### Requisitos de Usuário

<<<<<<< .mine
* **RU.01:**

* **RU.02:**

* **RU.03:**

* **RU.04:**

* **RU.05:**
______________

### Requisitos de Design

* **RD.01:** 

* **RD.02:**

* **RD.03:**

* **RD.04:**

* **RD.05:**
______________

#### Siglas

=======
* RU.01:
* RU.02:
* RU.03:
* RU.04:
* RU.05:
______________

### Requisitos de Design

* RD.01:
* RD.02:
* RD.03:
* RD.04:
* RD.05:
______________

#### Siglas









>>>>>>> .theirs
| Sigla | Significado |
| --- | --- |
| CONDISI | Conselho Distrital de Saúde Indígena |
| CSLI | Conselhos Locais de Saúde Indígena |
| DSEI | Distritos Sanitários Especiais Indígenas |
| SESAI | Secretaria Especial de Saúde Indígena |
