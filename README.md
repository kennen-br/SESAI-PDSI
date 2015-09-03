# PDSI Generator

## Instalação

OBS: Use o Vagrant, com ubuntu 14/04. Rode o postinstall.sh como provisioning.
Todos os passos serão realizados dentro do diretório do projeto, dentro do vagrant.

### Ajustando o RVM
```
$ rvm install 2.2.0
$ rvm use 2.2.0 --default
```

### Instalando as dependências do projeto

```
$ bundle install
```

### Configurando / inicializando o banco de dados

Edite o arquivo config/database.yml (crie se não existir) com o conteúdo de acordo
com o config/database.yml.sample. Utilize o usuário root e a senha rapadura.

```
$ rake db:create
$ rake db:migrate
$ rake db:seed
```

### Rodando a aplicação localmente

```
$ rails server -b 0.0.0.0
```

e agora acesse seu navegador em http://localhost:3000

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
