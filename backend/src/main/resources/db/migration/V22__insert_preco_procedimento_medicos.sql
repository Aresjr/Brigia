insert into especialidade (nome) SELECT 'DERMATOLOGISTA - CURETAGEM CORPO';
insert into procedimento (nome, especialidade_id) SELECT 'CURETAGEM 1 LESÃO GRANDE OU 05 LESÕES PEQUENAS', id from especialidade where nome like 'DERMATOLOGISTA - CURETAGEM ROSTO';
insert into procedimento (nome, especialidade_id) SELECT 'VALOR A CADA 05 LESÕES SE TIVER + VER VALOR C/DR', id from especialidade where nome like 'DERMATOLOGISTA - CURETAGEM CORPO';

insert into procedimento (nome, especialidade_id) SELECT 'ATÉ 05', id from especialidade where nome like 'DERMATOLOGISTA - CRIOTERAPIA';

insert into especialidade (nome) SELECT 'DERMATOLOGISTA - INCISÃO LESÃO - CORPO';
insert into procedimento (nome, especialidade_id) SELECT 'INCISÃO LESÃO - CORPO', id from especialidade where nome like 'DERMATOLOGISTA - INCISÃO LESÃO - CORPO';

insert into especialidade (nome) SELECT 'GINECOLOGISTA - PRE NATAL';
insert into procedimento (nome, especialidade_id) SELECT 'CONSULTA PRE NATAL', id from especialidade where nome like 'GINECOLOGISTA - PRE NATAL';

insert into procedimento (nome, especialidade_id) SELECT 'PREV +CONSULTA', id from especialidade where nome like 'GINECOLOGISTA + PREVENTIVO';

