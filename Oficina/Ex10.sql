USE Oficina;

-- 10.1
CREATE INDEX idx_placa ON Veiculos(placa);

-- 10.2
CREATE INDEX idx_fk_os_veiculo ON Ordens_Servico(id_veiculo);

-- 10.3
CREATE INDEX idx_os_pecas_composto ON OS_Pecas(id_os, id_peca);

