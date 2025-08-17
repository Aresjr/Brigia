--pre_procedimento duplicados
delete from preco_procedimento where id IN (
	select pp_id from (
		select convenio_id, procedimento_id, count(*), max(pp.id) pp_id
		from preco_procedimento pp
		where convenio_id is not null and procedimento_id is not null
		group by convenio_id, procedimento_id
	) where count > 1
);

UPDATE preco_procedimento pp
SET procedimento_id = (
    SELECT p2.id
    FROM procedimento p2
    WHERE p2.nome = 'PREV +CONSULTA' -- versão correta
)
WHERE pp.procedimento_id = (
    SELECT p1.id
    FROM procedimento p1
    WHERE p1.nome = 'PREV +CONSULTA ' -- versão com espaço
);

delete from procedimento where nome = 'PREV +CONSULTA ';

update procedimento set nome = 'US PUNHO' where nome like 'US PUNHO ';
update procedimento set nome = 'US FIGADO E VIAS BILIARES' where nome like 'US FIGADO E VIAS BILIARES ';

UPDATE procedimento
SET nome = regexp_replace(nome, '\(\s+', '(', 'g');   -- remove espaço após (
UPDATE procedimento
SET nome = regexp_replace(nome, '\s+\)', ')', 'g');   -- remove espaço antes de )

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US MAP. ENDOMETRIOSE') THEN
RAISE EXCEPTION 'Procedimento US MAP. ENDOMETRIOSE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 270.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US MAP. ENDOMETRIOSE' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ECODOPPLER ARTERIAL (1 PERNA)') THEN
RAISE EXCEPTION 'Procedimento ECODOPPLER ARTERIAL (1 PERNA) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 290.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ECODOPPLER ARTERIAL (1 PERNA)' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ECODOPPLER ARTERIAL (2 LADOS)') THEN
RAISE EXCEPTION 'Procedimento ECODOPPLER ARTERIAL (2 LADOS) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 580.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ECODOPPLER ARTERIAL (2 LADOS)' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ECODOPPLER VENOSO (1 PERNA)') THEN
RAISE EXCEPTION 'Procedimento ECODOPPLER VENOSO (1 PERNA) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 290.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ECODOPPLER VENOSO (1 PERNA)' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ECODOPPLER VENOSO (2 LADOS)') THEN
RAISE EXCEPTION 'Procedimento ECODOPPLER VENOSO (2 LADOS) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 580.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ECODOPPLER VENOSO (2 LADOS)' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AB INF - FEM') THEN
RAISE EXCEPTION 'Procedimento US AB INF - FEM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US AB INF - FEM' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AB INF - FEM (C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US AB INF - FEM (C/ DOOPLER) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 190.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US AB INF - FEM (C/ DOOPLER)' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AB INF - MASC (C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US AB INF - MASC (C/ DOOPLER) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 190.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US AB INF - MASC (C/ DOOPLER)' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AB SUP (C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US AB SUP (C/ DOOPLER) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 190.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US AB SUP (C/ DOOPLER)' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AB TOTAL (APENDICITE)') THEN
RAISE EXCEPTION 'Procedimento US AB TOTAL (APENDICITE) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US AB TOTAL (APENDICITE)' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AB TOTAL (C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US AB TOTAL (C/ DOOPLER) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 225.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US AB TOTAL (C/ DOOPLER)' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AB INF - MASC') THEN
RAISE EXCEPTION 'Procedimento US AB INF - MASC not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US AB INF - MASC' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AP URINÁRIO - FEM (C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US AP URINÁRIO - FEM (C/ DOOPLER) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 190.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US AP URINÁRIO - FEM (C/ DOOPLER)' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AP URINÁRIO - MASC (C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US AP URINÁRIO - MASC (C/ DOOPLER) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 190.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US AP URINÁRIO - MASC (C/ DOOPLER)' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AB SUP') THEN
RAISE EXCEPTION 'Procedimento US AB SUP not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US AB SUP' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US BOLSA ESCROTAL (C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US BOLSA ESCROTAL (C/ DOOPLER) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 190.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US BOLSA ESCROTAL (C/ DOOPLER)' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US DOOPLER AORTA/RENAIS') THEN
RAISE EXCEPTION 'Procedimento US DOOPLER AORTA/RENAIS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 190.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US DOOPLER AORTA/RENAIS' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US DOOPLER CAROTIDAS/VERT') THEN
RAISE EXCEPTION 'Procedimento US DOOPLER CAROTIDAS/VERT not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 190.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US DOOPLER CAROTIDAS/VERT' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US GINECOL. TV (C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US GINECOL. TV (C/ DOOPLER) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 190.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US GINECOL. TV (C/ DOOPLER)' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US MAMAS (FEM / MASC) (COM DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US MAMAS (FEM / MASC) (COM DOOPLER) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 190.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US MAMAS (FEM / MASC) (COM DOOPLER)' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AB TOTAL') THEN
RAISE EXCEPTION 'Procedimento US AB TOTAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US AB TOTAL' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US MORF. 1º TRIM (10 A 14 SEM)') THEN
RAISE EXCEPTION 'Procedimento US MORF. 1º TRIM (10 A 14 SEM) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 300.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US MORF. 1º TRIM (10 A 14 SEM)' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US MORF. 2º TRIM (20 A 24 SEM)') THEN
RAISE EXCEPTION 'Procedimento US MORF. 2º TRIM (20 A 24 SEM) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 300.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US MORF. 2º TRIM (20 A 24 SEM)' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US ANTEBRAÇO') THEN
RAISE EXCEPTION 'Procedimento US ANTEBRAÇO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US ANTEBRAÇO' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US OBST. (C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US OBST. (C/ DOOPLER) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 190.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US OBST. (C/ DOOPLER)' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US OBST. (C/ TN)-GEMELAR') THEN
RAISE EXCEPTION 'Procedimento US OBST. (C/ TN)-GEMELAR not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 355.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US OBST. (C/ TN)-GEMELAR' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US OBST. (C/ TRANSL. NUCAL)') THEN
RAISE EXCEPTION 'Procedimento US OBST. (C/ TRANSL. NUCAL) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 215.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US OBST. (C/ TRANSL. NUCAL)' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US OBST. 1º TRIM (TV - C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US OBST. 1º TRIM (TV - C/ DOOPLER) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 190.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US OBST. 1º TRIM (TV - C/ DOOPLER)' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US OBST. GEM(CADA FETO) C/DOOP') THEN
RAISE EXCEPTION 'Procedimento US OBST. GEM(CADA FETO) C/DOOP not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 190.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US OBST. GEM(CADA FETO) C/DOOP' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US REGIAO CERVICAL (C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US REGIAO CERVICAL (C/ DOOPLER) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 190.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US REGIAO CERVICAL (C/ DOOPLER)' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US OBST. (PERFIL BIOF. FETAL)') THEN
RAISE EXCEPTION 'Procedimento US OBST. (PERFIL BIOF. FETAL) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 290.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US OBST. (PERFIL BIOF. FETAL)' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US TIREOIDE (COM DOPPLER)') THEN
RAISE EXCEPTION 'Procedimento US TIREOIDE (COM DOPPLER) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 190.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US TIREOIDE (COM DOPPLER)' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AP URINÁRIO - FEM') THEN
RAISE EXCEPTION 'Procedimento US AP URINÁRIO - FEM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US AP URINÁRIO - FEM' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AP URINÁRIO - MASC') THEN
RAISE EXCEPTION 'Procedimento US AP URINÁRIO - MASC not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US AP URINÁRIO - MASC' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US ARTICULAÇÃO') THEN
RAISE EXCEPTION 'Procedimento US ARTICULAÇÃO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US ARTICULAÇÃO' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AXILA (CADA LADO)') THEN
RAISE EXCEPTION 'Procedimento US AXILA (CADA LADO) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US AXILA (CADA LADO)' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US TORAXICA EXTRA-CARDIACA') THEN
RAISE EXCEPTION 'Procedimento US TORAXICA EXTRA-CARDIACA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 200.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US TORAXICA EXTRA-CARDIACA' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US BOLSA ESCROTAL') THEN
RAISE EXCEPTION 'Procedimento US BOLSA ESCROTAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US BOLSA ESCROTAL' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US COTOVELO') THEN
RAISE EXCEPTION 'Procedimento US COTOVELO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US COTOVELO' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US DEDO') THEN
RAISE EXCEPTION 'Procedimento US DEDO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US DEDO' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US FIGADO E VIAS BILIARES') THEN
RAISE EXCEPTION 'Procedimento US FIGADO E VIAS BILIARES not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US FIGADO E VIAS BILIARES' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US GINECOL. PELVICA (ABD INF)') THEN
RAISE EXCEPTION 'Procedimento US GINECOL. PELVICA (ABD INF) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US GINECOL. PELVICA (ABD INF)' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US DOOPLER AORTA/ILÍACAS') THEN
RAISE EXCEPTION 'Procedimento US DOOPLER AORTA/ILÍACAS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 190.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US DOOPLER AORTA/ILÍACAS' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US GINECOL. TV') THEN
RAISE EXCEPTION 'Procedimento US GINECOL. TV not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US GINECOL. TV' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US GLANDULAS SALIVARES') THEN
RAISE EXCEPTION 'Procedimento US GLANDULAS SALIVARES not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US GLANDULAS SALIVARES' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US JOELHO') THEN
RAISE EXCEPTION 'Procedimento US JOELHO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US JOELHO' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US LOMBAR (CADA LADO)') THEN
RAISE EXCEPTION 'Procedimento US LOMBAR (CADA LADO) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US LOMBAR (CADA LADO)' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US MAMAS (FEM / MASC)') THEN
RAISE EXCEPTION 'Procedimento US MAMAS (FEM / MASC) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US MAMAS (FEM / MASC)' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US DOOPLER ESTRUTURA ISOL') THEN
RAISE EXCEPTION 'Procedimento US DOOPLER ESTRUTURA ISOL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 190.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US DOOPLER ESTRUTURA ISOL' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US MAO') THEN
RAISE EXCEPTION 'Procedimento US MAO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US MAO' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US OBST. 1º TRIM (TV)') THEN
RAISE EXCEPTION 'Procedimento US OBST. 1º TRIM (TV) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US OBST. 1º TRIM (TV)' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US OBST. 2º, 3º TRIM') THEN
RAISE EXCEPTION 'Procedimento US OBST. 2º, 3º TRIM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US OBST. 2º, 3º TRIM' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US OBST. GEM(CADA FETO)') THEN
RAISE EXCEPTION 'Procedimento US OBST. GEM(CADA FETO) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US OBST. GEM(CADA FETO)' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US OMBRO') THEN
RAISE EXCEPTION 'Procedimento US OMBRO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US OMBRO' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US PE (FACES VOLAR E PLANTAR)') THEN
RAISE EXCEPTION 'Procedimento US PE (FACES VOLAR E PLANTAR) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US PE (FACES VOLAR E PLANTAR)' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US PAREDE ABDOM (HERNIAS)') THEN
RAISE EXCEPTION 'Procedimento US PAREDE ABDOM (HERNIAS) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US PAREDE ABDOM (HERNIAS)' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US PARTES MOLES (LESOES ESPECIFICAS)') THEN
RAISE EXCEPTION 'Procedimento US PARTES MOLES (LESOES ESPECIFICAS) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US PARTES MOLES (LESOES ESPECIFICAS)' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US PENIS') THEN
RAISE EXCEPTION 'Procedimento US PENIS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US PENIS' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US PROST. ABDOM') THEN
RAISE EXCEPTION 'Procedimento US PROST. ABDOM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US PROST. ABDOM' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US PUNHO') THEN
RAISE EXCEPTION 'Procedimento US PUNHO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US PUNHO' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US QUADRIL ADULTO (CADA LADO)') THEN
RAISE EXCEPTION 'Procedimento US QUADRIL ADULTO (CADA LADO) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US QUADRIL ADULTO (CADA LADO)' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US REGIAO CERVICAL') THEN
RAISE EXCEPTION 'Procedimento US REGIAO CERVICAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US REGIAO CERVICAL' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US REGIAO INGUINAL (HERNIA)') THEN
RAISE EXCEPTION 'Procedimento US REGIAO INGUINAL (HERNIA) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US REGIAO INGUINAL (HERNIA)' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US TIREOIDE') THEN
RAISE EXCEPTION 'Procedimento US TIREOIDE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US TIREOIDE' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US TORNOZELO') THEN
RAISE EXCEPTION 'Procedimento US TORNOZELO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US TORNOZELO' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AB INF - FEM') THEN
RAISE EXCEPTION 'Procedimento US AB INF - FEM not found';
END IF;
UPDATE procedimento SET valor_padrao = 210.00
WHERE nome = 'US AB INF - FEM';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AB INF - MASC') THEN
RAISE EXCEPTION 'Procedimento US AB INF - MASC not found';
END IF;
UPDATE procedimento SET valor_padrao = 210.00
WHERE nome = 'US AB INF - MASC';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AB SUP') THEN
RAISE EXCEPTION 'Procedimento US AB SUP not found';
END IF;
UPDATE procedimento SET valor_padrao = 210.00
WHERE nome = 'US AB SUP';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AB TOTAL') THEN
RAISE EXCEPTION 'Procedimento US AB TOTAL not found';
END IF;
UPDATE procedimento SET valor_padrao = 210.00
WHERE nome = 'US AB TOTAL';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US ANTEBRAÇO') THEN
RAISE EXCEPTION 'Procedimento US ANTEBRAÇO not found';
END IF;
UPDATE procedimento SET valor_padrao = 210.00
WHERE nome = 'US ANTEBRAÇO';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ECODOPPLER ARTERIAL (1 PERNA)') THEN
RAISE EXCEPTION 'Procedimento ECODOPPLER ARTERIAL (1 PERNA) not found';
END IF;
UPDATE procedimento SET valor_padrao = 410.00
WHERE nome = 'ECODOPPLER ARTERIAL (1 PERNA)';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AP URINÁRIO - FEM') THEN
RAISE EXCEPTION 'Procedimento US AP URINÁRIO - FEM not found';
END IF;
UPDATE procedimento SET valor_padrao = 210.00
WHERE nome = 'US AP URINÁRIO - FEM';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AP URINÁRIO - MASC') THEN
RAISE EXCEPTION 'Procedimento US AP URINÁRIO - MASC not found';
END IF;
UPDATE procedimento SET valor_padrao = 210.00
WHERE nome = 'US AP URINÁRIO - MASC';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US ARTICULAÇÃO') THEN
RAISE EXCEPTION 'Procedimento US ARTICULAÇÃO not found';
END IF;
UPDATE procedimento SET valor_padrao = 210.00
WHERE nome = 'US ARTICULAÇÃO';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ECODOPPLER ARTERIAL (2 LADOS)') THEN
RAISE EXCEPTION 'Procedimento ECODOPPLER ARTERIAL (2 LADOS) not found';
END IF;
UPDATE procedimento SET valor_padrao = 820.00
WHERE nome = 'ECODOPPLER ARTERIAL (2 LADOS)';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ECODOPPLER VENOSO (1 PERNA)') THEN
RAISE EXCEPTION 'Procedimento ECODOPPLER VENOSO (1 PERNA) not found';
END IF;
UPDATE procedimento SET valor_padrao = 410.00
WHERE nome = 'ECODOPPLER VENOSO (1 PERNA)';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ECODOPPLER VENOSO (2 LADOS)') THEN
RAISE EXCEPTION 'Procedimento ECODOPPLER VENOSO (2 LADOS) not found';
END IF;
UPDATE procedimento SET valor_padrao = 820.00
WHERE nome = 'ECODOPPLER VENOSO (2 LADOS)';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AB INF - FEM (C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US AB INF - FEM (C/ DOOPLER) not found';
END IF;
UPDATE procedimento SET valor_padrao = 290.00
WHERE nome = 'US AB INF - FEM (C/ DOOPLER)';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AB INF - MASC (C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US AB INF - MASC (C/ DOOPLER) not found';
END IF;
UPDATE procedimento SET valor_padrao = 290.00
WHERE nome = 'US AB INF - MASC (C/ DOOPLER)';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AB SUP (C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US AB SUP (C/ DOOPLER) not found';
END IF;
UPDATE procedimento SET valor_padrao = 290.00
WHERE nome = 'US AB SUP (C/ DOOPLER)';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AXILA (CADA LADO)') THEN
RAISE EXCEPTION 'Procedimento US AXILA (CADA LADO) not found';
END IF;
UPDATE procedimento SET valor_padrao = 210.00
WHERE nome = 'US AXILA (CADA LADO)';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AB TOTAL (C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US AB TOTAL (C/ DOOPLER) not found';
END IF;
UPDATE procedimento SET valor_padrao = 290.00
WHERE nome = 'US AB TOTAL (C/ DOOPLER)';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AP URINÁRIO - FEM (C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US AP URINÁRIO - FEM (C/ DOOPLER) not found';
END IF;
UPDATE procedimento SET valor_padrao = 290.00
WHERE nome = 'US AP URINÁRIO - FEM (C/ DOOPLER)';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AP URINÁRIO - MASC (C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US AP URINÁRIO - MASC (C/ DOOPLER) not found';
END IF;
UPDATE procedimento SET valor_padrao = 290.00
WHERE nome = 'US AP URINÁRIO - MASC (C/ DOOPLER)';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US BOLSA ESCROTAL (C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US BOLSA ESCROTAL (C/ DOOPLER) not found';
END IF;
UPDATE procedimento SET valor_padrao = 290.00
WHERE nome = 'US BOLSA ESCROTAL (C/ DOOPLER)';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US BOLSA ESCROTAL') THEN
RAISE EXCEPTION 'Procedimento US BOLSA ESCROTAL not found';
END IF;
UPDATE procedimento SET valor_padrao = 210.00
WHERE nome = 'US BOLSA ESCROTAL';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US DOOPLER AORTA/RENAIS') THEN
RAISE EXCEPTION 'Procedimento US DOOPLER AORTA/RENAIS not found';
END IF;
UPDATE procedimento SET valor_padrao = 290.00
WHERE nome = 'US DOOPLER AORTA/RENAIS';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US DOOPLER CAROTIDAS/VERT') THEN
RAISE EXCEPTION 'Procedimento US DOOPLER CAROTIDAS/VERT not found';
END IF;
UPDATE procedimento SET valor_padrao = 290.00
WHERE nome = 'US DOOPLER CAROTIDAS/VERT';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US COTOVELO') THEN
RAISE EXCEPTION 'Procedimento US COTOVELO not found';
END IF;
UPDATE procedimento SET valor_padrao = 210.00
WHERE nome = 'US COTOVELO';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US GINECOL. TV (C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US GINECOL. TV (C/ DOOPLER) not found';
END IF;
UPDATE procedimento SET valor_padrao = 290.00
WHERE nome = 'US GINECOL. TV (C/ DOOPLER)';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento anteriores WHERE nome = 'US MAMAS (FEM / MASC) (COM DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US MAMAS (FEM / MASC) (COM DOOPLER) not found';
END IF;
UPDATE procedimento SET valor_padrao = 290.00
WHERE nome = 'US MAMAS (FEM / MASC) (COM DOOPLER)';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US MORF. 1º TRIM (10 A 14 SEM)') THEN
RAISE EXCEPTION 'Procedimento US MORF. 1º TRIM (10 A 14 SEM) not found';
END IF;
UPDATE procedimento SET valor_padrao = 405.00
WHERE nome = 'US MORF. 1º TRIM (10 A 14 SEM)';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US MORF. 2º TRIM (20 A 24 SEM)') THEN
RAISE EXCEPTION 'Procedimento US MORF. 2º TRIM (20 A 24 SEM) not found';
END IF;
UPDATE procedimento SET valor_padrao = 405.00
WHERE nome = 'US MORF. 2º TRIM (20 A 24 SEM)';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US OBST. (C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US OBST. (C/ DOOPLER) not found';
END IF;
UPDATE procedimento SET valor_padrao = 290.00
WHERE nome = 'US OBST. (C/ DOOPLER)';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US DEDO') THEN
RAISE EXCEPTION 'Procedimento US DEDO not found';
END IF;
UPDATE procedimento SET valor_padrao = 210.00
WHERE nome = 'US DEDO';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US OBST. (C/ TN)-GEMELAR') THEN
RAISE EXCEPTION 'Procedimento US OBST. (C/ TN)-GEMELAR not found';
END IF;
UPDATE procedimento SET valor_padrao = 430.00
WHERE nome = 'US OBST. (C/ TN)-GEMELAR';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US OBST. (C/ TRANSL. NUCAL)') THEN
RAISE EXCEPTION 'Procedimento US OBST. (C/ TRANSL. NUCAL) not found';
END IF;
UPDATE procedimento SET valor_padrao = 275.00
WHERE nome = 'US OBST. (C/ TRANSL. NUCAL)';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US FIGADO E VIAS BILIARES') THEN
RAISE EXCEPTION 'Procedimento US FIGADO E VIAS BILIARES not found';
END IF;
UPDATE procedimento SET valor_padrao = 210.00
WHERE nome = 'US FIGADO E VIAS BILIARES';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US OBST. 1º TRIM (TV - C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US OBST. 1º TRIM (TV - C/ DOOPLER) not found';
END IF;
UPDATE procedimento SET valor_padrao = 290.00
WHERE nome = 'US OBST. 1º TRIM (TV - C/ DOOPLER)';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US OBST. GEM(CADA FETO) C/DOOP') THEN
RAISE EXCEPTION 'Procedimento US OBST. GEM(CADA FETO) C/DOOP not found';
END IF;
UPDATE procedimento SET valor_padrao = 290.00
WHERE nome = 'US OBST. GEM(CADA FETO) C/DOOP';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US REGIAO CERVICAL (C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US REGIAO CERVICAL (C/ DOOPLER) not found';
END IF;
UPDATE procedimento SET valor_padrao = 290.00
WHERE nome = 'US REGIAO CERVICAL (C/ DOOPLER)';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US DOOPLER AORTA/ILÍACAS') THEN
RAISE EXCEPTION 'Procedimento US DOOPLER AORTA/ILÍACAS not found';
END IF;
UPDATE procedimento SET valor_padrao = 290.00
WHERE nome = 'US DOOPLER AORTA/ILÍACAS';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US TIREOIDE (COM DOPPLER)') THEN
RAISE EXCEPTION 'Procedimento US TIREOIDE (COM DOPPLER) not found';
END IF;
UPDATE procedimento SET valor_padrao = 290.00
WHERE nome = 'US TIREOIDE (COM DOPPLER)';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US GINECOL. PELVICA (ABD INF)') THEN
RAISE EXCEPTION 'Procedimento US GINECOL. PELVICA (ABD INF) not found';
END IF;
UPDATE procedimento SET valor_padrao = 210.00
WHERE nome = 'US GINECOL. PELVICA (ABD INF)';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US GINECOL. TV') THEN
RAISE EXCEPTION 'Procedimento US GINECOL. TV not found';
END IF;
UPDATE procedimento SET valor_padrao = 210.00
WHERE nome = 'US GINECOL. TV';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US GLANDULAS SALIVARES') THEN
RAISE EXCEPTION 'Procedimento US GLANDULAS SALIVARES not found';
END IF;
UPDATE procedimento SET valor_padrao = 210.00
WHERE nome = 'US GLANDULAS SALIVARES';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US JOELHO') THEN
RAISE EXCEPTION 'Procedimento US JOELHO not found';
END IF;
UPDATE procedimento SET valor_padrao = 210.00
WHERE nome = 'US JOELHO';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US LOMBAR (CADA LADO)') THEN
RAISE EXCEPTION 'Procedimento US LOMBAR (CADA LADO) not found';
END IF;
UPDATE procedimento SET valor_padrao = 210.00
WHERE nome = 'US LOMBAR (CADA LADO)';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US DOOPLER ESTRUTURA ISOL') THEN
RAISE EXCEPTION 'Procedimento US DOOPLER ESTRUTURA ISOL not found';
END IF;
UPDATE procedimento SET valor_padrao = 290.00
WHERE nome = 'US DOOPLER ESTRUTURA ISOL';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US MAMAS (FEM / MASC)') THEN
RAISE EXCEPTION 'Procedimento US MAMAS (FEM / MASC) not found';
END IF;
UPDATE procedimento SET valor_padrao = 210.00
WHERE nome = 'US MAMAS (FEM / MASC)';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US MAO') THEN
RAISE EXCEPTION 'Procedimento US MAO not found';
END IF;
UPDATE procedimento SET valor_padrao = 210.00
WHERE nome = 'US MAO';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US OBST. 1º TRIM (TV)') THEN
RAISE EXCEPTION 'Procedimento US OBST. 1º TRIM (TV) not found';
END IF;
UPDATE procedimento SET valor_padrao = 210.00
WHERE nome = 'US OBST. 1º TRIM (TV)';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US OBST. 2º, 3º TRIM') THEN
RAISE EXCEPTION 'Procedimento US OBST. 2º, 3º TRIM not found';
END IF;
UPDATE procedimento SET valor_padrao = 210.00
WHERE nome = 'US OBST. 2º, 3º TRIM';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US OBST. GEM(CADA FETO)') THEN
RAISE EXCEPTION 'Procedimento US OBST. GEM(CADA FETO) not found';
END IF;
UPDATE procedimento SET valor_padrao = 210.00
WHERE nome = 'US OBST. GEM(CADA FETO)';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US OMBRO') THEN
RAISE EXCEPTION 'Procedimento US OMBRO not found';
END IF;
UPDATE procedimento SET valor_padrao = 210.00
WHERE nome = 'US OMBRO';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US PE (FACES VOLAR E PLANTAR)') THEN
RAISE EXCEPTION 'Procedimento US PE (FACES VOLAR E PLANTAR) not found';
END IF;
UPDATE procedimento SET valor_padrao = 210.00
WHERE nome = 'US PE (FACES VOLAR E Plantar)';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US PAREDE ABDOM (HERNIAS)') THEN
RAISE EXCEPTION 'Procedimento US PAREDE ABDOM (HERNIAS) not found';
END IF;
UPDATE procedimento SET valor_padrao = 210.00
WHERE nome = 'US PAREDE ABDOM (HERNIAS)';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US PARTES MOLES (LESOES ESPECIFICAS)') THEN
RAISE EXCEPTION 'Procedimento US PARTES MOLES (LESOES ESPECIFICAS) not found';
END IF;
UPDATE procedimento SET valor_padrao = 210.00
WHERE nome = 'US PARTES MOLES (LESOES ESPECIFICAS)';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US PENIS') THEN
RAISE EXCEPTION 'Procedimento US PENIS not found';
END IF;
UPDATE procedimento SET valor_padrao = 210.00
WHERE nome = 'US PENIS';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AB TOTAL (APENDICITE)') THEN
RAISE EXCEPTION 'Procedimento US AB TOTAL (APENDICITE) not found';
END IF;
UPDATE procedimento SET valor_padrao = 200.00
WHERE nome = 'US AB TOTAL (APENDICITE)';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US PROST. ABDOM') THEN
RAISE EXCEPTION 'Procedimento US PROST. ABDOM not found';
END IF;
UPDATE procedimento SET valor_padrao = 210.00
WHERE nome = 'US PROST. ABDOM';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US PUNHO') THEN
RAISE EXCEPTION 'Procedimento US PUNHO not found';
END IF;
UPDATE procedimento SET valor_padrao = 210.00
WHERE nome = 'US PUNHO';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US QUADRIL ADULTO (CADA LADO)') THEN
RAISE EXCEPTION 'Procedimento US QUADRIL ADULTO (CADA LADO) not found';
END IF;
UPDATE procedimento SET valor_padrao = 210.00
WHERE nome = 'US QUADRIL ADULTO (CADA LADO)';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US MAP. ENDOMETRIOSE') THEN
RAISE EXCEPTION 'Procedimento US MAP. ENDOMETRIOSE not found';
END IF;
UPDATE procedimento SET valor_padrao = 350.00
WHERE nome = 'US MAP. ENDOMETRIOSE';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US OBST. (PERFIL BIOF. FETAL)') THEN
RAISE EXCEPTION 'Procedimento US OBST. (PERFIL BIOF. FETAL) not found';
END IF;
UPDATE procedimento SET valor_padrao = 270.00
WHERE nome = 'US OBST. (PERFIL BIOF. FETAL)';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US REGIAO CERVICAL') THEN
RAISE EXCEPTION 'Procedimento US REGIAO CERVICAL not found';
END IF;
UPDATE procedimento SET valor_padrao = 210.00
WHERE nome = 'US REGIAO CERVICAL';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US REGIAO INGUINAL (HERNIA)') THEN
RAISE EXCEPTION 'Procedimento US REGIAO INGUINAL (HERNIA) not found';
END IF;
UPDATE procedimento SET valor_padrao = 210.00
WHERE nome = 'US REGIAO INGUINAL (HERNIA)';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US TIREOIDE') THEN
RAISE EXCEPTION 'Procedimento US TIREOIDE not found';
END IF;
UPDATE procedimento SET valor_padrao = 210.00
WHERE nome = 'US TIREOIDE';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US TORAXICA EXTRA-CARDIACA') THEN
RAISE EXCEPTION 'Procedimento US TORAXICA EXTRA-CARDIACA not found';
END IF;
UPDATE procedimento SET valor_padrao = 285.00
WHERE nome = 'US TORAXICA EXTRA-CARDIACA';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US TORNOZELO') THEN
RAISE EXCEPTION 'Procedimento US TORNOZELO not found';
END IF;
UPDATE procedimento SET valor_padrao = 210.00
WHERE nome = 'US TORNOZELO';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AB INF - FEM') THEN
RAISE EXCEPTION 'Procedimento US AB INF - FEM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 160.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US AB INF - FEM' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AB INF - MASC') THEN
RAISE EXCEPTION 'Procedimento US AB INF - MASC not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 160.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US AB INF - MASC' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AB SUP') THEN
RAISE EXCEPTION 'Procedimento US AB SUP not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 160.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US AB SUP' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AB TOTAL') THEN
RAISE EXCEPTION 'Procedimento US AB TOTAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 160.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US AB TOTAL' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US ANTEBRAÇO') THEN
RAISE EXCEPTION 'Procedimento US ANTEBRAÇO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 160.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US ANTEBRAÇO' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AP URINÁRIO - FEM') THEN
RAISE EXCEPTION 'Procedimento US AP URINÁRIO - FEM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 160.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US AP URINÁRIO - FEM' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AP URINÁRIO - MASC') THEN
RAISE EXCEPTION 'Procedimento US AP URINÁRIO - MASC not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 160.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US AP URINÁRIO - MASC' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US ARTICULAÇÃO') THEN
RAISE EXCEPTION 'Procedimento US ARTICULAÇÃO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 160.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US ARTICULAÇÃO' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AXILA (CADA LADO)') THEN
RAISE EXCEPTION 'Procedimento US AXILA (CADA LADO) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 160.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US AXILA (CADA LADO)' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US BOLSA ESCROTAL') THEN
RAISE EXCEPTION 'Procedimento US BOLSA ESCROTAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 160.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US BOLSA ESCROTAL' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US COTOVELO') THEN
RAISE EXCEPTION 'Procedimento US COTOVELO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 160.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US COTOVELO' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US DEDO') THEN
RAISE EXCEPTION 'Procedimento US DEDO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 160.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US DEDO' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US FIGADO E VIAS BILIARES') THEN
RAISE EXCEPTION 'Procedimento US FIGADO E VIAS BILIARES not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 160.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US FIGADO E VIAS BILIARES' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US DOOPLER AORTA/ILÍACAS') THEN
RAISE EXCEPTION 'Procedimento US DOOPLER AORTA/ILÍACAS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 190.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US DOOPLER AORTA/ILÍACAS' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US GINECOL. PELVICA (ABD INF)') THEN
RAISE EXCEPTION 'Procedimento US GINECOL. PELVICA (ABD INF) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 160.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US GINECOL. PELVICA (ABD INF)' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ECODOPPLER ARTERIAL (1 PERNA)') THEN
RAISE EXCEPTION 'Procedimento ECODOPPLER ARTERIAL (1 PERNA) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 300.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ECODOPPLER ARTERIAL (1 PERNA)' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US GINECOL. TV') THEN
RAISE EXCEPTION 'Procedimento US GINECOL. TV not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 160.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US GINECOL. TV' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US GLANDULAS SALIVARES') THEN
RAISE EXCEPTION 'Procedimento US GLANDULAS SALIVARES not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 160.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US GLANDULAS SALIVARES' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US JOELHO') THEN
RAISE EXCEPTION 'Procedimento US JOELHO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 160.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US JOELHO' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ECODOPPLER ARTERIAL (2 LADOS)') THEN
RAISE EXCEPTION 'Procedimento ECODOPPLER ARTERIAL (2 LADOS) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 600.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ECODOPPLER ARTERIAL (2 LADOS)' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ECODOPPLER VENOSO (1 PERNA)') THEN
RAISE EXCEPTION 'Procedimento ECODOPPLER VENOSO (1 PERNA) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 300.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ECODOPPLER VENOSO (1 PERNA)' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US MAP. ENDOMETRIOSE') THEN
RAISE EXCEPTION 'Procedimento US MAP. ENDOMETRIOSE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 300.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US MAP. ENDOMETRIOSE' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ECODOPPLER VENOSO (2 LADOS)') THEN
RAISE EXCEPTION 'Procedimento ECODOPPLER VENOSO (2 LADOS) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 600.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ECODOPPLER VENOSO (2 LADOS)' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US LOMBAR (CADA LADO)') THEN
RAISE EXCEPTION 'Procedimento US LOMBAR (CADA LADO) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 160.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US LOMBAR (CADA LADO)' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AB INF - FEM (C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US AB INF - FEM (C/ DOOPLER) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 210.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US AB INF - FEM (C/ DOOPLER)' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US DOOPLER ESTRUTURA ISOL') THEN
RAISE EXCEPTION 'Procedimento US DOOPLER ESTRUTURA ISOL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 250.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US DOOPLER ESTRUTURA ISOL' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US MAMAS (FEM / MASC)') THEN
RAISE EXCEPTION 'Procedimento US MAMAS (FEM / MASC) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 160.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US MAMAS (FEM / MASC)' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AB TOTAL (APENDICITE)') THEN
RAISE EXCEPTION 'Procedimento US AB TOTAL (APENDICITE) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 180.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US AB TOTAL (APENDICITE)' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US MAO') THEN
RAISE EXCEPTION 'Procedimento US MAO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 160.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US MAO' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US OBST. 1º TRIM (TV)') THEN
RAISE EXCEPTION 'Procedimento US OBST. 1º TRIM (TV) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 160.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US OBST. 1º TRIM (TV)' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AB INF - MASC (C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US AB INF - MASC (C/ DOOPLER) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 210.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US AB INF - MASC (C/ DOOPLER)' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US OBST. 2º, 3º TRIM') THEN
RAISE EXCEPTION 'Procedimento US OBST. 2º, 3º TRIM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 160.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US OBST. 2º, 3º TRIM' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AB SUP (C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US AB SUP (C/ DOOPLER) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 210.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US AB SUP (C/ DOOPLER)' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AB TOTAL (C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US AB TOTAL (C/ DOOPLER) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 210.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US AB TOTAL (C/ DOOPLER)' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AP URINÁRIO - FEM (C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US AP URINÁRIO - FEM (C/ DOOPLER) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 210.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US AP URINÁRIO - FEM (C/ DOOPLER)' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AP URINÁRIO - MASC (C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US AP URINÁRIO - MASC (C/ DOOPLER) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 210.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US AP URINÁRIO - MASC (C/ DOOPLER)' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US BOLSA ESCROTAL (C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US BOLSA ESCROTAL (C/ DOOPLER) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 190.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US BOLSA ESCROTAL (C/ DOOPLER)' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US DOOPLER AORTA/RENAIS') THEN
RAISE EXCEPTION 'Procedimento US DOOPLER AORTA/RENAIS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 250.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US DOOPLER AORTA/RENAIS' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US OBST. GEM(CADA FETO)') THEN
RAISE EXCEPTION 'Procedimento US OBST. GEM(CADA FETO) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 160.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US OBST. GEM(CADA FETO)' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US DOOPLER CAROTIDAS/VERT') THEN
RAISE EXCEPTION 'Procedimento US DOOPLER CAROTIDAS/VERT not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 250.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US DOOPLER CAROTIDAS/VERT' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US GINECOL. TV (C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US GINECOL. TV (C/ DOOPLER) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 250.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US GINECOL. TV (C/ DOOPLER)' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US MAMAS (FEM / MASC) (COM DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US MAMAS (FEM / MASC) (COM DOOPLER) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 250.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US MAMAS (FEM / MASC) (COM DOOPLER)' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US MORF. 1º TRIM (10 A 14 SEM)') THEN
RAISE EXCEPTION 'Procedimento US MORF. 1º TRIM (10 A 14 SEM) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 345.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US MORF. 1º TRIM (10 A 14 SEM)' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US MORF. 2º TRIM (20 A 24 SEM)') THEN
RAISE EXCEPTION 'Procedimento US MORF. 2º TRIM (20 A 24 SEM) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 345.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US MORF. 2º TRIM (20 A 24 SEM)' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US OBST. (C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US OBST. (C/ DOOPLER) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 210.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US OBST. (C/ DOOPLER)' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US OBST. (PERFIL BIOF. FETAL)') THEN
RAISE EXCEPTION 'Procedimento US OBST. (PERFIL BIOF. FETAL) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 250.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US OBST. (PERFIL BIOF. FETAL)' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US OBST. (C/ TN)-GEMELAR') THEN
RAISE EXCEPTION 'Procedimento US OBST. (C/ TN)-GEMELAR not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 395.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US OBST. (C/ TN)-GEMELAR' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US OMBRO') THEN
RAISE EXCEPTION 'Procedimento US OMBRO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 160.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US OMBRO' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US OBST. (C/ TRANSL. NUCAL)') THEN
RAISE EXCEPTION 'Procedimento US OBST. (C/ TRANSL. NUCAL) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 250.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US OBST. (C/ TRANSL. NUCAL)' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US PE (FACES VOLAR E PLANTAR)') THEN
RAISE EXCEPTION 'Procedimento US PE (FACES VOLAR E PLANTAR) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 160.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US PE (FACES VOLAR E PLANTAR)' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US PAREDE ABDOM (HERNIAS)') THEN
RAISE EXCEPTION 'Procedimento US PAREDE ABDOM (HERNIAS) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 160.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US PAREDE ABDOM (HERNIAS)' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US OBST. 1º TRIM (TV - C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US OBST. 1º TRIM (TV - C/ DOOPLER) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 210.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US OBST. 1º TRIM (TV - C/ DOOPLER)' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US PARTES MOLES (LESOES ESPECIFICAS)') THEN
RAISE EXCEPTION 'Procedimento US PARTES MOLES (LESOES ESPECIFICAS) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 160.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US PARTES MOLES (LESOES ESPECIFICAS)' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US OBST. GEM(CADA FETO) C/DOOP') THEN
RAISE EXCEPTION 'Procedimento US OBST. GEM(CADA FETO) C/DOOP not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 210.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US OBST. GEM(CADA FETO) C/DOOP' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US TORAXICA EXTRA-CARDIACA') THEN
RAISE EXCEPTION 'Procedimento US TORAXICA EXTRA-CARDIACA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 220.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US TORAXICA EXTRA-CARDIACA' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US REGIAO CERVICAL (C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US REGIAO CERVICAL (C/ DOOPLER) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 210.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US REGIAO CERVICAL (C/ DOOPLER)' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US TIREOIDE (COM DOPPLER)') THEN
RAISE EXCEPTION 'Procedimento US TIREOIDE (COM DOPPLER) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 210.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US TIREOIDE (COM DOPPLER)' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US PENIS') THEN
RAISE EXCEPTION 'Procedimento US PENIS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 160.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US PENIS' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US PROST. ABDOM') THEN
RAISE EXCEPTION 'Procedimento US PROST. ABDOM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 160.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US PROST. ABDOM' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US PUNHO') THEN
RAISE EXCEPTION 'Procedimento US PUNHO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 160.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US PUNHO' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US QUADRIL ADULTO (CADA LADO)') THEN
RAISE EXCEPTION 'Procedimento US QUADRIL ADULTO (CADA LADO) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 160.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US QUADRIL ADULTO (CADA LADO)' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US REGIAO CERVICAL') THEN
RAISE EXCEPTION 'Procedimento US REGIAO CERVICAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 160.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US REGIAO CERVICAL' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US REGIAO INGUINAL (HERNIA)') THEN
RAISE EXCEPTION 'Procedimento US REGIAO INGUINAL (HERNIA) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 160.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US REGIAO INGUINAL (HERNIA)' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US TIREOIDE') THEN
RAISE EXCEPTION 'Procedimento US TIREOIDE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 160.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US TIREOIDE' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US TORNOZELO') THEN
RAISE EXCEPTION 'Procedimento US TORNOZELO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 160.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US TORNOZELO' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AB INF - FEM') THEN
RAISE EXCEPTION 'Procedimento US AB INF - FEM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 130.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US AB INF - FEM' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AB INF - MASC') THEN
RAISE EXCEPTION 'Procedimento US AB INF - MASC not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 130.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US AB INF - MASC' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AB SUP') THEN
RAISE EXCEPTION 'Procedimento US AB SUP not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 130.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US AB SUP' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AB TOTAL') THEN
RAISE EXCEPTION 'Procedimento US AB TOTAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 130.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US AB TOTAL' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US ANTEBRAÇO') THEN
RAISE EXCEPTION 'Procedimento US ANTEBRAÇO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 130.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US ANTEBRAÇO' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AP URINÁRIO - FEM') THEN
RAISE EXCEPTION 'Procedimento US AP URINÁRIO - FEM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 130.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US AP URINÁRIO - FEM' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AP URINÁRIO - MASC') THEN
RAISE EXCEPTION 'Procedimento US AP URINÁRIO - MASC not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 130.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US AP URINÁRIO - MASC' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US ARTICULAÇÃO') THEN
RAISE EXCEPTION 'Procedimento US ARTICULAÇÃO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 130.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US ARTICULAÇÃO' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AXILA (CADA LADO)') THEN
RAISE EXCEPTION 'Procedimento US AXILA (CADA LADO) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 130.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US AXILA (CADA LADO)' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US MAP. ENDOMETRIOSE') THEN
RAISE EXCEPTION 'Procedimento US MAP. ENDOMETRIOSE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 220.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US MAP. ENDOMETRIOSE' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US BOLSA ESCROTAL') THEN
RAISE EXCEPTION 'Procedimento US BOLSA ESCROTAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 130.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US BOLSA ESCROTAL' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AB TOTAL (APENDICITE)') THEN
RAISE EXCEPTION 'Procedimento US AB TOTAL (APENDICITE) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 140.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US AB TOTAL (APENDICITE)' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US COTOVELO') THEN
RAISE EXCEPTION 'Procedimento US COTOVELO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 130.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US COTOVELO' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US DEDO') THEN
RAISE EXCEPTION 'Procedimento US DEDO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 130.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US DEDO' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US FIGADO E VIAS BILIARES') THEN
RAISE EXCEPTION 'Procedimento US FIGADO E VIAS BILIARES not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 130.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US FIGADO E VIAS BILIARES' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US GINECOL. PELVICA (ABD INF)') THEN
RAISE EXCEPTION 'Procedimento US GINECOL. PELVICA (ABD INF) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 160.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US GINECOL. PELVICA (ABD INF)' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US OBST. (PERFIL BIOF. FETAL)') THEN
RAISE EXCEPTION 'Procedimento US OBST. (PERFIL BIOF. FETAL) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 205.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US OBST. (PERFIL BIOF. FETAL)' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US GINECOL. TV') THEN
RAISE EXCEPTION 'Procedimento US GINECOL. TV not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 130.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US GINECOL. TV' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US GLANDULAS SALIVARES') THEN
RAISE EXCEPTION 'Procedimento US GLANDULAS SALIVARES not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 130.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US GLANDULAS SALIVARES' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US JOELHO') THEN
RAISE EXCEPTION 'Procedimento US JOELHO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 130.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US JOELHO' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US TORAXICA EXTRA-CARDIACA') THEN
RAISE EXCEPTION 'Procedimento US TORAXICA EXTRA-CARDIACA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 160.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US TORAXICA EXTRA-CARDIACA' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US LOMBAR (CADA LADO)') THEN
RAISE EXCEPTION 'Procedimento US LOMBAR (CADA LADO) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 130.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US LOMBAR (CADA LADO)' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US DOOPLER ESTRUTURA ISOL') THEN
RAISE EXCEPTION 'Procedimento US DOOPLER ESTRUTURA ISOL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 180.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US DOOPLER ESTRUTURA ISOL' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US MAMAS (FEM / MASC)') THEN
RAISE EXCEPTION 'Procedimento US MAMAS (FEM / MASC) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 130.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US MAMAS (FEM / MASC)' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US MAO') THEN
RAISE EXCEPTION 'Procedimento US MAO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 130.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US MAO' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US OBST. 1º TRIM (TV)') THEN
RAISE EXCEPTION 'Procedimento US OBST. 1º TRIM (TV) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 130.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US OBST. 1º TRIM (TV)' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US OBST. 2º, 3º TRIM') THEN
RAISE EXCEPTION 'Procedimento US OBST. 2º, 3º TRIM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 130.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US OBST. 2º, 3º TRIM' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US OBST. GEM(CADA FETO)') THEN
RAISE EXCEPTION 'Procedimento US OBST. GEM(CADA FETO) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 130.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US OBST. GEM(CADA FETO)' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US OMBRO') THEN
RAISE EXCEPTION 'Procedimento US OMBRO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 130.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US OMBRO' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US PE (FACES VOLAR E PLANTAR)') THEN
RAISE EXCEPTION 'Procedimento US PE (FACES VOLAR E PLANTAR) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 130.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US PE (FACES VOLAR E PLANTAR)' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US PAREDE ABDOM (HERNIAS)') THEN
RAISE EXCEPTION 'Procedimento US PAREDE ABDOM (HERNIAS) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 130.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US PAREDE ABDOM (HERNIAS)' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US PARTES MOLES (LESOES ESPECIFICAS)') THEN
RAISE EXCEPTION 'Procedimento US PARTES MOLES (LESOES ESPECIFICAS) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 130.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US PARTES MOLES (LESOES ESPECIFICAS)' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US PENIS') THEN
RAISE EXCEPTION 'Procedimento US PENIS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 130.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US PENIS' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ECODOPPLER ARTERIAL (1 PERNA)') THEN
RAISE EXCEPTION 'Procedimento ECODOPPLER ARTERIAL (1 PERNA) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 280.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ECODOPPLER ARTERIAL (1 PERNA)' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ECODOPPLER ARTERIAL (2 LADOS)') THEN
RAISE EXCEPTION 'Procedimento ECODOPPLER ARTERIAL (2 LADOS) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 560.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ECODOPPLER ARTERIAL (2 LADOS)' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ECODOPPLER VENOSO (1 PERNA)') THEN
RAISE EXCEPTION 'Procedimento ECODOPPLER VENOSO (1 PERNA) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 280.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ECODOPPLER VENOSO (1 PERNA)' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ECODOPPLER VENOSO (2 LADOS)') THEN
RAISE EXCEPTION 'Procedimento ECODOPPLER VENOSO (2 LADOS) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 560.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ECODOPPLER VENOSO (2 LADOS)' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AB INF - FEM (C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US AB INF - FEM (C/ DOOPLER) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 180.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US AB INF - FEM (C/ DOOPLER)' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AB INF - MASC (C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US AB INF - MASC (C/ DOOPLER) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 180.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US AB INF - MASC (C/ DOOPLER)' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AB SUP (C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US AB SUP (C/ DOOPLER) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 180.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US AB SUP (C/ DOOPLER)' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US PROST. ABDOM') THEN
RAISE EXCEPTION 'Procedimento US PROST. ABDOM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 130.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US PROST. ABDOM' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AB TOTAL (C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US AB TOTAL (C/ DOOPLER) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 180.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US AB TOTAL (C/ DOOPLER)' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AP URINÁRIO - FEM (C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US AP URINÁRIO - FEM (C/ DOOPLER) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 180.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US AP URINÁRIO - FEM (C/ DOOPLER)' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AP URINÁRIO - MASC (C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US AP URINÁRIO - MASC (C/ DOOPLER) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 180.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US AP URINÁRIO - MASC (C/ DOOPLER)' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US BOLSA ESCROTAL (C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US BOLSA ESCROTAL (C/ DOOPLER) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 180.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US BOLSA ESCROTAL (C/ DOOPLER)' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US DOOPLER AORTA/ILÍACAS') THEN
RAISE EXCEPTION 'Procedimento US DOOPLER AORTA/ILÍACAS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 280.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US DOOPLER AORTA/ILÍACAS' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US DOOPLER AORTA/RENAIS') THEN
RAISE EXCEPTION 'Procedimento US DOOPLER AORTA/RENAIS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 280.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US DOOPLER AORTA/RENAIS' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US DOOPLER CAROTIDAS/VERT') THEN
RAISE EXCEPTION 'Procedimento US DOOPLER CAROTIDAS/VERT not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 180.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US DOOPLER CAROTIDAS/VERT' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US PUNHO') THEN
RAISE EXCEPTION 'Procedimento US PUNHO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 130.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US PUNHO' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US GINECOL. TV (C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US GINECOL. TV (C/ DOOPLER) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 180.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US GINECOL. TV (C/ DOOPLER)' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US MAMAS (FEM / MASC) (COM DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US MAMAS (FEM / MASC) (COM DOOPLER) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 180.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US MAMAS (FEM / MASC) (COM DOOPLER)' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US QUADRIL ADULTO (CADA LADO)') THEN
RAISE EXCEPTION 'Procedimento US QUADRIL ADULTO (CADA LADO) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 130.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US QUADRIL ADULTO (CADA LADO)' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US MORF. 1º TRIM (10 A 14 SEM)') THEN
RAISE EXCEPTION 'Procedimento US MORF. 1º TRIM (10 A 14 SEM) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 265.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US MORF. 1º TRIM (10 A 14 SEM)' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US MORF. 2º TRIM (20 A 24 SEM)') THEN
RAISE EXCEPTION 'Procedimento US MORF. 2º TRIM (20 A 24 SEM) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 265.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US MORF. 2º TRIM (20 A 24 SEM)' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US OBST. (C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US OBST. (C/ DOOPLER) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 180.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US OBST. (C/ DOOPLER)' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US OBST. (C/ TN)-GEMELAR') THEN
RAISE EXCEPTION 'Procedimento US OBST. (C/ TN)-GEMELAR not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 350.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US OBST. (C/ TN)-GEMELAR' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US OBST. (C/ TRANSL. NUCAL)') THEN
RAISE EXCEPTION 'Procedimento US OBST. (C/ TRANSL. NUCAL) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 205.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US OBST. (C/ TRANSL. NUCAL)' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US OBST. 1º TRIM (TV - C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US OBST. 1º TRIM (TV - C/ DOOPLER) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 180.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US OBST. 1º TRIM (TV - C/ DOOPLER)' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US REGIAO CERVICAL') THEN
RAISE EXCEPTION 'Procedimento US REGIAO CERVICAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 130.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US REGIAO CERVICAL' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US OBST. GEM(CADA FETO) C/DOOP') THEN
RAISE EXCEPTION 'Procedimento US OBST. GEM(CADA FETO) C/DOOP not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 180.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US OBST. GEM(CADA FETO) C/DOOP' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;


DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US REGIAO INGUINAL (HERNIA)') THEN
RAISE EXCEPTION 'Procedimento US REGIAO INGUINAL (HERNIA) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 130.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US REGIAO INGUINAL (HERNIA)' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US TIREOIDE') THEN
RAISE EXCEPTION 'Procedimento US TIREOIDE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 130.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US TIREOIDE' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US REGIAO CERVICAL (C/ DOOPLER)') THEN
RAISE EXCEPTION 'Procedimento US REGIAO CERVICAL (C/ DOOPLER) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 180.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US REGIAO CERVICAL (C/ DOOPLER)' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US TORNOZELO') THEN
RAISE EXCEPTION 'Procedimento US TORNOZELO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 130.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US TORNOZELO' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US TIREOIDE (COM DOPPLER)') THEN
RAISE EXCEPTION 'Procedimento US TIREOIDE (COM DOPPLER) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 180.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'US TIREOIDE (COM DOPPLER)' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;