create database somativa;
use somativa;

CREATE TABLE Alunos (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    data_nascimento DATE
);

CREATE TABLE Cursos (
    id INT PRIMARY KEY,
    titulo VARCHAR(100),
    descricao TEXT,
    carga_horaria INT,
    status VARCHAR(20)
);

CREATE TABLE Inscricoes (
    id INT PRIMARY KEY,
    aluno_id INT,
    curso_id INT,
    data_inscricao DATE,
    FOREIGN KEY (aluno_id) REFERENCES Alunos(id),
    FOREIGN KEY (curso_id) REFERENCES Cursos(id)
);

CREATE TABLE Avaliacoes (
    id INT PRIMARY KEY,
    inscricao_id INT UNIQUE,
    nota DECIMAL(4,2),
    comentario TEXT,
    FOREIGN KEY (inscricao_id) REFERENCES Inscricoes(id)
);