-- =========================
-- ALUNO
-- =========================

INSERT INTO Aluno
(nome, CPF, telefone, email, historico_saude, data_nascimento,
cidade, rua, bairro, numero, estado, cep)
VALUES
('Joao Silva','12345678901','77999990001','joao@email.com','Hipertensao','1995-05-10','Vitoria da Conquista','Rua A','Centro','101','BA','45000000'),
('Maria Souza','12345678902','77999990002','maria@email.com','Nenhum','1998-08-15','Vitoria da Conquista','Rua B','Candeias','202','BA','45028000'),
('Carlos Oliveira','12345678903','77999990003','carlos@email.com','Diabetes','1992-01-20','Vitoria da Conquista','Rua C','Brasil','303','BA','45010000'),
('Ana Lima','12345678904','77999990004','ana@email.com','Nenhum','1999-04-11','Vitoria da Conquista','Rua D','Centro','404','BA','45000000'),
('Lucas Santos','12345678905','77999990005','lucas@email.com','Asma','1997-03-22','Vitoria da Conquista','Rua E','Patagonia','505','BA','45065000'),
('Fernanda Rocha','12345678906','77999990006','fernanda@email.com','Nenhum','1993-12-01','Vitoria da Conquista','Rua F','Brasil','606','BA','45010000'),
('Pedro Alves','12345678907','77999990007','pedro@email.com','Nenhum','1994-06-15','Vitoria da Conquista','Rua G','Centro','707','BA','45000000'),
('Juliana Costa','12345678908','77999990008','juliana@email.com','Hipertensao','1996-08-10','Vitoria da Conquista','Rua H','Candeias','808','BA','45028000'),
('Rafael Gomes','12345678909','77999990009','rafael@email.com','Nenhum','2000-09-20','Vitoria da Conquista','Rua I','Patagonia','909','BA','45065000'),
('Patricia Nunes','12345678910','77999990010','patricia@email.com','Nenhum','1991-11-30','Vitoria da Conquista','Rua J','Brasil','100','BA','45010000');

-- =========================
-- PLANO
-- =========================

INSERT INTO Plano (tipo, status, valor)
VALUES
('mensal','ativo',99.90),
('trimestral','ativo',270.00),
('semestral','ativo',500.00),
('diaria','ativo',15.00);

-- =========================
-- INSTRUTOR
-- =========================

INSERT INTO Instrutor (nome, telefone, email, CREF)
VALUES
('Ana Pereira','77999991111','ana@maximus.com','CREF001'),
('Lucas Trainer','77999992222','lucas@maximus.com','CREF002'),
('Marcos Lima','77999993333','marcos@maximus.com','CREF003');

-- =========================
-- ASSINATURA
-- =========================

INSERT INTO Assinatura
(data_inicio, status, data_fim, data_vencimento, valor_assinatura, fk_Aluno_id_aluno, fk_Plano_id_plano)
VALUES
('2025-01-01','ativa','2025-01-31','2025-01-10',99.90,1,1),
('2025-01-01','inadimplente','2025-01-31','2025-01-10',99.90,2,1),
('2025-02-01','ativa','2025-04-30','2025-02-10',270.00,3,2),
('2025-02-01','ativa','2025-07-31','2025-02-10',500.00,4,3),
('2025-03-01','inadimplente','2025-03-31','2025-03-10',99.90,5,1),
('2025-03-01','ativa','2025-05-31','2025-03-10',270.00,6,2),
('2025-04-01','ativa','2025-04-01','2025-04-01',15.00,7,4),
('2025-04-01','ativa','2025-04-30','2025-04-10',99.90,8,1),
('2025-05-01','ativa','2025-10-31','2025-05-10',500.00,9,3),
('2025-05-01','inadimplente','2025-05-31','2025-05-10',99.90,10,1);

-- =========================
-- PAGAMENTO
-- =========================

INSERT INTO Pagamento
(data_pagamento, valor, forma_pagamento, comprovante, fk_Assinatura_id_assinatura)
VALUES
('2025-01-05',99.90,'PIX','COMP001',1),
('2025-02-05',270.00,'Cartao','COMP002',3),
('2025-02-05',500.00,'PIX','COMP003',4),
('2025-03-05',270.00,'Dinheiro','COMP004',6),
('2025-04-01',15.00,'PIX','COMP005',7),
('2025-04-05',99.90,'Cartao','COMP006',8),
('2025-05-05',500.00,'PIX','COMP007',9);

-- =========================
-- AVALIACAO FISICA
-- =========================

INSERT INTO Avaliacao_Fisica
(peso, altura, data, IMC, historico_saude_consultado, status_avaliacao, fk_Instrutor_id_instrutor, fk_Aluno_id_aluno)
VALUES
(80.5,1.75,'2025-01-15',26.29,'Hipertensao','concluida',1,1),
(65.0,1.68,'2025-02-20',23.03,'Nenhum','pendente',2,2),
(90.0,1.80,'2025-03-10',27.78,'Diabetes','concluida',1,3),
(70.0,1.70,'2025-04-10',24.22,'Nenhum','concluida',3,4),
(82.0,1.78,'2025-05-05',25.88,'Asma','pendente',2,5),
(68.0,1.72,'2025-05-15',22.99,'Nenhum','concluida',1,6),
(75.0,1.73,'2025-06-10',25.06,'Nenhum','concluida',3,7),
(60.0,1.65,'2025-06-15',22.04,'Hipertensao','pendente',2,8);

-- =========================
-- ACESSO
-- =========================

INSERT INTO Acesso (data_hora, tipo, fk_Aluno_id_aluno)
VALUES
('2025-01-01 08:00:00','entrada',1),
('2025-01-01 10:00:00','saida',1),
('2025-01-02 08:00:00','entrada',1),
('2025-01-03 08:00:00','entrada',1),
('2025-01-04 08:00:00','entrada',1),
('2025-01-05 08:00:00','entrada',1),

('2025-02-01 08:00:00','entrada',2),
('2025-02-02 08:00:00','entrada',2),

('2025-03-01 08:00:00','entrada',3),
('2025-03-02 08:00:00','entrada',3),
('2025-03-03 08:00:00','entrada',3),
('2025-03-04 08:00:00','entrada',3),

('2025-04-01 08:00:00','entrada',4),
('2025-04-02 08:00:00','entrada',4),
('2025-04-03 08:00:00','entrada',4),

('2025-05-01 08:00:00','entrada',5),
('2025-05-02 08:00:00','entrada',5),

('2025-05-03 08:00:00','entrada',6),
('2025-05-04 08:00:00','entrada',6),
('2025-05-05 08:00:00','entrada',6),

('2025-05-06 08:00:00','entrada',7),
('2025-05-07 08:00:00','entrada',7),

('2025-05-08 08:00:00','entrada',8),
('2025-05-09 08:00:00','entrada',8),
('2025-05-10 08:00:00','entrada',8),

('2025-05-11 08:00:00','entrada',9),
('2025-05-12 08:00:00','entrada',9),
('2025-05-13 08:00:00','entrada',9),
('2025-05-14 08:00:00','entrada',9),

('2025-05-15 08:00:00','entrada',10);