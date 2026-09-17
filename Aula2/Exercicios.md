# Oficina SQL Essencial - Lista de Exercícios

## Aulas 1 e 2 - SQL Server

**Banco de dados:** `EmpresaBrasil`  
**Objetivo:** praticar consultas e filtros usando apenas os conteúdos apresentados nas duas primeiras aulas.

### Conteúdos utilizados

- `SELECT` e `FROM`;
- seleção de colunas e uso de `*`;
- alias com `AS`;
- operadores aritméticos: `+`, `-`, `*`, `/` e `%`;
- operadores relacionais: `=`, `<>`, `>`, `<`, `>=` e `<=`;
- filtros com `WHERE`;
- operadores lógicos: `AND`, `OR` e `NOT`;
- operadores auxiliares: `BETWEEN`, `IN`, `LIKE` e `IS NULL`;
- `DISTINCT`, `TOP` e `ORDER BY`.

> Execute antes o arquivo `Script-EMPRESA.sql`. Todos os exercícios são somente de consulta: não altere os dados do banco.

---

## Nível 1 - Fundamentos

### 1. Conhecendo os clientes

Exiba todos os dados de todos os registros da tabela `Clientes`.

**Resultado esperado:** todas as colunas da tabela.

### 2. Selecionando colunas

Exiba apenas o nome, a cidade e a região de todos os clientes.

**Colunas esperadas:** `Nome`, `Cidade` e `Regiao`.

### 3. Produtos de baixo preço

Mostre a descrição e o preço dos produtos que custam menos de R$ 10,00.

**Colunas esperadas:** `Descr` e `Preco`.

### 4. Funcionários com maior salário

Liste o nome, o cargo e o salário dos funcionários que recebem R$ 3.000,00 ou mais.

**Colunas esperadas:** `Nome`, `Cargo` e `Salario`.

### 5. Cliente de uma cidade específica

Mostre todos os dados dos clientes que moram na cidade de `Marabá`.

---

## Nível 2 - Combinando recursos

### 6. Departamentos sem repetição

Liste os departamentos existentes na tabela `Funcionarios`, sem valores repetidos e em ordem alfabética.

**Coluna esperada:** `Departamento`.

### 7. Os cinco produtos mais caros

Mostre apenas os cinco produtos com os maiores preços. Exiba a descrição e o preço, do mais caro para o mais barato.

**Colunas esperadas:** `Descr` e `Preco`.

### 8. Financeiro ou Recursos Humanos

Liste o nome, o departamento e o salário dos funcionários que trabalham no departamento `Financeiro` ou no departamento `RH`. Ordene do maior salário para o menor.

### 9. Faixa de preço e quantidade em estoque

Mostre os produtos cujo preço esteja entre R$ 5,00 e R$ 15,00, inclusive, e que tenham pelo menos 60 unidades em estoque.

**Colunas esperadas:** `Descr`, `Preco` e `Unidades`.

### 10. Clientes de três estados

Liste o nome, a cidade e a região dos clientes que pertencem a `SP`, `MG` ou `RJ`. Ordene primeiro pela região e depois pelo nome.


