DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'LIPOPROTEINA A') THEN
RAISE EXCEPTION 'Procedimento LIPOPROTEINA A not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 53.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'LIPOPROTEINA A' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'LIPOPROTEINA A') THEN
RAISE EXCEPTION 'Procedimento LIPOPROTEINA A not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 58.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'LIPOPROTEINA A' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'LITIO (LITEMIA)') THEN
RAISE EXCEPTION 'Procedimento LITIO (LITEMIA) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 30.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'LITIO (LITEMIA)' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'LITIO (LITEMIA)') THEN
RAISE EXCEPTION 'Procedimento LITIO (LITEMIA) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 35.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'LITIO (LITEMIA)' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'LITIO (LITEMIA)') THEN
RAISE EXCEPTION 'Procedimento LITIO (LITEMIA) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 40.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'LITIO (LITEMIA)' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MACROPROLACTINA') THEN
RAISE EXCEPTION 'Procedimento MACROPROLACTINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 56.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'MACROPROLACTINA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MACROPROLACTINA') THEN
RAISE EXCEPTION 'Procedimento MACROPROLACTINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 61.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'MACROPROLACTINA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MACROPROLACTINA') THEN
RAISE EXCEPTION 'Procedimento MACROPROLACTINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 66.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'MACROPROLACTINA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MAGNESIO') THEN
RAISE EXCEPTION 'Procedimento MAGNESIO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 11.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'MAGNESIO' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MAGNESIO') THEN
RAISE EXCEPTION 'Procedimento MAGNESIO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 16.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'MAGNESIO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MAGNESIO') THEN
RAISE EXCEPTION 'Procedimento MAGNESIO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 11.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'MAGNESIO' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MAGNESIO') THEN
RAISE EXCEPTION 'Procedimento MAGNESIO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 21.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'MAGNESIO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MANGANES') THEN
RAISE EXCEPTION 'Procedimento MANGANES not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 44.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'MANGANES' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MANGANES') THEN
RAISE EXCEPTION 'Procedimento MANGANES not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 49.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'MANGANES' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MANGANES') THEN
RAISE EXCEPTION 'Procedimento MANGANES not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 54.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'MANGANES' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MARCAD. TUMORAIS (CA 125)') THEN
RAISE EXCEPTION 'Procedimento MARCAD. TUMORAIS (CA 125) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 64.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'MARCAD. TUMORAIS (CA 125)' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MARCAD. TUMORAIS (CA 125)') THEN
RAISE EXCEPTION 'Procedimento MARCAD. TUMORAIS (CA 125) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 69.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'MARCAD. TUMORAIS (CA 125)' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MARCAD. TUMORAIS (CA 125)') THEN
RAISE EXCEPTION 'Procedimento MARCAD. TUMORAIS (CA 125) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 74.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'MARCAD. TUMORAIS (CA 125)' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MARCAD. TUMORAIS (CA 15-3)') THEN
RAISE EXCEPTION 'Procedimento MARCAD. TUMORAIS (CA 15-3) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 64.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'MARCAD. TUMORAIS (CA 15-3)' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MARCAD. TUMORAIS (CA 15-3)') THEN
RAISE EXCEPTION 'Procedimento MARCAD. TUMORAIS (CA 15-3) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 69.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'MARCAD. TUMORAIS (CA 15-3)' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MARCAD. TUMORAIS (CA 15-3)') THEN
RAISE EXCEPTION 'Procedimento MARCAD. TUMORAIS (CA 15-3) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 74.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'MARCAD. TUMORAIS (CA 15-3)' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MARCAD. TUMORAIS (CA 19.9)') THEN
RAISE EXCEPTION 'Procedimento MARCAD. TUMORAIS (CA 19.9) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 58.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'MARCAD. TUMORAIS (CA 19.9)' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MARCAD. TUMORAIS (CA 19.9)') THEN
RAISE EXCEPTION 'Procedimento MARCAD. TUMORAIS (CA 19.9) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 63.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'MARCAD. TUMORAIS (CA 19.9)' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MARCAD. TUMORAIS (CA 19.9)') THEN
RAISE EXCEPTION 'Procedimento MARCAD. TUMORAIS (CA 19.9) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 68.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'MARCAD. TUMORAIS (CA 19.9)' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MARCAD. TUMORAIS (CA 72-4)') THEN
RAISE EXCEPTION 'Procedimento MARCAD. TUMORAIS (CA 72-4) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 120.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'MARCAD. TUMORAIS (CA 72-4)' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MARCAD. TUMORAIS (CA 72-4)') THEN
RAISE EXCEPTION 'Procedimento MARCAD. TUMORAIS (CA 72-4) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 125.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'MARCAD. TUMORAIS (CA 72-4)' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MARCAD. TUMORAIS (CA 72-4)') THEN
RAISE EXCEPTION 'Procedimento MARCAD. TUMORAIS (CA 72-4) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 130.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'MARCAD. TUMORAIS (CA 72-4)' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MERCURIO') THEN
RAISE EXCEPTION 'Procedimento MERCURIO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 50.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'MERCURIO' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MERCURIO') THEN
RAISE EXCEPTION 'Procedimento MERCURIO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 55.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'MERCURIO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MERCURIO') THEN
RAISE EXCEPTION 'Procedimento MERCURIO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 60.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'MERCURIO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'METANOL') THEN
RAISE EXCEPTION 'Procedimento METANOL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 44.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'METANOL' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'METANOL') THEN
RAISE EXCEPTION 'Procedimento METANOL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 49.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'METANOL' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'METANOL') THEN
RAISE EXCEPTION 'Procedimento METANOL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 54.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'METANOL' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'METIL ETIL ACETONA') THEN
RAISE EXCEPTION 'Procedimento METIL ETIL ACETONA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 38.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'METIL ETIL ACETONA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

