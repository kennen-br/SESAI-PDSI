# SESAI-PDSI #
## Visão geral ##

Software para coleta e consolidação da família de dados destinados à elaboração do Plano Distrital de Saúde Indígena.

A SESAI é a área do Ministério da Saúde criada para coordenar e executar o processo de gestão do Subsistema de Atenção à Saúde Indígena em todo Território Nacional. Com esforços voltados para a implementação do Subsistema de Atenção à Saúde Indígena constitui-se o Plano Distrital de Saúde Indígena, de forma que sua construção é iniciada nos Conselhos Locais de Saúde Indígena (CSLI), com consolidação pelos Distritos Sanitários Especiais Indígenas (DSEI) e aprovação no Conselho Distrital de Saúde Indígena (CONDISI) sendo posteriormente encaminhado à Secretaria Especial de Saúde Indígena (SESAI) para homologação.

O Plano Distrital tem por si só o papel de aprimorar o planejamento, tanto do orçamento quanto da gestão, através também do monitoramento e avaliação, dentro dos respectivos Distritos Sanitários Especiais Indígenas (DSEI) viabilizando uma maior aderência ao Plano Nacional de Saúde/ Plano Plurianual e o Planejamento Estratégico da Secretaria Especial de Saúde Indígena.

### Solução ###

Dado o início das coletas em território, que vem sendo realizado de forma sistemática, compreendendo um padrão processual já determinado em planejamento, percebe-se a oportunidade de informatizar e sistematizar tal processo através de uma ferramenta para a coleta da família de dados e consolidação das informações em banco de dados, para posterior verificação e consulta por meio de painéis de visualização online, relatórios e gráficos.

Com a entrada em operação desta ferramenta de coleta de dados e consequente desativação do modelo de controle de coleta de dados em planilhas considera-se o proveito de se centralizar o controle destes processos, desenvolvendo um novo sistema, de propriedade da Pacto Desenvolvimento Institucional, que possuísse as funcionalidades para tal, mas que permitisse uma maior flexibilidade e agilidade para a evolução das atividades de gestão e monitoramento dentro dos Conselhos Locais de Saúde Indígena (CSLI) e Distritos Sanitários Especiais Indígenas (DSEI), além de a possibilidade de desenvolvimento de funcionalidades que venham de encontro às necessidades tanto no âmbito operacional quanto executivo.

Do ponto de vista puramente sistêmico, o desenvolvimento desta ferramenta deve considerar prontamente a necessidade de coleta de dados em ambiente sem conectividade em redes de computadores, e consequentemente, sem acesso à Internet. Parte de suas funcionalidades, portanto, prevê a interface de dados, coletados em ambiente off-line, para posterior consolidação em banco de dados em meio digital.

### Modelo proposto ###

A coleta de dados, tem sua como sua atividade central a consolidação das informações dentro da estrutura de dados proposta para o sistema para posteriormente permitir a geração do . Portanto, o preenchimento do formulário com perguntas, em diferentes níveis de acesso, levando em consideração o direcionamento das questões de acordo com o usuário e as instâncias da Saúde Indígena. Tal processo também deverá ter como prevista a opção para upload da planilha de dados coletados, sendo opção a ser utilizada enquanto a ferramenta não estiver em produção.

O painel de visualização e controle da informação, ambos também com diferentes níveis de acesso. O perfil Gerencial, permitindo a funcionalidades de gerenciamento dos processos de coleta de informação realizados em território e o perfil Executivo, com funcionalidades para análises quantitativas, gráficos e relatórios.

O painel administrativo permite a gestão e controle da ferramenta como um todo. Controle de acessos e usuários, informações técnicas acerca da aplicação, logs de ações, entre outras funcionalidades para gerenciamento da aplicação. 

Para descrição do Modelo proposto o estaremos abordando em três aspectos fundamentais:
- A coleta de dados, o fluxo de tratamento e arquitetura das informações consolidadas;
- Visualização e revisão dos dados;
- Geração do documento PDSI.

___________

##Plano Distrital de Saúde Indígena (PDSI) 2016 – 2019##
A composição do PDSI reflete o trabalho conjunto das diversas instâcias da Secretaria de Atenção e Saúde Indígena, ora na coleta de dados, criação de textos explicativos sobre metodolgia dos processos, justificativas, critérios, entre outras informações, que em sua totalidade, após serem revisados pela SESAI Central subsidiam a geração do documento PDSI.

