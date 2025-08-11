DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CREATINO FOSFOQ - MB-MASSA') THEN
RAISE EXCEPTION 'Procedimento CREATINO FOSFOQ - MB-MASSA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 22.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CREATINO FOSFOQ - MB-MASSA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CREATINO FOSFOQ - MB-MASSA') THEN
RAISE EXCEPTION 'Procedimento CREATINO FOSFOQ - MB-MASSA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 27.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CREATINO FOSFOQ - MB-MASSA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CREATINO FOSFOQ - MB-MASSA') THEN
RAISE EXCEPTION 'Procedimento CREATINO FOSFOQ - MB-MASSA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 22.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CREATINO FOSFOQ - MB-MASSA' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CREATINO FOSFOQ - MB-MASSA') THEN
RAISE EXCEPTION 'Procedimento CREATINO FOSFOQ - MB-MASSA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 32.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CREATINO FOSFOQ - MB-MASSA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CROMO URINARIO') THEN
RAISE EXCEPTION 'Procedimento CROMO URINARIO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 40.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CROMO URINARIO' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CROMO URINARIO') THEN
RAISE EXCEPTION 'Procedimento CROMO URINARIO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 45.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CROMO URINARIO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CROMO URINARIO') THEN
RAISE EXCEPTION 'Procedimento CROMO URINARIO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 50.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CROMO URINARIO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULT CHLAMYDIA') THEN
RAISE EXCEPTION 'Procedimento CULT CHLAMYDIA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 52.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULT CHLAMYDIA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULT CHLAMYDIA') THEN
RAISE EXCEPTION 'Procedimento CULT CHLAMYDIA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 57.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULT CHLAMYDIA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULT CHLAMYDIA') THEN
RAISE EXCEPTION 'Procedimento CULT CHLAMYDIA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 62.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULT CHLAMYDIA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULT ORORFARINGE ANTIB') THEN
RAISE EXCEPTION 'Procedimento CULT ORORFARINGE ANTIB not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 52.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULT ORORFARINGE ANTIB' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULT ORORFARINGE ANTIB') THEN
RAISE EXCEPTION 'Procedimento CULT ORORFARINGE ANTIB not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 57.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULT ORORFARINGE ANTIB' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULT ORORFARINGE ANTIB') THEN
RAISE EXCEPTION 'Procedimento CULT ORORFARINGE ANTIB not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 62.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULT ORORFARINGE ANTIB' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULT SEC OROFARINGE') THEN
RAISE EXCEPTION 'Procedimento CULT SEC OROFARINGE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 52.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULT SEC OROFARINGE' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULT SEC OROFARINGE') THEN
RAISE EXCEPTION 'Procedimento CULT SEC OROFARINGE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 57.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULT SEC OROFARINGE' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULT SEC OROFARINGE') THEN
RAISE EXCEPTION 'Procedimento CULT SEC OROFARINGE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 62.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULT SEC OROFARINGE' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PESQ DE STREPTOCOCOS B') THEN
RAISE EXCEPTION 'Procedimento PESQ DE STREPTOCOCOS B not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 52.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'PESQ DE STREPTOCOCOS B' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PESQ DE STREPTOCOCOS B') THEN
RAISE EXCEPTION 'Procedimento PESQ DE STREPTOCOCOS B not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 57.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'PESQ DE STREPTOCOCOS B' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PESQ DE STREPTOCOCOS B') THEN
RAISE EXCEPTION 'Procedimento PESQ DE STREPTOCOCOS B not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 62.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'PESQ DE STREPTOCOCOS B' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULTURA BACTERIANA') THEN
RAISE EXCEPTION 'Procedimento CULTURA BACTERIANA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 36.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULTURA BACTERIANA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULTURA BACTERIANA') THEN
RAISE EXCEPTION 'Procedimento CULTURA BACTERIANA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 41.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULTURA BACTERIANA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULTURA BACTERIANA') THEN
RAISE EXCEPTION 'Procedimento CULTURA BACTERIANA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 46.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULTURA BACTERIANA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULTURA DE SECREÇÃO VAGINAL') THEN
RAISE EXCEPTION 'Procedimento CULTURA DE SECREÇÃO VAGINAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 80.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULTURA DE SECREÇÃO VAGINAL' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULTURA DE SECREÇÃO VAGINAL') THEN
RAISE EXCEPTION 'Procedimento CULTURA DE SECREÇÃO VAGINAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 85.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULTURA DE SECREÇÃO VAGINAL' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULTURA DE SECREÇÃO VAGINAL') THEN
RAISE EXCEPTION 'Procedimento CULTURA DE SECREÇÃO VAGINAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 90.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULTURA DE SECREÇÃO VAGINAL' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULTURA DE URINA') THEN
RAISE EXCEPTION 'Procedimento CULTURA DE URINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 16.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULTURA DE URINA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULTURA DE URINA') THEN
RAISE EXCEPTION 'Procedimento CULTURA DE URINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 21.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULTURA DE URINA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULTURA DE URINA') THEN
RAISE EXCEPTION 'Procedimento CULTURA DE URINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 26.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULTURA DE URINA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULTURA FEZES (COPROCULTURA)') THEN
RAISE EXCEPTION 'Procedimento CULTURA FEZES (COPROCULTURA) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 16.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULTURA FEZES (COPROCULTURA)' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULTURA FEZES (COPROCULTURA)') THEN
RAISE EXCEPTION 'Procedimento CULTURA FEZES (COPROCULTURA) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 21.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULTURA FEZES (COPROCULTURA)' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULTURA FEZES (COPROCULTURA)') THEN
RAISE EXCEPTION 'Procedimento CULTURA FEZES (COPROCULTURA) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 26.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULTURA FEZES (COPROCULTURA)' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULTURA GONORREIA') THEN
RAISE EXCEPTION 'Procedimento CULTURA GONORREIA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 52.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULTURA GONORREIA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULTURA GONORREIA') THEN
RAISE EXCEPTION 'Procedimento CULTURA GONORREIA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 57.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULTURA GONORREIA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULTURA GONORREIA') THEN
RAISE EXCEPTION 'Procedimento CULTURA GONORREIA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 62.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULTURA GONORREIA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULTURA P/ MUCOPLASMA 55') THEN
RAISE EXCEPTION 'Procedimento CULTURA P/ MUCOPLASMA 55 not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 52.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULTURA P/ MUCOPLASMA 55' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULTURA P/ MUCOPLASMA 55') THEN
RAISE EXCEPTION 'Procedimento CULTURA P/ MUCOPLASMA 55 not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 57.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULTURA P/ MUCOPLASMA 55' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULTURA P/ MUCOPLASMA 55') THEN
RAISE EXCEPTION 'Procedimento CULTURA P/ MUCOPLASMA 55 not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 62.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULTURA P/ MUCOPLASMA 55' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULTURA PARA ESTREPTOCOCOS AGALACTIE (VAGINAL)') THEN
RAISE EXCEPTION 'Procedimento CULTURA PARA ESTREPTOCOCOS AGALACTIE (VAGINAL) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 52.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULTURA PARA ESTREPTOCOCOS AGALACTIE (VAGINAL)' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULTURA PARA ESTREPTOCOCOS AGALACTIE (VAGINAL)') THEN
RAISE EXCEPTION 'Procedimento CULTURA PARA ESTREPTOCOCOS AGALACTIE (VAGINAL) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 57.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULTURA PARA ESTREPTOCOCOS AGALACTIE (VAGINAL)' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULTURA PARA ESTREPTOCOCOS AGALACTIE (VAGINAL)') THEN
RAISE EXCEPTION 'Procedimento CULTURA PARA ESTREPTOCOCOS AGALACTIE (VAGINAL) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 62.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULTURA PARA ESTREPTOCOCOS AGALACTIE (VAGINAL)' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULTURA PARA ESTREPTOCOCOS AGALACTIE (PERINEAL)') THEN
RAISE EXCEPTION 'Procedimento CULTURA PARA ESTREPTOCOCOS AGALACTIE (PERINEAL) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 56.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULTURA PARA ESTREPTOCOCOS AGALACTIE (PERINEAL)' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULTURA PARA ESTREPTOCOCOS AGALACTIE (PERINEAL)') THEN
RAISE EXCEPTION 'Procedimento CULTURA PARA ESTREPTOCOCOS AGALACTIE (PERINEAL) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 61.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULTURA PARA ESTREPTOCOCOS AGALACTIE (PERINEAL)' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULTURA PARA ESTREPTOCOCOS AGALACTIE (PERINEAL)') THEN
RAISE EXCEPTION 'Procedimento CULTURA PARA ESTREPTOCOCOS AGALACTIE (PERINEAL) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 66.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULTURA PARA ESTREPTOCOCOS AGALACTIE (PERINEAL)' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULTURA PARA FUNGOS') THEN
RAISE EXCEPTION 'Procedimento CULTURA PARA FUNGOS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 40.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULTURA PARA FUNGOS' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULTURA PARA FUNGOS') THEN
RAISE EXCEPTION 'Procedimento CULTURA PARA FUNGOS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 45.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULTURA PARA FUNGOS' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULTURA PARA FUNGOS') THEN
RAISE EXCEPTION 'Procedimento CULTURA PARA FUNGOS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 50.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULTURA PARA FUNGOS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULTURA SS E. COLI') THEN
RAISE EXCEPTION 'Procedimento CULTURA SS E. COLI not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 52.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULTURA SS E. COLI' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULTURA SS E. COLI') THEN
RAISE EXCEPTION 'Procedimento CULTURA SS E. COLI not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 57.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULTURA SS E. COLI' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULTURA SS E. COLI') THEN
RAISE EXCEPTION 'Procedimento CULTURA SS E. COLI not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 62.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULTURA SS E. COLI' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULTURA UREAPLASMA') THEN
RAISE EXCEPTION 'Procedimento CULTURA UREAPLASMA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 50.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULTURA UREAPLASMA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULTURA UREAPLASMA') THEN
RAISE EXCEPTION 'Procedimento CULTURA UREAPLASMA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 55.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULTURA UREAPLASMA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULTURA UREAPLASMA') THEN
RAISE EXCEPTION 'Procedimento CULTURA UREAPLASMA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 60.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULTURA UREAPLASMA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULTURA URINA') THEN
RAISE EXCEPTION 'Procedimento CULTURA URINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 16.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULTURA URINA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULTURA URINA') THEN
RAISE EXCEPTION 'Procedimento CULTURA URINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 21.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULTURA URINA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULTURA URINA') THEN
RAISE EXCEPTION 'Procedimento CULTURA URINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 26.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULTURA URINA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULTURA, MICOPLASMA') THEN
RAISE EXCEPTION 'Procedimento CULTURA, MICOPLASMA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 50.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULTURA, MICOPLASMA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULTURA, MICOPLASMA') THEN
RAISE EXCEPTION 'Procedimento CULTURA, MICOPLASMA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 55.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULTURA, MICOPLASMA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULTURA, MICOPLASMA') THEN
RAISE EXCEPTION 'Procedimento CULTURA, MICOPLASMA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 50.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULTURA, MICOPLASMA' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CULTURA, MICOPLASMA') THEN
RAISE EXCEPTION 'Procedimento CULTURA, MICOPLASMA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 60.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CULTURA, MICOPLASMA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CURVA GLICEMIA GESTANTE - JEJUM,60M,120M') THEN
RAISE EXCEPTION 'Procedimento CURVA GLICEMIA GESTANTE - JEJUM,60M,120M not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 46.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CURVA GLICEMIA GESTANTE - JEJUM,60M,120M' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CURVA GLICEMIA GESTANTE - JEJUM,60M,120M') THEN
RAISE EXCEPTION 'Procedimento CURVA GLICEMIA GESTANTE - JEJUM,60M,120M not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 51.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CURVA GLICEMIA GESTANTE - JEJUM,60M,120M' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CURVA GLICEMIA GESTANTE - JEJUM,60M,120M') THEN
RAISE EXCEPTION 'Procedimento CURVA GLICEMIA GESTANTE - JEJUM,60M,120M not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 56.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CURVA GLICEMIA GESTANTE - JEJUM,60M,120M' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CURVA GLICEMICA (4 DOSES)') THEN
RAISE EXCEPTION 'Procedimento CURVA GLICEMICA (4 DOSES) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 70.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CURVA GLICEMICA (4 DOSES)' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CURVA GLICEMICA (4 DOSES)') THEN
RAISE EXCEPTION 'Procedimento CURVA GLICEMICA (4 DOSES) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 75.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'CURVA GLICEMICA (4 DOSES)' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CURVA GLICEMICA (4 DOSES)') THEN
RAISE EXCEPTION 'Procedimento CURVA GLICEMICA (4 DOSES) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 80.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'CURVA GLICEMICA (4 DOSES)' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'D DIMERO') THEN
RAISE EXCEPTION 'Procedimento D DIMERO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 154.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'D DIMERO' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'D DIMERO') THEN
RAISE EXCEPTION 'Procedimento D DIMERO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 159.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'D DIMERO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'D DIMERO') THEN
RAISE EXCEPTION 'Procedimento D DIMERO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 164.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'D DIMERO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'DENGUE IgG') THEN
RAISE EXCEPTION 'Procedimento DENGUE IgG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 112.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'DENGUE IgG' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'DENGUE IgG') THEN
RAISE EXCEPTION 'Procedimento DENGUE IgG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 117.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'DENGUE IgG' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'DENGUE IgG') THEN
RAISE EXCEPTION 'Procedimento DENGUE IgG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 122.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'DENGUE IgG' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'DENGUE Igm') THEN
RAISE EXCEPTION 'Procedimento DENGUE Igm not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 112.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'DENGUE Igm' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'DENGUE Igm') THEN
RAISE EXCEPTION 'Procedimento DENGUE Igm not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 117.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'DENGUE Igm' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'DENGUE Igm') THEN
RAISE EXCEPTION 'Procedimento DENGUE Igm not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 122.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'DENGUE Igm' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'DESIDROGENASE LACTICA - LDH') THEN
RAISE EXCEPTION 'Procedimento DESIDROGENASE LACTICA - LDH not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 16.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'DESIDROGENASE LACTICA - LDH' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'DESIDROGENASE LACTICA - LDH') THEN
RAISE EXCEPTION 'Procedimento DESIDROGENASE LACTICA - LDH not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 21.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'DESIDROGENASE LACTICA - LDH' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'DESIDROGENASE LACTICA - LDH') THEN
RAISE EXCEPTION 'Procedimento DESIDROGENASE LACTICA - LDH not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 16.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'DESIDROGENASE LACTICA - LDH' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'DESIDROGENASE LACTICA - LDH') THEN
RAISE EXCEPTION 'Procedimento DESIDROGENASE LACTICA - LDH not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 26.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'DESIDROGENASE LACTICA - LDH' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'DHEA') THEN
RAISE EXCEPTION 'Procedimento DHEA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 50.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'DHEA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'DHEA') THEN
RAISE EXCEPTION 'Procedimento DHEA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 55.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'DHEA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'DHEA') THEN
RAISE EXCEPTION 'Procedimento DHEA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 60.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'DHEA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'DHT - DEHIDROTESTOOSTERONA') THEN
RAISE EXCEPTION 'Procedimento DHT - DEHIDROTESTOOSTERONA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 64.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'DHT - DEHIDROTESTOOSTERONA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'DHT - DEHIDROTESTOOSTERONA') THEN
RAISE EXCEPTION 'Procedimento DHT - DEHIDROTESTOOSTERONA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 69.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'DHT - DEHIDROTESTOOSTERONA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'DHT - DEHIDROTESTOOSTERONA') THEN
RAISE EXCEPTION 'Procedimento DHT - DEHIDROTESTOOSTERONA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 74.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'DHT - DEHIDROTESTOOSTERONA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'DIMERO D') THEN
RAISE EXCEPTION 'Procedimento DIMERO D not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 154.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'DIMERO D' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'DIMERO D') THEN
RAISE EXCEPTION 'Procedimento DIMERO D not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 159.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'DIMERO D' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'DIMERO D') THEN
RAISE EXCEPTION 'Procedimento DIMERO D not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 164.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'DIMERO D' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ELETROFERESE DE PROTEINAS') THEN
RAISE EXCEPTION 'Procedimento ELETROFERESE DE PROTEINAS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 26.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ELETROFERESE DE PROTEINAS' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ELETROFERESE DE PROTEINAS') THEN
RAISE EXCEPTION 'Procedimento ELETROFERESE DE PROTEINAS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 31.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ELETROFERESE DE PROTEINAS' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ELETROFERESE DE PROTEINAS') THEN
RAISE EXCEPTION 'Procedimento ELETROFERESE DE PROTEINAS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 36.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ELETROFERESE DE PROTEINAS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ELETROFORESE DE HEMOGLOBINA') THEN
RAISE EXCEPTION 'Procedimento ELETROFORESE DE HEMOGLOBINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 38.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ELETROFORESE DE HEMOGLOBINA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ELETROFORESE DE HEMOGLOBINA') THEN
RAISE EXCEPTION 'Procedimento ELETROFORESE DE HEMOGLOBINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 43.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ELETROFORESE DE HEMOGLOBINA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ELETROFORESE DE HEMOGLOBINA') THEN
RAISE EXCEPTION 'Procedimento ELETROFORESE DE HEMOGLOBINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 48.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ELETROFORESE DE HEMOGLOBINA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'EPU (PARCIAL DE URINA)') THEN
RAISE EXCEPTION 'Procedimento EPU (PARCIAL DE URINA) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 10.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'EPU (PARCIAL DE URINA)' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'EPU (PARCIAL DE URINA)') THEN
RAISE EXCEPTION 'Procedimento EPU (PARCIAL DE URINA) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 15.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'EPU (PARCIAL DE URINA)' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'EPU (PARCIAL DE URINA)') THEN
RAISE EXCEPTION 'Procedimento EPU (PARCIAL DE URINA) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 20.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'EPU (PARCIAL DE URINA)' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ESPERMOGRAMA') THEN
RAISE EXCEPTION 'Procedimento ESPERMOGRAMA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 100.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ESPERMOGRAMA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ESPERMOGRAMA') THEN
RAISE EXCEPTION 'Procedimento ESPERMOGRAMA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 105.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ESPERMOGRAMA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ESPERMOGRAMA') THEN
RAISE EXCEPTION 'Procedimento ESPERMOGRAMA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 110.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ESPERMOGRAMA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ESTRADIOL') THEN
RAISE EXCEPTION 'Procedimento ESTRADIOL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 40.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ESTRADIOL' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ESTRADIOL') THEN
RAISE EXCEPTION 'Procedimento ESTRADIOL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 45.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ESTRADIOL' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ESTRADIOL') THEN
RAISE EXCEPTION 'Procedimento ESTRADIOL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 50.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ESTRADIOL' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ESTRIOL') THEN
RAISE EXCEPTION 'Procedimento ESTRIOL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 32.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ESTRIOL' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ESTRIOL') THEN
RAISE EXCEPTION 'Procedimento ESTRIOL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 37.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ESTRIOL' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ESTRIOL') THEN
RAISE EXCEPTION 'Procedimento ESTRIOL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 50.72, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ESTRIOL' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ESTRIOL') THEN
RAISE EXCEPTION 'Procedimento ESTRIOL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 42.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ESTRIOL' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ESTRONA') THEN
RAISE EXCEPTION 'Procedimento ESTRONA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 32.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ESTRONA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ESTRONA') THEN
RAISE EXCEPTION 'Procedimento ESTRONA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 37.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ESTRONA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ESTRONA') THEN
RAISE EXCEPTION 'Procedimento ESTRONA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 42.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ESTRONA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ETANOL') THEN
RAISE EXCEPTION 'Procedimento ETANOL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 50.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ETANOL' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ETANOL') THEN
RAISE EXCEPTION 'Procedimento ETANOL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 55.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ETANOL' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ETANOL') THEN
RAISE EXCEPTION 'Procedimento ETANOL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 60.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ETANOL' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'EXAME A FRESCO') THEN
RAISE EXCEPTION 'Procedimento EXAME A FRESCO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 10.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'EXAME A FRESCO' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'EXAME A FRESCO') THEN
RAISE EXCEPTION 'Procedimento EXAME A FRESCO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 15.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'EXAME A FRESCO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'EXAME A FRESCO') THEN
RAISE EXCEPTION 'Procedimento EXAME A FRESCO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 20.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'EXAME A FRESCO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FAN') THEN
RAISE EXCEPTION 'Procedimento FAN not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 18.40, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'FAN' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FAN') THEN
RAISE EXCEPTION 'Procedimento FAN not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 23.40, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'FAN' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FAN') THEN
RAISE EXCEPTION 'Procedimento FAN not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 28.40, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'FAN' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FATOR REUMATOIDE (LÁTEX)') THEN
RAISE EXCEPTION 'Procedimento FATOR REUMATOIDE (LÁTEX) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 12.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'FATOR REUMATOIDE (LÁTEX)' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FATOR REUMATOIDE (LÁTEX)') THEN
RAISE EXCEPTION 'Procedimento FATOR REUMATOIDE (LÁTEX) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 17.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'FATOR REUMATOIDE (LÁTEX)' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FATOR REUMATOIDE (LÁTEX)') THEN
RAISE EXCEPTION 'Procedimento FATOR REUMATOIDE (LÁTEX) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 22.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'FATOR REUMATOIDE (LÁTEX)' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FATOR REUMATOIDE QUANTITATIVO') THEN
RAISE EXCEPTION 'Procedimento FATOR REUMATOIDE QUANTITATIVO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 12.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'FATOR REUMATOIDE QUANTITATIVO' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FATOR REUMATOIDE QUANTITATIVO') THEN
RAISE EXCEPTION 'Procedimento FATOR REUMATOIDE QUANTITATIVO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 17.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'FATOR REUMATOIDE QUANTITATIVO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FATOR REUMATOIDE QUANTITATIVO') THEN
RAISE EXCEPTION 'Procedimento FATOR REUMATOIDE QUANTITATIVO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 22.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'FATOR REUMATOIDE QUANTITATIVO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FATOR RH') THEN
RAISE EXCEPTION 'Procedimento FATOR RH not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 4.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'FATOR RH' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FATOR RH') THEN
RAISE EXCEPTION 'Procedimento FATOR RH not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 9.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'FATOR RH' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FATOR RH') THEN
RAISE EXCEPTION 'Procedimento FATOR RH not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 14.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'FATOR RH' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FENOL (PARA BENZENO, FENOL') THEN
RAISE EXCEPTION 'Procedimento FENOL (PARA BENZENO, FENOL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 32.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'FENOL (PARA BENZENO, FENOL' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FENOL (PARA BENZENO, FENOL') THEN
RAISE EXCEPTION 'Procedimento FENOL (PARA BENZENO, FENOL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 37.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'FENOL (PARA BENZENO, FENOL' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FENOL (PARA BENZENO, FENOL') THEN
RAISE EXCEPTION 'Procedimento FENOL (PARA BENZENO, FENOL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 42.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'FENOL (PARA BENZENO, FENOL' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FERRITINA') THEN
RAISE EXCEPTION 'Procedimento FERRITINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 36.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'FERRITINA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FERRITINA') THEN
RAISE EXCEPTION 'Procedimento FERRITINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 41.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'FERRITINA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FERRITINA') THEN
RAISE EXCEPTION 'Procedimento FERRITINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 36.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'FERRITINA' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FERRITINA') THEN
RAISE EXCEPTION 'Procedimento FERRITINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 46.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'FERRITINA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FERRO SÉRICO') THEN
RAISE EXCEPTION 'Procedimento FERRO SÉRICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 10.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'FERRO SÉRICO' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FERRO SÉRICO') THEN
RAISE EXCEPTION 'Procedimento FERRO SÉRICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 15.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'FERRO SÉRICO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FERRO SÉRICO') THEN
RAISE EXCEPTION 'Procedimento FERRO SÉRICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 10.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'FERRO SÉRICO' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FERRO SÉRICO') THEN
RAISE EXCEPTION 'Procedimento FERRO SÉRICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 20.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'FERRO SÉRICO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FIBRINOGENIO') THEN
RAISE EXCEPTION 'Procedimento FIBRINOGENIO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 32.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'FIBRINOGENIO' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FIBRINOGENIO') THEN
RAISE EXCEPTION 'Procedimento FIBRINOGENIO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 37.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'FIBRINOGENIO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FIBRINOGENIO') THEN
RAISE EXCEPTION 'Procedimento FIBRINOGENIO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 42.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'FIBRINOGENIO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FLUOR (PARA FLUORETOS)') THEN
RAISE EXCEPTION 'Procedimento FLUOR (PARA FLUORETOS) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 32.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'FLUOR (PARA FLUORETOS)' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FLUOR (PARA FLUORETOS)') THEN
RAISE EXCEPTION 'Procedimento FLUOR (PARA FLUORETOS) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 37.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'FLUOR (PARA FLUORETOS)' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FLUOR (PARA FLUORETOS)') THEN
RAISE EXCEPTION 'Procedimento FLUOR (PARA FLUORETOS) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 42.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'FLUOR (PARA FLUORETOS)' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FORMALDEIDO') THEN
RAISE EXCEPTION 'Procedimento FORMALDEIDO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 38.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'FORMALDEIDO' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FORMALDEIDO') THEN
RAISE EXCEPTION 'Procedimento FORMALDEIDO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 43.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'FORMALDEIDO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FORMALDEIDO') THEN
RAISE EXCEPTION 'Procedimento FORMALDEIDO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 48.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'FORMALDEIDO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FOSFATSE ALCALINA') THEN
RAISE EXCEPTION 'Procedimento FOSFATSE ALCALINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 8.50, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'FOSFATSE ALCALINA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FOSFATSE ALCALINA') THEN
RAISE EXCEPTION 'Procedimento FOSFATSE ALCALINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 13.50, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'FOSFATSE ALCALINA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FOSFATSE ALCALINA') THEN
RAISE EXCEPTION 'Procedimento FOSFATSE ALCALINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 8.50, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'FOSFATSE ALCALINA' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FOSFATSE ALCALINA') THEN
RAISE EXCEPTION 'Procedimento FOSFATSE ALCALINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 18.50, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'FOSFATSE ALCALINA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FOSFOLIPIDIOS') THEN
RAISE EXCEPTION 'Procedimento FOSFOLIPIDIOS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 24.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'FOSFOLIPIDIOS' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FOSFOLIPIDIOS') THEN
RAISE EXCEPTION 'Procedimento FOSFOLIPIDIOS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 29.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'FOSFOLIPIDIOS' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FOSFOLIPIDIOS') THEN
RAISE EXCEPTION 'Procedimento FOSFOLIPIDIOS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 34.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'FOSFOLIPIDIOS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FOSOFORO') THEN
RAISE EXCEPTION 'Procedimento FOSOFORO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 10.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'FOSOFORO' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FOSOFORO') THEN
RAISE EXCEPTION 'Procedimento FOSOFORO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 15.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'FOSOFORO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FOSOFORO') THEN
RAISE EXCEPTION 'Procedimento FOSOFORO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 20.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'FOSOFORO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FRUTOSAMINAS') THEN
RAISE EXCEPTION 'Procedimento FRUTOSAMINAS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 16.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'FRUTOSAMINAS' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FRUTOSAMINAS') THEN
RAISE EXCEPTION 'Procedimento FRUTOSAMINAS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 21.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'FRUTOSAMINAS' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FRUTOSAMINAS') THEN
RAISE EXCEPTION 'Procedimento FRUTOSAMINAS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 26.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'FRUTOSAMINAS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FSH') THEN
RAISE EXCEPTION 'Procedimento FSH not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 30.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'FSH' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FSH') THEN
RAISE EXCEPTION 'Procedimento FSH not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 35.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'FSH' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FSH') THEN
RAISE EXCEPTION 'Procedimento FSH not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 30.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'FSH' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FSH') THEN
RAISE EXCEPTION 'Procedimento FSH not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 40.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'FSH' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FTA-ABS IGG') THEN
RAISE EXCEPTION 'Procedimento FTA-ABS IGG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 44.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'FTA-ABS IGG' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'FTA-ABS IGG') THEN
RAISE EXCEPTION 'Procedimento FTA-ABS IGG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 49.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'FTA-ABS IGG' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;