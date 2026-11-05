# GABARITO — OPERAÇÃO MOLHO SOMBRIO (INDIVIDUAL)

**Preparação:** executar `Script-EMPRESA.sql` do banco original e depois `06_PREPARACAO_MISTERIO_INDIVIDUAL_V2.sql`.

## Missão 1 (1 ponto)
```sql
SELECT CodProd, Descr
FROM Produtos
WHERE Descr LIKE '%Molho%';
```
**Resposta:** cinco molhos: Molho de Pimenta 150ml (CodProd 9), Molho de Tomate Tradicional 340g, Molho de Tomate Picante 340g, Molho Barbecue 250ml e Molho de Alho 200ml. Os quatro códigos novos dependem do banco e são atribuídos automaticamente. **Nenhum dos cinco deve ser apontado como adulterado nesta missão**.

## Missão 2 (2 pontos)
```sql
SELECT CodLote, CodProd, Setor, InicioProducao, FimProducao
FROM LotesInvestigados
WHERE ResultadoAnalise = 'Adulterado';
```
**Resposta:** a análise aponta **um único lote adulterado**, o 502, do produto 9 (Molho de Pimenta 150ml), setor Envase, em 06/02/2024 das 20h30 às 21h00. Os outros lotes, inclusive dos demais molhos, estão aprovados. É somente aqui que o produto correto é revelado.

## Missão 3 (2 pontos)
```sql
SELECT CodFun, Entrada, Saida
FROM AcessosFabrica
WHERE Setor = 'Envase'
  AND Entrada BETWEEN '2024-02-06T20:00:00' AND '2024-02-06T22:00:00'
ORDER BY Entrada;
```
**Resposta:** funcionários 9 (20h10), 3 (20h40), 4 (21h05), 11 (21h15). Quatro registros.

## Missão 4 (2 pontos)
```sql
SELECT CodFun, Entrada, Saida
FROM AcessosFabrica
WHERE Setor = 'Envase'
  AND Entrada BETWEEN '2024-02-06T20:30:00' AND '2024-02-06T21:00:00';
```
**Resposta:** funcionário 3, entrada 20h40, saída 20h52.



## Missão 5 (2 pontos)
```sql
SELECT F.Nome, F.Sobrenome, F.Cargo, A.Entrada
FROM AcessosFabrica A
INNER JOIN Funcionarios F ON A.CodFun = F.CodFun
WHERE A.Setor = 'Envase'
  AND A.Entrada BETWEEN '2024-02-06T20:30:00' AND '2024-02-06T21:00:00';
```
**Resposta prevista para a versão do `EmpresaBrasil` usada na elaboração:** José Oliveira, estoquista, entrada às 20h40. Se o banco original for de outra versão, valide o nome pelo `CodFun = 3`.



