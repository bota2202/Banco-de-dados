USE Oficina;

-- 7.1
SELECT 
    os.id_os,
    c.nome AS nome_cliente
FROM Ordens_Servico os
RIGHT JOIN Clientes c ON os.id_cliente = c.id_cliente;

-- 7.2
SELECT 
    s.id_servico,
    s.nome_servico,
    os.id_os
FROM OS_Servicos os
RIGHT JOIN Servicos s ON os.id_servico = s.id_servico;

-- 7.3
SELECT 
    osm.id_os,
    osm.id_mecanico,
    m.nome AS nome_mecanico
FROM OS_Mecanicos osm
RIGHT JOIN Mecanicos m ON osm.id_mecanico = m.id_mecanico;

-- 7.4
SELECT 
    v.id_veiculo,
    v.placa,
    v.modelo,
    os.id_os
FROM Ordens_Servico os
RIGHT JOIN Veiculos v ON os.id_veiculo = v.id_veiculo;