###ESTRUTURAÇÃO E CONTEÚDO###

Segue modelo definido como estrutra do Plano Distrital Sanitário Indígena 2016-2019.

|Capítulo	|Conteúdo	|Número de páginas	|Observações |
|:----------|:----------|:-----------------:|:-----------|
|1. Introdução|	Explicação ao leitor do que se trata o PDSI e o que ele encontrará nesse documento. <br /> Os princípios balizadores para a elaboração do PDSI | Máximo de 1 página | Texto padrão para todos os 34 DSEIs.<br /> Deve ser produzido pela SESAI Central.|
|2. O processo de construção do PDSI 2016-2019	| Explicação do processo metodológico de construção técnica e política.<br /> Apresentação do fluxograma do processo. | Máximo de 3 páginas	|Texto padrão para todos os 34 DSEIs, com pequenas adaptações para cada DSEI (datas e quantidade de reuniões realizadas). <br />Metodologia do processo<br /> Deve ser produzido pela SESAI Central e complementado pelo Coordenador de DSEI (com informações sobre o processo do PDSI no distrito).|
|3. Caracterização do DSEI | Breve histórico | Máximo de 2 páginas | Atualizar informações sobre distrito, com base na oficina de geoinformação.<br /> Conteúdo: Relato resumido da história da população indígena, histórico da consolidação do DSEI, perfil econômico da população e etnias que compõem o território.|
|3.1. Território e população|A) Mapa 	|Mapa padrão	|Destacar a localização da sede do Distrito, dos polos-base e aspectos geográficos (rios, estradas, limites territoriais, políticos).|
||B) Dados demográficos;<br /> C) Dados fisiográficos|	Tabelas padrão	|Tabelas de caracterização do DSEI (Anexo), Dados deverão ser inseridos em formulário excel.<br />No documento formal do PDSI deverá constar um “print” desse formulário.|
|3.2 Gestão| a) Meios de transporte; <br /> b) Recursos Humanos; <br /> C) Capacidade instalada; <br /> D) Rede de serviços; <br /> E) Infraestrutura de saúde Edificações; <br /> F) Infraestrutura de saúde Saneamento |	Tabelas padrão	| Tabelas de caracterização do DSEI (Anexo), Dados deverão ser inseridos em formulário excel.|
|4. Análise Situacional|	Texto analítico com os principais **avanços** e **dificuldades** do DSEI no período |	Máximo de 2 páginas |	Oficinas realizadas com CONDISI e Conselhos locais deverão subsidiar a síntese <br /> Documento Orientativo enviado pela SESAI Central proporciona orientações para essa análise. |
|4.1. Balanço do PDSI 2012-2015| Tabelas com comparativo entre o planejado e o realizado (deverão constar apenas no anexo)	| |	Dados do planejado x realizado deverão ser inseridos em formato digital (Excel).<br /> No documento formal do PDSI deverá constar um “print” desse formulário|
|4.2. Indicadores da saúde indígena no DSEI | Situação dos indicadores do mapa estratégico selecionados para serem coletados nesta fase de elaboração do PDSI	| |	Dados dos indicadores deverão ser inseridos em formato digital (a definir o sistema de inserção/ Formulário). <br />No documento formal do PDSI deverá constar um “print” desse formulário|
|4.3. Principais desafios a serem enfrentados em 2016-2019 |	Síntese analítica dos indicadores e da caracterização do DSEI, incluindo as especificidades de cada DSEI e apontando os principais desafios a serem enfrentados no quadriênio 2016-2019 (principais desafios que o plano deverá responder)	| Máximo de 2 páginas |	Oficinas realizadas com CONDISI e Conselhos locais deverão subsidiar a síntese<br /> SESAI Central deverá fazer revisão deste texto |
|5. RESULTADOS ESPERADOS 2016-2019	| Explicação metodológica das categorias do plano e de sua conexão com o plano estratégico da SESAI.<br /> Apresentação dos Resultados Esperados, organizados por estratégia e por ano (2016 a 2019). <br /> Identificar Resultados que compõem o Plano Estratégico da SESAI como um todo e os que são específicos do DSEI.|	Máximo de 2 páginas|	Elaborado pela SESAI Central	<br />Sempre que possível, apresentar linha de base de 2014. Resultados Esperados deverão ser inseridos em formato digital (a definir o sistema/formulário). <br />No documento formal do PDSI deverá constar um “print” desse formulário |
|6. Projeção Orçamentária 2016-2019	| Explicação sobre funcionamento do orçamento <br />Números macro, por rubrica e por ano. |	Máximo de 3 páginas  | A partir de formulário enviado pela sesai central |
||Breve Explicação da distribuição orçamentária| 0,5 página|<br />SESAI CENTRAL: Explicar porque determinados itens não serão incorporados (investimento e equipamento) <br />SESAI CENTRAL: Incluir referência à portaria que detalha a distribuição orçamentária	|
|7. Anexos|	Anexo 1 – Tabelas com o planejado versus o realizado no PDSI 2011-2015	|	| | |


