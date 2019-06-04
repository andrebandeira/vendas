-----------------------------
Instruções

Clonar o projeto: 
- git clone git@github.com:andrebandeira/vendas.git

Registrar no Hosts (/etc/hosts):
- 127.0.0.1   local.api.com.br
- 127.0.0.1   local.app.com.br

Executar o container docker:
- cd vendas
- docker-compose up

Cria o banco de dados:

Acessar o phpadmim
- http://127.0.0.1:5050/
- usuario: postgres
- senha: 123mudar

Registrar o server:
- host name/address: db

Criar o Banco de Dados:
- nome: vendas

Restaurar o dump:
- docker exec -i db psql -U postgres -d vendas < "backup.sql"
(Caso não funcione na pasta vendas/Projetos/BD tem um script de criaçao das tabelas (criacaoBD.sql))

Agendar serviço email:
- docker exec -it php bash
- service cron start
- Foi configurado para enviar o e-mail todos os dias as 20:20. A hora pode ser alterada acessando o container e executando o seguinte comando: pico /etc/crontab. Você irá acessar o arquivo de configuração do cron.

-----------------------------
Funcionalidade Implementadas

- Autenticação por API Token (Adicional)
- Cadastro de Vendedor (Requisito)
- Atualização de Vendedor (Adicional)
- Exclusão de Vendedor (Adicional)
- Busca de Vendedor (Adicional)
- Listagem de Todos Vendedores (Requisito)
- Lançamento de Venda (Requisito)
- Atualização de Venda (Adicional)
- Exclusão de Venda (Adicional)
- Busca de Venda (Adicional)
- Listagem de Todas Vendas (Adicional)
- Listagem de Todas Vendas de um Vendedor (Requisito)
- Envio de Relatório Diário (Requisito)
- Busca de Email para Envio do Relatório (Adicional)
- Atualização de Email para Envio do Relatório (Adicional)
- Dashboard (Adicional)

-----------------------------
Observações

- Na pasta vendas/Projetos tem uma collection do Postman com exemplo de requisições para a API.
- Na pasta vendas/Projetos/BD tem a modelagem do banco de dados.
- Na pasta vendas/Projetos/prints estão os prints das funcionalidade implementadas.


