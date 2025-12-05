USE Oficina;

-- 8.1
SELECT 
    c.*
FROM Clientes c
WHERE (
    SELECT COUNT(*) 
    FROM Ordens_Servico os 
    WHERE os.id_cliente = c.id_cliente
) > 3;

-- 8.2
SELECT DISTINCT
    p.nome AS nome_peca
FROM Pecas p
JOIN OS_Pecas osp ON p.id_peca = osp.id_peca
WHERE osp.id_os IN (
    SELECT osm.id_os 
    FROM OS_Mecanicos osm 
    WHERE osm.id_mecanico = 4
);

-- 8.3
SELECT 
    v.placa,
    v.modelo
FROM Veiculos v
WHERE v.id_veiculo NOT IN (
    SELECT DISTINCT id_veiculo 
    FROM Ordens_Servico
);

-- 8.4
SELECT 
    nome_servico,
    preco_mao_obra
FROM Servicos
WHERE preco_mao_obra > (
    SELECT AVG(preco_mao_obra) 
    FROM Servicos
);