Diante das necessidades previstas para a aplicação do Plano Nacional de Saúde/ Plano Plurianual de 2016-2019, entende-se como vital a análise situacional dos Conselhos Locais de Saúde Indígena (CSLI) e Distritos Sanitários Especiais Indígenas (DSEI), contemplando informações acerca das respectivas condições socioeconômicas, epidemiológicas e de gestão e também, os objetivos, as diretrizes e as metas pretendidas no período, tanto em relação à atenção à saúde propriamente dita quanto à gestão SUS no âmbito correspondente.

Desta forma, recai a responsabilidade do processo sobre os respectivos Conselhos Locais de Saúde Indígena (CSLI), onde Plano Distrital de Saúde Indígena iniciará sua construção, e também, pelos Distritos Sanitários Especiais Indígenas (DSEI), através da coleta de tal família de dados, sendo descritos como:

#### APRESENTAÇÕES DSEI####
Textos analíticos e situacionais de caracter explicativo acerca dos pontos a serem levantados ou questionados à cada DSEI, informação coletada através dos próprios coordenadores de DSEI sendo posteriormente revisada pela SESAI Central de acordo com a necessidade citada abaixo, correspondem as seguintes seções do documento PDSI:

1. Introdução
	* Deve ser produzido pela SESAI Central.

2. O processo de construção do PDSI 2016-2019 
	* Texto padrão para todos os 34 DSEIs, com pequena adaptações para cada DSEI (datas e quantidade de reuniões realizadas).
	* Deve ser produzido pela SESAI Central e complementado pelo Coordenador de DSEI (com informações sobre o processo do PDSI no distrito)

3. Caracterização do DSEI - Breve histórico	
	* Relato resumido da história da população indígena, histórico da consolidação do DSEI, perfil econômico da população e etnias que compõem o território.
4. Análise Situacional	
	* Texto analítico com os principais avanços e dificuldades do DSEI no período. Documento Orientativo enviado pela SESAI Central proporciona orientações para essa análise.

	4.3 Principais desafios a serem enfrentados em 2016-2019	
    * Síntese analítica dos indicadores e da caracterização do DSEI, incluindo as especificidades de cada DSEI e apontando os principais desafios a serem enfrentados no quadriênio 2016-2019 
    * Oficinas realizadas com CONDISI e Conselhos locais deverão subsidiar a síntese
    * SESAI Central deverá fazer revisão deste texto

5. RESULTADOS ESPERADOS 2016-2019
	* Explicação metodológica das categorias do plano e de sua conexão com o plano estratégico da SESAI.
	* Elaborado pela SESAI Central
	* No documento formal do PDSI deverá constar um “print” desse formulário 

6. Projeção Orçamentária 2016-2019	Explicação sobre funcionamento do orçamento 
	* Números macro, por rubrica e por ano.	
    * A partir de formulário enviado pela sesai central
	* Breve Explicação da distribuição orçamentária	


#### CARACTERIZAÇÃO DSEI ####
Refere-se a família de dados a serem consolidados por meio da coleta no sistema, através do preenchimento dos formulários criados, ou pela consulta via interface de dados à sistemas legados. Os dados a serem coletados seguem descritos nas planilhas abaixo relacionadas.

