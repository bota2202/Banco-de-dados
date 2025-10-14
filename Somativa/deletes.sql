use somativa;

DELETE FROM Inscricoes WHERE id = 5;
DELETE FROM Cursos WHERE id = 5;
DELETE FROM Avaliacoes WHERE comentario LIKE '%ofensiva%';
DELETE FROM Alunos WHERE id = 5;
DELETE FROM Inscricoes WHERE curso_id IN (
  SELECT id FROM Cursos WHERE status = 'inativo'
);
