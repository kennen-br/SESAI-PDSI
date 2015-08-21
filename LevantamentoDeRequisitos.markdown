# Coleta

## Fontes de informação

* Muitos dados serão coletados em campo. Outros serão importados de sistemas ou bancos de dados existentes.
* Os dados serão coletados a nível de **Polo Base**
* **ATENÇÃO**: Os dados de DSEIs e Polos Base serão fornecidos

### Coleta online

Esta coleta se dá por meio de um formulário web, acessado pelo navegador, salvando os dados diretamente na base de dados

### Coleta offline

Esta coleta se dá por meios diversos, porém sua interface com o banco de dados é via upload de arquivo .csv.

### Importação de dados de outros sistemas

Estes dados serão importados de outros sistemas.

* Um problema a ser considerado é manter os dados importatos consistentes com os novos dados criados.
  * Uma possivel solução é consolidar dados em uma base própria, 1x por dia (ou outro período)

## Dados coletados / recebidos

* Os dados poderão ser valores absolutos ou textos informativos. Arquivos de imagens podem ser incluídos no resultado final.

[Mais informações sobre os tipos de dados coletados podem ser obtidas clicando aqui](DadosColetados.markdown)

### Textos informativos

* Os textos informativos são os textos que compõe o relatório final.
  * Estes textos se referem, normalmente, à história, população, idiomas etc. do DSEI.
  * Os textos informativos serão coletados via interface do sistema
  * Os textos informativos serão coletados por meio de campo WYSIWYG

### Dados absolutos

* Os dados absolutos serão coletados por diversas [fontes de informações](#fontes-de-informação)
* Será informado, para cada dado absoluto necessário a sua origem, caso exista em algum dos sistemas.
* Alguns dados coletados possuem informações adicionais, referentes exclusivamente ao dado
  * Um exemplo, na planilha de custeio, são as justificativas, critérios e distribuição informados para cada item preenchido.

# Processamento

## Indicadores

* Os indicadores são gerados a partir de dados absolutos
* Os indicadores podem se referir ao nível de Polo Base ou DSEI.
  * Caso seja referente ao DSEI, será composto pelos dados absolutos de todos os polos base do DSEI
* Para geração de indicadores, é utilizada uma fórmula. Esta fórmula utiliza operadores sobre dados absolutos.
* Os indicadores possuem classificações de acordo com o resultado da fórmula.

Mais informações sobre cada uma das listagens de indicadores, em cada uma das planilhas, pode ser obtida [Aqui](DadosColetados.markdown)

# Apresentação dos resultados

* O produto final será um relatório em PDF, com informações computadas a partir dos dados calculados, alguns textos informados via interface gráfica, mapas (ou em imagem ou em pdf).

# Interface administrativa (Admin)

* CRUD Indicadores
* CRUD Localidades (DSEI, Polo Base, Aldeia, Tribo)
* Associar indicadores com entidade adequada (Tribo, Aldeia etc.)
* CRUD Usuário
 * Exclusão lógica devido aos logs e históricos
 * Associar permissões
* Visualizar logs (Nunca poderão ser alterados, apenas consultados)

## Usuários, permissões e perfis de acesso
* Usuários possuem diversos perfis de acesso.
 * Cada perfil de acesso possui uma coleção de permissões no sistema
 * Um usuário pertencerá a apenas um perfil de acesso (???)
* Os usuários que possuírem permissão, poderão criar usuários.
* Os usuários que possuírem permissão, poderão atribuir e/ou revogar privilégios a outros usuários.
* O usuário deverá pertencer a um nível de acesso
* O usuário deverá estar relacionado com uma localização (Polo, DSEI etc.)

## Logs
* Será mantido log de todas as operações de inserção, alteração e exclusão realizadas no banco de dados.
