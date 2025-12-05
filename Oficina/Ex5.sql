USE Oficina;

-- 5.1
SELECT DISTINCT
    v.placa,
    v.modelo
FROM Veiculos v
INNER JOIN Ordens_Servico os ON v.id_veiculo = os.id_veiculo
WHERE os.status = 'Em Execução';

-- 5.2
SELECT DISTINCT
    c.nome
FROM Clientes c
INNER JOIN Veiculos v ON c.id_cliente = v.id_cliente
WHERE v.marca = 'Volkswagen';

-- 5.3
SELECT DISTINCT
    m.nome
FROM Mecanicos m
INNER JOIN OS_Mecanicos osm ON m.id_mecanico = osm.id_mecanico;

-- 5.4
SELECT DISTINCT
    s.nome_servico
FROM Servicos s
INNER JOIN OS_Servicos os ON s.id_servico = os.id_servico;

