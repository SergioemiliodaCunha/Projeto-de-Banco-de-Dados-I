CREATE TABLE Aluno (
id_aluno INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
CPF CHAR(11) NOT NULL UNIQUE,
telefone VARCHAR(15) NOT NULL,
email VARCHAR(100) NOT NULL,
historico_saude TEXT,
data_nascimento DATE NOT NULL,
cidade VARCHAR(50) NOT NULL,
rua VARCHAR(50) NOT NULL,
bairro VARCHAR(50) NOT NULL,
numero VARCHAR(10) NOT NULL,
estado CHAR(2) NOT NULL,
cep CHAR(8) NOT NULL
);

CREATE TABLE Plano (
id_plano INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
tipo ENUM('diaria','mensal','trimestral','semestral') NOT NULL,
status ENUM('ativo','inativo') NOT NULL,
valor DECIMAL(10,2) NOT NULL
);

CREATE TABLE Assinatura (
id_assinatura INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
data_inicio DATE NOT NULL,
status ENUM('ativa','inativa','inadimplente') NOT NULL,
data_fim DATE NOT NULL,
data_vencimento DATE NOT NULL,
valor_assinatura DECIMAL(10,2) NOT NULL,
fk_Aluno_id_aluno INT UNSIGNED NOT NULL,
fk_Plano_id_plano INT UNSIGNED NOT NULL
);

CREATE TABLE Pagamento (
id_pagamento INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
data_pagamento DATE NOT NULL,
valor DECIMAL(10,2) NOT NULL,
forma_pagamento VARCHAR(30) NOT NULL,
comprovante VARCHAR(255) NOT NULL,
fk_Assinatura_id_assinatura INT UNSIGNED NOT NULL
);

CREATE TABLE Acesso (
id_acesso INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
data_hora DATETIME NOT NULL,
tipo ENUM('entrada','saida') NOT NULL,
fk_Aluno_id_aluno INT UNSIGNED NOT NULL
);

CREATE TABLE Instrutor (
id_instrutor INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
telefone CHAR(15) NOT NULL,
email VARCHAR(100) NOT NULL,
CREF VARCHAR(20) NOT NULL
);

CREATE TABLE Avaliacao_Fisica (
id_avaliacao INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
peso DECIMAL(5,2) NOT NULL,
altura DECIMAL(4,2) NOT NULL,
data DATE NOT NULL,
IMC DECIMAL(5,2) NOT NULL,
historico_saude_consultado TEXT,
status_avaliacao ENUM('pendente','concluida') NOT NULL,
fk_Instrutor_id_instrutor INT UNSIGNED NOT NULL,
fk_Aluno_id_aluno INT UNSIGNED NOT NULL
);

ALTER TABLE Assinatura
ADD CONSTRAINT FK_Assinatura_Aluno
FOREIGN KEY (fk_Aluno_id_aluno)
REFERENCES Aluno(id_aluno);

ALTER TABLE Assinatura
ADD CONSTRAINT FK_Assinatura_Plano
FOREIGN KEY (fk_Plano_id_plano)
REFERENCES Plano(id_plano);

ALTER TABLE Pagamento
ADD CONSTRAINT FK_Pagamento_Assinatura
FOREIGN KEY (fk_Assinatura_id_assinatura)
REFERENCES Assinatura(id_assinatura);

ALTER TABLE Acesso
ADD CONSTRAINT FK_Acesso_Aluno
FOREIGN KEY (fk_Aluno_id_aluno)
REFERENCES Aluno(id_aluno);

ALTER TABLE Avaliacao_Fisica
ADD CONSTRAINT FK_Avaliacao_Aluno
FOREIGN KEY (fk_Aluno_id_aluno)
REFERENCES Aluno(id_aluno);

ALTER TABLE Avaliacao_Fisica
ADD CONSTRAINT FK_Avaliacao_Instrutor
FOREIGN KEY (fk_Instrutor_id_instrutor)
REFERENCES Instrutor(id_instrutor);
