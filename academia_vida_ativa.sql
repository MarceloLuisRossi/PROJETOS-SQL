CREATE DATABASE academia_vida_ativa;
USE academia_vida_ativa;

CREATE TABLE plano_academia (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome_plano VARCHAR(50) NOT NULL,
    valor_plano DECIMAL(10,2),
    duracao INT
);

CREATE TABLE aluno (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) UNIQUE,
    data_nascimento DATE,
    telefone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE contrato (
	id INT PRIMARY KEY AUTO_INCREMENT,
    data_compra DATETIME NOT NULL,
    data_fim_contrato DATETIME NOT NULL,
    id_plano_academia INT NOT NULL,
    id_aluno INT NOT NULL,
    FOREIGN KEY (id_plano_academia) REFERENCES plano_academia(id),
    FOREIGN KEY (id_aluno) REFERENCES aluno(id)
);

CREATE TABLE avaliacao_fisica (
	id INT PRIMARY KEY AUTO_INCREMENT,
    data_avaliacao DATE,
    peso DECIMAL(5,2),
    altura DECIMAL(5,2),
    percentual_gordura DECIMAL(5,2),
    id_aluno INT NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id)
);

CREATE TABLE armario (
	id INT PRIMARY KEY AUTO_INCREMENT,
    numero CHAR(6) NOT NULL,
    localizacao VARCHAR(100),
    id_aluno INT NOT NULL UNIQUE,
	FOREIGN KEY (id_aluno) REFERENCES aluno(id)
);

CREATE TABLE instrutor (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) UNIQUE,
    especialidade VARCHAR(100),
    telefone VARCHAR(20)
);

CREATE TABLE aula (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    horario TIME,
    capacidade_maxima INT,
    id_instrutor INT NOT NULL,
    FOREIGN KEY (id_instrutor) REFERENCES instrutor(id)
);

CREATE TABLE aluno_aula (
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT NOT NULL,
    id_aula INT NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id),
    FOREIGN KEY (id_aula) REFERENCES aula(id)
);

INSERT INTO plano_academia (nome_plano, valor_plano, duracao) VALUES 
('Mensal Padrão', 120.00, 1),
('Trimestral Prata', 300.00, 3),
('Semestral Ouro', 550.00, 6),
('Anual Diamante', 1000.00, 12),
('Mensal Estudante', 90.00, 1),
('Mensal Melhor Idade', 80.00, 1),
('Plano Casal Anual', 1800.00, 12),
('Funcional VIP', 150.00, 1),
('Crossfit Mensal', 200.00, 1),
('Projeto Verão', 350.00, 3);

INSERT INTO aluno (nome, cpf, data_nascimento, telefone, email) VALUES 
('Ana Souza', '11111111111', '1995-05-10', '54999991111', 'ana@email.com'),
('Bruno Lima', '22222222222', '1990-08-22', '54999992222', 'bruno@email.com'),
('Carlos Dias', '33333333333', '1985-12-01', '54999993333', NULL),
('Daniela Paz', '44444444444', '2000-02-15', '54999994444', 'daniela@email.com'),
('Eduardo Silva', '55555555555', '1998-07-30', '54999995555', 'edu@email.com'),
('Fernanda Rosa', '66666666666', '1982-03-25', '54999996666', NULL),
('Gabriel Melo', '77777777777', '1999-11-11', '54999997777', 'gabriel@email.com'),
('Helena Costa', '88888888888', '1975-06-05', '54999998888', 'helena@email.com'),
('Igor Santos', '99999999999', '2001-09-18', '54999999999', NULL),
('Julia Alves', '10101010101', '1993-01-20', '54999990000', 'julia@email.com');

INSERT INTO instrutor (nome, cpf, especialidade, telefone) VALUES 
('Marcos Treino', '12312312312', 'Musculação', '54988881111'),
('Luiza Zen', '23423423423', 'Yoga', '54988882222'),
('Pedro Suor', '34534534534', 'Crossfit', '54988883333'),
('Camila Ritmo', '45645645645', 'Spinning', '54988884444'),
('Fernando Força', '56756756756', 'Funcional', '54988885555'),
('Sofia Flex', '67867867867', 'Pilates', '54988886666'),
('Roberto Luta', '78978978978', 'Muay Thai', '54988887777'),
('Amanda Core', '89089089089', 'Ginástica Localizada', '54988888888'),
('Ricardo Peso', '90190190190', 'Musculação', '54988889999'),
('Vanessa Hit', '01201201201', 'HIIT', '54988880000');

INSERT INTO armario (numero, localizacao, id_aluno) VALUES 
('A-001', 'Vestiário Feminino', 1),
('A-002', 'Vestiário Masculino', 2),
('A-003', 'Vestiário Masculino', 3),
('A-004', 'Vestiário Feminino', 4),
('A-005', 'Vestiário Masculino', 5),
('A-006', 'Vestiário Feminino', 6),
('A-007', 'Vestiário Masculino', 7),
('A-008', 'Vestiário Feminino', 8),
('A-009', 'Vestiário Masculino', 9),
('A-010', 'Vestiário Feminino', 10);

