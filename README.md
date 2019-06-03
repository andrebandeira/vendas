Clonar o projeto: 
	- git clone git@github.com:andrebandeira/vendas.git

Registrar no Hosts (/etc/hosts):
	- 127.0.0.1   local.api.com.br
	- 127.0.0.1   local.app.com.br

Executar o container docker:
	- cd vendas
	- docker-compose up

Cria o banco de dados:
	- acessar o phpadmim
		- http://127.0.0.1:5050/
			- usuario: postgres
			- senha: 123mudar
	- registra o server:
		- host name/address: db
	- create database:
		- nome: vendas
	- restore dump:
		- docker exec -i db psql -U postgres -d vendas < backup.sql

Agendar serviço email:
	- docker exec -it php bash
	- service cron start
	- Foi configurado para enviar o email todos os dias as 20:20. A hora pode ser alterada acessando o container e executando o seguinte comando: pico /etc/crontab. Você irá acessar o arquivo de configuração do cron.
