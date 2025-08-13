insert into procedimento (codigo, nome, especialidade_id) SELECT null,'POTASSIO URINARIO', id from especialidade where nome like 'LAB.';
update procedimento set nome = 'TOXICOLÓGICO - CABELO' where nome = 'TOXICOLÃ“GICO - CABELO';
update procedimento set nome = 'TOXICOLÓGICO - URINA' where nome = 'TOXICOLÃ“GICO - URINA';

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'METIL ETIL ACETONA') THEN
RAISE EXCEPTION 'Procedimento METIL ETIL ACETONA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 43.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'METIL ETIL ACETONA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'METIL ETIL ACETONA') THEN
RAISE EXCEPTION 'Procedimento METIL ETIL ACETONA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 48.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'METIL ETIL ACETONA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MIC UNHAS (DIRETO - LOCAL)') THEN
RAISE EXCEPTION 'Procedimento MIC UNHAS (DIRETO - LOCAL) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 8.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'MIC UNHAS (DIRETO - LOCAL)' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MIC UNHAS (DIRETO - LOCAL)') THEN
RAISE EXCEPTION 'Procedimento MIC UNHAS (DIRETO - LOCAL) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 13.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'MIC UNHAS (DIRETO - LOCAL)' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MIC UNHAS (DIRETO - LOCAL)') THEN
RAISE EXCEPTION 'Procedimento MIC UNHAS (DIRETO - LOCAL) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 18.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'MIC UNHAS (DIRETO - LOCAL)' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MICROALBUMINURIAM') THEN
RAISE EXCEPTION 'Procedimento MICROALBUMINURIAM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 32.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'MICROALBUMINURIAM' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MICROALBUMINURIAM') THEN
RAISE EXCEPTION 'Procedimento MICROALBUMINURIAM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 37.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'MICROALBUMINURIAM' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MICROALBUMINURIAM') THEN
RAISE EXCEPTION 'Procedimento MICROALBUMINURIAM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 42.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'MICROALBUMINURIAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MONONUCLEOSE') THEN
RAISE EXCEPTION 'Procedimento MONONUCLEOSE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 60.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'MONONUCLEOSE' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MONONUCLEOSE') THEN
RAISE EXCEPTION 'Procedimento MONONUCLEOSE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 65.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'MONONUCLEOSE' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MONONUCLEOSE') THEN
RAISE EXCEPTION 'Procedimento MONONUCLEOSE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 70.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'MONONUCLEOSE' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MONONUCLEOSE-EPSTEIN BARR-IGG') THEN
RAISE EXCEPTION 'Procedimento MONONUCLEOSE-EPSTEIN BARR-IGG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 60.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'MONONUCLEOSE-EPSTEIN BARR-IGG' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MONONUCLEOSE-EPSTEIN BARR-IGG') THEN
RAISE EXCEPTION 'Procedimento MONONUCLEOSE-EPSTEIN BARR-IGG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 65.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'MONONUCLEOSE-EPSTEIN BARR-IGG' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MONONUCLEOSE-EPSTEIN BARR-IGG') THEN
RAISE EXCEPTION 'Procedimento MONONUCLEOSE-EPSTEIN BARR-IGG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 70.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'MONONUCLEOSE-EPSTEIN BARR-IGG' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MONONUCLEOSE,ANTI-VCA(EBV)IGG') THEN
RAISE EXCEPTION 'Procedimento MONONUCLEOSE,ANTI-VCA(EBV)IGG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 60.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'MONONUCLEOSE,ANTI-VCA(EBV)IGG' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MONONUCLEOSE,ANTI-VCA(EBV)IGG') THEN
RAISE EXCEPTION 'Procedimento MONONUCLEOSE,ANTI-VCA(EBV)IGG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 65.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'MONONUCLEOSE,ANTI-VCA(EBV)IGG' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MONONUCLEOSE,ANTI-VCA(EBV)IGG') THEN
RAISE EXCEPTION 'Procedimento MONONUCLEOSE,ANTI-VCA(EBV)IGG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 70.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'MONONUCLEOSE,ANTI-VCA(EBV)IGG' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MONONUCLEOSE,ANTI-VCA(EBV)IGM') THEN
RAISE EXCEPTION 'Procedimento MONONUCLEOSE,ANTI-VCA(EBV)IGM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 60.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'MONONUCLEOSE,ANTI-VCA(EBV)IGM' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MONONUCLEOSE,ANTI-VCA(EBV)IGM') THEN
RAISE EXCEPTION 'Procedimento MONONUCLEOSE,ANTI-VCA(EBV)IGM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 65.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'MONONUCLEOSE,ANTI-VCA(EBV)IGM' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MONONUCLEOSE,ANTI-VCA(EBV)IGM') THEN
RAISE EXCEPTION 'Procedimento MONONUCLEOSE,ANTI-VCA(EBV)IGM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 70.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'MONONUCLEOSE,ANTI-VCA(EBV)IGM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MUCOPROTEÍNAS') THEN
RAISE EXCEPTION 'Procedimento MUCOPROTEÍNAS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 16.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'MUCOPROTEÍNAS' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MUCOPROTEÍNAS') THEN
RAISE EXCEPTION 'Procedimento MUCOPROTEÍNAS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 21.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'MUCOPROTEÍNAS' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MUCOPROTEÍNAS') THEN
RAISE EXCEPTION 'Procedimento MUCOPROTEÍNAS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 26.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'MUCOPROTEÍNAS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'NIQUEL') THEN
RAISE EXCEPTION 'Procedimento NIQUEL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 44.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'NIQUEL' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'NIQUEL') THEN
RAISE EXCEPTION 'Procedimento NIQUEL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 49.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'NIQUEL' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'NIQUEL') THEN
RAISE EXCEPTION 'Procedimento NIQUEL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 54.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'NIQUEL' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'OXIRUS, PESQUISA') THEN
RAISE EXCEPTION 'Procedimento OXIRUS, PESQUISA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 8.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'OXIRUS, PESQUISA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'OXIRUS, PESQUISA') THEN
RAISE EXCEPTION 'Procedimento OXIRUS, PESQUISA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 13.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'OXIRUS, PESQUISA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'OXIRUS, PESQUISA') THEN
RAISE EXCEPTION 'Procedimento OXIRUS, PESQUISA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 18.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'OXIRUS, PESQUISA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PAINEL DST - PCR') THEN
RAISE EXCEPTION 'Procedimento PAINEL DST - PCR not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 320.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'PAINEL DST - PCR' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PAINEL DST - PCR') THEN
RAISE EXCEPTION 'Procedimento PAINEL DST - PCR not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 325.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'PAINEL DST - PCR' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PAINEL DST - PCR') THEN
RAISE EXCEPTION 'Procedimento PAINEL DST - PCR not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 330.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'PAINEL DST - PCR' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PARASITOLOGICO (EPF)') THEN
RAISE EXCEPTION 'Procedimento PARASITOLOGICO (EPF) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 9.50, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'PARASITOLOGICO (EPF)' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PARASITOLOGICO (EPF)') THEN
RAISE EXCEPTION 'Procedimento PARASITOLOGICO (EPF) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 14.50, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'PARASITOLOGICO (EPF)' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PARASITOLOGICO (EPF)') THEN
RAISE EXCEPTION 'Procedimento PARASITOLOGICO (EPF) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 12.40, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'PARASITOLOGICO (EPF)' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PARASITOLOGICO (EPF)') THEN
RAISE EXCEPTION 'Procedimento PARASITOLOGICO (EPF) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 19.50, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'PARASITOLOGICO (EPF)' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PARATORMONIO - PTH') THEN
RAISE EXCEPTION 'Procedimento PARATORMONIO - PTH not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 48.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'PARATORMONIO - PTH' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PARATORMONIO - PTH') THEN
RAISE EXCEPTION 'Procedimento PARATORMONIO - PTH not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 53.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'PARATORMONIO - PTH' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PARATORMONIO - PTH') THEN
RAISE EXCEPTION 'Procedimento PARATORMONIO - PTH not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 58.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'PARATORMONIO - PTH' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PESQ CHLAMYDIA A FRESCO + BAC') THEN
RAISE EXCEPTION 'Procedimento PESQ CHLAMYDIA A FRESCO + BAC not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 24.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'PESQ CHLAMYDIA A FRESCO + BAC' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PESQ CHLAMYDIA A FRESCO + BAC') THEN
RAISE EXCEPTION 'Procedimento PESQ CHLAMYDIA A FRESCO + BAC not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 29.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'PESQ CHLAMYDIA A FRESCO + BAC' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PESQ CHLAMYDIA A FRESCO + BAC') THEN
RAISE EXCEPTION 'Procedimento PESQ CHLAMYDIA A FRESCO + BAC not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 34.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'PESQ CHLAMYDIA A FRESCO + BAC' and u.nome = 'Itapoá';
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
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PLAQUETAS') THEN
RAISE EXCEPTION 'Procedimento PLAQUETAS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 8.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'PLAQUETAS' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PLAQUETAS') THEN
RAISE EXCEPTION 'Procedimento PLAQUETAS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 13.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'PLAQUETAS' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PLAQUETAS') THEN
RAISE EXCEPTION 'Procedimento PLAQUETAS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 18.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'PLAQUETAS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'POTASSIO') THEN
RAISE EXCEPTION 'Procedimento POTASSIO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 9.50, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'POTASSIO' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'POTASSIO') THEN
RAISE EXCEPTION 'Procedimento POTASSIO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 14.50, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'POTASSIO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'POTASSIO') THEN
RAISE EXCEPTION 'Procedimento POTASSIO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 10.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'POTASSIO' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'POTASSIO') THEN
RAISE EXCEPTION 'Procedimento POTASSIO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 19.50, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'POTASSIO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'POTASSIO URINARIO') THEN
RAISE EXCEPTION 'Procedimento POTASSIO URINARIO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 10.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'POTASSIO URINARIO' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'POTASSIO URINARIO') THEN
RAISE EXCEPTION 'Procedimento POTASSIO URINARIO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 15.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'POTASSIO URINARIO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'POTASSIO URINARIO') THEN
RAISE EXCEPTION 'Procedimento POTASSIO URINARIO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 20.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'POTASSIO URINARIO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PROLACTINA') THEN
RAISE EXCEPTION 'Procedimento PROLACTINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 30.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'PROLACTINA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PROLACTINA') THEN
RAISE EXCEPTION 'Procedimento PROLACTINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 35.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'PROLACTINA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PROLACTINA') THEN
RAISE EXCEPTION 'Procedimento PROLACTINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 30.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'PROLACTINA' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PROLACTINA') THEN
RAISE EXCEPTION 'Procedimento PROLACTINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 40.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'PROLACTINA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PROTEINA C REATIVA - ( QUANT )') THEN
RAISE EXCEPTION 'Procedimento PROTEINA C REATIVA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 26.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'PROTEINA C REATIVA - ( QUANT )' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PROTEINA C REATIVA - ( QUANT )') THEN
RAISE EXCEPTION 'Procedimento PROTEINA C REATIVA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 31.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'PROTEINA C REATIVA - ( QUANT )' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PROTEINA C REATIVA - ( QUANT )') THEN
RAISE EXCEPTION 'Procedimento PROTEINA C REATIVA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 36.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'PROTEINA C REATIVA - ( QUANT )' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PROTEINA C REATIVA - ( QUANT )') THEN
RAISE EXCEPTION 'Procedimento PROTEINA C REATIVA - ( QUANT ) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 26.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'PROTEINA C REATIVA - ( QUANT )' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PROTEINA C REATIVA - ( QUANT )') THEN
RAISE EXCEPTION 'Procedimento PROTEINA C REATIVA - ( QUANT ) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 31.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'PROTEINA C REATIVA - ( QUANT )' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PROTEINA C REATIVA - ( QUANT )') THEN
RAISE EXCEPTION 'Procedimento PROTEINA C REATIVA - ( QUANT ) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 36.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'PROTEINA C REATIVA - ( QUANT )' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PROTEINA TOTAIS') THEN
RAISE EXCEPTION 'Procedimento PROTEINA TOTAIS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 16.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'PROTEINA TOTAIS' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PROTEINA TOTAIS') THEN
RAISE EXCEPTION 'Procedimento PROTEINA TOTAIS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 21.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'PROTEINA TOTAIS' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PROTEINA TOTAIS') THEN
RAISE EXCEPTION 'Procedimento PROTEINA TOTAIS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 26.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'PROTEINA TOTAIS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PROTEINAS TOTAIS E FRAÇÕES') THEN
RAISE EXCEPTION 'Procedimento PROTEINAS TOTAIS E FRAÇÕES not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 16.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'PROTEINAS TOTAIS E FRAÇÕES' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PROTEINAS TOTAIS E FRAÇÕES') THEN
RAISE EXCEPTION 'Procedimento PROTEINAS TOTAIS E FRAÇÕES not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 21.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'PROTEINAS TOTAIS E FRAÇÕES' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PROTEINAS TOTAIS E FRAÇÕES') THEN
RAISE EXCEPTION 'Procedimento PROTEINAS TOTAIS E FRAÇÕES not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 26.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'PROTEINAS TOTAIS E FRAÇÕES' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PROTEINURIA 24 HORAS') THEN
RAISE EXCEPTION 'Procedimento PROTEINURIA 24 HORAS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 30.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'PROTEINURIA 24 HORAS' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PROTEINURIA 24 HORAS') THEN
RAISE EXCEPTION 'Procedimento PROTEINURIA 24 HORAS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 35.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'PROTEINURIA 24 HORAS' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PROTEINURIA 24 HORAS') THEN
RAISE EXCEPTION 'Procedimento PROTEINURIA 24 HORAS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 40.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'PROTEINURIA 24 HORAS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PSA LIVRE') THEN
RAISE EXCEPTION 'Procedimento PSA LIVRE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 38.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'PSA LIVRE' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PSA LIVRE') THEN
RAISE EXCEPTION 'Procedimento PSA LIVRE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 43.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'PSA LIVRE' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PSA LIVRE') THEN
RAISE EXCEPTION 'Procedimento PSA LIVRE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 48.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'PSA LIVRE' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PSA TOTAL') THEN
RAISE EXCEPTION 'Procedimento PSA TOTAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 26.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'PSA TOTAL' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PSA TOTAL') THEN
RAISE EXCEPTION 'Procedimento PSA TOTAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 31.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'PSA TOTAL' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PSA TOTAL') THEN
RAISE EXCEPTION 'Procedimento PSA TOTAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 36.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'PSA TOTAL' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'RETICULOCITOS') THEN
RAISE EXCEPTION 'Procedimento RETICULOCITOS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 11.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'RETICULOCITOS' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'RETICULOCITOS') THEN
RAISE EXCEPTION 'Procedimento RETICULOCITOS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 16.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'RETICULOCITOS' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'RETICULOCITOS') THEN
RAISE EXCEPTION 'Procedimento RETICULOCITOS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 21.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'RETICULOCITOS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ROTAVIRUS, PESQUISA, ELISA') THEN
RAISE EXCEPTION 'Procedimento ROTAVIRUS, PESQUISA, ELISA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 64.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ROTAVIRUS, PESQUISA, ELISA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ROTAVIRUS, PESQUISA, ELISA') THEN
RAISE EXCEPTION 'Procedimento ROTAVIRUS, PESQUISA, ELISA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 69.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ROTAVIRUS, PESQUISA, ELISA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ROTAVIRUS, PESQUISA, ELISA') THEN
RAISE EXCEPTION 'Procedimento ROTAVIRUS, PESQUISA, ELISA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 74.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ROTAVIRUS, PESQUISA, ELISA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'RUBEOLA - IGG') THEN
RAISE EXCEPTION 'Procedimento RUBEOLA - IGG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 32.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'RUBEOLA - IGG' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'RUBEOLA - IGG') THEN
RAISE EXCEPTION 'Procedimento RUBEOLA - IGG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 37.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'RUBEOLA - IGG' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'RUBEOLA - IGG') THEN
RAISE EXCEPTION 'Procedimento RUBEOLA - IGG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 46.68, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'RUBEOLA - IGG' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'RUBEOLA - IGG') THEN
RAISE EXCEPTION 'Procedimento RUBEOLA - IGG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 42.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'RUBEOLA - IGG' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'RUBEOLA - IGM') THEN
RAISE EXCEPTION 'Procedimento RUBEOLA - IGM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 36.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'RUBEOLA - IGM' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'RUBEOLA - IGM') THEN
RAISE EXCEPTION 'Procedimento RUBEOLA - IGM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 41.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'RUBEOLA - IGM' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'RUBEOLA - IGM') THEN
RAISE EXCEPTION 'Procedimento RUBEOLA - IGM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 40.70, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'RUBEOLA - IGM' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'RUBEOLA - IGM') THEN
RAISE EXCEPTION 'Procedimento RUBEOLA - IGM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 46.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'RUBEOLA - IGM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'S-DHEA (SULFATO)') THEN
RAISE EXCEPTION 'Procedimento S-DHEA (SULFATO) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 50.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'S-DHEA (SULFATO)' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'S-DHEA (SULFATO)') THEN
RAISE EXCEPTION 'Procedimento S-DHEA (SULFATO) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 55.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'S-DHEA (SULFATO)' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'S-DHEA (SULFATO)') THEN
RAISE EXCEPTION 'Procedimento S-DHEA (SULFATO) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 60.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'S-DHEA (SULFATO)' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SANGUE OCULTO NAS FEZES') THEN
RAISE EXCEPTION 'Procedimento SANGUE OCULTO NAS FEZES not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 9.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'SANGUE OCULTO NAS FEZES' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SANGUE OCULTO NAS FEZES') THEN
RAISE EXCEPTION 'Procedimento SANGUE OCULTO NAS FEZES not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 14.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'SANGUE OCULTO NAS FEZES' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SANGUE OCULTO NAS FEZES') THEN
RAISE EXCEPTION 'Procedimento SANGUE OCULTO NAS FEZES not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 12.40, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'SANGUE OCULTO NAS FEZES' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SANGUE OCULTO NAS FEZES') THEN
RAISE EXCEPTION 'Procedimento SANGUE OCULTO NAS FEZES not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 19.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'SANGUE OCULTO NAS FEZES' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SELENIO SERICO') THEN
RAISE EXCEPTION 'Procedimento SELENIO SERICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 50.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'SELENIO SERICO' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SELENIO SERICO') THEN
RAISE EXCEPTION 'Procedimento SELENIO SERICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 55.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'SELENIO SERICO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SELENIO SERICO') THEN
RAISE EXCEPTION 'Procedimento SELENIO SERICO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 60.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'SELENIO SERICO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SEROTONINA') THEN
RAISE EXCEPTION 'Procedimento SEROTONINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 76.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'SEROTONINA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SEROTONINA') THEN
RAISE EXCEPTION 'Procedimento SEROTONINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 81.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'SEROTONINA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SEROTONINA') THEN
RAISE EXCEPTION 'Procedimento SEROTONINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 86.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'SEROTONINA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SEXAGEM FETAL') THEN
RAISE EXCEPTION 'Procedimento SEXAGEM FETAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 360.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'SEXAGEM FETAL' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SEXAGEM FETAL') THEN
RAISE EXCEPTION 'Procedimento SEXAGEM FETAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 365.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'SEXAGEM FETAL' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SEXAGEM FETAL') THEN
RAISE EXCEPTION 'Procedimento SEXAGEM FETAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 370.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'SEXAGEM FETAL' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SHBG') THEN
RAISE EXCEPTION 'Procedimento SHBG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 64.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'SHBG' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SHBG') THEN
RAISE EXCEPTION 'Procedimento SHBG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 69.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'SHBG' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SHBG') THEN
RAISE EXCEPTION 'Procedimento SHBG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 74.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'SHBG' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SODIO') THEN
RAISE EXCEPTION 'Procedimento SODIO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 9.50, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'SODIO' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SODIO') THEN
RAISE EXCEPTION 'Procedimento SODIO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 14.50, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'SODIO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SODIO') THEN
RAISE EXCEPTION 'Procedimento SODIO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 10.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'SODIO' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SODIO') THEN
RAISE EXCEPTION 'Procedimento SODIO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 19.50, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'SODIO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SOMATOMEDINA') THEN
RAISE EXCEPTION 'Procedimento SOMATOMEDINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 64.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'SOMATOMEDINA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SOMATOMEDINA') THEN
RAISE EXCEPTION 'Procedimento SOMATOMEDINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 69.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'SOMATOMEDINA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SOMATOMEDINA') THEN
RAISE EXCEPTION 'Procedimento SOMATOMEDINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 74.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'SOMATOMEDINA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SWAB ANAL ( OXIÚRIOS )') THEN
RAISE EXCEPTION 'Procedimento SWAB ANAL ( OXIÚRIOS ) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 8.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'SWAB ANAL ( OXIÚRIOS )' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SWAB ANAL ( OXIÚRIOS )') THEN
RAISE EXCEPTION 'Procedimento SWAB ANAL ( OXIÚRIOS ) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 13.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'SWAB ANAL ( OXIÚRIOS )' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SWAB ANAL ( OXIÚRIOS )') THEN
RAISE EXCEPTION 'Procedimento SWAB ANAL ( OXIÚRIOS ) not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 18.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'SWAB ANAL ( OXIÚRIOS )' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SWAB FARINGEO') THEN
RAISE EXCEPTION 'Procedimento SWAB FARINGEO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 52.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'SWAB FARINGEO' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SWAB FARINGEO') THEN
RAISE EXCEPTION 'Procedimento SWAB FARINGEO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 57.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'SWAB FARINGEO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SWAB FARINGEO') THEN
RAISE EXCEPTION 'Procedimento SWAB FARINGEO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 62.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'SWAB FARINGEO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'T3 - REVERSO') THEN
RAISE EXCEPTION 'Procedimento T3 - REVERSO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 84.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'T3 - REVERSO' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'T3 - REVERSO') THEN
RAISE EXCEPTION 'Procedimento T3 - REVERSO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 89.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'T3 - REVERSO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'T3 - REVERSO') THEN
RAISE EXCEPTION 'Procedimento T3 - REVERSO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 94.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'T3 - REVERSO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'T3 - TRIIODOTIRONINA') THEN
RAISE EXCEPTION 'Procedimento T3 - TRIIODOTIRONINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 30.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'T3 - TRIIODOTIRONINA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'T3 - TRIIODOTIRONINA') THEN
RAISE EXCEPTION 'Procedimento T3 - TRIIODOTIRONINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 35.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'T3 - TRIIODOTIRONINA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'T3 - TRIIODOTIRONINA') THEN
RAISE EXCEPTION 'Procedimento T3 - TRIIODOTIRONINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 40.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'T3 - TRIIODOTIRONINA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'T3 LIVRE') THEN
RAISE EXCEPTION 'Procedimento T3 LIVRE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 44.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'T3 LIVRE' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'T3 LIVRE') THEN
RAISE EXCEPTION 'Procedimento T3 LIVRE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 49.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'T3 LIVRE' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'T3 LIVRE') THEN
RAISE EXCEPTION 'Procedimento T3 LIVRE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 44.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'T3 LIVRE' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'T3 LIVRE') THEN
RAISE EXCEPTION 'Procedimento T3 LIVRE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 54.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'T3 LIVRE' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'T3 REVERSO') THEN
RAISE EXCEPTION 'Procedimento T3 REVERSO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 84.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'T3 REVERSO' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'T3 REVERSO') THEN
RAISE EXCEPTION 'Procedimento T3 REVERSO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 89.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'T3 REVERSO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'T3 REVERSO') THEN
RAISE EXCEPTION 'Procedimento T3 REVERSO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 90.46, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'T3 REVERSO' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'T3 REVERSO') THEN
RAISE EXCEPTION 'Procedimento T3 REVERSO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 94.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'T3 REVERSO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'T3 TOTAL') THEN
RAISE EXCEPTION 'Procedimento T3 TOTAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 30.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'T3 TOTAL' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'T3 TOTAL') THEN
RAISE EXCEPTION 'Procedimento T3 TOTAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 35.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'T3 TOTAL' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'T3 TOTAL') THEN
RAISE EXCEPTION 'Procedimento T3 TOTAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 40.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'T3 TOTAL' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'T4 LIVRE') THEN
RAISE EXCEPTION 'Procedimento T4 LIVRE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 36.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'T4 LIVRE' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'T4 LIVRE') THEN
RAISE EXCEPTION 'Procedimento T4 LIVRE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 41.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'T4 LIVRE' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'T4 LIVRE') THEN
RAISE EXCEPTION 'Procedimento T4 LIVRE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 36.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'T4 LIVRE' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'T4 LIVRE') THEN
RAISE EXCEPTION 'Procedimento T4 LIVRE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 46.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'T4 LIVRE' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'T4 TOTAL - TIROXINA') THEN
RAISE EXCEPTION 'Procedimento T4 TOTAL - TIROXINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 36.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'T4 TOTAL - TIROXINA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'T4 TOTAL - TIROXINA') THEN
RAISE EXCEPTION 'Procedimento T4 TOTAL - TIROXINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 41.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'T4 TOTAL - TIROXINA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'T4 TOTAL - TIROXINA') THEN
RAISE EXCEPTION 'Procedimento T4 TOTAL - TIROXINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 36.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'T4 TOTAL - TIROXINA' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'T4 TOTAL - TIROXINA') THEN
RAISE EXCEPTION 'Procedimento T4 TOTAL - TIROXINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 46.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'T4 TOTAL - TIROXINA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TAP - TEMPO DE PROTROMBINA') THEN
RAISE EXCEPTION 'Procedimento TAP - TEMPO DE PROTROMBINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 18.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TAP - TEMPO DE PROTROMBINA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TAP - TEMPO DE PROTROMBINA') THEN
RAISE EXCEPTION 'Procedimento TAP - TEMPO DE PROTROMBINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 23.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TAP - TEMPO DE PROTROMBINA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TAP - TEMPO DE PROTROMBINA') THEN
RAISE EXCEPTION 'Procedimento TAP - TEMPO DE PROTROMBINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 28.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'TAP - TEMPO DE PROTROMBINA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TESTE DE TOLERANCIA A LACTOSE') THEN
RAISE EXCEPTION 'Procedimento TESTE DE TOLERANCIA A LACTOSE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 50.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TESTE DE TOLERANCIA A LACTOSE' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TESTE DE TOLERANCIA A LACTOSE') THEN
RAISE EXCEPTION 'Procedimento TESTE DE TOLERANCIA A LACTOSE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 55.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TESTE DE TOLERANCIA A LACTOSE' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TESTE DE TOLERANCIA A LACTOSE') THEN
RAISE EXCEPTION 'Procedimento TESTE DE TOLERANCIA A LACTOSE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 60.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'TESTE DE TOLERANCIA A LACTOSE' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TESTOSTERONA BIOD.') THEN
RAISE EXCEPTION 'Procedimento TESTOSTERONA BIOD. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 130.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TESTOSTERONA BIOD.' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TESTOSTERONA BIOD.') THEN
RAISE EXCEPTION 'Procedimento TESTOSTERONA BIOD. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 135.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TESTOSTERONA BIOD.' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TESTOSTERONA BIOD.') THEN
RAISE EXCEPTION 'Procedimento TESTOSTERONA BIOD. not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 140.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'TESTOSTERONA BIOD.' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TESTOSTERONA LIVRE') THEN
RAISE EXCEPTION 'Procedimento TESTOSTERONA LIVRE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 40.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TESTOSTERONA LIVRE' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TESTOSTERONA LIVRE') THEN
RAISE EXCEPTION 'Procedimento TESTOSTERONA LIVRE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 45.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TESTOSTERONA LIVRE' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TESTOSTERONA LIVRE') THEN
RAISE EXCEPTION 'Procedimento TESTOSTERONA LIVRE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 52.68, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TESTOSTERONA LIVRE' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TESTOSTERONA LIVRE') THEN
RAISE EXCEPTION 'Procedimento TESTOSTERONA LIVRE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 50.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'TESTOSTERONA LIVRE' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TESTOSTERONA TOTAL') THEN
RAISE EXCEPTION 'Procedimento TESTOSTERONA TOTAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 40.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TESTOSTERONA TOTAL' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TESTOSTERONA TOTAL') THEN
RAISE EXCEPTION 'Procedimento TESTOSTERONA TOTAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 45.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TESTOSTERONA TOTAL' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TESTOSTERONA TOTAL') THEN
RAISE EXCEPTION 'Procedimento TESTOSTERONA TOTAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 40.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TESTOSTERONA TOTAL' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TESTOSTERONA TOTAL') THEN
RAISE EXCEPTION 'Procedimento TESTOSTERONA TOTAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 50.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'TESTOSTERONA TOTAL' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TGO') THEN
RAISE EXCEPTION 'Procedimento TGO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 9.50, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TGO' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TGO') THEN
RAISE EXCEPTION 'Procedimento TGO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 14.50, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TGO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TGO') THEN
RAISE EXCEPTION 'Procedimento TGO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 10.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TGO' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TGO') THEN
RAISE EXCEPTION 'Procedimento TGO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 19.50, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'TGO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TGP') THEN
RAISE EXCEPTION 'Procedimento TGP not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 9.50, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TGP' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TGP') THEN
RAISE EXCEPTION 'Procedimento TGP not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 14.50, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TGP' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TGP') THEN
RAISE EXCEPTION 'Procedimento TGP not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 10.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TGP' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TGP') THEN
RAISE EXCEPTION 'Procedimento TGP not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 19.50, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'TGP' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TIREOGLOBULINA') THEN
RAISE EXCEPTION 'Procedimento TIREOGLOBULINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 40.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TIREOGLOBULINA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TIREOGLOBULINA') THEN
RAISE EXCEPTION 'Procedimento TIREOGLOBULINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 45.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TIREOGLOBULINA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TIREOGLOBULINA') THEN
RAISE EXCEPTION 'Procedimento TIREOGLOBULINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 40.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TIREOGLOBULINA' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TIREOGLOBULINA') THEN
RAISE EXCEPTION 'Procedimento TIREOGLOBULINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 50.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'TIREOGLOBULINA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TOXICOLÓGICO - CABELO') THEN
RAISE EXCEPTION 'Procedimento TOXICOLÓGICO - CABELO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TOXICOLÓGICO - CABELO' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TOXICOLÓGICO - CABELO') THEN
RAISE EXCEPTION 'Procedimento TOXICOLÓGICO - CABELO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TOXICOLÓGICO - CABELO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TOXICOLÓGICO - CABELO') THEN
RAISE EXCEPTION 'Procedimento TOXICOLÓGICO - CABELO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'TOXICOLÓGICO - CABELO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TOXICOLÓGICO - URINA') THEN
RAISE EXCEPTION 'Procedimento TOXICOLÓGICO - URINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 150.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TOXICOLÓGICO - URINA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TOXICOLÓGICO - URINA') THEN
RAISE EXCEPTION 'Procedimento TOXICOLÓGICO - URINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 155.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TOXICOLÓGICO - URINA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TOXICOLÓGICO - URINA') THEN
RAISE EXCEPTION 'Procedimento TOXICOLÓGICO - URINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 160.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'TOXICOLÓGICO - URINA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TOXOPLASMOSE IGG') THEN
RAISE EXCEPTION 'Procedimento TOXOPLASMOSE IGG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 30.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TOXOPLASMOSE IGG' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TOXOPLASMOSE IGG') THEN
RAISE EXCEPTION 'Procedimento TOXOPLASMOSE IGG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 35.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TOXOPLASMOSE IGG' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TOXOPLASMOSE IGG') THEN
RAISE EXCEPTION 'Procedimento TOXOPLASMOSE IGG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 61.05, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TOXOPLASMOSE IGG' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TOXOPLASMOSE IGG') THEN
RAISE EXCEPTION 'Procedimento TOXOPLASMOSE IGG not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 40.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'TOXOPLASMOSE IGG' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TOXOPLASMOSE IGM') THEN
RAISE EXCEPTION 'Procedimento TOXOPLASMOSE IGM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 30.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TOXOPLASMOSE IGM' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TOXOPLASMOSE IGM') THEN
RAISE EXCEPTION 'Procedimento TOXOPLASMOSE IGM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 35.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TOXOPLASMOSE IGM' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TOXOPLASMOSE IGM') THEN
RAISE EXCEPTION 'Procedimento TOXOPLASMOSE IGM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 61.05, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TOXOPLASMOSE IGM' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TOXOPLASMOSE IGM') THEN
RAISE EXCEPTION 'Procedimento TOXOPLASMOSE IGM not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 40.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'TOXOPLASMOSE IGM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TRANSFERRINA') THEN
RAISE EXCEPTION 'Procedimento TRANSFERRINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 28.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TRANSFERRINA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TRANSFERRINA') THEN
RAISE EXCEPTION 'Procedimento TRANSFERRINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 33.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TRANSFERRINA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TRANSFERRINA') THEN
RAISE EXCEPTION 'Procedimento TRANSFERRINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 28.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TRANSFERRINA' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TRANSFERRINA') THEN
RAISE EXCEPTION 'Procedimento TRANSFERRINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 38.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'TRANSFERRINA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TRANSGLUTAMINASE') THEN
RAISE EXCEPTION 'Procedimento TRANSGLUTAMINASE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 80.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TRANSGLUTAMINASE' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TRANSGLUTAMINASE') THEN
RAISE EXCEPTION 'Procedimento TRANSGLUTAMINASE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 85.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TRANSGLUTAMINASE' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TRANSGLUTAMINASE') THEN
RAISE EXCEPTION 'Procedimento TRANSGLUTAMINASE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 90.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'TRANSGLUTAMINASE' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TRIGLICERIDEOS') THEN
RAISE EXCEPTION 'Procedimento TRIGLICERIDEOS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 9.50, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TRIGLICERIDEOS' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TRIGLICERIDEOS') THEN
RAISE EXCEPTION 'Procedimento TRIGLICERIDEOS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 14.50, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TRIGLICERIDEOS' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TRIGLICERIDEOS') THEN
RAISE EXCEPTION 'Procedimento TRIGLICERIDEOS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 10.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TRIGLICERIDEOS' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TRIGLICERIDEOS') THEN
RAISE EXCEPTION 'Procedimento TRIGLICERIDEOS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 19.50, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'TRIGLICERIDEOS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TSH') THEN
RAISE EXCEPTION 'Procedimento TSH not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 30.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TSH' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TSH') THEN
RAISE EXCEPTION 'Procedimento TSH not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 35.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TSH' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TSH') THEN
RAISE EXCEPTION 'Procedimento TSH not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 30.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TSH' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TSH') THEN
RAISE EXCEPTION 'Procedimento TSH not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 40.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'TSH' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TTPA') THEN
RAISE EXCEPTION 'Procedimento TTPA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 20.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TTPA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TTPA') THEN
RAISE EXCEPTION 'Procedimento TTPA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 25.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'TTPA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'TTPA') THEN
RAISE EXCEPTION 'Procedimento TTPA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 30.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'TTPA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'UREIA') THEN
RAISE EXCEPTION 'Procedimento UREIA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 9.50, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'UREIA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'UREIA') THEN
RAISE EXCEPTION 'Procedimento UREIA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 14.50, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'UREIA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'UREIA') THEN
RAISE EXCEPTION 'Procedimento UREIA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 10.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'UREIA' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'UREIA') THEN
RAISE EXCEPTION 'Procedimento UREIA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 19.50, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'UREIA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VDRL') THEN
RAISE EXCEPTION 'Procedimento VDRL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 12.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'VDRL' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VDRL') THEN
RAISE EXCEPTION 'Procedimento VDRL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 17.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'VDRL' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VDRL') THEN
RAISE EXCEPTION 'Procedimento VDRL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 12.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'VDRL' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VDRL') THEN
RAISE EXCEPTION 'Procedimento VDRL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 22.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'VDRL' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VHS') THEN
RAISE EXCEPTION 'Procedimento VHS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 15.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'VHS' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VHS') THEN
RAISE EXCEPTION 'Procedimento VHS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 20.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'VHS' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VHS') THEN
RAISE EXCEPTION 'Procedimento VHS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 15.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'VHS' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VHS') THEN
RAISE EXCEPTION 'Procedimento VHS not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 25.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'VHS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VITAMINA A') THEN
RAISE EXCEPTION 'Procedimento VITAMINA A not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 90.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'VITAMINA A' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VITAMINA A') THEN
RAISE EXCEPTION 'Procedimento VITAMINA A not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 95.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'VITAMINA A' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VITAMINA A') THEN
RAISE EXCEPTION 'Procedimento VITAMINA A not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 100.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'VITAMINA A' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VITAMINA B12') THEN
RAISE EXCEPTION 'Procedimento VITAMINA B12 not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 34.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'VITAMINA B12' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VITAMINA B12') THEN
RAISE EXCEPTION 'Procedimento VITAMINA B12 not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 39.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'VITAMINA B12' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VITAMINA B12') THEN
RAISE EXCEPTION 'Procedimento VITAMINA B12 not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 34.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'VITAMINA B12' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VITAMINA B12') THEN
RAISE EXCEPTION 'Procedimento VITAMINA B12 not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 44.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'VITAMINA B12' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VITAMINA C') THEN
RAISE EXCEPTION 'Procedimento VITAMINA C not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 90.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'VITAMINA C' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VITAMINA C') THEN
RAISE EXCEPTION 'Procedimento VITAMINA C not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 95.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'VITAMINA C' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VITAMINA C') THEN
RAISE EXCEPTION 'Procedimento VITAMINA C not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 100.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'VITAMINA C' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VITAMINA C') THEN
RAISE EXCEPTION 'Procedimento VITAMINA C not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 90.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'VITAMINA C' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VITAMINA C') THEN
RAISE EXCEPTION 'Procedimento VITAMINA C not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 95.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'VITAMINA C' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VITAMINA C') THEN
RAISE EXCEPTION 'Procedimento VITAMINA C not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 100.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'VITAMINA C' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VITAMINA D') THEN
RAISE EXCEPTION 'Procedimento VITAMINA D not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 60.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'VITAMINA D' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VITAMINA D') THEN
RAISE EXCEPTION 'Procedimento VITAMINA D not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 65.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'VITAMINA D' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VITAMINA D') THEN
RAISE EXCEPTION 'Procedimento VITAMINA D not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 60.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'VITAMINA D' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VITAMINA D') THEN
RAISE EXCEPTION 'Procedimento VITAMINA D not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 70.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'VITAMINA D' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VITAMINA D 25 DIHIDROXI') THEN
RAISE EXCEPTION 'Procedimento VITAMINA D 25 DIHIDROXI not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 60.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'VITAMINA D 25 DIHIDROXI' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VITAMINA D 25 DIHIDROXI') THEN
RAISE EXCEPTION 'Procedimento VITAMINA D 25 DIHIDROXI not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 65.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'VITAMINA D 25 DIHIDROXI' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VITAMINA D 25 DIHIDROXI') THEN
RAISE EXCEPTION 'Procedimento VITAMINA D 25 DIHIDROXI not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 70.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'VITAMINA D 25 DIHIDROXI' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VITAMINA D 25 OH') THEN
RAISE EXCEPTION 'Procedimento VITAMINA D 25 OH not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 60.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'VITAMINA D 25 OH' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VITAMINA D 25 OH') THEN
RAISE EXCEPTION 'Procedimento VITAMINA D 25 OH not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 65.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'VITAMINA D 25 OH' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VITAMINA D 25 OH') THEN
RAISE EXCEPTION 'Procedimento VITAMINA D 25 OH not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 70.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'VITAMINA D 25 OH' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VITAMINA E') THEN
RAISE EXCEPTION 'Procedimento VITAMINA E not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 210.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'VITAMINA E' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VITAMINA E') THEN
RAISE EXCEPTION 'Procedimento VITAMINA E not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 215.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'VITAMINA E' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VITAMINA E') THEN
RAISE EXCEPTION 'Procedimento VITAMINA E not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 220.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'VITAMINA E' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'WAALER-ROSE') THEN
RAISE EXCEPTION 'Procedimento WAALER-ROSE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 9.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'WAALER-ROSE' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'WAALER-ROSE') THEN
RAISE EXCEPTION 'Procedimento WAALER-ROSE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 14.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'WAALER-ROSE' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'WAALER-ROSE') THEN
RAISE EXCEPTION 'Procedimento WAALER-ROSE not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 19.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'WAALER-ROSE' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ZINCO') THEN
RAISE EXCEPTION 'Procedimento ZINCO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 36.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ZINCO' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ZINCO') THEN
RAISE EXCEPTION 'Procedimento ZINCO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 41.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ZINCO' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ZINCO') THEN
RAISE EXCEPTION 'Procedimento ZINCO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 46.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ZINCO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ZINCO PROTOPORFIRINA') THEN
RAISE EXCEPTION 'Procedimento ZINCO PROTOPORFIRINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 56.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ZINCO PROTOPORFIRINA' and c.nome = 'VALE+/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ZINCO PROTOPORFIRINA') THEN
RAISE EXCEPTION 'Procedimento ZINCO PROTOPORFIRINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 61.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ZINCO PROTOPORFIRINA' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ZINCO PROTOPORFIRINA') THEN
RAISE EXCEPTION 'Procedimento ZINCO PROTOPORFIRINA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 66.00, p.id, NULL, u.id FROM procedimento p JOIN unidade u ON 1 = 1
WHERE p.nome = 'ZINCO PROTOPORFIRINA' and u.nome = 'Itapoá';
END $$;

