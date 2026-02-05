# 📦 Projeto Banco de Dados E-commerce

Este repositório contém a implementação de um banco de dados relacional para um sistema de **e-commerce**, desenvolvido como parte de um desafio de modelagem lógica e consulta SQL.

O projeto contempla a criação do esquema, inserção de dados para testes e elaboração de consultas SQL avançadas.

---

## 🎯 Objetivo do Projeto

O objetivo é aplicar conceitos de:

* Modelagem lógica de banco de dados
* Definição de chaves primárias e estrangeiras
* Aplicação de constraints
* Mapeamento de modelo EER
* Normalização de dados
* Elaboração de consultas SQL

Além disso, o modelo foi refinado para contemplar:

* Cliente Pessoa Física (PF) ou Pessoa Jurídica (PJ)
* Múltiplas formas de pagamento por cliente
* Controle de entregas com status e rastreio
* Relacionamento entre produtos, fornecedores, vendedores e estoque

---

## 🗂️ Estrutura do Repositório

O projeto está organizado nos seguintes arquivos:

```
📁 ecommerce_database.sql   → Criação do banco e das tabelas
📁 ecommerce_values.sql     → Inserção de dados para testes
📁 ecommerce_query.sql      → Consultas SQL
```

---

## 🧱 Modelagem do Banco de Dados

O banco de dados possui as seguintes entidades principais:

* **Client**: Cadastro de clientes (PF ou PJ)
* **Person / Company**: Especializações de cliente
* **Product**: Produtos disponíveis
* **Orders**: Pedidos realizados
* **Payments**: Formas de pagamento
* **Delivery**: Entregas e rastreio
* **Supplier**: Fornecedores
* **Seller**: Vendedores
* **ProductStorage**: Estoque
* **Tabelas associativas**: Relacionamentos N:N

### Especialização PF e PJ

O cliente pode ser:

* Pessoa Física → Tabela `person`
* Pessoa Jurídica → Tabela `company`

Cada cliente pertence a apenas um dos tipos.

---

## ⚙️ Como Executar o Projeto

### 1️⃣ Criar o Banco e as Tabelas

Execute o arquivo:

```sql
ecommerce_database.sql
```

Este script cria o banco `ecommerce` e todas as tabelas com suas constraints.

---

### 2️⃣ Inserir os Dados

Execute o arquivo:

```sql
ecommerce_values.sql
```

Este script insere dados fictícios para testes.

---

### 3️⃣ Executar as Consultas

Execute o arquivo:

```sql
ecommerce_query.sql
```

Este arquivo contém consultas para análise e validação dos dados.

---

## 📊 Consultas Implementadas

As queries contemplam os seguintes requisitos:

✅ SELECT simples

✅ Filtros com WHERE

✅ Atributos derivados (expressões e CASE)

✅ ORDER BY

✅ GROUP BY com HAVING

✅ JOINs entre múltiplas tabelas

✅ Subqueries

### Exemplos de Perguntas Respondidas

* Quantos pedidos cada cliente realizou?
* Algum vendedor também é fornecedor?
* Qual a relação entre produtos, fornecedores e estoque?
* Quais são os produtos mais vendidos?
* Qual o status das entregas?
* Qual a média de avaliação por categoria?

---

## 📈 Indicadores Gerados

O projeto inclui consultas para geração de KPIs, como:

* Total de clientes
* Total de produtos
* Total de pedidos
* Pedidos confirmados
* Avaliação média geral
* Ranking de produtos
* Distribuição de entregas

---

## 🛠️ Tecnologias Utilizadas

* MySQL / MariaDB
* SQL padrão
* GitHub para versionamento

---

## 📌 Requisitos Atendidos

✔ Modelagem lógica

✔ Chaves primárias e estrangeiras

✔ Constraints

✔ Especialização (PF / PJ)

✔ Múltiplos pagamentos

✔ Entregas com rastreio

✔ Persistência de dados

✔ Consultas complexas

✔ Documentação no README

---

## 👨‍💻 Autor

Projeto desenvolvido para fins acadêmicos, com foco em prática de banco de dados relacional e SQL.

---

## 📄 Licença

Este projeto é de uso educacional.

Sinta-se à vontade para estudar, adaptar e evoluir a implementação.

