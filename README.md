# PDSI Generator

## Instalação

OBS: Use o Vagrant, com ubuntu 14/04. Rode o postinstall.sh como provisioning.
Todos os passos serão realizados dentro do diretório do projeto, dentro do vagrant.

### Ajustando o RVM
```
$ rvm install 2.2.0
$ rvm use 2.2.0 --default
```
### Instalando pg 0.'8.2 (libpq-fe.h)

```
$ sudo aptitude install libpq-dev
```

### Instalando as dependências do projeto
```
$ bundle install
```
### Criar banco de dados manualmente
```
psql -h localhost -U desenv sesai_pdsi
```
Senha: rapadura
Caso não funcionar, tem que rodar manualmente as 3 últimas linhas do postinstall.sh

### Configurando / inicializando o banco de dados

Edite o arquivo config/database.yml (crie se não existir) com o conteúdo de acordo
com o config/database.yml.sample. Utilize o usuário root e a senha rapadura.

```
$ rake db:create
$ rake db:migrate
$ rake db:seed
```

Copie os arquivos samples de configuração **usando root** e reinicie o server postgresql:

```
$ sudo cp samples/postgresql.conf /etc/postgresql/9.3/main/
$ sudo cp samples/pg_hba.conf /etc/postgresql/9.3/main/
$ sudo service postgresql restart
```

### Rodando a aplicação localmente

```
$ rails server -b 0.0.0.0
```

e agora acesse seu navegador em http://localhost:3000

### Caso de erro em ExecJS Instalação NodeJS
```
sudo apt-get install nodejs npm
```


# Deploy

```
$ git push heroku rc:master
```

## Comandos heroku
```
$  git push heroku rc:master
$  heroku run rails console
$  heroku run bash
```

# Documentação

* [Especificação do projeto](doc/README.markdown)
* [Dados que serão coletados e suas origens](doc/DadosColetados.markdown)
* [Requisitos relacionados aos usuários](doc/RequisitosDeUsuario.markdown)

## Gerando documentação do projeto

Gera o ERD do modelo do banco de dados, baseado nos models e seus relacionamentos
```
$ rake erd
```

Gera o diagrama de classes
```
$ rake diagram:all
```
