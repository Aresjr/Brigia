alter table preco_procedimento alter column unidade_id DROP NOT NULL;
alter table preco_procedimento alter column convenio_id DROP NOT NULL;

insert into procedimento (nome, especialidade_id) SELECT 'AC DELTA AMINIO LEVULÍNICO', id from especialidade where nome like 'LAB.';
insert into procedimento (codigo, nome, especialidade_id) SELECT null,'BACTERIOSCOPIA ( URINA)', id from especialidade where nome like 'LAB.';
insert into procedimento (codigo, nome, especialidade_id) SELECT null,'BIÓPSIA - MATERIAL EXTERNO', id from especialidade where nome like 'LAB.';

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = '2,5 HEXANODIONA URINA') THEN
RAISE EXCEPTION 'Procedimento 2,5 HEXANODIONA URINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 90.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = '2,5 HEXANODIONA URINA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = '2,5 HEXANODIONA URINA') THEN
RAISE EXCEPTION 'Procedimento 2,5 HEXANODIONA URINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 95.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = '2,5 HEXANODIONA URINA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = '2,5 HEXANODIONA URINA') THEN
RAISE EXCEPTION 'Procedimento 2,5 HEXANODIONA URINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 100.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = '2,5 HEXANODIONA URINA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ABS. ATOMICA METAIS(ARSENICO)') THEN
RAISE EXCEPTION 'Procedimento ABS. ATOMICA METAIS(ARSENICO) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 68.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ABS. ATOMICA METAIS(ARSENICO)' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ABS. ATOMICA METAIS(ARSENICO)') THEN
RAISE EXCEPTION 'Procedimento ABS. ATOMICA METAIS(ARSENICO) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 73.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ABS. ATOMICA METAIS(ARSENICO)' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ABS. ATOMICA METAIS(ARSENICO)') THEN
RAISE EXCEPTION 'Procedimento ABS. ATOMICA METAIS(ARSENICO) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 78.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ABS. ATOMICA METAIS(ARSENICO)' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AC DELTA AMINIO LEVULÍNICO') THEN
RAISE EXCEPTION 'Procedimento AC DELTA AMINIO LEVULÍNICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 42.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'AC DELTA AMINIO LEVULÍNICO' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AC DELTA AMINIO LEVULÍNICO') THEN
RAISE EXCEPTION 'Procedimento AC DELTA AMINIO LEVULÍNICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 47.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'AC DELTA AMINIO LEVULÍNICO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AC DELTA AMINIO LEVULÍNICO') THEN
RAISE EXCEPTION 'Procedimento AC DELTA AMINIO LEVULÍNICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 52.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'AC DELTA AMINIO LEVULÍNICO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AC FORMICO URINARIO') THEN
RAISE EXCEPTION 'Procedimento AC FORMICO URINARIO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 170.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'AC FORMICO URINARIO' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AC FORMICO URINARIO') THEN
RAISE EXCEPTION 'Procedimento AC FORMICO URINARIO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 175.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'AC FORMICO URINARIO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AC FORMICO URINARIO') THEN
RAISE EXCEPTION 'Procedimento AC FORMICO URINARIO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 180.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'AC FORMICO URINARIO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ACIDO FOLICO') THEN
RAISE EXCEPTION 'Procedimento ACIDO FOLICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 32.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ACIDO FOLICO' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ACIDO FOLICO') THEN
RAISE EXCEPTION 'Procedimento ACIDO FOLICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 37.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ACIDO FOLICO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ACIDO FOLICO') THEN
RAISE EXCEPTION 'Procedimento ACIDO FOLICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 42.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ACIDO FOLICO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ACIDO FOLICO') THEN
RAISE EXCEPTION 'Procedimento ACIDO FOLICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 32.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ACIDO FOLICO' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ACIDO FOLICO') THEN
RAISE EXCEPTION 'Procedimento ACIDO FOLICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 37.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ACIDO FOLICO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ACIDO FOLICO') THEN
RAISE EXCEPTION 'Procedimento ACIDO FOLICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 32.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ACIDO FOLICO' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ACIDO FOLICO') THEN
RAISE EXCEPTION 'Procedimento ACIDO FOLICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 42.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ACIDO FOLICO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ACIDO HIPURICO') THEN
RAISE EXCEPTION 'Procedimento ACIDO HIPURICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 18.85, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ACIDO HIPURICO' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ACIDO HIPURICO') THEN
RAISE EXCEPTION 'Procedimento ACIDO HIPURICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 24.5, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ACIDO HIPURICO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ACIDO HIPURICO') THEN
RAISE EXCEPTION 'Procedimento ACIDO HIPURICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 32.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ACIDO HIPURICO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ACIDO MANDELICO') THEN
RAISE EXCEPTION 'Procedimento ACIDO MANDELICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 22.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ACIDO MANDELICO' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ACIDO MANDELICO') THEN
RAISE EXCEPTION 'Procedimento ACIDO MANDELICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 27.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ACIDO MANDELICO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ACIDO MANDELICO') THEN
RAISE EXCEPTION 'Procedimento ACIDO MANDELICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 32.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ACIDO MANDELICO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ACIDO METILHIPURICO') THEN
RAISE EXCEPTION 'Procedimento ACIDO METILHIPURICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 19.6, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ACIDO METILHIPURICO' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ACIDO METILHIPURICO') THEN
RAISE EXCEPTION 'Procedimento ACIDO METILHIPURICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 24.5, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ACIDO METILHIPURICO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ACIDO METILHIPURICO') THEN
RAISE EXCEPTION 'Procedimento ACIDO METILHIPURICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 33.5, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ACIDO METILHIPURICO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ACIDO TRANS MUCONICO') THEN
RAISE EXCEPTION 'Procedimento ACIDO TRANS MUCONICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 64.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ACIDO TRANS MUCONICO' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ACIDO TRANS MUCONICO') THEN
RAISE EXCEPTION 'Procedimento ACIDO TRANS MUCONICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 69.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ACIDO TRANS MUCONICO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ACIDO TRANS MUCONICO') THEN
RAISE EXCEPTION 'Procedimento ACIDO TRANS MUCONICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 74.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ACIDO TRANS MUCONICO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ACIDO TRICLORACETICO') THEN
RAISE EXCEPTION 'Procedimento ACIDO TRICLORACETICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 26.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ACIDO TRICLORACETICO' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ACIDO TRICLORACETICO') THEN
RAISE EXCEPTION 'Procedimento ACIDO TRICLORACETICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 31.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ACIDO TRICLORACETICO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ACIDO TRICLORACETICO') THEN
RAISE EXCEPTION 'Procedimento ACIDO TRICLORACETICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 36.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ACIDO TRICLORACETICO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ACIDO URICO') THEN
RAISE EXCEPTION 'Procedimento ACIDO URICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 7.2, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ACIDO URICO' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ACIDO URICO') THEN
RAISE EXCEPTION 'Procedimento ACIDO URICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 12.2, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ACIDO URICO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ACIDO URICO') THEN
RAISE EXCEPTION 'Procedimento ACIDO URICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 8.38, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ACIDO URICO' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ACIDO URICO') THEN
RAISE EXCEPTION 'Procedimento ACIDO URICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 17.2, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ACIDO URICO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ACTH - HORMONIO ADRENOCORTICOTROFICO') THEN
RAISE EXCEPTION 'Procedimento ACTH - HORMONIO ADRENOCORTICOTROFICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 52.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ACTH - HORMONIO ADRENOCORTICOTROFICO' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ACTH - HORMONIO ADRENOCORTICOTROFICO') THEN
RAISE EXCEPTION 'Procedimento ACTH - HORMONIO ADRENOCORTICOTROFICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 57.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ACTH - HORMONIO ADRENOCORTICOTROFICO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ACTH - HORMONIO ADRENOCORTICOTROFICO') THEN
RAISE EXCEPTION 'Procedimento ACTH - HORMONIO ADRENOCORTICOTROFICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 62.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ACTH - HORMONIO ADRENOCORTICOTROFICO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ALBUMINA') THEN
RAISE EXCEPTION 'Procedimento ALBUMINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 9.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ALBUMINA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ALBUMINA') THEN
RAISE EXCEPTION 'Procedimento ALBUMINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 14.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ALBUMINA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ALBUMINA') THEN
RAISE EXCEPTION 'Procedimento ALBUMINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 19.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ALBUMINA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ALDOLASE') THEN
RAISE EXCEPTION 'Procedimento ALDOLASE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 16.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ALDOLASE' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ALDOLASE') THEN
RAISE EXCEPTION 'Procedimento ALDOLASE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 21.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ALDOLASE' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ALDOLASE') THEN
RAISE EXCEPTION 'Procedimento ALDOLASE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 26.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ALDOLASE' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ALFA 1- GLICOPROTEINA') THEN
RAISE EXCEPTION 'Procedimento ALFA 1- GLICOPROTEINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 18.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ALFA 1- GLICOPROTEINA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ALFA 1- GLICOPROTEINA') THEN
RAISE EXCEPTION 'Procedimento ALFA 1- GLICOPROTEINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 23.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ALFA 1- GLICOPROTEINA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ALFA 1- GLICOPROTEINA') THEN
RAISE EXCEPTION 'Procedimento ALFA 1- GLICOPROTEINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 38.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ALFA 1- GLICOPROTEINA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ALFA-FETOPROTEINA') THEN
RAISE EXCEPTION 'Procedimento ALFA-FETOPROTEINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 70.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ALFA-FETOPROTEINA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ALFA-FETOPROTEINA') THEN
RAISE EXCEPTION 'Procedimento ALFA-FETOPROTEINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 75.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ALFA-FETOPROTEINA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ALFA-FETOPROTEINA') THEN
RAISE EXCEPTION 'Procedimento ALFA-FETOPROTEINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 80.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ALFA-FETOPROTEINA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AMILASE') THEN
RAISE EXCEPTION 'Procedimento AMILASE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 11.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'AMILASE' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AMILASE') THEN
RAISE EXCEPTION 'Procedimento AMILASE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 16.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'AMILASE' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AMILASE') THEN
RAISE EXCEPTION 'Procedimento AMILASE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 11.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'AMILASE' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AMILASE') THEN
RAISE EXCEPTION 'Procedimento AMILASE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 21.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'AMILASE' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANDROSTENEDIONA') THEN
RAISE EXCEPTION 'Procedimento ANDROSTENEDIONA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 54.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANDROSTENEDIONA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANDROSTENEDIONA') THEN
RAISE EXCEPTION 'Procedimento ANDROSTENEDIONA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 59.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANDROSTENEDIONA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANDROSTENEDIONA') THEN
RAISE EXCEPTION 'Procedimento ANDROSTENEDIONA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 64.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANDROSTENEDIONA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI CCP') THEN
RAISE EXCEPTION 'Procedimento ANTI CCP not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 210.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI CCP' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI CCP') THEN
RAISE EXCEPTION 'Procedimento ANTI CCP not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 215.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI CCP' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI CCP') THEN
RAISE EXCEPTION 'Procedimento ANTI CCP not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 220.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI CCP' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI DNA ATIVO 2 HELICE') THEN
RAISE EXCEPTION 'Procedimento ANTI DNA ATIVO 2 HELICE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 32.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI DNA ATIVO 2 HELICE' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI DNA ATIVO 2 HELICE') THEN
RAISE EXCEPTION 'Procedimento ANTI DNA ATIVO 2 HELICE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 37.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI DNA ATIVO 2 HELICE' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI DNA ATIVO 2 HELICE') THEN
RAISE EXCEPTION 'Procedimento ANTI DNA ATIVO 2 HELICE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 42.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI DNA ATIVO 2 HELICE' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI ENA RNP') THEN
RAISE EXCEPTION 'Procedimento ANTI ENA RNP not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 64.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI ENA RNP' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI ENA RNP') THEN
RAISE EXCEPTION 'Procedimento ANTI ENA RNP not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 69.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI ENA RNP' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI ENA RNP') THEN
RAISE EXCEPTION 'Procedimento ANTI ENA RNP not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 74.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI ENA RNP' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI ENDOMIZIO IGA') THEN
RAISE EXCEPTION 'Procedimento ANTI ENDOMIZIO IGA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 56.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI ENDOMIZIO IGA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI ENDOMIZIO IGA') THEN
RAISE EXCEPTION 'Procedimento ANTI ENDOMIZIO IGA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 61.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI ENDOMIZIO IGA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI ENDOMIZIO IGA') THEN
RAISE EXCEPTION 'Procedimento ANTI ENDOMIZIO IGA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 76.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI ENDOMIZIO IGA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI ENDOMIZIO IGG') THEN
RAISE EXCEPTION 'Procedimento ANTI ENDOMIZIO IGG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 56.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI ENDOMIZIO IGG' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI ENDOMIZIO IGG') THEN
RAISE EXCEPTION 'Procedimento ANTI ENDOMIZIO IGG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 61.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI ENDOMIZIO IGG' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI ENDOMIZIO IGG') THEN
RAISE EXCEPTION 'Procedimento ANTI ENDOMIZIO IGG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 66.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI ENDOMIZIO IGG' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI ENDOMIZIO IGM') THEN
RAISE EXCEPTION 'Procedimento ANTI ENDOMIZIO IGM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 56.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI ENDOMIZIO IGM' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI ENDOMIZIO IGM') THEN
RAISE EXCEPTION 'Procedimento ANTI ENDOMIZIO IGM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 61.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI ENDOMIZIO IGM' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI ENDOMIZIO IGM') THEN
RAISE EXCEPTION 'Procedimento ANTI ENDOMIZIO IGM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 66.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI ENDOMIZIO IGM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI HBC IgG (HEPATITE B)') THEN
RAISE EXCEPTION 'Procedimento ANTI HBC IgG (HEPATITE B) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 40.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI HBC IgG (HEPATITE B)' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI HBC IgG (HEPATITE B)') THEN
RAISE EXCEPTION 'Procedimento ANTI HBC IgG (HEPATITE B) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 45.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI HBC IgG (HEPATITE B)' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI HBC IgG (HEPATITE B)') THEN
RAISE EXCEPTION 'Procedimento ANTI HBC IgG (HEPATITE B) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 50.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI HBC IgG (HEPATITE B)' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI HBC IgM (HEPATITE B)') THEN
RAISE EXCEPTION 'Procedimento ANTI HBC IgM (HEPATITE B) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 40.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI HBC IgM (HEPATITE B)' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI HBC IgM (HEPATITE B)') THEN
RAISE EXCEPTION 'Procedimento ANTI HBC IgM (HEPATITE B) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 45.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI HBC IgM (HEPATITE B)' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI HBC IgM (HEPATITE B)') THEN
RAISE EXCEPTION 'Procedimento ANTI HBC IgM (HEPATITE B) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 50.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI HBC IgM (HEPATITE B)' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI HBE (HEPATITE B)') THEN
RAISE EXCEPTION 'Procedimento ANTI HBE (HEPATITE B) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 44.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI HBE (HEPATITE B)' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI HBE (HEPATITE B)') THEN
RAISE EXCEPTION 'Procedimento ANTI HBE (HEPATITE B) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 49.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI HBE (HEPATITE B)' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI HBE (HEPATITE B)') THEN
RAISE EXCEPTION 'Procedimento ANTI HBE (HEPATITE B) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 54.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI HBE (HEPATITE B)' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI HBS (HEPATITE B)') THEN
RAISE EXCEPTION 'Procedimento ANTI HBS (HEPATITE B) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 34.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI HBS (HEPATITE B)' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI HBS (HEPATITE B)') THEN
RAISE EXCEPTION 'Procedimento ANTI HBS (HEPATITE B) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 39.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI HBS (HEPATITE B)' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI HBS (HEPATITE B)') THEN
RAISE EXCEPTION 'Procedimento ANTI HBS (HEPATITE B) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 44.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI HBS (HEPATITE B)' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI HVA IgG (HEPATITE A)') THEN
RAISE EXCEPTION 'Procedimento ANTI HVA IgG (HEPATITE A) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 54.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI HVA IgG (HEPATITE A)' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI HVA IgM (HEPATITE A)') THEN
RAISE EXCEPTION 'Procedimento ANTI HVA IgM (HEPATITE A) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 40.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI HVA IgM (HEPATITE A)' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI HVA IgM (HEPATITE A)') THEN
RAISE EXCEPTION 'Procedimento ANTI HVA IgM (HEPATITE A) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 45.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI HVA IgM (HEPATITE A)' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI HVA IgM (HEPATITE A)') THEN
RAISE EXCEPTION 'Procedimento ANTI HVA IgM (HEPATITE A) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 50.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI HVA IgM (HEPATITE A)' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI SM') THEN
RAISE EXCEPTION 'Procedimento ANTI SM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 56.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI SM' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI SM') THEN
RAISE EXCEPTION 'Procedimento ANTI SM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 61.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI SM' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI SM') THEN
RAISE EXCEPTION 'Procedimento ANTI SM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 66.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI SM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI TRANSG TECIDUAL - IGA') THEN
RAISE EXCEPTION 'Procedimento ANTI TRANSG TECIDUAL - IGA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 54.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI TRANSG TECIDUAL - IGA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI TRANSG TECIDUAL - IGA') THEN
RAISE EXCEPTION 'Procedimento ANTI TRANSG TECIDUAL - IGA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 59.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI TRANSG TECIDUAL - IGA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI TRANSG TECIDUAL - IGA') THEN
RAISE EXCEPTION 'Procedimento ANTI TRANSG TECIDUAL - IGA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 64.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI TRANSG TECIDUAL - IGA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI-LA / SSB') THEN
RAISE EXCEPTION 'Procedimento ANTI-LA / SSB not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 38.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI-LA / SSB' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI-LA / SSB') THEN
RAISE EXCEPTION 'Procedimento ANTI-LA / SSB not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 43.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI-LA / SSB' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI-LA / SSB') THEN
RAISE EXCEPTION 'Procedimento ANTI-LA / SSB not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 48.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI-LA / SSB' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI-RO / SSA') THEN
RAISE EXCEPTION 'Procedimento ANTI-RO / SSA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 38.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI-RO / SSA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI-RO / SSA') THEN
RAISE EXCEPTION 'Procedimento ANTI-RO / SSA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 43.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI-RO / SSA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI-RO / SSA') THEN
RAISE EXCEPTION 'Procedimento ANTI-RO / SSA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 48.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI-RO / SSA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI-TPO') THEN
RAISE EXCEPTION 'Procedimento ANTI-TPO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 26.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI-TPO' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI-TPO') THEN
RAISE EXCEPTION 'Procedimento ANTI-TPO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 31.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI-TPO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTI-TPO') THEN
RAISE EXCEPTION 'Procedimento ANTI-TPO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 36.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTI-TPO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTIBIOGRAMA') THEN
RAISE EXCEPTION 'Procedimento ANTIBIOGRAMA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 16.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTIBIOGRAMA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTIBIOGRAMA') THEN
RAISE EXCEPTION 'Procedimento ANTIBIOGRAMA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 21.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTIBIOGRAMA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTIBIOGRAMA') THEN
RAISE EXCEPTION 'Procedimento ANTIBIOGRAMA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 16.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTIBIOGRAMA' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTIBIOGRAMA') THEN
RAISE EXCEPTION 'Procedimento ANTIBIOGRAMA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 26.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTIBIOGRAMA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTICOAGULANTE LUPICO') THEN
RAISE EXCEPTION 'Procedimento ANTICOAGULANTE LUPICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 90.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTICOAGULANTE LUPICO' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTICOAGULANTE LUPICO') THEN
RAISE EXCEPTION 'Procedimento ANTICOAGULANTE LUPICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 95.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTICOAGULANTE LUPICO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTICOAGULANTE LUPICO') THEN
RAISE EXCEPTION 'Procedimento ANTICOAGULANTE LUPICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 100.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTICOAGULANTE LUPICO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTIGLIADINA (GLÚTEN) - IgA') THEN
RAISE EXCEPTION 'Procedimento ANTIGLIADINA (GLÚTEN) - IgA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 38.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTIGLIADINA (GLÚTEN) - IgA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTIGLIADINA (GLÚTEN) - IgA') THEN
RAISE EXCEPTION 'Procedimento ANTIGLIADINA (GLÚTEN) - IgA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 43.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTIGLIADINA (GLÚTEN) - IgA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTIGLIADINA (GLÚTEN) - IgA') THEN
RAISE EXCEPTION 'Procedimento ANTIGLIADINA (GLÚTEN) - IgA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 48.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTIGLIADINA (GLÚTEN) - IgA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTIGLIADINA (GLÚTEN) - IgG') THEN
RAISE EXCEPTION 'Procedimento ANTIGLIADINA (GLÚTEN) - IgG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 38.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTIGLIADINA (GLÚTEN) - IgG' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTIGLIADINA (GLÚTEN) - IgG') THEN
RAISE EXCEPTION 'Procedimento ANTIGLIADINA (GLÚTEN) - IgG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 43.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTIGLIADINA (GLÚTEN) - IgG' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTIGLIADINA (GLÚTEN) - IgG') THEN
RAISE EXCEPTION 'Procedimento ANTIGLIADINA (GLÚTEN) - IgG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 38.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTIGLIADINA (GLÚTEN) - IgG' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTIGLIADINA (GLÚTEN) - IgG') THEN
RAISE EXCEPTION 'Procedimento ANTIGLIADINA (GLÚTEN) - IgG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 48.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTIGLIADINA (GLÚTEN) - IgG' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTIGLIADINA (GLÚTEN) - IgM') THEN
RAISE EXCEPTION 'Procedimento ANTIGLIADINA (GLÚTEN) - IgM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 38.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTIGLIADINA (GLÚTEN) - IgM' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTIGLIADINA (GLÚTEN) - IgM') THEN
RAISE EXCEPTION 'Procedimento ANTIGLIADINA (GLÚTEN) - IgM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 43.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTIGLIADINA (GLÚTEN) - IgM' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTIGLIADINA (GLÚTEN) - IgM') THEN
RAISE EXCEPTION 'Procedimento ANTIGLIADINA (GLÚTEN) - IgM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 48.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTIGLIADINA (GLÚTEN) - IgM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTIMICROSSOMAL') THEN
RAISE EXCEPTION 'Procedimento ANTIMICROSSOMAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 42.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTIMICROSSOMAL' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTIMICROSSOMAL') THEN
RAISE EXCEPTION 'Procedimento ANTIMICROSSOMAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 47.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTIMICROSSOMAL' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ANTIMICROSSOMAL') THEN
RAISE EXCEPTION 'Procedimento ANTIMICROSSOMAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 52.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ANTIMICROSSOMAL' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ASO (ASLO - PESQ LATEX)') THEN
RAISE EXCEPTION 'Procedimento ASO (ASLO - PESQ LATEX) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 24.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ASO (ASLO - PESQ LATEX)' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ASO (ASLO - PESQ LATEX)') THEN
RAISE EXCEPTION 'Procedimento ASO (ASLO - PESQ LATEX) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 29.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ASO (ASLO - PESQ LATEX)' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ASO (ASLO - PESQ LATEX)') THEN
RAISE EXCEPTION 'Procedimento ASO (ASLO - PESQ LATEX) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 34.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ASO (ASLO - PESQ LATEX)' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'B2 MICROBULINA') THEN
RAISE EXCEPTION 'Procedimento B2 MICROBULINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 56.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'B2 MICROBULINA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'B2 MICROBULINA') THEN
RAISE EXCEPTION 'Procedimento B2 MICROBULINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 61.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'B2 MICROBULINA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'B2 MICROBULINA') THEN
RAISE EXCEPTION 'Procedimento B2 MICROBULINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 66.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'B2 MICROBULINA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BACT + EPU') THEN
RAISE EXCEPTION 'Procedimento BACT + EPU not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 31.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'BACT + EPU' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BACT + EPU') THEN
RAISE EXCEPTION 'Procedimento BACT + EPU not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 36.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'BACT + EPU' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BACT + EPU') THEN
RAISE EXCEPTION 'Procedimento BACT + EPU not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 41.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'BACT + EPU' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BACT SECREÇÃO VAGINAL') THEN
RAISE EXCEPTION 'Procedimento BACT SECREÇÃO VAGINAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 31.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'BACT SECREÇÃO VAGINAL' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BACT SECREÇÃO VAGINAL') THEN
RAISE EXCEPTION 'Procedimento BACT SECREÇÃO VAGINAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 36.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'BACT SECREÇÃO VAGINAL' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BACT SECREÇÃO VAGINAL') THEN
RAISE EXCEPTION 'Procedimento BACT SECREÇÃO VAGINAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 41.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'BACT SECREÇÃO VAGINAL' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BACTERIOSCOPIA ( GRAM)') THEN
RAISE EXCEPTION 'Procedimento BACTERIOSCOPIA ( GRAM) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 31.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'BACTERIOSCOPIA ( GRAM)' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BACTERIOSCOPIA ( GRAM)') THEN
RAISE EXCEPTION 'Procedimento BACTERIOSCOPIA ( GRAM) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 36.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'BACTERIOSCOPIA ( GRAM)' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BACTERIOSCOPIA ( GRAM)') THEN
RAISE EXCEPTION 'Procedimento BACTERIOSCOPIA ( GRAM) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 41.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'BACTERIOSCOPIA ( GRAM)' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BACTERIOSCOPIA ( URINA)') THEN
RAISE EXCEPTION 'Procedimento BACTERIOSCOPIA ( URINA) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 31.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'BACTERIOSCOPIA ( URINA)' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BACTERIOSCOPIA ( URINA)') THEN
RAISE EXCEPTION 'Procedimento BACTERIOSCOPIA ( URINA) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 36.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'BACTERIOSCOPIA ( URINA)' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BACTERIOSCOPIA ( URINA)') THEN
RAISE EXCEPTION 'Procedimento BACTERIOSCOPIA ( URINA) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 41.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'BACTERIOSCOPIA ( URINA)' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BETA HCG MASCULINO - TOTAL') THEN
RAISE EXCEPTION 'Procedimento BETA HCG MASCULINO - TOTAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 100.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'BETA HCG MASCULINO - TOTAL' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BETA HCG MASCULINO - TOTAL') THEN
RAISE EXCEPTION 'Procedimento BETA HCG MASCULINO - TOTAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 105.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'BETA HCG MASCULINO - TOTAL' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BETA HCG MASCULINO - TOTAL') THEN
RAISE EXCEPTION 'Procedimento BETA HCG MASCULINO - TOTAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 110.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'BETA HCG MASCULINO - TOTAL' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BETA HCG-QUALIT') THEN
RAISE EXCEPTION 'Procedimento BETA HCG-QUALIT not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 28.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'BETA HCG-QUALIT' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BETA HCG-QUALIT') THEN
RAISE EXCEPTION 'Procedimento BETA HCG-QUALIT not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 33.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'BETA HCG-QUALIT' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BETA HCG-QUALIT') THEN
RAISE EXCEPTION 'Procedimento BETA HCG-QUALIT not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 38.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'BETA HCG-QUALIT' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BETA HCG-QUANT') THEN
RAISE EXCEPTION 'Procedimento BETA HCG-QUANT not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 46.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'BETA HCG-QUANT' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BETA HCG-QUANT') THEN
RAISE EXCEPTION 'Procedimento BETA HCG-QUANT not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 51.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'BETA HCG-QUANT' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BETA HCG-QUANT') THEN
RAISE EXCEPTION 'Procedimento BETA HCG-QUANT not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 56.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'BETA HCG-QUANT' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BILIRRUBINAS') THEN
RAISE EXCEPTION 'Procedimento BILIRRUBINAS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 9.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'BILIRRUBINAS' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BILIRRUBINAS') THEN
RAISE EXCEPTION 'Procedimento BILIRRUBINAS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 14.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'BILIRRUBINAS' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BILIRRUBINAS') THEN
RAISE EXCEPTION 'Procedimento BILIRRUBINAS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 19.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'BILIRRUBINAS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BILLIRRUBINAS DIR/IND/TOTAL') THEN
RAISE EXCEPTION 'Procedimento BILLIRRUBINAS DIR/IND/TOTAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 9.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'BILLIRRUBINAS DIR/IND/TOTAL' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BILLIRRUBINAS DIR/IND/TOTAL') THEN
RAISE EXCEPTION 'Procedimento BILLIRRUBINAS DIR/IND/TOTAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 14.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'BILLIRRUBINAS DIR/IND/TOTAL' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BILLIRRUBINAS DIR/IND/TOTAL') THEN
RAISE EXCEPTION 'Procedimento BILLIRRUBINAS DIR/IND/TOTAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 9.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'BILLIRRUBINAS DIR/IND/TOTAL' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BILLIRRUBINAS DIR/IND/TOTAL') THEN
RAISE EXCEPTION 'Procedimento BILLIRRUBINAS DIR/IND/TOTAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 19.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'BILLIRRUBINAS DIR/IND/TOTAL' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BIÓPSIA - MATERIAL CLÍNICA') THEN
RAISE EXCEPTION 'Procedimento BIÓPSIA - MATERIAL CLÍNICA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'BIÓPSIA - MATERIAL CLÍNICA' and c.nome = 'VALE+' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BIÓPSIA - MATERIAL CLÍNICA') THEN
RAISE EXCEPTION 'Procedimento BIÓPSIA - MATERIAL CLÍNICA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 160.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'BIÓPSIA - MATERIAL CLÍNICA' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BIÓPSIA - MATERIAL CLÍNICA') THEN
RAISE EXCEPTION 'Procedimento BIÓPSIA - MATERIAL CLÍNICA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 160.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'BIÓPSIA - MATERIAL CLÍNICA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BIÓPSIA - MATERIAL CLÍNICA') THEN
RAISE EXCEPTION 'Procedimento BIÓPSIA - MATERIAL CLÍNICA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 160.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'BIÓPSIA - MATERIAL CLÍNICA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BIÓPSIA - MATERIAL EXTERNO') THEN
RAISE EXCEPTION 'Procedimento BIÓPSIA - MATERIAL EXTERNO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 170.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'BIÓPSIA - MATERIAL EXTERNO' and c.nome = 'VALE+' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BIÓPSIA - MATERIAL EXTERNO') THEN
RAISE EXCEPTION 'Procedimento BIÓPSIA - MATERIAL EXTERNO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 190.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'BIÓPSIA - MATERIAL EXTERNO' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BIÓPSIA - MATERIAL EXTERNO') THEN
RAISE EXCEPTION 'Procedimento BIÓPSIA - MATERIAL EXTERNO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 210.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'BIÓPSIA - MATERIAL EXTERNO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BIÓPSIA - MATERIAL EXTERNO') THEN
RAISE EXCEPTION 'Procedimento BIÓPSIA - MATERIAL EXTERNO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 240.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'BIÓPSIA - MATERIAL EXTERNO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BRUCELA - IGG') THEN
RAISE EXCEPTION 'Procedimento BRUCELA - IGG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 42.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'BRUCELA - IGG' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BRUCELA - IGG') THEN
RAISE EXCEPTION 'Procedimento BRUCELA - IGG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 47.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'BRUCELA - IGG' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BRUCELA - IGG') THEN
RAISE EXCEPTION 'Procedimento BRUCELA - IGG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 52.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'BRUCELA - IGG' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BRUCELA - IGM') THEN
RAISE EXCEPTION 'Procedimento BRUCELA - IGM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 42.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'BRUCELA - IGM' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BRUCELA - IGM') THEN
RAISE EXCEPTION 'Procedimento BRUCELA - IGM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 47.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'BRUCELA - IGM' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BRUCELA - IGM') THEN
RAISE EXCEPTION 'Procedimento BRUCELA - IGM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 52.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'BRUCELA - IGM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CA 15-3') THEN
RAISE EXCEPTION 'Procedimento CA 15-3 not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 64.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CA 15-3' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CA 15-3') THEN
RAISE EXCEPTION 'Procedimento CA 15-3 not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 69.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CA 15-3' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CA 15-3') THEN
RAISE EXCEPTION 'Procedimento CA 15-3 not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 74.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CA 15-3' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CA 19-9') THEN
RAISE EXCEPTION 'Procedimento CA 19-9 not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 58.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CA 19-9' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CA 19-9') THEN
RAISE EXCEPTION 'Procedimento CA 19-9 not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 63.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CA 19-9' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CA 19-9') THEN
RAISE EXCEPTION 'Procedimento CA 19-9 not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 68.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CA 19-9' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CA 72-4') THEN
RAISE EXCEPTION 'Procedimento CA 72-4 not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 120.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CA 72-4' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CA 72-4') THEN
RAISE EXCEPTION 'Procedimento CA 72-4 not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 125.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CA 72-4' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CA 72-4') THEN
RAISE EXCEPTION 'Procedimento CA 72-4 not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 130.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CA 72-4' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CADIOLPINA IGG') THEN
RAISE EXCEPTION 'Procedimento CADIOLPINA IGG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 50.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CADIOLPINA IGG' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CADIOLPINA IGG') THEN
RAISE EXCEPTION 'Procedimento CADIOLPINA IGG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 55.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CADIOLPINA IGG' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CADIOLPINA IGG') THEN
RAISE EXCEPTION 'Procedimento CADIOLPINA IGG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 60.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CADIOLPINA IGG' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CADIOLPINA IGM') THEN
RAISE EXCEPTION 'Procedimento CADIOLPINA IGM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 42.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CADIOLPINA IGM' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CADIOLPINA IGM') THEN
RAISE EXCEPTION 'Procedimento CADIOLPINA IGM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 47.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CADIOLPINA IGM' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CADIOLPINA IGM') THEN
RAISE EXCEPTION 'Procedimento CADIOLPINA IGM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 52.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CADIOLPINA IGM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CADMIO NA URINA') THEN
RAISE EXCEPTION 'Procedimento CADMIO NA URINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 50.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CADMIO NA URINA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CADMIO NA URINA') THEN
RAISE EXCEPTION 'Procedimento CADMIO NA URINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 55.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CADMIO NA URINA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CADMIO NA URINA') THEN
RAISE EXCEPTION 'Procedimento CADMIO NA URINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 60.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CADMIO NA URINA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CALCIO') THEN
RAISE EXCEPTION 'Procedimento CALCIO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 10.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CALCIO' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CALCIO') THEN
RAISE EXCEPTION 'Procedimento CALCIO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 15.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CALCIO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CALCIO') THEN
RAISE EXCEPTION 'Procedimento CALCIO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 20.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CALCIO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CALCIO IONICO') THEN
RAISE EXCEPTION 'Procedimento CALCIO IONICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 20.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CALCIO IONICO' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CALCIO IONICO') THEN
RAISE EXCEPTION 'Procedimento CALCIO IONICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 25.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CALCIO IONICO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CALCIO IONICO') THEN
RAISE EXCEPTION 'Procedimento CALCIO IONICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 30.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CALCIO IONICO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CALCIO SÉRICO') THEN
RAISE EXCEPTION 'Procedimento CALCIO SÉRICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 9.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CALCIO SÉRICO' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CALCIO SÉRICO') THEN
RAISE EXCEPTION 'Procedimento CALCIO SÉRICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 14.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CALCIO SÉRICO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CALCIO SÉRICO') THEN
RAISE EXCEPTION 'Procedimento CALCIO SÉRICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 9.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CALCIO SÉRICO' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CALCIO SÉRICO') THEN
RAISE EXCEPTION 'Procedimento CALCIO SÉRICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 19.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CALCIO SÉRICO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CANABINOIDE - URINA (MACONHA)') THEN
RAISE EXCEPTION 'Procedimento CANABINOIDE - URINA (MACONHA) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 90.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CANABINOIDE - URINA (MACONHA)' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CANABINOIDE - URINA (MACONHA)') THEN
RAISE EXCEPTION 'Procedimento CANABINOIDE - URINA (MACONHA) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 95.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CANABINOIDE - URINA (MACONHA)' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CANABINOIDE - URINA (MACONHA)') THEN
RAISE EXCEPTION 'Procedimento CANABINOIDE - URINA (MACONHA) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 100.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CANABINOIDE - URINA (MACONHA)' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CARBOXIHEMOGLOBINA') THEN
RAISE EXCEPTION 'Procedimento CARBOXIHEMOGLOBINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 24.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CARBOXIHEMOGLOBINA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CARBOXIHEMOGLOBINA') THEN
RAISE EXCEPTION 'Procedimento CARBOXIHEMOGLOBINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 29.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CARBOXIHEMOGLOBINA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CARBOXIHEMOGLOBINA') THEN
RAISE EXCEPTION 'Procedimento CARBOXIHEMOGLOBINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 34.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CARBOXIHEMOGLOBINA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CAXUMBA, IGG') THEN
RAISE EXCEPTION 'Procedimento CAXUMBA, IGG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 40.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CAXUMBA, IGG' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CAXUMBA, IGG') THEN
RAISE EXCEPTION 'Procedimento CAXUMBA, IGG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 45.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CAXUMBA, IGG' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CAXUMBA, IGG') THEN
RAISE EXCEPTION 'Procedimento CAXUMBA, IGG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 50.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CAXUMBA, IGG' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CAXUMBA, IGM') THEN
RAISE EXCEPTION 'Procedimento CAXUMBA, IGM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 40.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CAXUMBA, IGM' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CAXUMBA, IGM') THEN
RAISE EXCEPTION 'Procedimento CAXUMBA, IGM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 45.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CAXUMBA, IGM' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CAXUMBA, IGM') THEN
RAISE EXCEPTION 'Procedimento CAXUMBA, IGM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 50.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CAXUMBA, IGM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CEA') THEN
RAISE EXCEPTION 'Procedimento CEA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 94.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CEA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CEA') THEN
RAISE EXCEPTION 'Procedimento CEA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 99.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CEA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CEA') THEN
RAISE EXCEPTION 'Procedimento CEA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 104.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CEA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CHAGAS HEMOAGLUTINAÇÃO') THEN
RAISE EXCEPTION 'Procedimento CHAGAS HEMOAGLUTINAÇÃO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 36.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CHAGAS HEMOAGLUTINAÇÃO' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CHAGAS HEMOAGLUTINAÇÃO') THEN
RAISE EXCEPTION 'Procedimento CHAGAS HEMOAGLUTINAÇÃO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 41.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CHAGAS HEMOAGLUTINAÇÃO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CHAGAS HEMOAGLUTINAÇÃO') THEN
RAISE EXCEPTION 'Procedimento CHAGAS HEMOAGLUTINAÇÃO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 46.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CHAGAS HEMOAGLUTINAÇÃO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CHLAMYDIA - IGG') THEN
RAISE EXCEPTION 'Procedimento CHLAMYDIA - IGG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 48.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CHLAMYDIA - IGG' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CHLAMYDIA - IGG') THEN
RAISE EXCEPTION 'Procedimento CHLAMYDIA - IGG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 53.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CHLAMYDIA - IGG' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CHLAMYDIA - IGG') THEN
RAISE EXCEPTION 'Procedimento CHLAMYDIA - IGG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 48.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CHLAMYDIA - IGG' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CHLAMYDIA - IGG') THEN
RAISE EXCEPTION 'Procedimento CHLAMYDIA - IGG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 58.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CHLAMYDIA - IGG' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CHLAMYDIA - IGM') THEN
RAISE EXCEPTION 'Procedimento CHLAMYDIA - IGM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 48.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CHLAMYDIA - IGM' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CHLAMYDIA - IGM') THEN
RAISE EXCEPTION 'Procedimento CHLAMYDIA - IGM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 53.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CHLAMYDIA - IGM' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CHLAMYDIA - IGM') THEN
RAISE EXCEPTION 'Procedimento CHLAMYDIA - IGM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 48.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CHLAMYDIA - IGM' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CHLAMYDIA - IGM') THEN
RAISE EXCEPTION 'Procedimento CHLAMYDIA - IGM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 58.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CHLAMYDIA - IGM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CHUMBO (URINA)') THEN
RAISE EXCEPTION 'Procedimento CHUMBO (URINA) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 42.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CHUMBO (URINA)' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CHUMBO (URINA)') THEN
RAISE EXCEPTION 'Procedimento CHUMBO (URINA) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 47.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CHUMBO (URINA)' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CHUMBO (URINA)') THEN
RAISE EXCEPTION 'Procedimento CHUMBO (URINA) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 52.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CHUMBO (URINA)' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CARBOXIHEMOGLOBINA') THEN
RAISE EXCEPTION 'Procedimento CARBOXIHEMOGLOBINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 24.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CARBOXIHEMOGLOBINA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CARBOXIHEMOGLOBINA') THEN
RAISE EXCEPTION 'Procedimento CARBOXIHEMOGLOBINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 29.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CARBOXIHEMOGLOBINA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CARBOXIHEMOGLOBINA') THEN
RAISE EXCEPTION 'Procedimento CARBOXIHEMOGLOBINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 34.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CARBOXIHEMOGLOBINA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CAXUMBA, IGG') THEN
RAISE EXCEPTION 'Procedimento CAXUMBA, IGG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 40.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CAXUMBA, IGG' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CAXUMBA, IGG') THEN
RAISE EXCEPTION 'Procedimento CAXUMBA, IGG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 45.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CAXUMBA, IGG' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CAXUMBA, IGG') THEN
RAISE EXCEPTION 'Procedimento CAXUMBA, IGG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 50.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CAXUMBA, IGG' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CAXUMBA, IGM') THEN
RAISE EXCEPTION 'Procedimento CAXUMBA, IGM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 40.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CAXUMBA, IGM' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CAXUMBA, IGM') THEN
RAISE EXCEPTION 'Procedimento CAXUMBA, IGM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 45.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CAXUMBA, IGM' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CAXUMBA, IGM') THEN
RAISE EXCEPTION 'Procedimento CAXUMBA, IGM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 50.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CAXUMBA, IGM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CEA') THEN
RAISE EXCEPTION 'Procedimento CEA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 94.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CEA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CEA') THEN
RAISE EXCEPTION 'Procedimento CEA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 99.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CEA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CEA') THEN
RAISE EXCEPTION 'Procedimento CEA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 104.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CEA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CHAGAS HEMOAGLUTINAÇÃO') THEN
RAISE EXCEPTION 'Procedimento CHAGAS HEMOAGLUTINAÇÃO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 36.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CHAGAS HEMOAGLUTINAÇÃO' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CHAGAS HEMOAGLUTINAÇÃO') THEN
RAISE EXCEPTION 'Procedimento CHAGAS HEMOAGLUTINAÇÃO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 41.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CHAGAS HEMOAGLUTINAÇÃO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CHAGAS HEMOAGLUTINAÇÃO') THEN
RAISE EXCEPTION 'Procedimento CHAGAS HEMOAGLUTINAÇÃO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 46.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CHAGAS HEMOAGLUTINAÇÃO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CHLAMYDIA - IGG') THEN
RAISE EXCEPTION 'Procedimento CHLAMYDIA - IGG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 48.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CHLAMYDIA - IGG' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CHLAMYDIA - IGG') THEN
RAISE EXCEPTION 'Procedimento CHLAMYDIA - IGG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 53.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CHLAMYDIA - IGG' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CHLAMYDIA - IGG') THEN
RAISE EXCEPTION 'Procedimento CHLAMYDIA - IGG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 48.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CHLAMYDIA - IGG' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CHLAMYDIA - IGG') THEN
RAISE EXCEPTION 'Procedimento CHLAMYDIA - IGG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 58.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CHLAMYDIA - IGG' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CHLAMYDIA - IGM') THEN
RAISE EXCEPTION 'Procedimento CHLAMYDIA - IGM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 48.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CHLAMYDIA - IGM' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CHLAMYDIA - IGM') THEN
RAISE EXCEPTION 'Procedimento CHLAMYDIA - IGM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 53.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CHLAMYDIA - IGM' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CHLAMYDIA - IGM') THEN
RAISE EXCEPTION 'Procedimento CHLAMYDIA - IGM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 48.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CHLAMYDIA - IGM' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CHLAMYDIA - IGM') THEN
RAISE EXCEPTION 'Procedimento CHLAMYDIA - IGM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 58.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CHLAMYDIA - IGM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CHUMBO (URINA)') THEN
RAISE EXCEPTION 'Procedimento CHUMBO (URINA) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 42.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CHUMBO (URINA)' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CHUMBO (URINA)') THEN
RAISE EXCEPTION 'Procedimento CHUMBO (URINA) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 47.0, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CHUMBO (URINA)' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CHUMBO (URINA)') THEN
RAISE EXCEPTION 'Procedimento CHUMBO (URINA) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 52.0, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CHUMBO (URINA)' and u.nome = 'Itapoá';
END $$;