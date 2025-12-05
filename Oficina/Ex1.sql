USE Oficina;

-- 1.1
SELECT * FROM Veiculos WHERE marca = 'Ford';

-- 1.2
SELECT DISTINCT c.*
FROM Clientes c
JOIN Ordens_Servico os ON c.id_cliente = os.id_cliente
WHERE os.data_abertura >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

-- 1.3
SELECT * FROM Mecanicos WHERE especialidade = 'Injeção Eletrônica';

-- 1.4
SELECT * FROM Ordens_Servico WHERE status = 'Aguardando Peça';

-- 1.5
SELECT * FROM Pecas WHERE qtd_estoque < 5;

-- 1.6
SELECT v.*
FROM Veiculos v
WHERE (
    SELECT COUNT(*) 
    FROM Ordens_Servico os 
    WHERE os.id_veiculo = v.id_veiculo
) > 1;

-- 1.7
SELECT DISTINCT os.*
FROM Ordens_Servico os
JOIN OS_Mecanicos osm ON os.id_os = osm.id_os
WHERE osm.id_mecanico = 3;

-- 1.8
SELECT nome, preco_venda 
FROM Pecas 
WHERE preco_custo > 200.00;
