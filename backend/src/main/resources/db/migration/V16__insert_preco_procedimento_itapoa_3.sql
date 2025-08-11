insert into procedimento (codigo, nome, especialidade_id) SELECT null,'CITOMEGALOVIRUS IgM', id from especialidade where nome like 'LAB.';

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CISTICERCOSE, AC') THEN
RAISE EXCEPTION 'Procedimento CISTICERCOSE, AC not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 34, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CISTICERCOSE, AC' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CISTICERCOSE, AC') THEN
RAISE EXCEPTION 'Procedimento CISTICERCOSE, AC not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 39, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CISTICERCOSE, AC' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CISTICERCOSE, AC') THEN
RAISE EXCEPTION 'Procedimento CISTICERCOSE, AC not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 44, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CISTICERCOSE, AC' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CITO IGG') THEN
RAISE EXCEPTION 'Procedimento CITO IGG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 40, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CITO IGG' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CITO IGG') THEN
RAISE EXCEPTION 'Procedimento CITO IGG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 45, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CITO IGG' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CITO IGG') THEN
RAISE EXCEPTION 'Procedimento CITO IGG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 50, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CITO IGG' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CITO IGM') THEN
RAISE EXCEPTION 'Procedimento CITO IGM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 36, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CITO IGM' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CITO IGM') THEN
RAISE EXCEPTION 'Procedimento CITO IGM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 41, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CITO IGM' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CITO IGM') THEN
RAISE EXCEPTION 'Procedimento CITO IGM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 46, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CITO IGM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CITOMEGALOVIRUS IgG') THEN
RAISE EXCEPTION 'Procedimento CITOMEGALOVIRUS IgG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 40, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CITOMEGALOVIRUS IgG' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CITOMEGALOVIRUS IgG') THEN
RAISE EXCEPTION 'Procedimento CITOMEGALOVIRUS IgG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 45, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CITOMEGALOVIRUS IgG' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CITOMEGALOVIRUS IgG') THEN
RAISE EXCEPTION 'Procedimento CITOMEGALOVIRUS IgG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 50, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CITOMEGALOVIRUS IgG' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CITOMEGALOVIRUS IgM') THEN
RAISE EXCEPTION 'Procedimento CITOMEGALOVIRUS IgM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 36, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CITOMEGALOVIRUS IgM' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CITOMEGALOVIRUS IgM') THEN
RAISE EXCEPTION 'Procedimento CITOMEGALOVIRUS IgM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 41, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CITOMEGALOVIRUS IgM' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CITOMEGALOVIRUS IgM') THEN
RAISE EXCEPTION 'Procedimento CITOMEGALOVIRUS IgM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 46, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CITOMEGALOVIRUS IgM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CK - MB') THEN
RAISE EXCEPTION 'Procedimento CK - MB not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 22, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CK - MB' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CK - MB') THEN
RAISE EXCEPTION 'Procedimento CK - MB not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 27, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CK - MB' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CK - MB') THEN
RAISE EXCEPTION 'Procedimento CK - MB not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 32, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CK - MB' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CLEARANCE DE CREATININA') THEN
RAISE EXCEPTION 'Procedimento CLEARANCE DE CREATININA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 24, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CLEARANCE DE CREATININA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CLEARANCE DE CREATININA') THEN
RAISE EXCEPTION 'Procedimento CLEARANCE DE CREATININA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 29, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CLEARANCE DE CREATININA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CLEARANCE DE CREATININA') THEN
RAISE EXCEPTION 'Procedimento CLEARANCE DE CREATININA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 24, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CLEARANCE DE CREATININA' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CLEARANCE DE CREATININA') THEN
RAISE EXCEPTION 'Procedimento CLEARANCE DE CREATININA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 34, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CLEARANCE DE CREATININA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CLEARENCE DE UREIA') THEN
RAISE EXCEPTION 'Procedimento CLEARENCE DE UREIA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 28, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CLEARENCE DE UREIA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CLEARENCE DE UREIA') THEN
RAISE EXCEPTION 'Procedimento CLEARENCE DE UREIA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 33, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CLEARENCE DE UREIA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CLEARENCE DE UREIA') THEN
RAISE EXCEPTION 'Procedimento CLEARENCE DE UREIA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 38, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CLEARENCE DE UREIA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CLORETOS - CL') THEN
RAISE EXCEPTION 'Procedimento CLORETOS - CL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 8, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CLORETOS - CL' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CLORETOS - CL') THEN
RAISE EXCEPTION 'Procedimento CLORETOS - CL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 13, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CLORETOS - CL' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CLORETOS - CL') THEN
RAISE EXCEPTION 'Procedimento CLORETOS - CL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 18, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CLORETOS - CL' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CLORO') THEN
RAISE EXCEPTION 'Procedimento CLORO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 8, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CLORO' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CLORO') THEN
RAISE EXCEPTION 'Procedimento CLORO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 13, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CLORO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CLORO') THEN
RAISE EXCEPTION 'Procedimento CLORO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 18, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CLORO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COAGULOGRAMA') THEN
RAISE EXCEPTION 'Procedimento COAGULOGRAMA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 42, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'COAGULOGRAMA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COAGULOGRAMA') THEN
RAISE EXCEPTION 'Procedimento COAGULOGRAMA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 47, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'COAGULOGRAMA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COAGULOGRAMA') THEN
RAISE EXCEPTION 'Procedimento COAGULOGRAMA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 42, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'COAGULOGRAMA' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COAGULOGRAMA') THEN
RAISE EXCEPTION 'Procedimento COAGULOGRAMA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 52, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'COAGULOGRAMA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COBRE-SANGUINIO') THEN
RAISE EXCEPTION 'Procedimento COBRE-SANGUINIO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 32, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'COBRE-SANGUINIO' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COBRE-SANGUINIO') THEN
RAISE EXCEPTION 'Procedimento COBRE-SANGUINIO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 37, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'COBRE-SANGUINIO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COBRE-SANGUINIO') THEN
RAISE EXCEPTION 'Procedimento COBRE-SANGUINIO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 42, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'COBRE-SANGUINIO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COLESTEROL TOTAL') THEN
RAISE EXCEPTION 'Procedimento COLESTEROL TOTAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 8, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'COLESTEROL TOTAL' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COLESTEROL TOTAL') THEN
RAISE EXCEPTION 'Procedimento COLESTEROL TOTAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 13, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'COLESTEROL TOTAL' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COLESTEROL TOTAL') THEN
RAISE EXCEPTION 'Procedimento COLESTEROL TOTAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 8, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'COLESTEROL TOTAL' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COLESTEROL TOTAL') THEN
RAISE EXCEPTION 'Procedimento COLESTEROL TOTAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 18, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'COLESTEROL TOTAL' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COLESTEROL TOTAL + FRAÇÕES') THEN
RAISE EXCEPTION 'Procedimento COLESTEROL TOTAL + FRAÇÕES not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 52, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'COLESTEROL TOTAL + FRAÇÕES' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COLESTEROL TOTAL + FRAÇÕES') THEN
RAISE EXCEPTION 'Procedimento COLESTEROL TOTAL + FRAÇÕES not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 57, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'COLESTEROL TOTAL + FRAÇÕES' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COLESTEROL TOTAL + FRAÇÕES') THEN
RAISE EXCEPTION 'Procedimento COLESTEROL TOTAL + FRAÇÕES not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 62, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'COLESTEROL TOTAL + FRAÇÕES' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COLESTEROL VLDL') THEN
RAISE EXCEPTION 'Procedimento COLESTEROL VLDL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 16, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'COLESTEROL VLDL' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COLESTEROL VLDL') THEN
RAISE EXCEPTION 'Procedimento COLESTEROL VLDL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 21, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'COLESTEROL VLDL' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COLESTEROL VLDL') THEN
RAISE EXCEPTION 'Procedimento COLESTEROL VLDL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 16, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'COLESTEROL VLDL' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COLESTEROL VLDL') THEN
RAISE EXCEPTION 'Procedimento COLESTEROL VLDL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 26, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'COLESTEROL VLDL' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COLINESTERASE') THEN
RAISE EXCEPTION 'Procedimento COLINESTERASE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 25, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'COLINESTERASE' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COLINESTERASE') THEN
RAISE EXCEPTION 'Procedimento COLINESTERASE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 28, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'COLINESTERASE' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COLINESTERASE') THEN
RAISE EXCEPTION 'Procedimento COLINESTERASE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 38, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'COLINESTERASE' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COMPLEMENTO C3') THEN
RAISE EXCEPTION 'Procedimento COMPLEMENTO C3 not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 26, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'COMPLEMENTO C3' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COMPLEMENTO C3') THEN
RAISE EXCEPTION 'Procedimento COMPLEMENTO C3 not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 31, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'COMPLEMENTO C3' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COMPLEMENTO C3') THEN
RAISE EXCEPTION 'Procedimento COMPLEMENTO C3 not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 36, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'COMPLEMENTO C3' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COMPLEMENTO C4') THEN
RAISE EXCEPTION 'Procedimento COMPLEMENTO C4 not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 26, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'COMPLEMENTO C4' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COMPLEMENTO C4') THEN
RAISE EXCEPTION 'Procedimento COMPLEMENTO C4 not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 31, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'COMPLEMENTO C4' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COMPLEMENTO C4') THEN
RAISE EXCEPTION 'Procedimento COMPLEMENTO C4 not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 36, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'COMPLEMENTO C4' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COOMBS DIRETO') THEN
RAISE EXCEPTION 'Procedimento COOMBS DIRETO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 12, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'COOMBS DIRETO' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COOMBS DIRETO') THEN
RAISE EXCEPTION 'Procedimento COOMBS DIRETO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 17, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'COOMBS DIRETO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COOMBS DIRETO') THEN
RAISE EXCEPTION 'Procedimento COOMBS DIRETO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 22, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'COOMBS DIRETO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COOMBS INDIRETO') THEN
RAISE EXCEPTION 'Procedimento COOMBS INDIRETO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 12, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'COOMBS INDIRETO' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COOMBS INDIRETO') THEN
RAISE EXCEPTION 'Procedimento COOMBS INDIRETO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 17, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'COOMBS INDIRETO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COOMBS INDIRETO') THEN
RAISE EXCEPTION 'Procedimento COOMBS INDIRETO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 12, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'COOMBS INDIRETO' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COOMBS INDIRETO') THEN
RAISE EXCEPTION 'Procedimento COOMBS INDIRETO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 22, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'COOMBS INDIRETO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COPROLOGICO FUNC') THEN
RAISE EXCEPTION 'Procedimento COPROLOGICO FUNC not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 48, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'COPROLOGICO FUNC' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COPROLOGICO FUNC') THEN
RAISE EXCEPTION 'Procedimento COPROLOGICO FUNC not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 53, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'COPROLOGICO FUNC' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COPROLOGICO FUNC') THEN
RAISE EXCEPTION 'Procedimento COPROLOGICO FUNC not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 58, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'COPROLOGICO FUNC' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CORTISOL') THEN
RAISE EXCEPTION 'Procedimento CORTISOL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 34, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CORTISOL' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CORTISOL') THEN
RAISE EXCEPTION 'Procedimento CORTISOL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 39, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CORTISOL' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CORTISOL') THEN
RAISE EXCEPTION 'Procedimento CORTISOL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 44, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CORTISOL' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CREATINA') THEN
RAISE EXCEPTION 'Procedimento CREATINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 104, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CREATINA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CREATINA') THEN
RAISE EXCEPTION 'Procedimento CREATINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 109, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CREATINA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CREATINA') THEN
RAISE EXCEPTION 'Procedimento CREATINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 114, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CREATINA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CREATININA') THEN
RAISE EXCEPTION 'Procedimento CREATININA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 10, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CREATININA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CREATININA') THEN
RAISE EXCEPTION 'Procedimento CREATININA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 15, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CREATININA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CREATININA') THEN
RAISE EXCEPTION 'Procedimento CREATININA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 20, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CREATININA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CREATINO FOSFOQ - MB-ATIVID - CPK') THEN
RAISE EXCEPTION 'Procedimento CREATINO FOSFOQ - MB-ATIVID - CPK not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 22, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CREATINO FOSFOQ - MB-ATIVID - CPK' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CREATINO FOSFOQ - MB-ATIVID - CPK') THEN
RAISE EXCEPTION 'Procedimento CREATINO FOSFOQ - MB-ATIVID - CPK not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 27, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CREATINO FOSFOQ - MB-ATIVID - CPK' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CREATINO FOSFOQ - MB-ATIVID - CPK') THEN
RAISE EXCEPTION 'Procedimento CREATINO FOSFOQ - MB-ATIVID - CPK not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 22, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CREATINO FOSFOQ - MB-ATIVID - CPK' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CREATINO FOSFOQ - MB-ATIVID - CPK') THEN
RAISE EXCEPTION 'Procedimento CREATINO FOSFOQ - MB-ATIVID - CPK not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 32, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CREATINO FOSFOQ - MB-ATIVID - CPK' and u.nome = 'Itapoá';
END $$;