INSERT INTO avaliacao_fisica (data_avaliacao, peso, altura, percentual_gordura, id_aluno) VALUES 
('2025-01-10', 65.5, 1.65, 22.5, 1),
('2025-06-15', 63.0, 1.65, 20.0, 1),
('2025-02-20', 80.2, 1.80, 18.0, 2),
('2025-03-05', 95.0, 1.75, 28.5, 3),
('2025-04-12', 58.0, 1.60, 25.0, 4),
('2025-05-22', 75.5, 1.78, 15.5, 5),
('2025-07-10', 68.0, 1.70, 24.0, 6),
('2025-08-30', 82.0, 1.82, 16.0, 7),
('2025-09-14', 60.5, 1.58, 26.5, 8),
('2025-10-01', 70.0, 1.72, 19.0, 9);

INSERT INTO aula (nome, horario, capacidade_maxima, id_instrutor) VALUES 
('Musculação Livre', '06:00:00', 50, 1),
('Hatha Yoga', '07:30:00', 15, 2),
('WOD Crossfit', '18:00:00', 20, 3),
('Spinning Avançado', '19:00:00', 25, 4),
('Circuito Funcional', '08:00:00', 20, 5),
('Pilates Solo', '17:00:00', 12, 6),
('Muay Thai Iniciantes', '20:00:00', 30, 7),
('GAP', '18:30:00', 25, 8),
('Musculação Livre', '14:00:00', 50, 9),
('HIIT Express', '12:15:00', 20, 10);

INSERT INTO contrato (data_compra, data_fim_contrato, id_plano_academia, id_aluno) VALUES 
('2025-01-01', '2025-12-31', 4, 1),
('2025-02-15', '2025-05-15', 2, 2),
('2025-03-01', '2025-04-01', 1, 3),
('2025-03-15', '2025-04-15', 5, 4),
('2025-04-01', '2025-10-01', 3, 5),
('2025-05-10', '2025-06-10', 1, 6),
('2025-06-01', '2026-06-01', 7, 7),
('2025-07-20', '2025-08-20', 6, 8),
('2025-08-01', '2025-09-01', 9, 9),
('2025-09-10', '2025-12-10', 10, 10);

INSERT INTO aluno_aula (id_aluno, id_aula) VALUES 
(1, 2),
(1, 6),
(2, 3),
(3, 1),
(4, 5),
(5, 4),
(6, 8),
(7, 7),
(8, 6),
(9, 10);

-- Listar alunos que possuem avaliações físicas.
SELECT A.nome AS nome_aluno
FROM aluno A
WHERE A.id IN (
	SELECT AF.id_aluno
    FROM avaliacao_fisica AF
);

-- Listar alunos que NÃO possuem avaliações físicas.
SELECT A.nome AS nome_aluno
FROM aluno A
WHERE A.id NOT IN (
	SELECT AF.id_aluno
    FROM avaliacao_fisica AF
);

-- Listar aulas cuja capacidade é maior que a média de capacidade das aulas.
SELECT DISTINCT AULA.nome AS nome_aula
FROM aula AULA
WHERE capacidade_maxima > (
	SELECT AVG(capacidade_maxima)
    FROM aula AULA
);

-- Listar instrutores que ministram mais aulas que a média.
SELECT
	INS.nome AS nome_instrutor
FROM instrutor INS
JOIN aula AULA ON INS.id = AULA.id_instrutor
GROUP BY INS.id, INS.nome
HAVING COUNT(AULA.id) > (
	SELECT COUNT(id) / COUNT(DISTINCT id_instrutor)
    FROM aula AULA
);

-- Listar alunos que estão inscritos em alguma aula.
SELECT A.nome AS nome_aluno
FROM aluno A
WHERE A.id IN (
	SELECT AA.id_aluno
    FROM aluno_aula AA
);

-- Crie as seguintes views:

-- Uma view que mostre:
-- nome do aluno
-- nome do plano
-- valor do plano

CREATE VIEW vw_aluno_plano AS
SELECT
	A.nome AS aluno,
	PA.nome_plano AS plano,
	PA.valor_plano AS valor
FROM aluno A
JOIN contrato C
	ON A.id = C.id_aluno
JOIN plano_academia PA
	ON PA.id = C.id_plano_academia;
    
-- Uma view que mostre:
-- nome da aula
-- nome do instrutor
-- quantidade de alunos inscritos

CREATE VIEW vw_aula_instrutor AS
SELECT
	AULA.nome AS nome_aula,
    INS.nome AS nome_instrutor,
    COUNT(AA.id_aluno) AS quantidade_alunos
FROM aula AULA
JOIN instrutor INS
	ON AULA.id_instrutor = INS.id
LEFT JOIN aluno_aula AA
	ON AULA.id = AA.id_aula
GROUP BY
	AULA.nome,
    INS.nome;

-- Crie índices para melhorar consultas:
-- índice no CPF do aluno
CREATE INDEX idx_cpf_aluno ON aluno(cpf);

-- índice no CPF do instrutor
CREATE INDEX idx_cpf_instrutor ON instrutor(cpf);

-- índice nas chaves estrangeiras principais
CREATE INDEX idx_plano_academia ON contrato(id_plano_academia);
CREATE INDEX idx_id_instrutor ON aula(id_instrutor);

-- índice na tabela de relacionamento (N:N)
CREATE INDEX idx_id_aluno ON aluno_aula(id_aluno);
CREATE INDEX IDX_id_aula ON aluno_aula(id_aula);