| PLANILHA   | DESCRIÇÃO | STATUS |
| :----------- | ------- | :----:|
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


## Especificação de Requisitos ##
### Requisitos de Negócio
* **RN.01:** Definição da arquitetura e relacionamento entre os dados da coleta
	* **RN.01.01:** Consolidação da estrutura dos dados a serem coletados
	* **RN.01.02:** Análise de interface de dados com sistemas legados

* **RN.02:** Definição da estrutura e conteúdo do documento PDSI

* **RN.03:** Consolidação das regras de cálculo de indicadores

* **RN.04:** 

* **RN.05:**

__________

### Requisitos de Funcionais

* **RF.01:** Ferramenta de coleta online e consolidação em banco de dados

* **RF.02:** Ferramenta de coleta offline e posterior consolidação em banco de dados

* **RF.03:** Painel de visualização dos dados coletados com filtros por eixos de coleta e DSEI

* **RF.04:** Painel de administração da ferramenta (Cadastro e logs de manutenção de usuários + Logs de coleta de dados)

* **RF.05:** Integração dos dados coletados entre os diversos eixos (indicadores, dados demográficos, orçamento, etc.) – BI

* **RF.06:** 

* **RF.07:** Interface de dados com sistemas legados

* **RF.08:** Gerador do documento PDSI (pdf)
______________

### Requisitos do Sistema

* **RS.01:** Fontes de informação

* **RS.02:** Dados coletados / recebidos

* **RS.03:** Processamento

* **RS.04:** Apresentação dos resultados

* **RS.05:** Interface administrativa (Admin)

* **RS.06:** Usuários, permissões e perfis de acesso

* **RS.07:** Logs

Acesse o levantamento de requisitos do sistema clicando [Aqui](LevantamentoDeRequisitos.markdown)
______________

### Requisitos de Usuário

* **RU.01:** Níveis de acesso por instância e função:
    * **RU.01.01:** Instância
	* **RU.01.02:** Função
* **RU.02:** Log de manutenção de usuários

* **RU.03:** Log de usuários ativos no preenchimento da coleta de cada DSEI

* **RU.04:** A conta de usuário deve atender as seguintes especificações:
	*  **RU.04.01:**  A criação da conta de usuário deve seguir a máscara padrão proposta.
    *  **RU.04.02:**  Utilizar senha forte com no mínimo 14 caracteres combinando letras maiúsculas, minúsculas, números e caracteres especiais;
    *  **RU.04.03:**  A utilização da senha seja restrita localmente, ou seja, autenticação da conta de serviço deve ser restrita ao host/IP do Servidor;
    *  **RU.04.04:**  Deve ser disponibilizado somente os privilégios necessários à conta de usuário;
    *  **RU.04.05:**  Os canais para a autenticação e transferência de informações restritas, como usuário e senha, informações caráter pessoal devem ser criptografados;
    *  **RU.04.06:**  Não armazenar senhas, strings de conexão ou outras informações confidenciais em texto claro ou em qualquer forma criptograficamente insegura;
    *  **RU.04.07:**  A string de conexão não deve ser codificada na aplicação. A string de conexão deve ser armazenada em um arquivo de configuração separado em um sistema confiável e as informações devem ser criptografadas. Obs.: **não** utilizar o algoritmo de hash MD5.


<!--* **RU.05:**-->
Acesse o levantamento de requisitos de usuário clicando [Aqui](RequisitosDeUsuario.md)
______________

### Requisitos de Design

* **RD.01:** Layout responsivo

* **RD.02:** Navegação entre seções da coleta de dados sem restrição (seguindo referncias das planilhas e campos de coleta)

* **RD.03:** Validação de campos ainda não preenchidos

* **RD.04:** Extrato de pendências da coleta

* **RD.05:** Integração da proposta de layout e arte dos eixos dos Mapa de Indicadores
______________

#### Siglas

| Sigla | Significado |
| --- | --- |
| CONDISI | Conselho Distrital de Saúde Indígena |
| CSLI | Conselhos Locais de Saúde Indígena |
| DSEI | Distritos Sanitários Especiais Indígenas |
| SESAI | Secretaria Especial de Saúde Indígena |


