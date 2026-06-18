1. Qual a quantidade de alunos com assinaturas inadimplentes em 2025?
sqlSELECT DISTINCT a.id_aluno, a.nome
FROM Aluno a
JOIN Assinatura s ON a.id_aluno = s.fk_Aluno_id_aluno
WHERE s.status = 'inadimplente'
AND YEAR(s.data_inicio) = 2025;


2. Qual a quantidade de assinaturas realizadas por tipo de plano (mensal, trimestral, semestral e diária) em 2025?
sqlSELECT p.tipo, COUNT(s.id_assinatura) AS total_assinaturas
FROM Assinatura s
JOIN Plano p ON s.fk_Plano_id_plano = p.id_plano
WHERE YEAR(s.data_inicio) = 2025
GROUP BY p.tipo;


3. Qual o total arrecadado de pagamentos realizados em 2025, agrupados por forma de pagamento?
sqlSELECT forma_pagamento, SUM(valor) AS total_arrecadado
FROM Pagamento
WHERE YEAR(data_pagamento) = 2025
GROUP BY forma_pagamento;


4. Qual a quantidade de avaliações físicas por status da avaliação (pendente ou concluída) em 2025?
sqlSELECT status_avaliacao, COUNT(*) AS total
FROM Avaliacao_Fisica
WHERE YEAR(data) = 2025
GROUP BY status_avaliacao;


5. Quais são os 10 alunos com maior frequência de acesso à academia durante o ano de 2025?
sqlSELECT a.id_aluno, a.nome, COUNT(ac.id_acesso) AS frequencia
FROM Aluno a
JOIN Acesso ac ON a.id_aluno = ac.fk_Aluno_id_aluno
WHERE YEAR(ac.data_hora) = 2025
GROUP BY a.id_aluno, a.nome
ORDER BY frequencia DESC
LIMIT 10;