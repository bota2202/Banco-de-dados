USE Oficina;

-- 4.1
SELECT 
    os.id_os,
    c.nome AS nome_cliente,
    v.placa,
    os.data_abertura
FROM Ordens_Servico os
JOIN Clientes c ON os.id_cliente = c.id_cliente
JOIN Veiculos v ON os.id_veiculo = v.id_veiculo;

-- 4.2
SELECT 
    p.nome AS nome_peca,
    osp.quantidade_usada
FROM OS_Pecas osp
JOIN Pecas p ON osp.id_peca = p.id_peca
WHERE osp.id_os = 50;

-- 4.3
SELECT 
    m.nome AS nome_mecanico
FROM OS_Mecanicos osm
JOIN Mecanicos m ON osm.id_mecanico = m.id_mecanico
WHERE osm.id_os = 75;

-- 4.4
SELECT 
    v.placa,
    v.modelo,
    c.nome AS proprietario
FROM Veiculos v
JOIN Clientes c ON v.id_cliente = c.id_cliente;

