INSERT INTO convenio (nome) select 'PREFEITURA';

insert into procedimento (nome, especialidade_id) SELECT 'ASO - ADM', id from especialidade where nome like 'LAB.';
insert into procedimento (nome, especialidade_id) SELECT 'ASO - DEM', id from especialidade where nome like 'LAB.';
insert into procedimento (nome, especialidade_id) SELECT 'ASO - PER', id from especialidade where nome like 'LAB.';
insert into procedimento (nome, especialidade_id) SELECT 'ASO - RET. AO TRAB.', id from especialidade where nome like 'LAB.';
insert into procedimento (nome, especialidade_id) SELECT 'ASO - MUD. FUNÇÃO', id from especialidade where nome like 'LAB.';
insert into procedimento (nome, especialidade_id) SELECT 'ASSINATURA DE CAT', id from especialidade where nome like 'LAB.';
insert into procedimento (nome, especialidade_id) SELECT 'REMANEJAMENTO', id from especialidade where nome like 'LAB.';
insert into procedimento (nome, especialidade_id) SELECT 'ATESTADO', id from especialidade where nome like 'LAB.';
insert into procedimento (nome, especialidade_id) SELECT 'AUDIO - TRAB.', id from especialidade where nome like 'FONOAUDIOLOGA';
insert into procedimento (nome, especialidade_id) SELECT 'ACUIDADE', id from especialidade where nome like 'OFTALMOLOGISTA';
insert into procedimento (nome, especialidade_id) SELECT 'AVALIAÇÃO PSICO.', id from especialidade where nome like 'PSICÓLOGO';
insert into procedimento (nome, especialidade_id) SELECT 'RX - TORAX - 2 INC.', id from especialidade where nome like 'LAB.';
insert into procedimento (nome, especialidade_id) SELECT 'RX - COLUNA LOMBAR', id from especialidade where nome like 'LAB.';
insert into procedimento (nome, especialidade_id) SELECT 'HEMOGRAMA - TRAB.', id from especialidade where nome like 'LAB.';
insert into procedimento (nome, especialidade_id) SELECT 'GLICOSE - TRAB.', id from especialidade where nome like 'LAB.';
insert into procedimento (nome, especialidade_id) SELECT 'GAMA GT - TRAB.', id from especialidade where nome like 'LAB.';
insert into procedimento (nome, especialidade_id) SELECT 'COLINESTERASE - TRAB.', id from especialidade where nome like 'LAB.';
insert into procedimento (nome, especialidade_id) SELECT 'CREATININA - TRAB.', id from especialidade where nome like 'LAB.';
insert into procedimento (nome, especialidade_id) SELECT 'AC. HUPURICO - TRAB.', id from especialidade where nome like 'LAB.';
insert into procedimento (nome, especialidade_id) SELECT 'AC. METIL HIPURICO - TRAB.', id from especialidade where nome like 'LAB.';
insert into procedimento (nome, especialidade_id) SELECT 'AC. MANDELICO - TRAB.', id from especialidade where nome like 'LAB.';
insert into procedimento (nome, especialidade_id) SELECT 'RETICULOCITOS - TRAB.', id from especialidade where nome like 'LAB.';
insert into procedimento (nome, especialidade_id) SELECT 'VDRL - TRAB.', id from especialidade where nome like 'LAB.';
insert into procedimento (nome, especialidade_id) SELECT 'COPROCULTURA - TRAB.', id from especialidade where nome like 'LAB.';
insert into procedimento (nome, especialidade_id) SELECT 'TOXICOLÓGICO', id from especialidade where nome like 'LAB.';
insert into procedimento (nome, especialidade_id) SELECT 'HORMÔNIO TIREOESTIMULANTE (TSH)', id from especialidade where nome like 'LAB.';
insert into procedimento (nome, especialidade_id) SELECT 'GLICEMIA', id from especialidade where nome like 'LAB.';
insert into procedimento (nome, especialidade_id) SELECT 'RETICULÓCITOS', id from especialidade where nome like 'LAB.';
insert into procedimento (nome, especialidade_id) SELECT 'HEMOGRAMA', id from especialidade where nome like 'LAB.';
insert into procedimento (nome, especialidade_id) SELECT 'ACETILCOLINESTERASE ERITROCITÁRIA', id from especialidade where nome like 'LAB.';
insert into procedimento (nome, especialidade_id) SELECT 'HEPATITE B - HBSAC (ANTI-HBS)', id from especialidade where nome like 'LAB.';
insert into procedimento (nome, especialidade_id) SELECT 'PARASITOLÓGICO DE FEZES', id from especialidade where nome like 'LAB.';
insert into procedimento (nome, especialidade_id) SELECT 'ROTINA (SUMÁRIO) DE URINA', id from especialidade where nome like 'LAB.';
insert into procedimento (nome, especialidade_id) SELECT 'CULTURA DE URINA (URUCULTURA)', id from especialidade where nome like 'LAB.';
insert into procedimento (nome, especialidade_id) SELECT 'CULTURA NAS FEZES', id from especialidade where nome like 'LAB.';
insert into procedimento (nome, especialidade_id) SELECT 'AVALIAÇÃO DE PROCESSO', id from especialidade where nome like 'LAB.';

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ASO - ADM') THEN
RAISE EXCEPTION 'Procedimento ASO - ADM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 0.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ASO - ADM' and c.nome = 'MENSALISTA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ASO - DEM') THEN
RAISE EXCEPTION 'Procedimento ASO - DEM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 0.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ASO - DEM' and c.nome = 'MENSALISTA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ASO - PER') THEN
RAISE EXCEPTION 'Procedimento ASO - PER not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 0.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ASO - PER' and c.nome = 'MENSALISTA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ASO - RET. AO TRAB.') THEN
RAISE EXCEPTION 'Procedimento ASO - RET. AO TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 0.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ASO - RET. AO TRAB.' and c.nome = 'MENSALISTA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ASO - MUD. FUNÇÃO') THEN
RAISE EXCEPTION 'Procedimento ASO - MUD. FUNÇÃO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 0.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ASO - MUD. FUNÇÃO' and c.nome = 'MENSALISTA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ASSINATURA DE CAT') THEN
RAISE EXCEPTION 'Procedimento ASSINATURA DE CAT not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 100.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ASSINATURA DE CAT' and c.nome = 'MENSALISTA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'REMANEJAMENTO') THEN
RAISE EXCEPTION 'Procedimento REMANEJAMENTO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 100.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'REMANEJAMENTO' and c.nome = 'MENSALISTA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ATESTADO') THEN
RAISE EXCEPTION 'Procedimento ATESTADO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 100.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ATESTADO' and c.nome = 'MENSALISTA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AUDIO - TRAB.') THEN
RAISE EXCEPTION 'Procedimento AUDIO - TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 25.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'AUDIO - TRAB.' and c.nome = 'MENSALISTA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ACUIDADE') THEN
RAISE EXCEPTION 'Procedimento ACUIDADE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 18.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ACUIDADE' and c.nome = 'MENSALISTA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'DINA LOMBAR') THEN
RAISE EXCEPTION 'Procedimento DINA LOMBAR not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 45.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'DINA LOMBAR' and c.nome = 'MENSALISTA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'DINA PUNHO') THEN
RAISE EXCEPTION 'Procedimento DINA PUNHO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 20.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'DINA PUNHO' and c.nome = 'MENSALISTA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ECG - ELETROCARDIOGRAMA') THEN
RAISE EXCEPTION 'Procedimento ECG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 65.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ECG - ELETROCARDIOGRAMA' and c.nome = 'MENSALISTA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'EEG - ELETROENCEFALOGRAMA') THEN
RAISE EXCEPTION 'Procedimento EEG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 120.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'EEG - ELETROENCEFALOGRAMA' and c.nome = 'MENSALISTA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ESPIROMETRIA') THEN
RAISE EXCEPTION 'Procedimento ESPIRO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 55.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ESPIROMETRIA' and c.nome = 'MENSALISTA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AVALIAÇÃO PSICO.') THEN
RAISE EXCEPTION 'Procedimento AVALIAÇÃO PSICO. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 300.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'AVALIAÇÃO PSICO.' and c.nome = 'MENSALISTA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'RX - TORAX - 2 INC.') THEN
RAISE EXCEPTION 'Procedimento RX - TORAX - 2 INC. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 52.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'RX - TORAX - 2 INC.' and c.nome = 'MENSALISTA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'RX - COLUNA LOMBAR') THEN
RAISE EXCEPTION 'Procedimento RX - COLUNA LOMBAR not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 56.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'RX - COLUNA LOMBAR' and c.nome = 'MENSALISTA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'HEMOGRAMA - TRAB.') THEN
RAISE EXCEPTION 'Procedimento HEMOGRAMA - TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 13.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'HEMOGRAMA - TRAB.' and c.nome = 'MENSALISTA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'GLICOSE - TRAB.') THEN
RAISE EXCEPTION 'Procedimento GLICOSE - TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 9.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'GLICOSE - TRAB.' and c.nome = 'MENSALISTA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'GAMA GT - TRAB.') THEN
RAISE EXCEPTION 'Procedimento GAMA GT - TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 10.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'GAMA GT - TRAB.' and c.nome = 'MENSALISTA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COLINESTERASE - TRAB.') THEN
RAISE EXCEPTION 'Procedimento COLINESTERASE - TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 20.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'COLINESTERASE - TRAB.' and c.nome = 'MENSALISTA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CREATININA - TRAB.') THEN
RAISE EXCEPTION 'Procedimento CREATININA - TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 15.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CREATININA - TRAB.' and c.nome = 'MENSALISTA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AC. HUPURICO - TRAB.') THEN
RAISE EXCEPTION 'Procedimento AC. HUPURICO - TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 18.85, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'AC. HUPURICO - TRAB.' and c.nome = 'MENSALISTA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AC. METIL HIPURICO - TRAB.') THEN
RAISE EXCEPTION 'Procedimento AC. METIL HIPURICO - TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 19.60, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'AC. METIL HIPURICO - TRAB.' and c.nome = 'MENSALISTA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AC. MANDELICO - TRAB.') THEN
RAISE EXCEPTION 'Procedimento AC. MANDELICO - TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 22.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'AC. MANDELICO - TRAB.' and c.nome = 'MENSALISTA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'RETICULOCITOS - TRAB.') THEN
RAISE EXCEPTION 'Procedimento RETICULOCITOS - TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 11.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'RETICULOCITOS - TRAB.' and c.nome = 'MENSALISTA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VDRL - TRAB.') THEN
RAISE EXCEPTION 'Procedimento VDRL - TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 12.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'VDRL - TRAB.' and c.nome = 'MENSALISTA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COPROCULTURA - TRAB.') THEN
RAISE EXCEPTION 'Procedimento COPROCULTURA - TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 15.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'COPROCULTURA - TRAB.' and c.nome = 'MENSALISTA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PARASITOLÓGICO DE FEZES') THEN
RAISE EXCEPTION 'Procedimento PARASITOLOGICO DE FEZES - TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 10.50, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'PARASITOLÓGICO DE FEZES' and c.nome = 'MENSALISTA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ASO - ADM') THEN
RAISE EXCEPTION 'Procedimento ASO - ADM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 50.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ASO - ADM' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ASO - DEM') THEN
RAISE EXCEPTION 'Procedimento ASO - DEM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 50.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ASO - DEM' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ASO - PER') THEN
RAISE EXCEPTION 'Procedimento ASO - PER not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 50.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ASO - PER' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ASO - RET. AO TRAB.') THEN
RAISE EXCEPTION 'Procedimento ASO - RET. AO TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 50.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ASO - RET. AO TRAB.' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ASO - MUD. FUNÇÃO') THEN
RAISE EXCEPTION 'Procedimento ASO - MUD. FUNÇÃO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 50.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ASO - MUD. FUNÇÃO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ASSINATURA DE CAT') THEN
RAISE EXCEPTION 'Procedimento ASSINATURA DE CAT not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 155.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ASSINATURA DE CAT' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'REMANEJAMENTO') THEN
RAISE EXCEPTION 'Procedimento REMANEJAMENTO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 155.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'REMANEJAMENTO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ATESTADO') THEN
RAISE EXCEPTION 'Procedimento ATESTADO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 155.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ATESTADO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AUDIO - TRAB.') THEN
RAISE EXCEPTION 'Procedimento AUDIO - TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 25.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'AUDIO - TRAB.' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ACUIDADE') THEN
RAISE EXCEPTION 'Procedimento ACUIDADE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 20.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ACUIDADE' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'DINA LOMBAR') THEN
RAISE EXCEPTION 'Procedimento DINA LOMBAR not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 55.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'DINA LOMBAR' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'DINA PUNHO') THEN
RAISE EXCEPTION 'Procedimento DINA PUNHO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 40.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'DINA PUNHO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ECG - ELETROCARDIOGRAMA') THEN
RAISE EXCEPTION 'Procedimento ECG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 75.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ECG - ELETROCARDIOGRAMA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'EEG - ELETROENCEFALOGRAMA') THEN
RAISE EXCEPTION 'Procedimento EEG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 180.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'EEG - ELETROENCEFALOGRAMA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ESPIROMETRIA') THEN
RAISE EXCEPTION 'Procedimento ESPIRO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 65.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ESPIROMETRIA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AVALIAÇÃO PSICO.') THEN
RAISE EXCEPTION 'Procedimento AVALIAÇÃO PSICO. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 300.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'AVALIAÇÃO PSICO.' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'RX - TORAX - 2 INC.') THEN
RAISE EXCEPTION 'Procedimento RX - TORAX - 2 INC. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 72.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'RX - TORAX - 2 INC.' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'RX - COLUNA LOMBAR') THEN
RAISE EXCEPTION 'Procedimento RX - COLUNA LOMBAR not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 76.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'RX - COLUNA LOMBAR' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'HEMOGRAMA - TRAB.') THEN
RAISE EXCEPTION 'Procedimento HEMOGRAMA - TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 16.90, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'HEMOGRAMA - TRAB.' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'GLICOSE - TRAB.') THEN
RAISE EXCEPTION 'Procedimento GLICOSE - TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 14.50, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'GLICOSE - TRAB.' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'GAMA GT - TRAB.') THEN
RAISE EXCEPTION 'Procedimento GAMA GT - TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 15.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'GAMA GT - TRAB.' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COLINESTERASE - TRAB.') THEN
RAISE EXCEPTION 'Procedimento COLINESTERASE - TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 25.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'COLINESTERASE - TRAB.' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CREATININA - TRAB.') THEN
RAISE EXCEPTION 'Procedimento CREATININA - TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 18.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CREATININA - TRAB.' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AC. HUPURICO - TRAB.') THEN
RAISE EXCEPTION 'Procedimento AC. HUPURICO - TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 24.50, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'AC. HUPURICO - TRAB.' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AC. METIL HIPURICO - TRAB.') THEN
RAISE EXCEPTION 'Procedimento AC. METIL HIPURICO - TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 24.50, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'AC. METIL HIPURICO - TRAB.' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AC. MANDELICO - TRAB.') THEN
RAISE EXCEPTION 'Procedimento AC. MANDELICO - TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 24.50, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'AC. MANDELICO - TRAB.' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'RETICULOCITOS - TRAB.') THEN
RAISE EXCEPTION 'Procedimento RETICULOCITOS - TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 21.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'RETICULOCITOS - TRAB.' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VDRL - TRAB.') THEN
RAISE EXCEPTION 'Procedimento VDRL - TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 17.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'VDRL - TRAB.' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COPROCULTURA - TRAB.') THEN
RAISE EXCEPTION 'Procedimento COPROCULTURA - TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 20.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'COPROCULTURA - TRAB.' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PARASITOLÓGICO DE FEZES') THEN
RAISE EXCEPTION 'Procedimento PARASITOLOGICO DE FEZES - TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 15.50, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'PARASITOLÓGICO DE FEZES' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ASO - ADM') THEN
RAISE EXCEPTION 'Procedimento ASO - ADM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 90.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ASO - ADM' and c.nome = 'PARTICULAR' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ASO - DEM') THEN
RAISE EXCEPTION 'Procedimento ASO - DEM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 90.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ASO - DEM' and c.nome = 'PARTICULAR' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ASO - PER') THEN
RAISE EXCEPTION 'Procedimento ASO - PER not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 90.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ASO - PER' and c.nome = 'PARTICULAR' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ASO - RET. AO TRAB.') THEN
RAISE EXCEPTION 'Procedimento ASO - RET. AO TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 90.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ASO - RET. AO TRAB.' and c.nome = 'PARTICULAR' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ASO - MUD. FUNÇÃO') THEN
RAISE EXCEPTION 'Procedimento ASO - MUD. FUNÇÃO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 90.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ASO - MUD. FUNÇÃO' and c.nome = 'PARTICULAR' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ASSINATURA DE CAT') THEN
RAISE EXCEPTION 'Procedimento ASSINATURA DE CAT not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 260.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ASSINATURA DE CAT' and c.nome = 'PARTICULAR' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'REMANEJAMENTO') THEN
RAISE EXCEPTION 'Procedimento REMANEJAMENTO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 260.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'REMANEJAMENTO' and c.nome = 'PARTICULAR' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ATESTADO') THEN
RAISE EXCEPTION 'Procedimento ATESTADO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 260.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ATESTADO' and c.nome = 'PARTICULAR' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AUDIO - TRAB.') THEN
RAISE EXCEPTION 'Procedimento AUDIO - TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 45.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'AUDIO - TRAB.' and c.nome = 'PARTICULAR' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ACUIDADE') THEN
RAISE EXCEPTION 'Procedimento ACUIDADE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 35.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ACUIDADE' and c.nome = 'PARTICULAR' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'DINA LOMBAR') THEN
RAISE EXCEPTION 'Procedimento DINA LOMBAR not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 65.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'DINA LOMBAR' and c.nome = 'PARTICULAR' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'DINA PUNHO') THEN
RAISE EXCEPTION 'Procedimento DINA PUNHO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 60.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'DINA PUNHO' and c.nome = 'PARTICULAR' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ECG - ELETROCARDIOGRAMA') THEN
RAISE EXCEPTION 'Procedimento ECG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 65.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ECG - ELETROCARDIOGRAMA' and c.nome = 'PARTICULAR' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'EEG - ELETROENCEFALOGRAMA') THEN
RAISE EXCEPTION 'Procedimento EEG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 220.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'EEG - ELETROENCEFALOGRAMA' and c.nome = 'PARTICULAR' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ESPIROMETRIA') THEN
RAISE EXCEPTION 'Procedimento ESPIRO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 80.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ESPIROMETRIA' and c.nome = 'PARTICULAR' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AVALIAÇÃO PSICO.') THEN
RAISE EXCEPTION 'Procedimento AVALIAÇÃO PSICO. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 300.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'AVALIAÇÃO PSICO.' and c.nome = 'PARTICULAR' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'RX - TORAX - 2 INC.') THEN
RAISE EXCEPTION 'Procedimento RX - TORAX - 2 INC. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 85.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'RX - TORAX - 2 INC.' and c.nome = 'PARTICULAR' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'RX - COLUNA LOMBAR') THEN
RAISE EXCEPTION 'Procedimento RX - COLUNA LOMBAR not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 105.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'RX - COLUNA LOMBAR' and c.nome = 'PARTICULAR' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'HEMOGRAMA - TRAB.') THEN
RAISE EXCEPTION 'Procedimento HEMOGRAMA - TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 23.70, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'HEMOGRAMA - TRAB.' and c.nome = 'PARTICULAR' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'GLICOSE - TRAB.') THEN
RAISE EXCEPTION 'Procedimento GLICOSE - TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 19.50, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'GLICOSE - TRAB.' and c.nome = 'PARTICULAR' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'GAMA GT - TRAB.') THEN
RAISE EXCEPTION 'Procedimento GAMA GT - TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 20.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'GAMA GT - TRAB.' and c.nome = 'PARTICULAR' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COLINESTERASE - TRAB.') THEN
RAISE EXCEPTION 'Procedimento COLINESTERASE - TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 30.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'COLINESTERASE - TRAB.' and c.nome = 'PARTICULAR' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CREATININA - TRAB.') THEN
RAISE EXCEPTION 'Procedimento CREATININA - TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 23.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CREATININA - TRAB.' and c.nome = 'PARTICULAR' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AC. HUPURICO - TRAB.') THEN
RAISE EXCEPTION 'Procedimento AC. HUPURICO - TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 29.50, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'AC. HUPURICO - TRAB.' and c.nome = 'PARTICULAR' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AC. METIL HIPURICO - TRAB.') THEN
RAISE EXCEPTION 'Procedimento AC. METIL HIPURICO - TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 29.50, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'AC. METIL HIPURICO - TRAB.' and c.nome = 'PARTICULAR' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AC. MANDELICO - TRAB.') THEN
RAISE EXCEPTION 'Procedimento AC. MANDELICO - TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 29.50, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'AC. MANDELICO - TRAB.' and c.nome = 'PARTICULAR' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'RETICULOCITOS - TRAB.') THEN
RAISE EXCEPTION 'Procedimento RETICULOCITOS - TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 26.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'RETICULOCITOS - TRAB.' and c.nome = 'PARTICULAR' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VDRL - TRAB.') THEN
RAISE EXCEPTION 'Procedimento VDRL - TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 22.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'VDRL - TRAB.' and c.nome = 'PARTICULAR' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COPROCULTURA - TRAB.') THEN
RAISE EXCEPTION 'Procedimento COPROCULTURA - TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 25.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'COPROCULTURA - TRAB.' and c.nome = 'PARTICULAR' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PARASITOLÓGICO DE FEZES') THEN
RAISE EXCEPTION 'Procedimento PARASITOLOGICO DE FEZES - TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 20.50, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'PARASITOLÓGICO DE FEZES' and c.nome = 'PARTICULAR' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ASO - ADM') THEN
RAISE EXCEPTION 'Procedimento ASO - ADM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 61.33, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ASO - ADM' and c.nome = 'PREFEITURA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ASO - DEM') THEN
RAISE EXCEPTION 'Procedimento ASO - DEM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 61.33, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ASO - DEM' and c.nome = 'PREFEITURA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ASO - PER') THEN
RAISE EXCEPTION 'Procedimento ASO - PER not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 61.33, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ASO - PER' and c.nome = 'PREFEITURA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ASO - RET. AO TRAB.') THEN
RAISE EXCEPTION 'Procedimento ASO - RET. AO TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 61.33, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ASO - RET. AO TRAB.' and c.nome = 'PREFEITURA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ASO - MUD. FUNÇÃO') THEN
RAISE EXCEPTION 'Procedimento ASO - MUD. FUNÇÃO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 61.33, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ASO - MUD. FUNÇÃO' and c.nome = 'PREFEITURA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TOXICOLÓGICO') THEN
RAISE EXCEPTION 'Procedimento TOXICOLOGICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 193.33, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TOXICOLÓGICO' and c.nome = 'PREFEITURA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VDRL') THEN
RAISE EXCEPTION 'Procedimento VDRL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 25.33, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'VDRL' and c.nome = 'PREFEITURA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'HORMÔNIO TIREOESTIMULANTE (TSH)') THEN
RAISE EXCEPTION 'Procedimento HORMÔNIO TIREOESTIMULANTE (TSH) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 41.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'HORMÔNIO TIREOESTIMULANTE (TSH)' and c.nome = 'PREFEITURA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'GLICEMIA') THEN
RAISE EXCEPTION 'Procedimento GLICEMIA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 15.30, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'GLICEMIA' and c.nome = 'PREFEITURA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CREATININA') THEN
RAISE EXCEPTION 'Procedimento CREATININA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 17.13, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CREATININA' and c.nome = 'PREFEITURA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'RETICULÓCITOS') THEN
RAISE EXCEPTION 'Procedimento RETICULÓCITOS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 29.33, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'RETICULÓCITOS' and c.nome = 'PREFEITURA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'HEMOGRAMA') THEN
RAISE EXCEPTION 'Procedimento HEMOGRAMA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 18.80, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'HEMOGRAMA' and c.nome = 'PREFEITURA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TGP') THEN
RAISE EXCEPTION 'Procedimento TGP not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 17.47, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TGP' and c.nome = 'PREFEITURA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TGO') THEN
RAISE EXCEPTION 'Procedimento TGO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 16.97, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TGO' and c.nome = 'PREFEITURA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ECG - ELETROCARDIOGRAMA') THEN
RAISE EXCEPTION 'Procedimento ECG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 84.50, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ECG - ELETROCARDIOGRAMA' and c.nome = 'PREFEITURA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ACUIDADE') THEN
RAISE EXCEPTION 'Procedimento ACUIDADE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 23.30, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ACUIDADE' and c.nome = 'PREFEITURA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'EEG - ELETROENCEFALOGRAMA') THEN
RAISE EXCEPTION 'Procedimento EEG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 158.33, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'EEG - ELETROENCEFALOGRAMA' and c.nome = 'PREFEITURA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ACETILCOLINESTERASE ERITROCITÁRIA') THEN
RAISE EXCEPTION 'Procedimento ACETILCOLINESTERASE ERITROCITÁRIA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 47.67, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ACETILCOLINESTERASE ERITROCITÁRIA' and c.nome = 'PREFEITURA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'HEPATITE B - HBSAC (ANTI-HBS)') THEN
RAISE EXCEPTION 'Procedimento HEPATITE B - HBSAC (ANTI-HBS) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 42.50, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'HEPATITE B - HBSAC (ANTI-HBS)' and c.nome = 'PREFEITURA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AUDIO - TRAB.') THEN
RAISE EXCEPTION 'Procedimento AUDIO - TRAB. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 39.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'AUDIO - TRAB.' and c.nome = 'PREFEITURA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'GAMA GT') THEN
RAISE EXCEPTION 'Procedimento GAMA GT not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 19.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'GAMA GT' and c.nome = 'PREFEITURA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PARASITOLÓGICO DE FEZES') THEN
RAISE EXCEPTION 'Procedimento PARASITOLOGICO DE FEZES not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 18.30, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'PARASITOLÓGICO DE FEZES' and c.nome = 'PREFEITURA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'UREIA') THEN
RAISE EXCEPTION 'Procedimento UREIA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 13.97, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'UREIA' and c.nome = 'PREFEITURA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AVALIAÇÃO PSICO.') THEN
RAISE EXCEPTION 'Procedimento AVALIAÇÃO PSICO. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 198.33, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'AVALIAÇÃO PSICO.' and c.nome = 'PREFEITURA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ROTINA (SUMÁRIO) DE URINA') THEN
RAISE EXCEPTION 'Procedimento ROTINA (SUMÁRIO) DE URINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 25.83, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ROTINA (SUMÁRIO) DE URINA' and c.nome = 'PREFEITURA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULTURA DE URINA (URUCULTURA)') THEN
RAISE EXCEPTION 'Procedimento CULTURA DE URINA (URUCULTURA) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 32.80, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULTURA DE URINA (URUCULTURA)' and c.nome = 'PREFEITURA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ESPIROMETRIA') THEN
RAISE EXCEPTION 'Procedimento ESPIRO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 73.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ESPIROMETRIA' and c.nome = 'PREFEITURA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULTURA NAS FEZES') THEN
RAISE EXCEPTION 'Procedimento CULTURA NAS FEZES not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 33.13, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULTURA NAS FEZES' and c.nome = 'PREFEITURA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TRIGLICERIDEOS') THEN
RAISE EXCEPTION 'Procedimento TRIGLICERIDEOS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 16.80, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TRIGLICERIDEOS' and c.nome = 'PREFEITURA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ATESTADO') THEN
RAISE EXCEPTION 'Procedimento ATESTADO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 58.33, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ATESTADO' and c.nome = 'PREFEITURA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'RX - COLUNA LOMBAR') THEN
RAISE EXCEPTION 'Procedimento RX - COLUNA LOMBAR not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 91.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'RX - COLUNA LOMBAR' and c.nome = 'PREFEITURA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'REMANEJAMENTO') THEN
RAISE EXCEPTION 'Procedimento REMANEJAMENTO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 123.33, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'REMANEJAMENTO' and c.nome = 'PREFEITURA' and u.nome = 'Garuva';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AVALIAÇÃO DE PROCESSO') THEN
RAISE EXCEPTION 'Procedimento AVALIAÇÃO DE PROCESSO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 123.33, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'AVALIAÇÃO DE PROCESSO' and c.nome = 'PREFEITURA' and u.nome = 'Garuva';
END $$;