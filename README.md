# PDSI Generator

## Instalação

OBS: Use o Vagrant, com ubuntu 14/04. Rode o postinstall.sh como provisioning.
Todos os passos serão realizados dentro do diretório do projeto, dentro do vagrant.

### Ajustando o RVM
```
rvm install 2.2.0
rvm use 2.2.0 --default
```
### Instalar banco de dados Postgree manualmente
```
sudo apt-get install postgresql-9.3 postgresql-client postgresql-contrib libpq-dev
```
Para checar se o banco de dados esta instalado corretamente
```
aptitude search postgresql |grep ^i
```
Verificar se versão compativel: Postgree 9.3

### Instalando as dependências do projeto
```
sudo apt-get install nodejs npm libxml2-dev libxslt1-dev
gem install nokogiri -v '1.6.6.2' -- --use-system-libraries
bundle install
```

### Criar banco de dados manualmente
```
psql -h localhost -U desenv sesai_pdsi
```
Senha: rapadura
Caso não funcionar, tem que rodar manualmente as 3 últimas linhas do postinstall.sh

```
sudo su - postgres -c "echo \"CREATE USER desenv WITH SUPERUSER CREATEDB CREATEROLE ENCRYPTED PASSWORD 'rapadura';\" |psql -U postgres -d postgres" vagrant
sudo su - postgres -c "echo \"CREATE DATABASE sesai_pdsi;\" |psql -U postgres -d postgres" vagrant
sudo su - postgres -c "echo \"GRANT ALL PRIVILEGES ON DATABASE sesai_pdsi TO desenv;\" |psql -U postgres -d postgres" vagrant
```

### Configurando / inicializando o banco de dados

Edite o arquivo config/database.yml (crie se não existir) com o conteúdo de acordo
com o config/database.yml.sample. Utilize o usuário root e a senha rapadura.

```
rake db:create
rake db:migrate
rake db:seed
```

Copie os arquivos samples de configuração **usando root** e reinicie o server postgresql:

```
sudo cp samples/postgresql.conf /etc/postgresql/9.3/main/
sudo cp samples/pg_hba.conf /etc/postgresql/9.3/main/
sudo service postgresql restart
```

### Rodando a aplicação localmente

```
rails server -b 0.0.0.0
```

e agora acesse seu navegador em http://localhost:3000


# Deploy ambiente Desenvolvimento (dese.knn)

## Heroku
```
git push heroku rc:master
```

### Comandos Heroku
```
git push heroku rc:master
heroku run rails console
heroku run bash
```

##DigitalOcean
### Comandos DigitalOcean
```
mina development deploy
```

## Misc
### Parar o sevidor
```
mina development stop
```

### Restart o servidor
```
mina development restart
```

### Recriar o banco de dados e popular novamente
```
mina development purge
```

### Dump do banco
```
rake db:dump
```

### Restore do banco
```
rake db:restore
```

# Documentação

* [Especificação do projeto](doc/README.markdown)
* [Dados que serão coletados e suas origens](doc/DadosColetados.markdown)
* [Requisitos relacionados aos usuários](doc/RequisitosDeUsuario.markdown)

## Gerando documentação do projeto

Gera o ERD do modelo do banco de dados, baseado nos models e seus relacionamentos
```
rake erd
```

Gera o diagrama de classes
```
rake diagram:all
```
