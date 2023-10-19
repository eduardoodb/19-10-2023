CREATE DATABASE IF NOT EXISTS BDEscolar;
DROP DATABASE BDEscolar;
CREATE DATABASE BDEscolar;
USE BDEscolar;

CREATE TABLE Professores (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    TURNO varchar(5) NOT NULL,
    Nome VARCHAR(50) NOT NULL
);

CREATE TABLE Turmas (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NomeTurma VARCHAR(20) NOT NULL,
    ProfessorID INT,
    SALA INT,
    FOREIGN KEY (ProfessorID) REFERENCES Professores(ID)
);

CREATE TABLE Alunos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    DataNascimento DATE,
    TurmaID INT,
    CPF INT,
    FOREIGN KEY (TurmaID) REFERENCES Turmas(ID)
);

CREATE TABLE Disciplinas (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NomeDisciplina VARCHAR(30) NOT NULL,
    TurmaID INT,
    HORARIOS int not null,
    FOREIGN KEY (TurmaID) REFERENCES Turmas(ID)
);

CREATE TABLE UnidadesEscolares (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NomeUnidade VARCHAR(50) NOT NULL,
    CEP varchar(8) not null,
    Endereco VARCHAR(100)
);

-- Exemplos de inserções
INSERT INTO Professores (Nome) VALUES ('Enzo');
INSERT INTO Professores (Nome) VALUES ('Gleison');
INSERT INTO Turmas (NomeTurma, ProfessorID) VALUES ('Turma A', 1);
INSERT INTO Turmas (NomeTurma, ProfessorID) VALUES ('Turma B', 2);
INSERT INTO Disciplinas (NomeDisciplina, TurmaID) VALUES ('Banco de Dados', 1);

-- Exemplo de consulta
-- Obter todos os alunos na Turma A e suas disciplinas
SELECT Alunos.Nome, Disciplinas.NomeDisciplina
FROM Alunos
JOIN Turmas ON Alunos.TurmaID = Turmas.ID
JOIN Disciplinas ON Turmas.ID = Disciplinas.TurmaID
WHERE Turmas.NomeTurma = 'Turma A';

-- Exemplo de atualização
-- Atualizar o nome de um aluno
UPDATE Alunos
SET Nome = 'Novo Nome'
WHERE ID = 1;

-- Exemplo de exclusão
-- Excluir um aluno
DELETE FROM Alunos
WHERE ID = 1;