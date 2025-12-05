USE Oficina;

-- 9.1
SELECT 
    COALESCE(SUM(osv.preco_cobrado), 0) + 
    COALESCE(SUM(osp.preco_unitario_cobrado * osp.quantidade_usada), 0) AS faturamento_total
FROM Ordens_Servico os
LEFT JOIN OS_Servicos osv ON os.id_os = osv.id_os
LEFT JOIN OS_Pecas osp ON os.id_os = osp.id_os
WHERE os.id_os = 100;

-- 9.2
SELECT 
    AVG(DATEDIFF(data_conclusao, data_abertura)) AS tempo_medio_dias
FROM Ordens_Servico
WHERE data_conclusao IS NOT NULL;

-- 9.1.1
SELECT COUNT(*) AS total_veiculos FROM Veiculos;

-- 9.1.2
SELECT SUM(qtd_estoque * preco_custo) AS valor_total_inventario FROM Pecas;

-- 9.1.3
SELECT AVG(preco_mao_obra) AS preco_medio_mao_obra FROM Servicos;

-- 9.2.1
SELECT 
    marca,
    COUNT(*) AS quantidade_veiculos
FROM Veiculos
GROUP BY marca;

-- 9.2.2
SELECT 
    YEAR(data_abertura) AS ano,
    MONTH(data_abertura) AS mes,
    COUNT(*) AS quantidade_os
FROM Ordens_Servico
GROUP BY YEAR(data_abertura), MONTH(data_abertura)
ORDER BY ano DESC, mes DESC;

-- 9.2.3
SELECT 
    status,
    COUNT(*) AS quantidade_os
FROM Ordens_Servico
GROUP BY status;

-- 9.3.1
SELECT COUNT(*) AS total_os_concluidas 
FROM Ordens_Servico 
WHERE status = 'Concluído';

-- 9.3.2
SELECT 
    COALESCE(SUM(osv.preco_cobrado), 0) + 
    COALESCE(SUM(osp.preco_unitario_cobrado * osp.quantidade_usada), 0) AS faturamento_total_fiat
FROM Ordens_Servico os
JOIN Veiculos v ON os.id_veiculo = v.id_veiculo
LEFT JOIN OS_Servicos osv ON os.id_os = osv.id_os
LEFT JOIN OS_Pecas osp ON os.id_os = osp.id_os
WHERE v.marca = 'Fiat' 
AND os.data_abertura >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

-- 9.3.3
SELECT AVG(preco_mao_obra) AS preco_medio_mao_obra_motor 
FROM Servicos 
WHERE especialidade = 'Motor';

-- 9.4.1
SELECT 
    os.id_cliente,
    SUM(COALESCE(osv.preco_cobrado, 0) + COALESCE(osp.preco_unitario_cobrado * osp.quantidade_usada, 0)) AS total_gasto
FROM Ordens_Servico os
LEFT JOIN OS_Servicos osv ON os.id_os = osv.id_os
LEFT JOIN OS_Pecas osp ON os.id_os = osp.id_os
GROUP BY os.id_cliente
HAVING total_gasto > 5000.00;

-- 9.4.2
SELECT 
    id_peca,
    SUM(quantidade_usada) AS total_vendido
FROM OS_Pecas
GROUP BY id_peca
HAVING total_vendido > 100;

-- 9.4.3
SELECT 
    m.especialidade,
    COUNT(DISTINCT osm.id_os) AS total_os
FROM Mecanicos m
JOIN OS_Mecanicos osm ON m.id_mecanico = osm.id_mecanico
GROUP BY m.especialidade
HAVING total_os > 20;

-- 9.4.4
SELECT 
    m.nome,
    COUNT(osm.id_os) AS total_os
FROM Mecanicos m
JOIN OS_Mecanicos osm ON m.id_mecanico = osm.id_mecanico
GROUP BY m.id_mecanico, m.nome
ORDER BY total_os DESC
LIMIT 1;

