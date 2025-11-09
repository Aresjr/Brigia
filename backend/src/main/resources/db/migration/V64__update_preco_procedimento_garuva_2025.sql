-- Atualiza preços e repasses da unidade Garuva (unidade_id = 2) com base no arquivo 'REPASSES MÉDICOS ATUALIZADOS - GARUVA - REPASSES 2025.csv'
-- Higienização aplicada: normalização de nomes, remoção de prefixos monetários, ajustes de acentuação e agregação por procedimento/convênio (maior valor por combinação).

-- Garantir procedimentos necessários
INSERT INTO procedimento (nome, especialidade_id)
SELECT 'AJUDA DE CUSTO', e.id
  FROM especialidade e
 WHERE e.nome = 'CLINICO GERAL'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AJUDA DE CUSTO');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'AUDIO - TONAL', e.id
  FROM especialidade e
 WHERE e.nome = 'FONOAUDIOLOGA'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AUDIO - TONAL');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'AVALIAÇÃO PCD', e.id
  FROM especialidade e
 WHERE e.nome = 'CLINICO GERAL'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AVALIAÇÃO PCD');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'AVALIAÇÃO PSICO.', e.id
  FROM especialidade e
 WHERE e.nome = 'PSICOLÓGO'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AVALIAÇÃO PSICO.');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'BIOIMPEDÂNCIA', e.id
  FROM especialidade e
 WHERE e.nome = 'NUTRICIONISTA'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'BIOIMPEDÂNCIA');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'CONSULTA COVID-19', e.id
  FROM especialidade e
 WHERE e.nome = 'CLINICO GERAL'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA COVID-19');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'CONSULTA PSIQUIATRA', e.id
  FROM especialidade e
 WHERE e.nome = 'NEUROLOGISTA'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CONSULTA PSIQUIATRA');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'LARINGOSCOPIA', e.id
  FROM especialidade e
 WHERE e.nome = 'OTORRINO'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'LARINGOSCOPIA');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'LAUDO - DINA LOMBAR', e.id
  FROM especialidade e
 WHERE e.nome = 'LAB.'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'LAUDO - DINA LOMBAR');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'LAUDO - DINA PUNHO', e.id
  FROM especialidade e
 WHERE e.nome = 'LAB.'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'LAUDO - DINA PUNHO');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'LAUDO - ECG', e.id
  FROM especialidade e
 WHERE e.nome = 'CARDIOLOGISTA'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'LAUDO - ECG');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'LAUDO - EEG', e.id
  FROM especialidade e
 WHERE e.nome = 'NEUROLOGISTA'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'LAUDO - EEG');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'LAVAGEM DE OUVIDO', e.id
  FROM especialidade e
 WHERE e.nome = 'OTORRINO'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'LAVAGEM DE OUVIDO');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'P/HORA', e.id
  FROM especialidade e
 WHERE e.nome = 'CLINICO GERAL'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'P/HORA');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'POR HORA', e.id
  FROM especialidade e
 WHERE e.nome = 'CLINICO GERAL'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'POR HORA');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'REMANEJ. FUNÇÃO', e.id
  FROM especialidade e
 WHERE e.nome = 'LAB.'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'REMANEJ. FUNÇÃO');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'RETIRADA DE DIU', e.id
  FROM especialidade e
 WHERE e.nome = 'GINECOLOGISTA RETIRADA DIU'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'RETIRADA DE DIU');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'SE NÃO DER DE CONS. E PROC PAGAR ISSO', e.id
  FROM especialidade e
 WHERE e.nome = 'CLINICO GERAL'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SE NÃO DER DE CONS. E PROC PAGAR ISSO');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'SESSÃO FONO (10º)', e.id
  FROM especialidade e
 WHERE e.nome = 'FONOAUDIOLOGA'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SESSÃO FONO (10º)');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'SESSÃO FONO (1º)', e.id
  FROM especialidade e
 WHERE e.nome = 'FONOAUDIOLOGA'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SESSÃO FONO (1º)');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'SESSÃO FONO (2º)', e.id
  FROM especialidade e
 WHERE e.nome = 'FONOAUDIOLOGA'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SESSÃO FONO (2º)');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'SESSÃO FONO (3º)', e.id
  FROM especialidade e
 WHERE e.nome = 'FONOAUDIOLOGA'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SESSÃO FONO (3º)');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'SESSÃO FONO (4º)', e.id
  FROM especialidade e
 WHERE e.nome = 'FONOAUDIOLOGA'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SESSÃO FONO (4º)');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'SESSÃO FONO (5º)', e.id
  FROM especialidade e
 WHERE e.nome = 'FONOAUDIOLOGA'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SESSÃO FONO (5º)');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'SESSÃO FONO (6º)', e.id
  FROM especialidade e
 WHERE e.nome = 'FONOAUDIOLOGA'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SESSÃO FONO (6º)');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'SESSÃO FONO (7º)', e.id
  FROM especialidade e
 WHERE e.nome = 'FONOAUDIOLOGA'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SESSÃO FONO (7º)');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'SESSÃO FONO (8º)', e.id
  FROM especialidade e
 WHERE e.nome = 'FONOAUDIOLOGA'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SESSÃO FONO (8º)');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'SESSÃO FONO (9º)', e.id
  FROM especialidade e
 WHERE e.nome = 'FONOAUDIOLOGA'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SESSÃO FONO (9º)');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'SESSÃO PSICO', e.id
  FROM especialidade e
 WHERE e.nome = 'PSICOLÓGO'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SESSÃO PSICO');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'SESSÃO PSICO-IND ( 10ª )', e.id
  FROM especialidade e
 WHERE e.nome = 'PSICOLÓGO'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SESSÃO PSICO-IND ( 10ª )');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'SESSÃO PSICO-IND ( 1ª )', e.id
  FROM especialidade e
 WHERE e.nome = 'PSICOLÓGO'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SESSÃO PSICO-IND ( 1ª )');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'SESSÃO PSICO-IND ( 2ª )', e.id
  FROM especialidade e
 WHERE e.nome = 'PSICOLÓGO'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SESSÃO PSICO-IND ( 2ª )');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'SESSÃO PSICO-IND ( 3ª )', e.id
  FROM especialidade e
 WHERE e.nome = 'PSICOLÓGO'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SESSÃO PSICO-IND ( 3ª )');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'SESSÃO PSICO-IND ( 4ª )', e.id
  FROM especialidade e
 WHERE e.nome = 'PSICOLÓGO'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SESSÃO PSICO-IND ( 4ª )');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'SESSÃO PSICO-IND ( 5ª )', e.id
  FROM especialidade e
 WHERE e.nome = 'PSICOLÓGO'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SESSÃO PSICO-IND ( 5ª )');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'SESSÃO PSICO-IND ( 6ª )', e.id
  FROM especialidade e
 WHERE e.nome = 'PSICOLÓGO'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SESSÃO PSICO-IND ( 6ª )');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'SESSÃO PSICO-IND ( 7ª )', e.id
  FROM especialidade e
 WHERE e.nome = 'PSICOLÓGO'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SESSÃO PSICO-IND ( 7ª )');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'SESSÃO PSICO-IND ( 8ª )', e.id
  FROM especialidade e
 WHERE e.nome = 'PSICOLÓGO'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SESSÃO PSICO-IND ( 8ª )');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'SESSÃO PSICO-IND ( 9ª )', e.id
  FROM especialidade e
 WHERE e.nome = 'PSICOLÓGO'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'SESSÃO PSICO-IND ( 9ª )');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'US AP URINARIO - FEM', e.id
  FROM especialidade e
 WHERE e.nome = 'ULTRASSOM'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US AP URINARIO - FEM');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'US DOOPLER ARTERIAL ( 1 LADO )', e.id
  FROM especialidade e
 WHERE e.nome = 'ULTRASSOM'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US DOOPLER ARTERIAL ( 1 LADO )');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'US DOOPLER ARTERIAL ( 1 PERNA )', e.id
  FROM especialidade e
 WHERE e.nome = 'ULTRASSOM'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US DOOPLER ARTERIAL ( 1 PERNA )');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'US DOOPLER ARTERIAL ( 2 LADOS )', e.id
  FROM especialidade e
 WHERE e.nome = 'ULTRASSOM'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US DOOPLER ARTERIAL ( 2 LADOS )');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'US DOOPLER VENOSO ( 1 LADO )', e.id
  FROM especialidade e
 WHERE e.nome = 'ULTRASSOM'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US DOOPLER VENOSO ( 1 LADO )');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'US DOOPLER VENOSO ( 1 PERNA )', e.id
  FROM especialidade e
 WHERE e.nome = 'ULTRASSOM'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US DOOPLER VENOSO ( 1 PERNA )');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'US DOOPLER VENOSO ( 2 LADOS )', e.id
  FROM especialidade e
 WHERE e.nome = 'ULTRASSOM'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US DOOPLER VENOSO ( 2 LADOS )');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'US DOPLER', e.id
  FROM especialidade e
 WHERE e.nome = 'ULTRASSOM'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US DOPLER');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'US FIGADO E VIAS BILIARES', e.id
  FROM especialidade e
 WHERE e.nome = 'ULTRASSOM'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US FIGADO E VIAS BILIARES');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'US GENECOL. PELVICA (ABD INF)', e.id
  FROM especialidade e
 WHERE e.nome = 'ULTRASSOM'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US GENECOL. PELVICA (ABD INF)');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'US GENECOL. TV ( C/ DOOPLER)', e.id
  FROM especialidade e
 WHERE e.nome = 'ULTRASSOM'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US GENECOL. TV ( C/ DOOPLER)');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'US MÃO', e.id
  FROM especialidade e
 WHERE e.nome = 'ULTRASSOM'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US MÃO');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'US MORF. 1ª TRIM ( 10 A 14 SEM)', e.id
  FROM especialidade e
 WHERE e.nome = 'ULTRASSOM'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US MORF. 1ª TRIM ( 10 A 14 SEM)');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'US MORF. 2ª TRIM ( 20 A 24 SEM)', e.id
  FROM especialidade e
 WHERE e.nome = 'ULTRASSOM'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US MORF. 2ª TRIM ( 20 A 24 SEM)');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'US MORFOLOGICA', e.id
  FROM especialidade e
 WHERE e.nome = 'ULTRASSOM'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US MORFOLOGICA');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'US MORFOLOGICA + DOPLER', e.id
  FROM especialidade e
 WHERE e.nome = 'ULTRASSOM'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US MORFOLOGICA + DOPLER');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'US NORMAL', e.id
  FROM especialidade e
 WHERE e.nome = 'ULTRASSOM'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US NORMAL');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'US OBST.', e.id
  FROM especialidade e
 WHERE e.nome = 'ULTRASSOM'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US OBST.');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'US PUNHO', e.id
  FROM especialidade e
 WHERE e.nome = 'ULTRASSOM'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'US PUNHO');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'VAL. ATESTADO', e.id
  FROM especialidade e
 WHERE e.nome = 'CLINICO GERAL'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VAL. ATESTADO');

