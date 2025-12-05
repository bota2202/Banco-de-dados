USE Oficina;

-- 6.1
SELECT 
    c.id_cliente,
    c.nome,
    os.id_os
FROM Clientes c
LEFT JOIN Ordens_Servico os ON c.id_cliente = os.id_cliente;

-- 6.2
SELECT 
    m.id_mecanico,
    m.nome,
    COUNT(osm.id_os) AS quantidade_os
FROM Mecanicos m
LEFT JOIN OS_Mecanicos osm ON m.id_mecanico = osm.id_mecanico
GROUP BY m.id_mecanico, m.nome;

-- 6.3
SELECT 
    p.id_peca,
    p.nome,
    COALESCE(SUM(osp.quantidade_usada), 0) AS quantidade_total_vendida
FROM Pecas p
LEFT JOIN OS_Pecas osp ON p.id_peca = osp.id_peca
GROUP BY p.id_peca, p.nome;

-- 6.4
SELECT 
    v.id_veiculo,
    v.placa,
    v.modelo,
    MAX(os.data_abertura) AS ultima_os_data
FROM Veiculos v
LEFT JOIN Ordens_Servico os ON v.id_veiculo = os.id_veiculo
GROUP BY v.id_veiculo, v.placa, v.modelo;

