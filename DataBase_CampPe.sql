CREATE DATABASE CampeonatoPE2025;
USE CampeonatoPE2025;


CREATE TABLE Times (
    id_time INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    cidade VARCHAR(50),
    estadio VARCHAR(100)
);

CREATE TABLE Jogadores (
    id_jogador INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    posicao VARCHAR(30),
    idade INT,
    id_time INT
);


CREATE TABLE Tecnicos (
    id_tecnico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    especialidade VARCHAR(50)
);


CREATE TABLE Partidas (
    id_partida INT AUTO_INCREMENT PRIMARY KEY,
    time_casa INT,
    time_fora INT,
    local VARCHAR(100),
    resultado VARCHAR(10)
);


CREATE TABLE Escalacoes (
    id_escalacao INT AUTO_INCREMENT PRIMARY KEY,
    id_jogador INT,
    id_partida INT,
    status VARCHAR(20) -- Ex: Titular, Reserva
);


ALTER TABLE Jogadores
ADD CONSTRAINT fk_jogadores_times
FOREIGN KEY (id_time) REFERENCES Times(id_time);


ALTER TABLE Partidas
ADD CONSTRAINT fk_partida_casa
FOREIGN KEY (time_casa) REFERENCES Times(id_time);

ALTER TABLE Partidas
ADD CONSTRAINT fk_partida_fora
FOREIGN KEY (time_fora) REFERENCES Times(id_time);


ALTER TABLE Escalacoes
ADD CONSTRAINT fk_escalacoes_jogadores
FOREIGN KEY (id_jogador) REFERENCES Jogadores(id_jogador);


ALTER TABLE Escalacoes
ADD CONSTRAINT fk_escalacoes_partidas
FOREIGN KEY (id_partida) REFERENCES Partidas(id_partida);

INSERT INTO Times (nome, cidade, estadio) VALUES
('Sport Recife', 'Recife', 'Ilha do Retiro'),
('Santa Cruz', 'Recife', 'Arruda'),
('Náutico', 'Recife', 'Aflitos'),
('Salgueiro', 'Salgueiro', 'Cornélio de Barros'),
('Central', 'Caruaru', 'Lacerdão'),
('Petrolina FC', 'Petrolina', 'Paulo Coelho'),
('Afogados FC', 'Afogados da Ingazeira', 'Vianão'),
('Vitória FC', 'Vitória de Santo Antão', 'Carneirão'),
('Ipojuca AC', 'Ipojuca', 'Gervásio Limeira'),
('Íbis', 'Paulista', 'Ademir Cunha');

INSERT INTO Jogadores (nome, posicao, idade, id_time) VALUES
('João Silva', 'Goleiro', 29, 1),
('Carlos Mendes', 'Zagueiro', 25, 1),
('Rafael Luz', 'Meio-campo', 27, 2),
('André Costa', 'Atacante', 22, 2),
('Tiago Rocha', 'Zagueiro', 30, 3),
('Henrique Dias', 'Meio-campo', 24, 3),
('Luiz Felipe', 'Atacante', 28, 4),
('Paulo Henrique', 'Goleiro', 26, 5),
('Rodrigo Souza', 'Meio-campo', 23, 6),
('Matheus Lima', 'Atacante', 21, 7);

INSERT INTO Tecnicos (nome, especialidade) VALUES
('Roberto Fernandes', 'Ofensivo'),
('Marcelo Martelotte', 'Defensivo'),
('Dado Cavalcanti', 'Posse de bola'),
('Itamar Schülle', 'Pressão alta'),
('Gilmar Dal Pozzo', 'Equilíbrio'),
('Zé Teodoro', 'Retranca'),
('Hélio dos Anjos', 'Transição rápida'),
('Daniel Paulista', 'Marca pressão'),
('Sérgio China', 'Lateral forte'),
('Pedro Manta', 'Bola parada');

INSERT INTO Partidas (time_casa, time_fora, local, resultado) VALUES
(1, 2, 'Ilha do Retiro', '2x1'),
(3, 4, 'Aflitos', '1x1'),
(5, 6, 'Lacerdão', '0x3'),
(7, 8, 'Vianão', '2x2'),
(9, 10, 'Gervásio Limeira', '1x0'),
(2, 3, 'Arruda', '1x2'),
(4, 5, 'Cornélio de Barros', '2x0'),
(6, 7, 'Paulo Coelho', '0x1'),
(8, 9, 'Carneirão', '3x1'),
(10, 1, 'Ademir Cunha', '0x2');

INSERT INTO Escalacoes (id_jogador, id_partida, status) VALUES
(1, 1, 'Titular'),
(2, 1, 'Titular'),
(3, 1, 'Reserva'),
(4, 1, 'Titular'),
(5, 2, 'Titular'),
(6, 2, 'Reserva'),
(7, 3, 'Titular'),
(8, 3, 'Titular'),
(9, 4, 'Titular'),
(10, 5, 'Titular');

SELECT j.nome AS jogador, t.nome AS time
FROM Jogadores j
INNER JOIN Times t ON j.id_time = t.id_time
WHERE j.nome LIKE '%a%';

SELECT p.id_partida, t1.nome AS mandante, t2.nome AS visitante
FROM Partidas p
INNER JOIN Times t1 ON p.time_casa = t1.id_time
INNER JOIN Times t2 ON p.time_fora = t2.id_time
WHERE t1.cidade LIKE '%r%' OR t2.cidade LIKE '%r%';

SELECT j.nome AS jogador, p.local, e.status
FROM Escalacoes e
INNER JOIN Jogadores j ON e.id_jogador = j.id_jogador
INNER JOIN Partidas p ON e.id_partida = p.id_partida
WHERE e.status LIKE '%Titular%';

SELECT j.nome AS jogador, t.nome AS time
FROM Jogadores j
INNER JOIN Times t ON j.id_time = t.id_time
WHERE t.nome LIKE '%a%';

SELECT p.id_partida, p.local, t1.nome AS mandante, t2.nome AS visitante
FROM Partidas p
INNER JOIN Times t1 ON p.time_casa = t1.id_time
INNER JOIN Times t2 ON p.time_fora = t2.id_time
WHERE p.local LIKE '%u%';
