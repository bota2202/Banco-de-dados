use somativa;

-- Alunos
INSERT INTO Alunos VALUES 
(1, 'João Silva', 'joao@email.com', '2000-05-15'),
(2, 'Maria Souza', NULL, '1998-10-02'),
(3, 'Carlos Lima', 'carlos@email.com', '1995-12-20'),
(4, 'Ana Costa', 'ana@email.com', '2003-07-18'),
(5, 'Pedro Rocha', 'pedro@email.com', '1999-03-11');

-- Cursos
INSERT INTO Cursos VALUES
(1, 'HTML e CSS', 'Curso de front-end básico', 40, 'ativo'),
(2, 'Python Básico', 'Introdução à programação', 60, 'ativo'),
(3, 'Banco de Dados', 'Conceitos de SQL', 50, 'ativo'),
(4, 'Git e GitHub', 'Controle de versão', 20, 'inativo'),
(5, 'JavaScript', 'Linguagem de programação web', 45, 'ativo');

-- Inscrições
INSERT INTO Inscricoes VALUES
(1, 1, 1, '2025-09-01'),
(2, 2, 2, '2025-09-02'),
(3, 3, 3, '2025-09-03'),
(4, 4, 4, '2025-09-04'),
(5, 5, 5, '2025-09-05');

-- Avaliações
INSERT INTO Avaliacoes VALUES
(1, 1, 9.5, 'Excelente aluno!'),
(2, 2, 8.0, 'Bom desempenho.'),
(3, 3, 9.8, 'Ótima participação!');