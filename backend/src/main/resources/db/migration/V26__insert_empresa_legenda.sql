ALTER TABLE empresa
ALTER COLUMN codigo_bc TYPE text
USING codigo_bc::text;

insert into empresa_legenda (nome, cor_fundo) select 'LINHA BRANCA SÃO MENSALISTAS', 'bg-white';
insert into empresa_legenda (nome, cor_fundo) select 'LINHA AZUL PARCEIROS PAGA 35,00 POR ASO', 'bg-blue-100';
insert into empresa_legenda (nome, cor_fundo) select 'LINHA VERDE MENSALISTA COM ENVIO E-SOCIAL (TABELA DIFERENCIADA DE MENS.)', 'bg-green-100';
insert into empresa_legenda (nome, cor_fundo) select 'LINHA AMARELA PARTICULAR', 'bg-yellow-100';
insert into empresa_legenda (nome, cor_fundo) select 'LINHA CINZA CONTABILIDADE/ CONSIDERAR VALOR DE PARCEIRO S/ MENS.', 'bg-gray-100';
insert into empresa_legenda (nome, cor_fundo) select 'LINHA AZUL ESCURO / CANCELADOS (NÃO PODE FATURAR)', 'bg-blue-800';
insert into empresa_legenda (nome, cor_fundo) select 'LINHA LARANJA PARCEIROS', 'bg-orange-100';