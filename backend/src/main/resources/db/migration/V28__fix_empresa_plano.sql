UPDATE empresa_plano set cor_fundo = 'bg-blue-500' WHERE nome = 'LINHA AZUL ESCURO / CANCELADOS (NÃO PODE FATURAR)';

ALTER TABLE empresa_plano ADD COLUMN IF NOT EXISTS descricao character varying(255);

UPDATE empresa_plano SET descricao = nome;

UPDATE empresa_plano SET nome = 'MENSALISTA' where descricao = 'LINHA BRANCA SÃO MENSALISTAS';
UPDATE empresa_plano SET nome = 'PARCEIROS - 35 POR ASO' where descricao = 'LINHA AZUL PARCEIROS PAGA 35,00 POR ASO';
UPDATE empresa_plano SET nome = 'MENSALISTA COM ENVIO E-SOCIAL' where descricao = 'LINHA VERDE MENSALISTA COM ENVIO E-SOCIAL (TABELA DIFERENCIADA DE MENS.)';
UPDATE empresa_plano SET nome = 'PARTICULAR' where descricao = 'LINHA AMARELA PARTICULAR';
UPDATE empresa_plano SET nome = 'CONTABILIDADE' where descricao = 'LINHA CINZA CONTABILIDADE/ CONSIDERAR VALOR DE PARCEIRO S/ MENS.';
UPDATE empresa_plano SET nome = 'PARCEIROS' where descricao = 'LINHA LARANJA PARCEIROS';
UPDATE empresa_plano SET nome = 'CANCELADOS (NÃO PODE FATURAR)' where descricao = 'LINHA AZUL ESCURO / CANCELADOS (NÃO PODE FATURAR)';