INSERT INTO procedimento (nome, especialidade_id)
SELECT 'VALOR FECHADO minimo P/ 2 HORAS ATENDIMENTO', e.id
  FROM especialidade e
 WHERE e.nome = 'CLINICO GERAL'
   AND NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VALOR FECHADO minimo P/ 2 HORAS ATENDIMENTO');

DO $$
DECLARE
    v_unidade_id BIGINT;
    v_procedimento_id BIGINT;
    v_convenio_id BIGINT;
BEGIN
    SELECT id INTO v_unidade_id FROM unidade WHERE id = 2 OR nome ILIKE '%Garuva%' ORDER BY id LIMIT 1;
    IF v_unidade_id IS NULL THEN
        RAISE EXCEPTION 'Unidade Garuva não encontrada';
    END IF;

    FOR rec IN
        SELECT * FROM (VALUES
            ('AJUDA DE CUSTO', 'COMPLEMENTO MÉDICO', 100.00),
            ('AJUDA DE CUSTO', 'INDEPENDENTE', 50.00),
            ('AJUDA DE CUSTO', 'PARTICULAR', 100.00),
            ('APLICAÇÃO DE ESPUMA', 'MENSALISTA', 280.00),
            ('APLICAÇÃO DE ESPUMA', 'PARCEIRO/SUS', 280.00),
            ('APLICAÇÃO DE ESPUMA', 'PARTICULAR', 280.00),
            ('APLICAÇÃO DE ESPUMA', 'VALE+', 280.00),
            ('APLICAÇÃO DE VARICOSE', 'MENSALISTA', 180.00),
            ('APLICAÇÃO DE VARICOSE', 'PARCEIRO/SUS', 180.00),
            ('APLICAÇÃO DE VARICOSE', 'PARTICULAR', 180.00),
            ('APLICAÇÃO DE VARICOSE', 'VALE+', 180.00),
            ('ASO - ADM', 'MENSALISTA', 17.00),
            ('ASO - ADM', 'PARCEIRO/SUS', 17.00),
            ('ASO - ADM', 'PARTICULAR', 17.00),
            ('ASO - DEM', 'MENSALISTA', 17.00),
            ('ASO - DEM', 'PARCEIRO/SUS', 17.00),
            ('ASO - DEM', 'PARTICULAR', 17.00),
            ('ASO - MUD. FUNÇÃO', 'MENSALISTA', 17.00),
            ('ASO - MUD. FUNÇÃO', 'PARCEIRO/SUS', 17.00),
            ('ASO - MUD. FUNÇÃO', 'PARTICULAR', 17.00),
            ('ASO - PER', 'MENSALISTA', 17.00),
            ('ASO - PER', 'PARCEIRO/SUS', 17.00),
            ('ASO - PER', 'PARTICULAR', 17.00),
            ('ASO - RET. AO TRAB.', 'MENSALISTA', 17.00),
            ('ASO - RET. AO TRAB.', 'PARCEIRO/SUS', 17.00),
            ('ASO - RET. AO TRAB.', 'PARTICULAR', 17.00),
            ('ASSINATURA DE CAT', 'MENSALISTA', 55.00),
            ('ASSINATURA DE CAT', 'PARTICULAR', 55.00),
            ('AUDIO - TONAL', 'MENSALISTA', 68.00),
            ('AUDIO - TONAL', 'PARCEIRO/SUS', 68.00),
            ('AUDIO - TONAL', 'PARTICULAR', 145.00),
            ('AUDIO - TONAL', 'VALE+', 68.00),
            ('AUDIO - TRAB.', 'MENSALISTA', 14.00),
            ('AUDIO - TRAB.', 'PARCEIRO/SUS', 14.00),
            ('AUDIO - TRAB.', 'PARTICULAR', 14.00),
            ('AVALIAÇÃO DE PROCESSO', 'PARCEIRO/SUS', 50.00),
            ('AVALIAÇÃO PCD', 'MENSALISTA', 50.00),
            ('AVALIAÇÃO PCD', 'PARCEIRO/SUS', 50.00),
            ('AVALIAÇÃO PSICO.', 'MENSALISTA', 65.00),
            ('AVALIAÇÃO PSICO.', 'PARCEIRO/SUS', 65.00),
            ('AVALIAÇÃO PSICO.', 'PARTICULAR', 65.00),
            ('BIOIMPEDÂNCIA', 'PARTICULAR', 50.00),
            ('COLOCAÇÃO DIU (não incluso DIU)', 'MENSALISTA', 500.00),
            ('COLOCAÇÃO DIU (não incluso DIU)', 'PARCEIRO/SUS', 500.00),
            ('COLOCAÇÃO DIU (não incluso DIU)', 'PARTICULAR', 500.00),
            ('COLOCAÇÃO DIU (não incluso DIU)', 'VALE+', 500.00),
            ('COLOCAÇÃO IMPLANON (não incluso implanon)', 'MENSALISTA', 1450.00),
            ('COLOCAÇÃO IMPLANON (não incluso implanon)', 'PARCEIRO/SUS', 1450.00),
            ('COLOCAÇÃO IMPLANON (não incluso implanon)', 'PARTICULAR', 1450.00),
            ('COLOCAÇÃO IMPLANON (não incluso implanon)', 'VALE+', 1450.00),
            ('CONSULTA CARDIOLOGISTA', 'CLINIPAM', 45.00),
            ('CONSULTA CARDIOLOGISTA', 'MENSALISTA', 65.00),
            ('CONSULTA CARDIOLOGISTA', 'PARCEIRO/SUS', 65.00),
            ('CONSULTA CARDIOLOGISTA', 'PARTICULAR', 110.00),
            ('CONSULTA CARDIOLOGISTA', 'VALE+', 65.00),
            ('CONSULTA CLINICO GERAL', 'CLINIPAM', 45.00),
            ('CONSULTA CLINICO GERAL', 'MENSALISTA', 65.00),
            ('CONSULTA CLINICO GERAL', 'PARCEIRO/SUS', 65.00),
            ('CONSULTA CLINICO GERAL', 'PARTICULAR', 110.00),
            ('CONSULTA CLINICO GERAL', 'VALE+', 65.00),
            ('CONSULTA COVID-19', 'MENSALISTA', 50.00),
            ('CONSULTA COVID-19', 'PARCEIRO/SUS', 50.00),
            ('CONSULTA DERMATOLOGISTA', 'CLINIPAM', 75.00),
            ('CONSULTA DERMATOLOGISTA', 'MENSALISTA', 75.00),
            ('CONSULTA DERMATOLOGISTA', 'PARCEIRO/SUS', 75.00),
            ('CONSULTA DERMATOLOGISTA', 'PARTICULAR', 125.00),
            ('CONSULTA DERMATOLOGISTA', 'VALE+', 75.00),
            ('CONSULTA GINECOLOGISTA', 'CLINIPAM', 70.00),
            ('CONSULTA GINECOLOGISTA', 'MENSALISTA', 95.00),
            ('CONSULTA GINECOLOGISTA', 'PARCEIRO/SUS', 95.00),
            ('CONSULTA GINECOLOGISTA', 'PARTICULAR', 150.00),
            ('CONSULTA GINECOLOGISTA', 'VALE+', 95.00),
            ('CONSULTA NEUROLOGISTA', 'CLINIPAM', 90.00),
            ('CONSULTA NEUROLOGISTA', 'MENSALISTA', 90.00),
            ('CONSULTA NEUROLOGISTA', 'PARCEIRO/SUS', 90.00),
            ('CONSULTA NEUROLOGISTA', 'PARTICULAR', 130.00),
            ('CONSULTA NEUROLOGISTA', 'VALE+', 90.00),
            ('CONSULTA NUTRICIONISTA', 'CLINIPAM', 45.00),
            ('CONSULTA NUTRICIONISTA', 'MENSALISTA', 45.00),
            ('CONSULTA NUTRICIONISTA', 'PARCEIRO/SUS', 45.00),
            ('CONSULTA NUTRICIONISTA', 'PARTICULAR', 70.00),
            ('CONSULTA NUTRICIONISTA', 'VALE+', 45.00),
            ('CONSULTA OFTALMOLOGISTA', 'INDEPENDENTE', 100.00),
            ('CONSULTA OTORRINO', 'CLINIPAM', 60.00),
            ('CONSULTA OTORRINO', 'MENSALISTA', 65.00),
            ('CONSULTA OTORRINO', 'PARCEIRO/SUS', 65.00),
            ('CONSULTA OTORRINO', 'PARTICULAR', 120.00),
            ('CONSULTA OTORRINO', 'VALE+', 65.00),
            ('CONSULTA PRE NATAL', 'CLINIPAM', 70.00),
            ('CONSULTA PRE NATAL', 'MENSALISTA', 115.00),
            ('CONSULTA PRE NATAL', 'PARCEIRO/SUS', 115.00),
            ('CONSULTA PRE NATAL', 'PARTICULAR', 170.00),
            ('CONSULTA PRE NATAL', 'VALE+', 115.00),
            ('CONSULTA PSIQUIATRA', 'INDEPENDENTE', 90.00),
            ('CONSULTA VASCULAR', 'CLINIPAM', 60.00),
            ('CONSULTA VASCULAR', 'MENSALISTA', 65.00),
            ('CONSULTA VASCULAR', 'PARCEIRO/SUS', 65.00),
            ('CONSULTA VASCULAR', 'PARTICULAR', 120.00),
            ('CONSULTA VASCULAR', 'VALE+', 65.00),
            ('EXAME ECOCARDIOGRAMA', 'CLINIPAM', 150.00),
            ('EXAME ECOCARDIOGRAMA', 'MENSALISTA', 150.00),
            ('EXAME ECOCARDIOGRAMA', 'PARCEIRO/SUS', 150.00),
            ('EXAME ECOCARDIOGRAMA', 'PARTICULAR', 150.00),
            ('EXAME ECOCARDIOGRAMA', 'VALE+', 150.00),
            ('LARINGOSCOPIA', 'MENSALISTA', 250.00),
            ('LARINGOSCOPIA', 'PARCEIRO/SUS', 250.00),
            ('LARINGOSCOPIA', 'PARTICULAR', 250.00),
            ('LARINGOSCOPIA', 'VALE+', 250.00),
            ('LAUDO - DINA LOMBAR', 'MENSALISTA', 10.00),
            ('LAUDO - DINA LOMBAR', 'PARCEIRO/SUS', 10.00),
            ('LAUDO - DINA PUNHO', 'MENSALISTA', 10.00),
            ('LAUDO - DINA PUNHO', 'PARCEIRO/SUS', 10.00),
            ('LAUDO - ECG', 'CLINIPAM', 10.00),
            ('LAUDO - ECG', 'MENSALISTA', 10.00),
            ('LAUDO - ECG', 'PARCEIRO/SUS', 10.00),
            ('LAUDO - ECG', 'PARTICULAR', 10.00),
            ('LAUDO - ECG', 'VALE+', 10.00),
            ('LAUDO - EEG', 'MENSALISTA', 20.00),
            ('LAUDO - EEG', 'PARCEIRO/SUS', 20.00),
            ('LAUDO - EEG', 'PARTICULAR', 20.00),
            ('LAUDO - EEG', 'VALE+', 20.00),
            ('LAVAGEM DE OUVIDO', 'INDEPENDENTE', 100.00),
            ('P/HORA', 'COMPLEMENTO MÉDICO', 100.00),
            ('POR HORA', 'COMPLEMENTO MÉDICO', 120.00),
            ('REMANEJ. FUNÇÃO', 'MENSALISTA', 50.00),
            ('REMANEJ. FUNÇÃO', 'PARCEIRO/SUS', 50.00),
            ('RETIRADA DE DIU', 'INDEPENDENTE', 225.00),
            ('SE NÃO DER DE CONS. E PROC PAGAR ISSO', 'VALOR MINIMO', 600.00),
            ('SESSÃO FONO (10º)', 'CLINIPAM', 45.00),
            ('SESSÃO FONO (10º)', 'MENSALISTA', 45.00),
            ('SESSÃO FONO (10º)', 'PARCEIRO/SUS', 45.00),
            ('SESSÃO FONO (10º)', 'PARTICULAR', 55.00),
            ('SESSÃO FONO (10º)', 'VALE+', 45.00),
            ('SESSÃO FONO (1º)', 'CLINIPAM', 45.00),
            ('SESSÃO FONO (1º)', 'MENSALISTA', 55.00),
            ('SESSÃO FONO (1º)', 'PARCEIRO/SUS', 55.00),
            ('SESSÃO FONO (1º)', 'PARTICULAR', 70.00),
            ('SESSÃO FONO (1º)', 'VALE+', 55.00),
            ('SESSÃO FONO (2º)', 'CLINIPAM', 45.00),
            ('SESSÃO FONO (2º)', 'MENSALISTA', 55.00),
            ('SESSÃO FONO (2º)', 'PARCEIRO/SUS', 55.00),
            ('SESSÃO FONO (2º)', 'PARTICULAR', 55.00),
            ('SESSÃO FONO (2º)', 'VALE+', 55.00),
            ('SESSÃO FONO (3º)', 'CLINIPAM', 45.00),
            ('SESSÃO FONO (3º)', 'MENSALISTA', 55.00),
            ('SESSÃO FONO (3º)', 'PARCEIRO/SUS', 55.00),
            ('SESSÃO FONO (3º)', 'PARTICULAR', 55.00),
            ('SESSÃO FONO (3º)', 'VALE+', 55.00),
            ('SESSÃO FONO (4º)', 'CLINIPAM', 45.00),
            ('SESSÃO FONO (4º)', 'MENSALISTA', 45.00),
            ('SESSÃO FONO (4º)', 'PARCEIRO/SUS', 45.00),
            ('SESSÃO FONO (4º)', 'PARTICULAR', 55.00),
            ('SESSÃO FONO (4º)', 'VALE+', 45.00),
            ('SESSÃO FONO (5º)', 'CLINIPAM', 45.00),
            ('SESSÃO FONO (5º)', 'MENSALISTA', 45.00),
            ('SESSÃO FONO (5º)', 'PARCEIRO/SUS', 45.00),
            ('SESSÃO FONO (5º)', 'PARTICULAR', 55.00),
            ('SESSÃO FONO (5º)', 'VALE+', 45.00),
            ('SESSÃO FONO (6º)', 'CLINIPAM', 45.00),
            ('SESSÃO FONO (6º)', 'MENSALISTA', 45.00),
            ('SESSÃO FONO (6º)', 'PARCEIRO/SUS', 45.00),
            ('SESSÃO FONO (6º)', 'PARTICULAR', 55.00),
            ('SESSÃO FONO (6º)', 'VALE+', 45.00),
            ('SESSÃO FONO (7º)', 'CLINIPAM', 45.00),
            ('SESSÃO FONO (7º)', 'MENSALISTA', 45.00),
            ('SESSÃO FONO (7º)', 'PARCEIRO/SUS', 45.00),
            ('SESSÃO FONO (7º)', 'PARTICULAR', 55.00),
            ('SESSÃO FONO (7º)', 'VALE+', 45.00),
            ('SESSÃO FONO (8º)', 'CLINIPAM', 45.00),
            ('SESSÃO FONO (8º)', 'MENSALISTA', 45.00),
            ('SESSÃO FONO (8º)', 'PARCEIRO/SUS', 45.00),
            ('SESSÃO FONO (8º)', 'PARTICULAR', 55.00),
            ('SESSÃO FONO (8º)', 'VALE+', 45.00),
            ('SESSÃO FONO (9º)', 'CLINIPAM', 45.00),
            ('SESSÃO FONO (9º)', 'MENSALISTA', 45.00),
            ('SESSÃO FONO (9º)', 'PARCEIRO/SUS', 45.00),
            ('SESSÃO FONO (9º)', 'PARTICULAR', 55.00),
            ('SESSÃO FONO (9º)', 'VALE+', 45.00),
            ('SESSÃO PSICO', 'CLINIPAM', 45.00),
            ('SESSÃO PSICO', 'MENSALISTA', 70.00),
            ('SESSÃO PSICO', 'PARCEIRO/SUS', 70.00),
            ('SESSÃO PSICO', 'PARTICULAR', 70.00),
            ('SESSÃO PSICO-IND ( 10ª )', 'CLINIPAM', 45.00),
            ('SESSÃO PSICO-IND ( 10ª )', 'MENSALISTA', 55.00),
            ('SESSÃO PSICO-IND ( 10ª )', 'PARTICULAR', 70.00),
            ('SESSÃO PSICO-IND ( 10ª )', 'VALE+', 55.00),
            ('SESSÃO PSICO-IND ( 1ª )', 'CLINIPAM', 45.00),
            ('SESSÃO PSICO-IND ( 1ª )', 'MENSALISTA', 70.00),
            ('SESSÃO PSICO-IND ( 1ª )', 'PARTICULAR', 115.00),
            ('SESSÃO PSICO-IND ( 1ª )', 'VALE+', 70.00),
            ('SESSÃO PSICO-IND ( 2ª )', 'CLINIPAM', 45.00),
            ('SESSÃO PSICO-IND ( 2ª )', 'MENSALISTA', 70.00),
            ('SESSÃO PSICO-IND ( 2ª )', 'PARTICULAR', 100.00),
            ('SESSÃO PSICO-IND ( 2ª )', 'VALE+', 70.00),
            ('SESSÃO PSICO-IND ( 3ª )', 'CLINIPAM', 45.00),
            ('SESSÃO PSICO-IND ( 3ª )', 'MENSALISTA', 70.00),
            ('SESSÃO PSICO-IND ( 3ª )', 'PARTICULAR', 100.00),
            ('SESSÃO PSICO-IND ( 3ª )', 'VALE+', 70.00),
            ('SESSÃO PSICO-IND ( 4ª )', 'CLINIPAM', 45.00),
            ('SESSÃO PSICO-IND ( 4ª )', 'MENSALISTA', 55.00),
            ('SESSÃO PSICO-IND ( 4ª )', 'PARTICULAR', 70.00),
            ('SESSÃO PSICO-IND ( 4ª )', 'VALE+', 55.00),
            ('SESSÃO PSICO-IND ( 5ª )', 'CLINIPAM', 45.00),
            ('SESSÃO PSICO-IND ( 5ª )', 'MENSALISTA', 55.00),
            ('SESSÃO PSICO-IND ( 5ª )', 'PARTICULAR', 70.00),
            ('SESSÃO PSICO-IND ( 5ª )', 'VALE+', 55.00),
            ('SESSÃO PSICO-IND ( 6ª )', 'CLINIPAM', 45.00),
            ('SESSÃO PSICO-IND ( 6ª )', 'MENSALISTA', 55.00),
            ('SESSÃO PSICO-IND ( 6ª )', 'PARTICULAR', 70.00),
            ('SESSÃO PSICO-IND ( 6ª )', 'VALE+', 55.00),
            ('SESSÃO PSICO-IND ( 7ª )', 'CLINIPAM', 45.00),
            ('SESSÃO PSICO-IND ( 7ª )', 'MENSALISTA', 55.00),
            ('SESSÃO PSICO-IND ( 7ª )', 'PARTICULAR', 70.00),
            ('SESSÃO PSICO-IND ( 7ª )', 'VALE+', 55.00),
            ('SESSÃO PSICO-IND ( 8ª )', 'CLINIPAM', 45.00),
            ('SESSÃO PSICO-IND ( 8ª )', 'MENSALISTA', 55.00),
            ('SESSÃO PSICO-IND ( 8ª )', 'PARTICULAR', 70.00),
            ('SESSÃO PSICO-IND ( 8ª )', 'VALE+', 55.00),
            ('SESSÃO PSICO-IND ( 9ª )', 'CLINIPAM', 45.00),
            ('SESSÃO PSICO-IND ( 9ª )', 'MENSALISTA', 55.00),
            ('SESSÃO PSICO-IND ( 9ª )', 'PARTICULAR', 70.00),
            ('SESSÃO PSICO-IND ( 9ª )', 'VALE+', 55.00),
            ('US AB INF - FEM', 'CLINIPAM', 70.00),
            ('US AB INF - FEM', 'MENSALISTA', 70.00),
            ('US AB INF - FEM', 'PARCEIRO/SUS', 70.00),
            ('US AB INF - FEM', 'PARTICULAR', 70.00),
            ('US AB INF - FEM', 'VALE+', 70.00),
            ('US AB INF - FEM (C/ DOOPLER)', 'CLINIPAM', 100.00),
            ('US AB INF - FEM (C/ DOOPLER)', 'MENSALISTA', 100.00),
            ('US AB INF - FEM (C/ DOOPLER)', 'PARCEIRO/SUS', 100.00),
            ('US AB INF - FEM (C/ DOOPLER)', 'PARTICULAR', 100.00),
            ('US AB INF - FEM (C/ DOOPLER)', 'VALE+', 100.00),
            ('US AB INF - MASC', 'CLINIPAM', 70.00),
            ('US AB INF - MASC', 'MENSALISTA', 70.00),
            ('US AB INF - MASC', 'PARCEIRO/SUS', 70.00),
            ('US AB INF - MASC', 'PARTICULAR', 70.00),
            ('US AB INF - MASC', 'VALE+', 70.00),
            ('US AB INF - MASC (C/ DOOPLER)', 'CLINIPAM', 100.00),
            ('US AB INF - MASC (C/ DOOPLER)', 'MENSALISTA', 100.00),
            ('US AB INF - MASC (C/ DOOPLER)', 'PARCEIRO/SUS', 100.00),
            ('US AB INF - MASC (C/ DOOPLER)', 'PARTICULAR', 100.00),
            ('US AB INF - MASC (C/ DOOPLER)', 'VALE+', 100.00),
            ('US AB SUP', 'CLINIPAM', 70.00),
            ('US AB SUP', 'MENSALISTA', 70.00),
            ('US AB SUP', 'PARCEIRO/SUS', 70.00),
            ('US AB SUP', 'PARTICULAR', 70.00),
            ('US AB SUP', 'VALE+', 70.00),
            ('US AB SUP (C/ DOOPLER)', 'CLINIPAM', 100.00),
            ('US AB SUP (C/ DOOPLER)', 'MENSALISTA', 100.00),
            ('US AB SUP (C/ DOOPLER)', 'PARCEIRO/SUS', 100.00),
            ('US AB SUP (C/ DOOPLER)', 'PARTICULAR', 100.00),
            ('US AB SUP (C/ DOOPLER)', 'VALE+', 100.00),
            ('US AB TOTAL', 'CLINIPAM', 70.00),
            ('US AB TOTAL', 'MENSALISTA', 70.00),
            ('US AB TOTAL', 'PARCEIRO/SUS', 70.00),
            ('US AB TOTAL', 'PARTICULAR', 70.00),
            ('US AB TOTAL', 'VALE+', 70.00),
            ('US AB TOTAL (APENDICITE)', 'MENSALISTA', 70.00),
            ('US AB TOTAL (APENDICITE)', 'PARCEIRO/SUS', 70.00),
            ('US AB TOTAL (APENDICITE)', 'PARTICULAR', 70.00),
            ('US AB TOTAL (APENDICITE)', 'VALE+', 70.00),
            ('US AB TOTAL (C/ DOOPLER)', 'CLINIPAM', 100.00),
            ('US AB TOTAL (C/ DOOPLER)', 'MENSALISTA', 100.00),
            ('US AB TOTAL (C/ DOOPLER)', 'PARCEIRO/SUS', 100.00),
            ('US AB TOTAL (C/ DOOPLER)', 'PARTICULAR', 100.00),
            ('US AB TOTAL (C/ DOOPLER)', 'VALE+', 100.00),
            ('US ANTEBRAÇO', 'CLINIPAM', 70.00),
            ('US ANTEBRAÇO', 'MENSALISTA', 70.00),
            ('US ANTEBRAÇO', 'PARCEIRO/SUS', 70.00),
            ('US ANTEBRAÇO', 'PARTICULAR', 70.00),
            ('US ANTEBRAÇO', 'VALE+', 70.00),
            ('US AP URINARIO - FEM', 'CLINIPAM', 70.00),
            ('US AP URINARIO - FEM', 'MENSALISTA', 70.00),
            ('US AP URINARIO - FEM', 'PARCEIRO/SUS', 70.00),
            ('US AP URINARIO - FEM', 'PARTICULAR', 70.00),
            ('US AP URINARIO - FEM', 'VALE+', 70.00),
            ('US AP URINARIO - FEM (C/ DOOPLER)', 'CLINIPAM', 100.00),
            ('US AP URINARIO - FEM (C/ DOOPLER)', 'MENSALISTA', 100.00),
            ('US AP URINARIO - FEM (C/ DOOPLER)', 'PARCEIRO/SUS', 100.00),
            ('US AP URINARIO - FEM (C/ DOOPLER)', 'PARTICULAR', 100.00),
            ('US AP URINARIO - FEM (C/ DOOPLER)', 'VALE+', 100.00),
            ('US AP URINARIO - MASC', 'CLINIPAM', 70.00),
            ('US AP URINARIO - MASC', 'MENSALISTA', 70.00),
            ('US AP URINARIO - MASC', 'PARCEIRO/SUS', 70.00),
            ('US AP URINARIO - MASC', 'PARTICULAR', 70.00),
            ('US AP URINARIO - MASC', 'VALE+', 70.00),
            ('US AP URINÁRIO - MASC (C/ DOOPLER)', 'CLINIPAM', 100.00),
            ('US AP URINÁRIO - MASC (C/ DOOPLER)', 'MENSALISTA', 100.00),
            ('US AP URINÁRIO - MASC (C/ DOOPLER)', 'PARCEIRO/SUS', 100.00),
            ('US AP URINÁRIO - MASC (C/ DOOPLER)', 'PARTICULAR', 100.00),
            ('US AP URINÁRIO - MASC (C/ DOOPLER)', 'VALE+', 100.00),
            ('US ARTICULAÇÃO', 'CLINIPAM', 70.00),
            ('US ARTICULAÇÃO', 'MENSALISTA', 70.00),
            ('US ARTICULAÇÃO', 'PARCEIRO/SUS', 70.00),
            ('US ARTICULAÇÃO', 'PARTICULAR', 70.00),
            ('US ARTICULAÇÃO', 'VALE+', 70.00),
            ('US AXILA (CADA LADO)', 'MENSALISTA', 70.00),
            ('US AXILA (CADA LADO)', 'PARCEIRO/SUS', 70.00),
            ('US AXILA (CADA LADO)', 'PARTICULAR', 70.00),
            ('US AXILA (CADA LADO)', 'VALE+', 70.00),
            ('US BOLSA ESCROTAL', 'CLINIPAM', 70.00),
            ('US BOLSA ESCROTAL', 'MENSALISTA', 70.00),
            ('US BOLSA ESCROTAL', 'PARCEIRO/SUS', 70.00),
            ('US BOLSA ESCROTAL', 'PARTICULAR', 70.00),
            ('US BOLSA ESCROTAL', 'VALE+', 70.00),
            ('US BOLSA ESCROTAL (C/ DOOPLER)', 'CLINIPAM', 100.00),
            ('US BOLSA ESCROTAL (C/ DOOPLER)', 'MENSALISTA', 100.00),
            ('US BOLSA ESCROTAL (C/ DOOPLER)', 'PARCEIRO/SUS', 100.00),
            ('US BOLSA ESCROTAL (C/ DOOPLER)', 'PARTICULAR', 100.00),
            ('US BOLSA ESCROTAL (C/ DOOPLER)', 'VALE+', 100.00),
            ('US COTOVELO', 'CLINIPAM', 70.00),
            ('US COTOVELO', 'MENSALISTA', 70.00),
            ('US COTOVELO', 'PARCEIRO/SUS', 70.00),
            ('US COTOVELO', 'PARTICULAR', 70.00),
            ('US COTOVELO', 'VALE+', 70.00),
            ('US DEDO', 'CLINIPAM', 70.00),
            ('US DEDO', 'MENSALISTA', 70.00),
            ('US DEDO', 'PARCEIRO/SUS', 70.00),
            ('US DEDO', 'PARTICULAR', 70.00),
            ('US DEDO', 'VALE+', 70.00),
            ('US DOOPLER AORTA/ILÍACAS', 'CLINIPAM', 100.00),
            ('US DOOPLER AORTA/ILÍACAS', 'MENSALISTA', 100.00),
            ('US DOOPLER AORTA/ILÍACAS', 'PARCEIRO/SUS', 100.00),
            ('US DOOPLER AORTA/ILÍACAS', 'PARTICULAR', 100.00),
            ('US DOOPLER AORTA/ILÍACAS', 'VALE+', 100.00),
            ('US DOOPLER AORTA/RENAIS', 'CLINIPAM', 100.00),
            ('US DOOPLER AORTA/RENAIS', 'MENSALISTA', 100.00),
            ('US DOOPLER AORTA/RENAIS', 'PARCEIRO/SUS', 100.00),
            ('US DOOPLER AORTA/RENAIS', 'PARTICULAR', 100.00),
            ('US DOOPLER AORTA/RENAIS', 'VALE+', 100.00),
            ('US DOOPLER ARTERIAL ( 1 LADO )', 'CLINIPAM', 100.00),
            ('US DOOPLER ARTERIAL ( 1 LADO )', 'MENSALISTA', 100.00),
            ('US DOOPLER ARTERIAL ( 1 LADO )', 'PARCEIRO/SUS', 100.00),
            ('US DOOPLER ARTERIAL ( 1 LADO )', 'PARTICULAR', 100.00),
            ('US DOOPLER ARTERIAL ( 1 LADO )', 'VALE+', 100.00),
            ('US DOOPLER ARTERIAL ( 1 PERNA )', 'CLINIPAM', 100.00),
            ('US DOOPLER ARTERIAL ( 1 PERNA )', 'MENSALISTA', 100.00),
            ('US DOOPLER ARTERIAL ( 1 PERNA )', 'PARCEIRO/SUS', 100.00),
            ('US DOOPLER ARTERIAL ( 1 PERNA )', 'PARTICULAR', 100.00),
            ('US DOOPLER ARTERIAL ( 1 PERNA )', 'VALE+', 100.00),
            ('US DOOPLER ARTERIAL ( 2 LADOS )', 'MENSALISTA', 200.00),
            ('US DOOPLER ARTERIAL ( 2 LADOS )', 'PARCEIRO/SUS', 200.00),
            ('US DOOPLER ARTERIAL ( 2 LADOS )', 'PARTICULAR', 200.00),
            ('US DOOPLER ARTERIAL ( 2 LADOS )', 'VALE+', 200.00),
            ('US DOOPLER CAROTIDAS/VERT', 'CLINIPAM', 100.00),
            ('US DOOPLER CAROTIDAS/VERT', 'MENSALISTA', 100.00),
            ('US DOOPLER CAROTIDAS/VERT', 'PARCEIRO/SUS', 100.00),
            ('US DOOPLER CAROTIDAS/VERT', 'PARTICULAR', 100.00),
            ('US DOOPLER CAROTIDAS/VERT', 'VALE+', 100.00),
            ('US DOOPLER ESTRUTURA ISOL', 'CLINIPAM', 100.00),
            ('US DOOPLER ESTRUTURA ISOL', 'MENSALISTA', 100.00),
            ('US DOOPLER ESTRUTURA ISOL', 'PARCEIRO/SUS', 100.00),
            ('US DOOPLER ESTRUTURA ISOL', 'PARTICULAR', 100.00),
            ('US DOOPLER ESTRUTURA ISOL', 'VALE+', 100.00),
            ('US DOOPLER VENOSO ( 1 LADO )', 'CLINIPAM', 100.00),
            ('US DOOPLER VENOSO ( 1 LADO )', 'MENSALISTA', 100.00),
            ('US DOOPLER VENOSO ( 1 LADO )', 'PARCEIRO/SUS', 100.00),
            ('US DOOPLER VENOSO ( 1 LADO )', 'PARTICULAR', 100.00),
            ('US DOOPLER VENOSO ( 1 LADO )', 'VALE+', 100.00),
            ('US DOOPLER VENOSO ( 1 PERNA )', 'CLINIPAM', 100.00),
            ('US DOOPLER VENOSO ( 1 PERNA )', 'MENSALISTA', 100.00),
            ('US DOOPLER VENOSO ( 1 PERNA )', 'PARCEIRO/SUS', 100.00),
            ('US DOOPLER VENOSO ( 1 PERNA )', 'PARTICULAR', 100.00),
            ('US DOOPLER VENOSO ( 1 PERNA )', 'VALE+', 100.00),
            ('US DOOPLER VENOSO ( 2 LADOS )', 'MENSALISTA', 200.00),
            ('US DOOPLER VENOSO ( 2 LADOS )', 'PARCEIRO/SUS', 200.00),
            ('US DOOPLER VENOSO ( 2 LADOS )', 'PARTICULAR', 200.00),
            ('US DOOPLER VENOSO ( 2 LADOS )', 'VALE+', 200.00),
            ('US DOPLER', 'INDEPENDENTE', 100.00),
            ('US FIGADO E VIAS BILIARES', 'CLINIPAM', 70.00),
            ('US FIGADO E VIAS BILIARES', 'MENSALISTA', 70.00),
            ('US FIGADO E VIAS BILIARES', 'PARCEIRO/SUS', 70.00),
            ('US FIGADO E VIAS BILIARES', 'PARTICULAR', 70.00),
            ('US FIGADO E VIAS BILIARES', 'VALE+', 70.00),
            ('US GENECOL. PELVICA (ABD INF)', 'MENSALISTA', 70.00),
            ('US GENECOL. PELVICA (ABD INF)', 'PARCEIRO/SUS', 70.00),
            ('US GENECOL. PELVICA (ABD INF)', 'PARTICULAR', 70.00),
            ('US GENECOL. PELVICA (ABD INF)', 'VALE+', 70.00),
            ('US GENECOL. TV ( C/ DOOPLER)', 'CLINIPAM', 100.00),
            ('US GENECOL. TV ( C/ DOOPLER)', 'MENSALISTA', 100.00),
            ('US GENECOL. TV ( C/ DOOPLER)', 'PARCEIRO/SUS', 100.00),
            ('US GENECOL. TV ( C/ DOOPLER)', 'PARTICULAR', 100.00),
            ('US GENECOL. TV ( C/ DOOPLER)', 'VALE+', 100.00),
            ('US GINECOL. TV', 'CLINIPAM', 70.00),
            ('US GINECOL. TV', 'MENSALISTA', 70.00),
            ('US GINECOL. TV', 'PARCEIRO/SUS', 70.00),
            ('US GINECOL. TV', 'PARTICULAR', 70.00),
            ('US GINECOL. TV', 'VALE+', 70.00),
            ('US GLANDULAS SALIVARES', 'CLINIPAM', 70.00),
            ('US GLANDULAS SALIVARES', 'MENSALISTA', 70.00),
            ('US GLANDULAS SALIVARES', 'PARCEIRO/SUS', 70.00),
            ('US GLANDULAS SALIVARES', 'PARTICULAR', 70.00),
            ('US GLANDULAS SALIVARES', 'VALE+', 70.00),
            ('US JOELHO', 'CLINIPAM', 70.00),
            ('US JOELHO', 'MENSALISTA', 70.00),
            ('US JOELHO', 'PARCEIRO/SUS', 70.00),
            ('US JOELHO', 'PARTICULAR', 70.00),
            ('US JOELHO', 'VALE+', 70.00),
            ('US LOMBAR ( CADA LADO )', 'CLINIPAM', 70.00),
            ('US LOMBAR ( CADA LADO )', 'MENSALISTA', 70.00),
            ('US LOMBAR ( CADA LADO )', 'PARCEIRO/SUS', 70.00),
            ('US LOMBAR ( CADA LADO )', 'PARTICULAR', 70.00),
            ('US LOMBAR ( CADA LADO )', 'VALE+', 70.00),
            ('US MAMAS (FEM / MASC)', 'CLINIPAM', 70.00),
            ('US MAMAS (FEM / MASC)', 'MENSALISTA', 70.00),
            ('US MAMAS (FEM / MASC)', 'PARCEIRO/SUS', 70.00),
            ('US MAMAS (FEM / MASC)', 'PARTICULAR', 70.00),
            ('US MAMAS (FEM / MASC)', 'VALE+', 70.00),
            ('US MAMAS (FEM / MASC) ( COM DOOPLER )', 'CLINIPAM', 100.00),
            ('US MAMAS (FEM / MASC) ( COM DOOPLER )', 'MENSALISTA', 100.00),
            ('US MAMAS (FEM / MASC) ( COM DOOPLER )', 'PARCEIRO/SUS', 100.00),
            ('US MAMAS (FEM / MASC) ( COM DOOPLER )', 'PARTICULAR', 100.00),
            ('US MAMAS (FEM / MASC) ( COM DOOPLER )', 'VALE+', 100.00),
            ('US MÃO', 'CLINIPAM', 70.00),
            ('US MÃO', 'MENSALISTA', 70.00),
            ('US MÃO', 'PARCEIRO/SUS', 70.00),
            ('US MÃO', 'PARTICULAR', 70.00),
            ('US MÃO', 'VALE+', 70.00),
            ('US MAP. ENDOMETRIOSE', 'INDEPENDENTE', 210.00),
            ('US MAP. ENDOMETRIOSE', 'MENSALISTA', 170.00),
            ('US MAP. ENDOMETRIOSE', 'PARCEIRO/SUS', 170.00),
            ('US MAP. ENDOMETRIOSE', 'PARTICULAR', 170.00),
            ('US MAP. ENDOMETRIOSE', 'VALE+', 170.00),
            ('US MORF. 1ª TRIM ( 10 A 14 SEM)', 'CLINIPAM', 120.00),
            ('US MORF. 1ª TRIM ( 10 A 14 SEM)', 'MENSALISTA', 140.00),
            ('US MORF. 1ª TRIM ( 10 A 14 SEM)', 'PARCEIRO/SUS', 140.00),
            ('US MORF. 1ª TRIM ( 10 A 14 SEM)', 'PARTICULAR', 140.00),
            ('US MORF. 1ª TRIM ( 10 A 14 SEM)', 'VALE+', 140.00),
            ('US MORF. 2ª TRIM ( 20 A 24 SEM)', 'CLINIPAM', 120.00),
            ('US MORF. 2ª TRIM ( 20 A 24 SEM)', 'MENSALISTA', 140.00),
            ('US MORF. 2ª TRIM ( 20 A 24 SEM)', 'PARCEIRO/SUS', 140.00),
            ('US MORF. 2ª TRIM ( 20 A 24 SEM)', 'PARTICULAR', 140.00),
            ('US MORF. 2ª TRIM ( 20 A 24 SEM)', 'VALE+', 140.00),
            ('US MORFOLOGICA', 'INDEPENDENTE', 140.00),
            ('US MORFOLOGICA + DOPLER', 'INDEPENDENTE', 170.00),
            ('US NORMAL', 'INDEPENDENTE', 70.00),
            ('US OBST.', 'CLINIPAM', 70.00),
            ('US OBST.', 'MENSALISTA', 70.00),
            ('US OBST.', 'PARCEIRO/SUS', 70.00),
            ('US OBST.', 'PARTICULAR', 70.00),
            ('US OBST.', 'VALE+', 70.00),
            ('US OBST. ( C/ DOOPLER )', 'CLINIPAM', 100.00),
            ('US OBST. ( C/ DOOPLER )', 'MENSALISTA', 100.00),
            ('US OBST. ( C/ DOOPLER )', 'PARCEIRO/SUS', 100.00),
            ('US OBST. ( C/ DOOPLER )', 'PARTICULAR', 100.00),
            ('US OBST. ( C/ DOOPLER )', 'VALE+', 100.00),
            ('US OBST. (C/ TN )-GEMELAR', 'CLINIPAM', 70.00),
            ('US OBST. (C/ TN )-GEMELAR', 'MENSALISTA', 200.00),
            ('US OBST. (C/ TN )-GEMELAR', 'PARCEIRO/SUS', 200.00),
            ('US OBST. (C/ TN )-GEMELAR', 'PARTICULAR', 200.00),
            ('US OBST. (C/ TN )-GEMELAR', 'VALE+', 200.00),
            ('US OBST. (C/ TRANSL. NUCAL )', 'CLINIPAM', 70.00),
            ('US OBST. (C/ TRANSL. NUCAL )', 'MENSALISTA', 100.00),
            ('US OBST. (C/ TRANSL. NUCAL )', 'PARCEIRO/SUS', 100.00),
            ('US OBST. (C/ TRANSL. NUCAL )', 'PARTICULAR', 100.00),
            ('US OBST. (C/ TRANSL. NUCAL )', 'VALE+', 100.00),
            ('US OBST. (PERFIL BIOF. FETAL)', 'CLINIPAM', 70.00),
            ('US OBST. (PERFIL BIOF. FETAL)', 'MENSALISTA', 70.00),
            ('US OBST. (PERFIL BIOF. FETAL)', 'PARCEIRO/SUS', 70.00),
            ('US OBST. (PERFIL BIOF. FETAL)', 'PARTICULAR', 70.00),
            ('US OBST. (PERFIL BIOF. FETAL)', 'VALE+', 70.00),
            ('US OBST. 1º TRIM ( TV - C/ DOOPLER )', 'CLINIPAM', 100.00),
            ('US OBST. 1º TRIM ( TV - C/ DOOPLER )', 'MENSALISTA', 100.00),
            ('US OBST. 1º TRIM ( TV - C/ DOOPLER )', 'PARCEIRO/SUS', 100.00),
            ('US OBST. 1º TRIM ( TV - C/ DOOPLER )', 'PARTICULAR', 100.00),
            ('US OBST. 1º TRIM ( TV - C/ DOOPLER )', 'VALE+', 100.00),
            ('US OBST. 1º TRIM ( TV )', 'CLINIPAM', 70.00),
            ('US OBST. 1º TRIM ( TV )', 'MENSALISTA', 70.00),
            ('US OBST. 1º TRIM ( TV )', 'PARCEIRO/SUS', 70.00),
            ('US OBST. 1º TRIM ( TV )', 'PARTICULAR', 70.00),
            ('US OBST. 1º TRIM ( TV )', 'VALE+', 70.00),
            ('US OBST. 2º, 3º TRIM', 'CLINIPAM', 70.00),
            ('US OBST. 2º, 3º TRIM', 'MENSALISTA', 70.00),
            ('US OBST. 2º, 3º TRIM', 'PARCEIRO/SUS', 70.00),
            ('US OBST. 2º, 3º TRIM', 'PARTICULAR', 70.00),
            ('US OBST. 2º, 3º TRIM', 'VALE+', 70.00),
            ('US OBST. GEM(CADA FETO)', 'CLINIPAM', 70.00),
            ('US OBST. GEM(CADA FETO)', 'MENSALISTA', 70.00),
            ('US OBST. GEM(CADA FETO)', 'PARCEIRO/SUS', 70.00),
            ('US OBST. GEM(CADA FETO)', 'PARTICULAR', 70.00),
            ('US OBST. GEM(CADA FETO)', 'VALE+', 70.00),
            ('US OBST. GEM(CADA FETO) C/DOOP', 'CLINIPAM', 100.00),
            ('US OBST. GEM(CADA FETO) C/DOOP', 'MENSALISTA', 100.00),
            ('US OBST. GEM(CADA FETO) C/DOOP', 'PARCEIRO/SUS', 100.00),
            ('US OBST. GEM(CADA FETO) C/DOOP', 'PARTICULAR', 100.00),
            ('US OBST. GEM(CADA FETO) C/DOOP', 'VALE+', 100.00),
            ('US OMBRO', 'CLINIPAM', 70.00),
            ('US OMBRO', 'MENSALISTA', 70.00),
            ('US OMBRO', 'PARCEIRO/SUS', 70.00),
            ('US OMBRO', 'PARTICULAR', 70.00),
            ('US OMBRO', 'VALE+', 70.00),
            ('US PAREDE ABDOM (HERNIAS)', 'MENSALISTA', 70.00),
            ('US PAREDE ABDOM (HERNIAS)', 'PARCEIRO/SUS', 70.00),
            ('US PAREDE ABDOM (HERNIAS)', 'PARTICULAR', 70.00),
            ('US PAREDE ABDOM (HERNIAS)', 'VALE+', 70.00),
            ('US PARTES MOLES (LESOES ESPECIFICAS)', 'CLINIPAM', 70.00),
            ('US PARTES MOLES (LESOES ESPECIFICAS)', 'MENSALISTA', 70.00),
            ('US PARTES MOLES (LESOES ESPECIFICAS)', 'PARCEIRO/SUS', 70.00),
            ('US PARTES MOLES (LESOES ESPECIFICAS)', 'PARTICULAR', 70.00),
            ('US PARTES MOLES (LESOES ESPECIFICAS)', 'VALE+', 70.00),
            ('US PE (FACES VOLAR E PLANTAR)', 'CLINIPAM', 70.00),
            ('US PE (FACES VOLAR E PLANTAR)', 'MENSALISTA', 70.00),
            ('US PE (FACES VOLAR E PLANTAR)', 'PARCEIRO/SUS', 70.00),
            ('US PE (FACES VOLAR E PLANTAR)', 'PARTICULAR', 70.00),
            ('US PE (FACES VOLAR E PLANTAR)', 'VALE+', 70.00),
            ('US PENIS', 'CLINIPAM', 70.00),
            ('US PENIS', 'MENSALISTA', 70.00),
            ('US PENIS', 'PARCEIRO/SUS', 70.00),
            ('US PENIS', 'PARTICULAR', 70.00),
            ('US PENIS', 'VALE+', 70.00),
            ('US PROST. ABDOM', 'MENSALISTA', 70.00),
            ('US PROST. ABDOM', 'PARCEIRO/SUS', 70.00),
            ('US PROST. ABDOM', 'PARTICULAR', 70.00),
            ('US PROST. ABDOM', 'VALE+', 70.00),
            ('US PROST. TRANSRETAL', 'CLINIPAM', 70.00),
            ('US PROST. TRANSRETAL', 'MENSALISTA', 70.00),
            ('US PROST. TRANSRETAL', 'PARCEIRO/SUS', 70.00),
            ('US PROST. TRANSRETAL', 'PARTICULAR', 70.00),
            ('US PROST. TRANSRETAL', 'VALE+', 70.00),
            ('US PUNHO', 'CLINIPAM', 70.00),
            ('US PUNHO', 'MENSALISTA', 70.00),
            ('US PUNHO', 'PARCEIRO/SUS', 70.00),
            ('US PUNHO', 'PARTICULAR', 70.00),
            ('US PUNHO', 'VALE+', 70.00),
            ('US QUADRIL ADULTO (CADA LADO)', 'CLINIPAM', 70.00),
            ('US QUADRIL ADULTO (CADA LADO)', 'MENSALISTA', 70.00),
            ('US QUADRIL ADULTO (CADA LADO)', 'PARCEIRO/SUS', 70.00),
            ('US QUADRIL ADULTO (CADA LADO)', 'PARTICULAR', 70.00),
            ('US QUADRIL ADULTO (CADA LADO)', 'VALE+', 70.00),
            ('US REGIAO CERVICAL', 'CLINIPAM', 70.00),
            ('US REGIAO CERVICAL', 'MENSALISTA', 70.00),
            ('US REGIAO CERVICAL', 'PARCEIRO/SUS', 70.00),
            ('US REGIAO CERVICAL', 'PARTICULAR', 70.00),
            ('US REGIAO CERVICAL', 'VALE+', 70.00),
            ('US REGIAO CERVICAL (C/ DOOPLER)', 'CLINIPAM', 100.00),
            ('US REGIAO CERVICAL (C/ DOOPLER)', 'MENSALISTA', 100.00),
            ('US REGIAO CERVICAL (C/ DOOPLER)', 'PARCEIRO/SUS', 100.00),
            ('US REGIAO CERVICAL (C/ DOOPLER)', 'PARTICULAR', 100.00),
            ('US REGIAO CERVICAL (C/ DOOPLER)', 'VALE+', 100.00),
            ('US REGIAO INGUINAL (HERNIA)', 'MENSALISTA', 70.00),
            ('US REGIAO INGUINAL (HERNIA)', 'PARCEIRO/SUS', 70.00),
            ('US REGIAO INGUINAL (HERNIA)', 'PARTICULAR', 70.00),
            ('US REGIAO INGUINAL (HERNIA)', 'VALE+', 70.00),
            ('US TIREOIDE', 'CLINIPAM', 70.00),
            ('US TIREOIDE', 'MENSALISTA', 70.00),
            ('US TIREOIDE', 'PARCEIRO/SUS', 70.00),
            ('US TIREOIDE', 'PARTICULAR', 70.00),
            ('US TIREOIDE', 'VALE+', 70.00),
            ('US TIREOIDE ( COM DOPPLER )', 'CLINIPAM', 100.00),
            ('US TIREOIDE ( COM DOPPLER )', 'MENSALISTA', 100.00),
            ('US TIREOIDE ( COM DOPPLER )', 'PARCEIRO/SUS', 100.00),
            ('US TIREOIDE ( COM DOPPLER )', 'PARTICULAR', 100.00),
            ('US TIREOIDE ( COM DOPPLER )', 'VALE+', 100.00),
            ('US TORAXICA EXTRA-CARDIACA', 'CLINIPAM', 70.00),
            ('US TORAXICA EXTRA-CARDIACA', 'MENSALISTA', 70.00),
            ('US TORAXICA EXTRA-CARDIACA', 'PARCEIRO/SUS', 70.00),
            ('US TORAXICA EXTRA-CARDIACA', 'PARTICULAR', 70.00),
            ('US TORAXICA EXTRA-CARDIACA', 'VALE+', 70.00),
            ('US TORNOZELO', 'CLINIPAM', 70.00),
            ('US TORNOZELO', 'MENSALISTA', 70.00),
            ('US TORNOZELO', 'PARCEIRO/SUS', 70.00),
            ('US TORNOZELO', 'PARTICULAR', 70.00),
            ('US TORNOZELO', 'VALE+', 70.00),
            ('VAL. ATESTADO', 'MENSALISTA', 50.00),
            ('VAL. ATESTADO', 'PARCEIRO/SUS', 50.00),
            ('VALOR FECHADO minimo P/ 2 HORAS ATENDIMENTO', 'INDEPENDENTE', 300.00)
        ) AS dados(procedimento_nome, convenio_nome, valor)
    LOOP
        SELECT id INTO v_procedimento_id FROM procedimento WHERE nome = rec.procedimento_nome LIMIT 1;
        IF v_procedimento_id IS NULL THEN
            RAISE EXCEPTION 'Procedimento % não encontrado', rec.procedimento_nome;
        END IF;

        SELECT id INTO v_convenio_id FROM convenio WHERE nome = rec.convenio_nome LIMIT 1;
        IF v_convenio_id IS NULL THEN
            RAISE EXCEPTION 'Convênio % não encontrado', rec.convenio_nome;
        END IF;

        IF EXISTS (SELECT 1 FROM preco_procedimento
                  WHERE procedimento_id = v_procedimento_id
                    AND convenio_id = v_convenio_id
                    AND unidade_id = v_unidade_id) THEN
            UPDATE preco_procedimento
               SET preco = rec.valor,
                   repasse = rec.valor
             WHERE procedimento_id = v_procedimento_id
               AND convenio_id = v_convenio_id
               AND unidade_id = v_unidade_id;
        ELSE
            INSERT INTO preco_procedimento (procedimento_id, convenio_id, unidade_id, preco, repasse)
            VALUES (v_procedimento_id, v_convenio_id, v_unidade_id, rec.valor, rec.valor);
        END IF;
    END LOOP;
END $$;
