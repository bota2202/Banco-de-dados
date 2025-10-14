use somativa;

SELECT * FROM Alunos;
SELECT nome, email FROM Alunos;
SELECT * FROM Cursos WHERE carga_horaria > 30;
SELECT * FROM Cursos WHERE status = 'inativo';
SELECT * FROM Alunos WHERE YEAR(data_nascimento) > 1995;
SELECT * FROM Avaliacoes WHERE nota > 9;
SELECT COUNT(*) AS total_cursos FROM Cursos;
SELECT * FROM Cursos ORDER BY carga_horaria DESC LIMIT 3;
