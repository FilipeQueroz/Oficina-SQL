# OPERAÇÃO MOLHO SOMBRIO — CASO 006
## Oficina SQL Essencial — Aula 6 | Investigação individual

**Dificuldade:** intermediário leve  
**Duração sugerida:** 30–40 minutos  
**Formato:** individual  
**Ferramenta:** SQL Server (SSMS)  
**Banco:** `EmpresaBrasil`

> **CASO FICTÍCIO — ALERTA SANITÁRIO**  
> Após casos graves de intoxicação, a vigilância sanitária suspeita de um dos vários molhos vendidos pela EmpresaBrasil. Os resultados das análises laboratoriais estão no banco de dados, mas ninguém sabe ainda qual produto e qual lote falharam. Sua missão como investigador(a) é consultar o banco de dados, descobrir o lote envolvido e identificar qual funcionário deve ser ouvido primeiro.

## Preparação (feita pelo instrutor)

O instrutor executará o banco original `EmpresaBrasil` e o script complementar `06_PREPARACAO_MISTERIO_INDIVIDUAL_V2.sql`. Não é preciso criar tabelas nem inserir dados.

**Tabelas que você poderá usar:**

| Tabela | Colunas importantes |
|---|---|
| `Produtos` | `CodProd`, `Descr` |
| `LotesInvestigados` | `CodLote`, `CodProd`, `ResultadoAnalise`, `Setor`, `InicioProducao`, `FimProducao` |
| `AcessosFabrica` | `CodFun`, `Setor`, `Entrada`, `Saida` |
| `Funcionarios` | `CodFun`, `Nome`, `Sobrenome`, `Cargo` |

**Regras:** use somente `SELECT` nas missões. Salve as consultas e escreva a resposta encontrada em cada uma. Não use `UPDATE`, `DELETE` ou `INSERT`.

---

### Missão 1 — Quais molhos podem estar envolvidos? (1 ponto)

A denúncia menciona apenas que o alimento era um molho. A empresa comercializa **vários tipos de molho**. Pesquise todos os produtos cuja descrição contenha **Molho**. Nesta etapa, **não é possível dizer qual deles foi adulterado**.

**Mostre:** `CodProd` e `Descr`.

*Ajuda:* para pesquisar uma palavra que aparece no meio de um texto, você já conhece o `LIKE`.

### Missão 2 — O resultado do laboratório (2 pontos)

A análise laboratorial acaba de chegar! O laboratório testou lotes de diferentes molhos e registrou os resultados na tabela `LotesInvestigados`. **Somente um lote** teve o resultado **Adulterado**. Localize-o.

**Mostre:** `CodLote`, `CodProd`, `Setor`, `InicioProducao` e `FimProducao`.

**Anote:** o código do produto, o número do lote e o horário de produção. Agora, compare o `CodProd` com os produtos encontrados na Missão 1 para descobrir **qual molho foi adulterado**.

### Missão 3 — Quem entrou no setor? (2 pontos)

O lote suspeito foi produzido em **06/02/2024**, entre **20h30 e 21h00**, no setor **Envase**. Antes de apontar suspeitos, veja quem entrou nesse setor entre **20h00 e 22h00** do mesmo dia.

**Mostre:** `CodFun`, `Entrada` e `Saida`, em ordem de entrada.

*Ajuda:* use `WHERE` com `AND` e `BETWEEN`, e depois `ORDER BY`.

### Missão 4 — Quem entrou durante a produção? (2 pontos)

Agora restrinja a consulta anterior: procure os registros do setor **Envase** em que a **entrada** ocorreu entre **20h30 e 21h00 de 06/02/2024**.

**Mostre:** `CodFun`, `Entrada` e `Saida`.

**Anote:** o código do funcionário encontrado.

*Ajuda:* você pode adaptar a consulta da Missão 3, mudando apenas o intervalo de horários.

### Missão 5 — Qual é o nome do funcionário? (2 pontos)

O registro mostra um código, mas a investigação precisa de um nome. Relacione as tabelas `AcessosFabrica` e `Funcionarios` para identificar quem aparece na Missão 4.

**Mostre:** `Nome`, `Sobrenome`, `Cargo` e `Entrada`.

**Pista para o JOIN:** ambas as tabelas possuem `CodFun`.

```sql
SELECT F.Nome, F.Sobrenome, F.Cargo, A.Entrada
FROM AcessosFabrica A
INNER JOIN Funcionarios F ON A.CodFun = F.CodFun
WHERE ...;
```

Complete o `WHERE` para selecionar o setor e o período da Missão 4.

### Missão 6 — Seu relatório final (1 ponto)

Responda com base nos resultados das consultas:

1. Qual produto e lote foram envolvidos?
2. Qual funcionário deve ser ouvido primeiro?
3. Que registro de horário justifica essa escolha?

**Importante:** estar no setor durante a produção é motivo para investigar, mas **não é prova de culpa**.

---

### Bônus opcional — Quantos acessos? (+1 ponto)

Use `COUNT` e `GROUP BY` para descobrir quantos acessos **cada código de funcionário** possui na tabela `AcessosFabrica`, considerando todos os registros.

**Mostre:** `CodFun` e a quantidade, ordenando da maior para a menor.

---

## Entrega

Entregue um arquivo `.sql` contendo as consultas das Missões 1 a 5, acompanhado das respostas e do pequeno relatório da Missão 6. O bônus é opcional.

**Pontuação:** 10 pontos + 1 ponto bônus.
