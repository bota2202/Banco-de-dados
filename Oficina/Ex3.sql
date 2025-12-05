USE Oficina;

-- 3.1
ALTER TABLE Clientes ADD COLUMN email VARCHAR(100);

-- 3.2
ALTER TABLE Mecanicos MODIFY COLUMN especialidade VARCHAR(150);

-- 3.3
ALTER TABLE Ordens_Servico DROP COLUMN diagnostico_entrada;

-- 3.4
ALTER TABLE Pecas ADD CONSTRAINT chk_preco CHECK (preco_venda >= preco_custo);

