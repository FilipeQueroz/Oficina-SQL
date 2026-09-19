# Oficina SQL Essencial - Gabarito do Professor

## Aulas 1 e 2 - SQL Server

As respostas abaixo são soluções de referência. Uma consulta escrita de outra forma também pode estar correta se produzir o resultado solicitado.

### 1. Conhecendo os clientes

```sql
SELECT *
FROM Clientes;
```

### 2. Selecionando colunas

```sql
SELECT Nome, Cidade, Regiao
FROM Clientes;
```

### 3. Produtos de baixo preço

```sql
SELECT Descr, Preco
FROM Produtos
WHERE Preco < 10;
```

### 4. Funcionários com maior salário

```sql
SELECT Nome, Cargo, Salario
FROM Funcionarios
WHERE Salario >= 3000;
```

### 5. Cliente de uma cidade específica

```sql
SELECT *
FROM Clientes
WHERE Cidade = 'Marabá';
```

### 6. Departamentos sem repetição

```sql
SELECT DISTINCT Departamento
FROM Funcionarios
ORDER BY Departamento ASC;
```

### 7. Os cinco produtos mais caros

```sql
SELECT TOP 5 Descr, Preco
FROM Produtos
ORDER BY Preco DESC;
```

### 8. Financeiro ou Recursos Humanos

```sql
SELECT Nome, Departamento, Salario
FROM Funcionarios
WHERE Departamento = 'Financeiro'
   OR Departamento = 'RH'
ORDER BY Salario DESC;
```

### 9. Faixa de preço e quantidade em estoque

```sql
SELECT Descr, Preco, Unidades
FROM Produtos
WHERE Preco BETWEEN 5 AND 15
  AND Unidades >= 60;
```

### 10. Clientes de três estados

```sql
SELECT Nome, Cidade, Regiao
FROM Clientes
WHERE Regiao IN ('SP', 'MG', 'RJ')
ORDER BY Regiao ASC, Nome ASC;
```


---

## Conteúdos propositalmente não utilizados

Esta lista não cobra `JOIN`, funções de agregação, `GROUP BY`, `HAVING`, subconsultas, `INSERT`, `UPDATE` ou `DELETE`, pois esses assuntos pertencem às aulas seguintes do cronograma.

