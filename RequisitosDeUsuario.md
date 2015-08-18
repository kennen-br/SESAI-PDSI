
### Requisitos de Usuário

* **RU.01:** Niveis de acesso por instância e função:
    * **RU.01.01:** Instância
		* Funcionários DSEI: Visualizam os dados acerca de seu DSEI apenas
		* Funcionarios SESAI Central: Visualizam todos os DSEI
	* **RU.01.02:**  Função
		* Usuário: Sem permissão para edição
		* Operador: Com permissão para edição
		* Administrador: Sem restrições, acesso área administrativa.

* **RU.02:** Log de manutenção de usuários

    | # | TIPOS DE EVENTOS | DETALHAMENTO DO TIPO DE EVENTO |
    |---|------------------|--------------------------------|
    |1	|Logon e logoff de usuários|	Logon e logoff de usuários que acessam a aplicação.|
    |2	|Eventos de sistema <br />(ocorrências relacionadas a administração do sistema)|	Qualquer alteração, exclusão e criação de parâmetros dentro do módulo de administração dos acessos na aplicação.|
    |3	|Gerenciamento de contas de usuários|	Qualquer alteração, exclusão e criação nas configurações do cadastro/conta de usuário.|
    |4	|Mudanças nas configurações de auditoria e logs	|Qualquer alteração, exclusão e criação nas configurações de auditoria da aplicação (se existir).|
    |5	|Transações/Operações executadas pelos usuários|	Devem ser geradas, registradas e disponibilizadas as informações das operações de acessos realizadas nas aplicações pelos usuários. Os tipos de informações que devem ser consideradas como escopo do domínio funcional são as seguintes:<br />Exemplos de operações de acessos dos usuários<br />- Concessão de acesso<br />- Revogação do acesso<br />- Bloqueio<br />- Desbloqueio<br />- Outras transações relacionadas|

* **RU.03:** Log de usuários ativos no preenchimento da coleta de cada DSEI
    | # | DADOS / INFORMAÇÕES | OBSERVAÇÕES |
    |---|---------------------|-------------|
    |	1|	Nome da Aplicação|	Nome da aplicação/sistemas acessado|
    |	2|	Login do usuário|	Login do usuário da aplicação|
    |	3|	Nome do usuário	|Nome do usuário da aplicação|
    |	4|	Data e Hora	|Data e hora início do evento.|
    |	6|	Nome do Computador (Hostname)|	Nome do computador que originou o acesso e/ou executou alguma transação/operação na aplicação.|
    |	7|	Indicação de sucesso ou falha|	Sucesso/Falha na acesso a aplicação (quando aplicável)|
    |	8|	Origem do Evento (SO, BD ou Aplicação) - Opcional	|Informar se o evento registrado tem como origem Sistema Operacional, Banco de Dados ou Aplicação.|
    |	9|	Identificação da Transação/Operação	|Identificação das operações de acesso executadas pelos usuários nas aplicações.|
    |10|	Informações Afetadas na Transação/Operação|	Registro das informações alteradas na finalização das operações.|

* **RU.04:** A conta de usuário deve atender as seguintes especificações:
	*  **RU.04.01:**  A criação da conta de usuário deve seguir o máscara padrão proposta, composta da seguinte forma:
		* Pirmeira letra representando o o nivel de acesso por função
        * Segunda letra representando a instancia do nivel de acesso
        * Sequência numerica de quatro algarismos atribuidos sistematicamente a cada inserção de usuário. 
        	Ex.:
        	*  US0001 (Usuário SESAI Central)
        	*  OD0001 (Operador DSEI)
        	*  AD0001 (Administrador)

    *   **RU.04.02:**  Utilizar senha forte com no mínimo 14 caracteres combinando letras maiúsculas, minúsculas, números e caracteres especiais;
    *   **RU.04.03:**  A utilização da senha seja restrita localmente, ou seja, autenticação da conta de serviço deve ser restrita ao host/IP do Servidor;
    *   **RU.04.04:**  Deve ser disponibilizado somentes os privilégios necessários à conta de usuário;
    *   **RU.04.05:**  Os canais para a autenticação e transferência de informações restritas, como usuário e senha, informações carater pessoal devem ser criptografados;
    *   **RU.04.06:**  Não armazenar senhas, strings de conexão ou outras informações confidenciais em texto claro ou em qualquer forma criptograficamente insegura;
    *   **RU.04.07:**  A string de conexão não deve ser codificada na aplicação. A string de conexão deve ser armazenada em um arquivo de configuração separado em um sistema confiável e as informações devem ser criptografadas. Obs.: **não** utilizar o algoritmo de hash MD5.

