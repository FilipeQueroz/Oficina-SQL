USE EmpresaBrasil;
GO

-- CASO FICTICIO: complemento para a Aula 6.
-- Execute APOS Script-EMPRESA.sql. Preserva os produtos originais.
-- Adiciona quatro molhos e duas tabelas para a investigacao.

IF OBJECT_ID('dbo.AcessosFabrica', 'U') IS NOT NULL DROP TABLE dbo.AcessosFabrica;
IF OBJECT_ID('dbo.LotesInvestigados', 'U') IS NOT NULL DROP TABLE dbo.LotesInvestigados;
GO

-- Evita duplicar os molhos ao executar novamente este complemento.
INSERT INTO Produtos (Descr, CodFor, CodCategoria, Preco, Unidades, UnidadesMedida, Descontinuado)
SELECT 'Molho de Tomate Tradicional 340g', 2, 2, 5.90, 120, 'un', 0
WHERE NOT EXISTS (SELECT 1 FROM Produtos WHERE Descr = 'Molho de Tomate Tradicional 340g');

INSERT INTO Produtos (Descr, CodFor, CodCategoria, Preco, Unidades, UnidadesMedida, Descontinuado)
SELECT 'Molho de Tomate Picante 340g', 2, 2, 6.40, 85, 'un', 0
WHERE NOT EXISTS (SELECT 1 FROM Produtos WHERE Descr = 'Molho de Tomate Picante 340g');

INSERT INTO Produtos (Descr, CodFor, CodCategoria, Preco, Unidades, UnidadesMedida, Descontinuado)
SELECT 'Molho Barbecue 250ml', 1, 2, 10.50, 70, 'un', 0
WHERE NOT EXISTS (SELECT 1 FROM Produtos WHERE Descr = 'Molho Barbecue 250ml');

INSERT INTO Produtos (Descr, CodFor, CodCategoria, Preco, Unidades, UnidadesMedida, Descontinuado)
SELECT 'Molho de Alho 200ml', 2, 2, 7.20, 95, 'un', 0
WHERE NOT EXISTS (SELECT 1 FROM Produtos WHERE Descr = 'Molho de Alho 200ml');
GO

CREATE TABLE LotesInvestigados (
    CodLote INT PRIMARY KEY,
    CodProd INT NOT NULL,
    DataProducao DATE NOT NULL,
    InicioProducao DATETIME NOT NULL,
    FimProducao DATETIME NOT NULL,
    Setor VARCHAR(30) NOT NULL,
    ResultadoAnalise VARCHAR(20) NOT NULL,
    FOREIGN KEY (CodProd) REFERENCES Produtos(CodProd)
);
GO

CREATE TABLE AcessosFabrica (
    CodAcesso INT PRIMARY KEY,
    CodFun INT NOT NULL,
    Setor VARCHAR(30) NOT NULL,
    Entrada DATETIME NOT NULL,
    Saida DATETIME NOT NULL,
    FOREIGN KEY (CodFun) REFERENCES Funcionarios(CodFun)
);
GO

-- Varios molhos com testes: somente UM lote tem resultado 'Adulterado'.
-- CodProd e localizado pela descricao, sem depender de IDs novos fixos.
INSERT INTO LotesInvestigados
(CodLote, CodProd, DataProducao, InicioProducao, FimProducao, Setor, ResultadoAnalise)
SELECT V.CodLote, P.CodProd, V.DataProducao, V.InicioProducao,
       V.FimProducao, V.Setor, V.ResultadoAnalise
FROM (VALUES
 (501, 'Molho de Pimenta 150ml',           CONVERT(DATE,'2024-02-05'), CONVERT(DATETIME,'2024-02-05T19:00:00'), CONVERT(DATETIME,'2024-02-05T20:00:00'), 'Envase', 'Aprovado'),
 (502, 'Molho de Pimenta 150ml',           CONVERT(DATE,'2024-02-06'), CONVERT(DATETIME,'2024-02-06T20:30:00'), CONVERT(DATETIME,'2024-02-06T21:00:00'), 'Envase', 'Adulterado'),
 (503, 'Molho de Pimenta 150ml',           CONVERT(DATE,'2024-02-07'), CONVERT(DATETIME,'2024-02-07T19:00:00'), CONVERT(DATETIME,'2024-02-07T20:00:00'), 'Envase', 'Aprovado'),
 (504, 'Molho de Tomate Tradicional 340g', CONVERT(DATE,'2024-02-06'), CONVERT(DATETIME,'2024-02-06T18:00:00'), CONVERT(DATETIME,'2024-02-06T18:45:00'), 'Envase', 'Aprovado'),
 (505, 'Molho de Tomate Picante 340g',     CONVERT(DATE,'2024-02-06'), CONVERT(DATETIME,'2024-02-06T19:00:00'), CONVERT(DATETIME,'2024-02-06T19:45:00'), 'Envase', 'Aprovado'),
 (506, 'Molho Barbecue 250ml',            CONVERT(DATE,'2024-02-06'), CONVERT(DATETIME,'2024-02-06T17:00:00'), CONVERT(DATETIME,'2024-02-06T17:45:00'), 'Envase', 'Aprovado'),
 (507, 'Molho de Alho 200ml',             CONVERT(DATE,'2024-02-07'), CONVERT(DATETIME,'2024-02-07T18:00:00'), CONVERT(DATETIME,'2024-02-07T18:40:00'), 'Envase', 'Aprovado')
) AS V(CodLote, Descr, DataProducao, InicioProducao, FimProducao, Setor, ResultadoAnalise)
INNER JOIN Produtos P ON P.Descr = V.Descr;
GO

INSERT INTO AcessosFabrica (CodAcesso, CodFun, Setor, Entrada, Saida)
VALUES
(1, 3, 'Estoque', '2024-02-06T19:50:00', '2024-02-06T20:15:00'),
(2, 9, 'Envase', '2024-02-06T20:10:00', '2024-02-06T20:25:00'),
(3, 10, 'Estoque', '2024-02-06T20:35:00', '2024-02-06T20:55:00'),
(4, 3, 'Envase', '2024-02-06T20:40:00', '2024-02-06T20:52:00'),
(5, 4, 'Envase', '2024-02-06T21:05:00', '2024-02-06T21:20:00'),
(6, 5, 'Escritorio', '2024-02-06T20:42:00', '2024-02-06T20:56:00'),
(7, 9, 'Estoque', '2024-02-06T20:45:00', '2024-02-06T21:10:00'),
(8, 11, 'Envase', '2024-02-06T21:15:00', '2024-02-06T21:30:00'),
(9, 3, 'Envase', '2024-02-07T19:25:00', '2024-02-07T19:35:00');
GO

SELECT CodProd, Descr FROM Produtos WHERE Descr LIKE '%Molho%' ORDER BY CodProd;
SELECT CodLote, CodProd, ResultadoAnalise FROM LotesInvestigados ORDER BY CodLote;
