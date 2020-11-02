# technical_alive_test_ruby
Aplicação Ruby on Rails que insere produtos no inventário de um cliente, atráves de um arquivo CSV e permite a filtragem dos produtos.

## Solution
Para resolver a tarefa criei uma view onde somente será feito o upload de arquivos .csv de formato válido, com dados dos produtos de um usuário.

Após o upload do arquivo se possuir um formato inválido, será exibido uma mensagem de erro para o usuário. Para um formato válido, as duas classes de serviço Inventory::Read e Inventory::Storage irão ler e guardar, respectivamente, os dados do arquivo e o usuário será redirecionado para a página do inventário, com uma mensagem de sucesso.

Nesta página de inventário ele poderá filtrar por fabricante, modelo e tipo de plano.

## Observações
Eu testei os models, rotas, services, e telas. Também, criei factories para os testes.

Utilizei o ActiveStorage para fazer o uploads dos arquivos e o Stimulus para filtrar os dados na página do inventário.

## Tasks checklist

    - [x] O usuário fará upload de um arquivo .csv no formato fornecido em input_valid através de um formulário;

    - [x] Os dados contidos no arquivo serão normalizados e salvos em um banco de dados relacional;

    - [x] O usuário será redirecionado para a página com o inventário, que indicará o sucesso ou falha da importação (preferencialmente com o motivo, no caso de falha);

    - [x] O usuário poderá visualizar os dados importados e buscá-los por fabricante, modelo e modalidade de venda (pré ou pós-pago).

## Project Requirements
- Ruby 2.7.0
- Rails 6.0.3

## Project Gems

### Code Quality
- rubocop

### Testing and Validations
- active_storage_validations
- capybara
- database_cleaner-active_record
- factory-bot-rails
- faker
- guard-rspec
- rspec-rails
- shoulda-matchers

### Reader spreadsheets (CSV)
- roo

### Bulk inserting data
- activerecord-import

### CSS Framework
- Bulma

### Javascript Framework
- Stimulus

## Running Project
Para iniciar a aplicação, você deve usar o seguinte comando:

```console
user@matrix:~$ rails s
```
A aplicação pode ser acessada em http://localhost:3000/

## Melhorias Futuras
Poderia ter sido criado um background job para o processamento dos arquivos, permitindo ao usuário manipular o sistema enquanto os arquivos estavam sendo processados.