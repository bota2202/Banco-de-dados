use joins2;

SELECT 
    c.NOME AS 'Nome do Cliente',
    v.DUPLIC AS 'Número da Duplicata', 
    v.VALOR AS 'Valor'
FROM CLIENTE c
INNER JOIN VENDA v ON c.CODCLI = v.CODCLI
WHERE c.NOME = 'PCTEC - MICROCOMPUTADORES S/A.'
ORDER BY v.DUPLIC;

SELECT 
    c.NOME AS 'Nome do Cliente',
    v.VENCTO AS 'Data de Vencimento'
FROM CLIENTE c
INNER JOIN VENDA v ON c.CODCLI = v.CODCLI
WHERE YEAR(v.VENCTO) = 2004 
    AND MONTH(v.VENCTO) = 11
ORDER BY v.VENCTO;

SELECT 
    c.nome AS Nome_Cliente,
    v.duplic AS Numero_Duplicata,
    v.vencto AS Data_Vencimento,
    v.valor AS Valor_Venda
FROM cliente c
INNER JOIN venda v ON c.codcli = v.codcli
WHERE MONTH(v.vencto) = 10
ORDER BY v.vencto;

SELECT 
    c.NOME AS 'Nome do Cliente',
    COUNT(v.DUPLIC) AS 'Quantidade de Títulos',
    SUM(v.VALOR) AS 'Total Devido'
FROM CLIENTE c
INNER JOIN VENDA v ON c.CODCLI = v.CODCLI
GROUP BY c.CODCLI, c.NOME
ORDER BY c.NOME;

SELECT 
    c.NOME AS 'Nome do Cliente',
    COUNT(v.DUPLIC) AS 'Quantidade de Títulos',
    SUM(v.VALOR) AS 'Total das Duplicatas'
FROM CLIENTE c
INNER JOIN VENDA v ON c.CODCLI = v.CODCLI
GROUP BY c.CODCLI, c.NOME
ORDER BY c.NOME;

SELECT 
    c.NOME AS CLIENTE,
    COUNT(v.DUPLIC) AS VENCIDOS
FROM CLIENTE c
INNER JOIN VENDA v ON c.CODCLI = v.CODCLI
WHERE v.VENCTO < '2003-12-31'
GROUP BY c.CODCLI, c.NOME
ORDER BY c.NOME;

SELECT 
    c.NOME AS 'Cliente',
    v.DUPLIC AS 'Duplicata',
    v.VALOR AS 'Valor Original',
    ROUND(v.VALOR * 0.10, 2) AS 'Juros (10%)',
    ROUND(v.VALOR * 1.10, 2) AS 'Valor Total'
FROM CLIENTE c
INNER JOIN VENDA v ON c.CODCLI = v.CODCLI
WHERE v.VENCTO < '1999-12-31'
ORDER BY c.NOME;