insert into especialidade (nome) SELECT 'ORTOPEDISTA / INFILTRAÇAO';
insert into procedimento (nome, especialidade_id) SELECT 'INFILTRAÇAO', id from especialidade where nome like 'ORTOPEDISTA / INFILTRAÇAO';

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ECG + CONSULTA') THEN
RAISE EXCEPTION 'Procedimento ECG + CONSULTA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 205.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ECG + CONSULTA' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ECG + CONSULTA') THEN
RAISE EXCEPTION 'Procedimento ECG@k + CONSULTA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 245.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ECG + CONSULTA' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ECG + CONSULTA') THEN
RAISE EXCEPTION 'Procedimento ECG + CONSULTA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 285.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ECG + CONSULTA' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ECG + CONSULTA') THEN
RAISE EXCEPTION 'Procedimento ECG + CONSULTA not found';
END IF;
UPDATE procedimento SET valor_padrao = 360.00
WHERE nome = 'ECG + CONSULTA';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'EXAME ECOCARDIOGRAMA') THEN
RAISE EXCEPTION 'Procedimento EXAME ECOCARDIOGRAMA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 240.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'EXAME ECOCARDIOGRAMA' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'EXAME ECOCARDIOGRAMA') THEN
RAISE EXCEPTION 'Procedimento EXAME ECOCARDIOGRAMA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 250.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'EXAME ECOCARDIOGRAMA' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'EXAME ECOCARDIOGRAMA') THEN
RAISE EXCEPTION 'Procedimento EXAME ECOCARDIOGRAMA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 270.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'EXAME ECOCARDIOGAMMA' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'EXAME ECOCARDIOGRAMA') THEN
RAISE EXCEPTION 'Procedimento EXAME ECOCARDIOGRAMA not found';
END IF;
UPDATE procedimento SET valor_padrao = 340.00
WHERE nome = 'EXAME ECOCARDIOGRAMA';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA CARDIOLOGISTA') THEN
RAISE EXCEPTION 'Procedimento CONSULTA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 140.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CONSULTA CARDIOLOGISTA' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA CARDIOLOGISTA') THEN
RAISE EXCEPTION 'Procedimento CONSULTA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 180.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CONSULTA CARDIOLOGISTA' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA CARDIOLOGISTA') THEN
RAISE EXCEPTION 'Procedimento CONSULTA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 215.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CONSULTA CARDIOLOGISTA' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA CARDIOLOGISTA') THEN
RAISE EXCEPTION 'Procedimento CONSULTA not found';
END IF;
UPDATE procedimento SET valor_padrao = 280.00
WHERE nome = 'CONSULTA CARDIOLOGISTA';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA CLINICO GERAL') THEN
RAISE EXCEPTION 'Procedimento CONSULTA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 100.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CONSULTA CLINICO GERAL' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA CLINICO GERAL') THEN
RAISE EXCEPTION 'Procedimento CONSULTA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 120.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CONSULTA CLINICO GERAL' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA CLINICO GERAL') THEN
RAISE EXCEPTION 'Procedimento CONSULTA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CONSULTA CLINICO GERAL' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA CLINICO GERAL') THEN
RAISE EXCEPTION 'Procedimento CONSULTA not found';
END IF;
UPDATE procedimento SET valor_padrao = 220.00
WHERE nome = 'CONSULTA CLINICO GERAL';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA DERMATOLOGISTA') THEN
RAISE EXCEPTION 'Procedimento CONSULTA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 140.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CONSULTA DERMATOLOGISTA' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA DERMATOLOGISTA') THEN
RAISE EXCEPTION 'Procedimento CONSULTA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 180.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CONSULTA DERMATOLOGISTA' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA DERMATOLOGISTA') THEN
RAISE EXCEPTION 'Procedimento CONSULTA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 210.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CONSULTA DERMATOLOGISTA' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA DERMATOLOGISTA') THEN
RAISE EXCEPTION 'Procedimento CONSULTA not found';
END IF;
UPDATE procedimento SET valor_padrao = 280.00
WHERE nome = 'CONSULTA DERMATOLOGISTA';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CURETAGEM 1 LESÃO GRANDE OU 05 LESÕES PEQUENAS') THEN
RAISE EXCEPTION 'Procedimento CURETAGEM 1 LESÃO GRANDE OU 05 LESÕES PEQUENAS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 380.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CURETAGEM 1 LESÃO GRANDE OU 05 LESÕES PEQUENAS' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CURETAGEM 1 LESÃO GRANDE OU 05 LESÕES PEQUENAS') THEN
RAISE EXCEPTION 'Procedimento CURETAGEM 1 LESÃO GRANDE OU 05 LESÕES PEQUENAS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 440.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CURETAGEM 1 LESÃO GRANDE OU 05 LESÕES PEQUENAS' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CURETAGEM 1 LESÃO GRANDE OU 05 LESÕES PEQUENAS') THEN
RAISE EXCEPTION 'Procedimento CURETAGEM 1 LESÃO GRANDE OU 05 LESÕES PEQUENAS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 480.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CURETAGEM 1 LESÃO GRANDE OU 05 LESÕES PEQUENAS' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CURETAGEM 1 LESÃO GRANDE OU 05 LESÕES PEQUENAS') THEN
RAISE EXCEPTION 'Procedimento CURETAGEM 1 LESÃO GRANDE OU 05 LESÕES PEQUENAS not found';
END IF;
UPDATE procedimento SET valor_padrao = 520.00
WHERE nome = 'CURETAGEM 1 LESÃO GRANDE OU 05 LESÕES PEQUENAS';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VALOR A CADA 05 LESÕES SE TIVER + VER VALOR C/DR') THEN
RAISE EXCEPTION 'Procedimento VALOR A CADA 05 LESÕES SE TIVER + VER VALOR C/DR not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 120.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'VALOR A CADA 05 LESÕES SE TIVER + VER VALOR C/DR' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VALOR A CADA 05 LESÕES SE TIVER + VER VALOR C/DR') THEN
RAISE EXCEPTION 'Procedimento VALOR A CADA 05 LESÕES SE TIVER + VER VALOR C/DR not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 120.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'VALOR A CADA 05 LESÕES SE TIVER + VER VALOR C/DR' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VALOR A CADA 05 LESÕES SE TIVER + VER VALOR C/DR') THEN
RAISE EXCEPTION 'Procedimento VALOR A CADA 05 LESÕES SE TIVER + VER VALOR C/DR not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'VALOR A CADA 05 LESÕES SE TIVER + VER VALOR C/DR' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VALOR A CADA 05 LESÕES SE TIVER + VER VALOR C/DR') THEN
RAISE EXCEPTION 'Procedimento VALOR A CADA 05 LESÕES SE TIVER + VER VALOR C/DR not found';
END IF;
UPDATE procedimento SET valor_padrao = 170.00
WHERE nome = 'VALOR A CADA 05 LESÕES SE TIVER + VER VALOR C/DR';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ATÉ 05') THEN
RAISE EXCEPTION 'Procedimento ATÉ 05 not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 340.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ATÉ 05' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ATÉ 05') THEN
RAISE EXCEPTION 'Procedimento ATÉ 05 not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 360.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ATÉ 05' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ATÉ 05') THEN
RAISE EXCEPTION 'Procedimento ATÉ 05 not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 400.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ATÉ 05' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ATÉ 05') THEN
RAISE EXCEPTION 'Procedimento ATÉ 05 not found';
END IF;
UPDATE procedimento SET valor_padrao = 460.00
WHERE nome = 'ATÉ 05';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'INCISÃO LESÃO - ROSTO') THEN
RAISE EXCEPTION 'Procedimento INCISÃO LESÃO - ROSTO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 400.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'INCISÃO LESÃO - ROSTO' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'INCISÃO LESÃO - ROSTO') THEN
RAISE EXCEPTION 'Procedimento INCISÃO LESÃO - ROSTO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 450.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'INCISÃO LESÃO - ROSTO' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'INCISÃO LESÃO - ROSTO') THEN
RAISE EXCEPTION 'Procedimento INCISÃO LESÃO - ROSTO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 500.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'INCISÃO LESÃO - ROSTO' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'INCISÃO LESÃO - ROSTO') THEN
RAISE EXCEPTION 'Procedimento INCISÃO LESÃO - ROSTO not found';
END IF;
UPDATE procedimento SET valor_padrao = 600.00
WHERE nome = 'INCISÃO LESÃO - ROSTO';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'INCISÃO LESÃO - CORPO') THEN
RAISE EXCEPTION 'Procedimento INCISÃO LESÃO - CORPO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 400.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'INCISÃO LESÃO - CORPO' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'INCISÃO LESÃO - CORPO') THEN
RAISE EXCEPTION 'Procedimento INCISÃO LESÃO - CORPO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 450.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'INCISÃO LESÃO - CORPO' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'INCISÃO LESÃO - CORPO') THEN
RAISE EXCEPTION 'Procedimento INCISÃO LESÃO - CORPO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 500.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'INCISÃO LESÃO - CORPO' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'INCISÃO LESÃO - CORPO') THEN
RAISE EXCEPTION 'Procedimento INCISÃO LESÃO - CORPO not found';
END IF;
UPDATE procedimento SET valor_padrao = 600.00
WHERE nome = 'INCISÃO LESÃO - CORPO';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA GINECOLOGISTA') THEN
RAISE EXCEPTION 'Procedimento CONSULTA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 140.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CONSULTA GINECOLOGISTA' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA GINECOLOGISTA') THEN
RAISE EXCEPTION 'Procedimento CONSULTA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 180.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CONSULTA GINECOLOGISTA' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA GINECOLOGISTA') THEN
RAISE EXCEPTION 'Procedimento CONSULTA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 200.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CONSULTA GINECOLOGISTA' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA GINECOLOGISTA') THEN
RAISE EXCEPTION 'Procedimento CONSULTA not found';
END IF;
UPDATE procedimento SET valor_padrao = 280.00
WHERE nome = 'CONSULTA GINECOLOGISTA';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA PRE NATAL') THEN
RAISE EXCEPTION 'Procedimento CONSULTA PRE NATAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 140.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CONSULTA PRE NATAL' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA PRE NATAL') THEN
RAISE EXCEPTION 'Procedimento CONSULTA PRE NATAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 180.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CONSULTA PRE NATAL' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA PRE NATAL') THEN
RAISE EXCEPTION 'Procedimento CONSULTA PRE NATAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 200.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CONSULTA PRE NATAL' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA PRE NATAL') THEN
RAISE EXCEPTION 'Procedimento CONSULTA PRE NATAL not found';
END IF;
UPDATE procedimento SET valor_padrao = 280.00
WHERE nome = 'CONSULTA PRE NATAL';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PREV +CONSULTA') THEN
RAISE EXCEPTION 'Procedimento PREV +CONSULTA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 190.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'PREV +CONSULTA' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PREV +CONSULTA') THEN
RAISE EXCEPTION 'Procedimento PREV +CONSULTA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 230.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'PREV +CONSULTA' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PREV +CONSULTA') THEN
RAISE EXCEPTION 'Procedimento PREV +CONSULTA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 300.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'PREV +CONSULTA' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PREV +CONSULTA') THEN
RAISE EXCEPTION 'Procedimento PREV +CONSULTA not found';
END IF;
UPDATE procedimento SET valor_padrao = 350.00
WHERE nome = 'PREV +CONSULTA';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COLOCAÇÃO DIU (não incluso DIU)') THEN
RAISE EXCEPTION 'Procedimento COLOCAÇÃO DIU (não incluso DIU) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 845.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'COLOCAÇÃO DIU (não incluso DIU)' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COLOCAÇÃO DIU (não incluso DIU)') THEN
RAISE EXCEPTION 'Procedimento COLOCAÇÃO DIU (não incluso DIU) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 860.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'COLOCAÇÃO DIU (não incluso DIU)' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COLOCAÇÃO DIU (não incluso DIU)') THEN
RAISE EXCEPTION 'Procedimento COLOCAÇÃO DIU (não incluso DIU) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 1000.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'COLOCAÇÃO DIU (não incluso DIU)' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COLOCAÇÃO DIU (não incluso DIU)') THEN
RAISE EXCEPTION 'Procedimento COLOCAÇÃO DIU (não incluso DIU) not found';
END IF;
UPDATE procedimento SET valor_padrao = 1200.00
WHERE nome = 'COLOCAÇÃO DIU (não incluso DIU)';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONS + RET DO DIU') THEN
RAISE EXCEPTION 'Procedimento CONS + RET DO DIU not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 240.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CONS + RET DO DIU' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONS + RET DO DIU') THEN
RAISE EXCEPTION 'Procedimento CONS + RET DO DIU not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 280.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CONS + RET DO DIU' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONS + RET DO DIU') THEN
RAISE EXCEPTION 'Procedimento CONS + RET DO DIU not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 300.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CONS + RET DO DIU' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONS + RET DO DIU') THEN
RAISE EXCEPTION 'Procedimento CONS + RET DO DIU not found';
END IF;
UPDATE procedimento SET valor_padrao = 380.00
WHERE nome = 'CONS + RET DO DIU';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COLOCAÇÃO IMPLANON (não incluso implanon)') THEN
RAISE EXCEPTION 'Procedimento COLOCAÇÃO IMPLANON (não incluso implanon) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 845.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'COLOCAÇÃO IMPLANON (não incluso implanon)' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COLOCAÇÃO IMPLANON (não incluso implanon)') THEN
RAISE EXCEPTION 'Procedimento COLOCAÇÃO IMPLANON (não incluso implanon) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 860.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'COLOCAÇÃO IMPLANON (não incluso implanon)' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COLOCAÇÃO IMPLANON (não incluso implanon)') THEN
RAISE EXCEPTION 'Procedimento COLOCAÇÃO IMPLANON (não incluso implanon) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 1000.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'COLOCAÇÃO IMPLANON (não incluso implanon)' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COLOCAÇÃO IMPLANON (não incluso implanon)') THEN
RAISE EXCEPTION 'Procedimento COLOCAÇÃO IMPLANON (não incluso implanon) not found';
END IF;
UPDATE procedimento SET valor_padrao = 1200.00
WHERE nome = 'COLOCAÇÃO IMPLANON (não incluso implanon)';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONS + RET DO IMPLANON') THEN
RAISE EXCEPTION 'Procedimento CONS + RET DO IMPLANON not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 240.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CONS + RET DO IMPLANON' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONS + RET DO IMPLANON') THEN
RAISE EXCEPTION 'Procedimento CONS + RET DO IMPLANON not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 280.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CONS + RET DO IMPLANON' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONS + RET DO IMPLANON') THEN
RAISE EXCEPTION 'Procedimento CONS + RET DO IMPLANON not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 300.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CONS + RET DO IMPLANON' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONS + RET DO IMPLANON') THEN
RAISE EXCEPTION 'Procedimento CONS + RET DO IMPLANON not found';
END IF;
UPDATE procedimento SET valor_padrao = 380.00
WHERE nome = 'CONS + RET DO IMPLANON';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'RETI DO DIU - PCTE DRA') THEN
RAISE EXCEPTION 'Procedimento RETI DO DIU - PCTE DRA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'RETI DO DIU - PCTE DRA' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'RETI DO DIU - PCTE DRA') THEN
RAISE EXCEPTION 'Procedimento RETI DO DIU - PCTE DRA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'RETI DO DIU - PCTE DRA' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'RETI DO DIU - PCTE DRA') THEN
RAISE EXCEPTION 'Procedimento RETI DO DIU - PCTE DRA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'RETI DO DIU - PCTE DRA' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'RETI DO DIU - PCTE DRA') THEN
RAISE EXCEPTION 'Procedimento RETI DO DIU - PCTE DRA not found';
END IF;
UPDATE procedimento SET valor_padrao = 150.00
WHERE nome = 'RETI DO DIU - PCTE DRA';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA NEUROLOGISTA') THEN
RAISE EXCEPTION 'Procedimento CONSULTA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 190.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CONSULTA NEUROLOGISTA' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA NEUROLOGISTA') THEN
RAISE EXCEPTION 'Procedimento CONSULTA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 220.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CONSULTA NEUROLOGISTA' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA NEUROLOGISTA') THEN
RAISE EXCEPTION 'Procedimento CONSULTA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 260.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CONSULTA NEUROLOGISTA' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA NEUROLOGISTA') THEN
RAISE EXCEPTION 'Procedimento CONSULTA not found';
END IF;
UPDATE procedimento SET valor_padrao = 300.00
WHERE nome = 'CONSULTA NEUROLOGISTA';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA NUTRICIONISTA') THEN
RAISE EXCEPTION 'Procedimento CONSULTA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 140.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CONSULTA NUTRICIONISTA' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA NUTRICIONISTA') THEN
RAISE EXCEPTION 'Procedimento CONSULTA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 180.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CONSULTA NUTRICIONISTA' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA NUTRICIONISTA') THEN
RAISE EXCEPTION 'Procedimento CONSULTA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 200.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CONSULTA NUTRICIONISTA' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA NUTRICIONISTA') THEN
RAISE EXCEPTION 'Procedimento CONSULTA not found';
END IF;
UPDATE procedimento SET valor_padrao = 280.00
WHERE nome = 'CONSULTA NUTRICIONISTA';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BIOPEDANCIA') THEN
RAISE EXCEPTION 'Procedimento BIOPEDANCIA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 85.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'BIOPEDANCIA' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BIOPEDANCIA') THEN
RAISE EXCEPTION 'Procedimento BIOPEDANCIA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 100.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'BIOPEDANCIA' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BIOPEDANCIA') THEN
RAISE EXCEPTION 'Procedimento BIOPEDANCIA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 110.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'BIOPEDANCIA' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BIOPEDANCIA') THEN
RAISE EXCEPTION 'Procedimento BIOPEDANCIA not found';
END IF;
UPDATE procedimento SET valor_padrao = 130.00
WHERE nome = 'BIOPEDANCIA';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA OFTALMOLOGISTA') THEN
RAISE EXCEPTION 'Procedimento CONSULTA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 160.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CONSULTA OFTALMOLOGISTA' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA OFTALMOLOGISTA') THEN
RAISE EXCEPTION 'Procedimento CONSULTA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 180.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CONSULTA OFTALMOLOGISTA' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA OFTALMOLOGISTA') THEN
RAISE EXCEPTION 'Procedimento CONSULTA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 200.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CONSULTA OFTALMOLOGISTA' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA OFTALMOLOGISTA') THEN
RAISE EXCEPTION 'Procedimento CONSULTA not found';
END IF;
UPDATE procedimento SET valor_padrao = 280.00
WHERE nome = 'CONSULTA OFTALMOLOGISTA';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA ORTOPEDISTA') THEN
RAISE EXCEPTION 'Procedimento CONSULTA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 140.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CONSULTA ORTOPEDISTA' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA ORTOPEDISTA') THEN
RAISE EXCEPTION 'Procedimento CONSULTA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 180.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CONSULTA ORTOPEDISTA' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA ORTOPEDISTA') THEN
RAISE EXCEPTION 'Procedimento CONSULTA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 200.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CONSULTA ORTOPEDISTA' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA ORTOPEDISTA') THEN
RAISE EXCEPTION 'Procedimento CONSULTA not found';
END IF;
UPDATE procedimento SET valor_padrao = 280.00
WHERE nome = 'CONSULTA ORTOPEDISTA';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'INFILTRAÇAO') THEN
RAISE EXCEPTION 'Procedimento INFILTRAÇAO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 290.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'INFILTRAÇAO' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'INFILTRAÇAO') THEN
RAISE EXCEPTION 'Procedimento INFILTRAÇAO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 320.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'INFILTRAÇAO' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'INFILTRAÇAO') THEN
RAISE EXCEPTION 'Procedimento INFILTRAÇAO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 350.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'INFILTRAÇAO' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'INFILTRAÇAO') THEN
RAISE EXCEPTION 'Procedimento INFILTRAÇAO not found';
END IF;
UPDATE procedimento SET valor_padrao = 390.00
WHERE nome = 'INFILTRAÇAO';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA OTORRINO') THEN
RAISE EXCEPTION 'Procedimento CONSULTA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 140.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CONSULTA OTORRINO' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA OTORRINO') THEN
RAISE EXCEPTION 'Procedimento CONSULTA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 180.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CONSULTA OTORRINO' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA OTORRINO') THEN
RAISE EXCEPTION 'Procedimento CONSULTA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 200.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CONSULTA OTORRINO' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA OTORRINO') THEN
RAISE EXCEPTION 'Procedimento CONSULTA not found';
END IF;
UPDATE procedimento SET valor_padrao = 280.00
WHERE nome = 'CONSULTA OTORRINO';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA VASCULAR') THEN
RAISE EXCEPTION 'Procedimento CONSULTA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 140.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CONSULTA VASCULAR' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA VASCULAR') THEN
RAISE EXCEPTION 'Procedimento CONSULTA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 180.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CONSULTA VASCULAR' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA VASCULAR') THEN
RAISE EXCEPTION 'Procedimento CONSULTA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 200.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CONSULTA VASCULAR' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA VASCULAR') THEN
RAISE EXCEPTION 'Procedimento CONSULTA not found';
END IF;
UPDATE procedimento SET valor_padrao = 280.00
WHERE nome = 'CONSULTA VASCULAR';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'APLICAÇÃO DE VARICOSE') THEN
RAISE EXCEPTION 'Procedimento APLICAÇÃO DE VARICOSE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 235.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'APLICAÇÃO DE VARICOSE' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'APLICAÇÃO DE VARICOSE') THEN
RAISE EXCEPTION 'Procedimento APLICAÇÃO DE VARICOSE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 235.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'APLICAÇÃO DE VARICOSE' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'APLICAÇÃO DE VARICOSE') THEN
RAISE EXCEPTION 'Procedimento APLICAÇÃO DE VARICOSE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 255.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'APLICAÇÃO DE VARICOSE' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'APLICAÇÃO DE VARICOSE') THEN
RAISE EXCEPTION 'Procedimento APLICAÇÃO DE VARICOSE not found';
END IF;
UPDATE procedimento SET valor_padrao = 280.00
WHERE nome = 'APLICAÇÃO DE VARICOSE';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'APLICAÇÃO DE ESPUMA') THEN
RAISE EXCEPTION 'Procedimento APLICAÇÃO DE ESPUMA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 380.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'APLICAÇÃO DE ESPUMA' and c.nome = 'VALE MAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'APLICAÇÃO DE ESPUMA') THEN
RAISE EXCEPTION 'Procedimento APLICAÇÃO DE ESPUMA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 380.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'APLICAÇÃO DE ESPUMA' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'APLICAÇÃO DE ESPUMA') THEN
RAISE EXCEPTION 'Procedimento APLICAÇÃO DE ESPUMA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 400.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'APLICAÇÃO DE ESPUMA' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'APLICAÇÃO DE ESPUMA') THEN
RAISE EXCEPTION 'Procedimento APLICAÇÃO DE ESPUMA not found';
END IF;
UPDATE procedimento SET valor_padrao = 430.00
WHERE nome = 'APLICAÇÃO DE ESPUMA';
END $$;