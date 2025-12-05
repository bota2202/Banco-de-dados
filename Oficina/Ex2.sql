USE Oficina;

-- 2.1
UPDATE Pecas 
SET preco_venda = preco_venda * 1.05
WHERE fabricante = 'Bosch';

-- 2.2
UPDATE Ordens_Servico 
SET status = 'Concluída'
WHERE id_os = 105 AND status = 'Em Execução';

-- 2.3
UPDATE Ordens_Servico 
SET data_conclusao = CURDATE()
WHERE status = 'Em Execução' 
AND data_abertura < DATE_SUB(CURDATE(), INTERVAL 30 DAY);

-- 2.4
UPDATE Pecas 
SET qtd_estoque = qtd_estoque * 2
WHERE id_peca = 20;

