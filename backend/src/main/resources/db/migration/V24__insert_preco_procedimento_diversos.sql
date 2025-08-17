update procedimento set nome = '2º a 5º SESSÃO' where nome = '2º a 5ºSESSÃO';

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = '1º a 3º SESSÃO') THEN
RAISE EXCEPTION 'Procedimento 1º a 3º SESSÃO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id, observacao)
SELECT 115.00, p.id, c.id, u.id, 'SEM RETORNO - PG POR SESSÃO/OU PACOTE' FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = '1º a 3º SESSÃO' and c.nome = 'VALE +/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'A PARTIR DA 4º SESSÃO') THEN
RAISE EXCEPTION 'Procedimento A PARTIR DA 4º SESSÃO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id, observacao)
SELECT 90.00, p.id, c.id, u.id, 'SEM RETORNO - PG POR SESSÃO/OU PACOTE' FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'A PARTIR DA 4º SESSÃO' and c.nome = 'VALE +/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = '1º a 3º SESSÃO') THEN
RAISE EXCEPTION 'Procedimento 1º a 3º SESSÃO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id, observacao)
SELECT 150.00, p.id, c.id, u.id, 'SEM RETORNO - PG POR SESSÃO/OU PACOTE' FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = '1º a 3º SESSÃO' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'A PARTIR DA 4º SESSÃO') THEN
RAISE EXCEPTION 'Procedimento A PARTIR DA 4º SESSÃO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id, observacao)
SELECT 120.00, p.id, c.id, u.id, 'SEM RETORNO - PG POR SESSÃO/OU PACOTE' FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'A PARTIR DA 4º SESSÃO' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = '1º SESSÃO') THEN
RAISE EXCEPTION 'Procedimento 1º SESSÃO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id, observacao)
SELECT 215.00, p.id, c.id, u.id, 'SEM RETORNO - PG POR SESSÃO/OU PACOTE' FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = '1º SESSÃO' and c.nome = 'PARTICULAR' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = '2º a 5º SESSÃO') THEN
RAISE EXCEPTION 'Procedimento 2º a 5º SESSÃO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id, observacao)
SELECT 170.00, p.id, c.id, u.id, 'SEM RETORNO - PG POR SESSÃO/OU PACOTE' FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = '2º a 5º SESSÃO' and c.nome = 'PARTICULAR' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'A PARTIR DA 6º SESSÃO') THEN
RAISE EXCEPTION 'Procedimento A PARTIR DA 6º SESSÃO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id, observacao)
SELECT 150.00, p.id, c.id, u.id, 'SEM RETORNO - PG POR SESSÃO/OU PACOTE' FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'A PARTIR DA 6º SESSÃO' and c.nome = 'PARTICULAR' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ECG TELECARDIO') THEN
RAISE EXCEPTION 'Procedimento ECG TELECARDIO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 75.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ECG TELECARDIO' and c.nome = 'VALE +/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ECG TELECARDIO') THEN
RAISE EXCEPTION 'Procedimento ECG TELECARDIO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 90.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ECG TELECARDIO' and c.nome = 'PARCEIRO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ECG TELECARDIO') THEN
RAISE EXCEPTION 'Procedimento ECG TELECARDIO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 110.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ECG TELECARDIO' and c.nome = 'PARTICULAR' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ECG - ELETROCARDIOGRAMA') THEN
RAISE EXCEPTION 'Procedimento ECG - ELETROCARDIOGRAMA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 75.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ECG - ELETROCARDIOGRAMA' and c.nome = 'VALE +/MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ECG - ELETROCARDIOGRAMA') THEN
RAISE EXCEPTION 'Procedimento ECG - ELETROCARDIOGRAMA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 90.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ECG - ELETROCARDIOGRAMA' and c.nome = 'PARCEIRO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ECG - ELETROCARDIOGRAMA') THEN
RAISE EXCEPTION 'Procedimento ECG - ELETROCARDIOGRAMA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
SELECT 110.00, p.id, c.id, u.id FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ECG - ELETROCARDIOGRAMA' and c.nome = 'PARTICULAR' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AUDIOMETRIA CLINICA') THEN
RAISE EXCEPTION 'Procedimento AUDIOMETRIA CLINICA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id, observacao)
SELECT 130.00, p.id, c.id, u.id, 'SEM RETORNO' FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'AUDIOMETRIA CLINICA' and c.nome = 'VALE +' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AUDIOMETRIA CLINICA') THEN
RAISE EXCEPTION 'Procedimento AUDIOMETRIA CLINICA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id, observacao)
SELECT 150.00, p.id, c.id, u.id, 'SEM RETORNO' FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'AUDIOMETRIA CLINICA' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AUDIOMETRIA CLINICA') THEN
RAISE EXCEPTION 'Procedimento AUDIOMETRIA CLINICA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id, observacao)
SELECT 170.00, p.id, c.id, u.id, 'SEM RETORNO' FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'AUDIOMETRIA CLINICA' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AUDIOMETRIA CLINICA') THEN
RAISE EXCEPTION 'Procedimento AUDIOMETRIA CLINICA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id, observacao)
SELECT 210.00, p.id, c.id, u.id, 'SEM RETORNO' FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'AUDIOMETRIA CLINICA' and c.nome = 'PARTICULAR' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ESPIROMETRIA') THEN
RAISE EXCEPTION 'Procedimento ESPIROMETRIA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id, observacao)
SELECT 90.00, p.id, c.id, u.id, 'SEM RETORNO' FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ESPIROMETRIA' and c.nome = 'VALE +' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ESPIROMETRIA') THEN
RAISE EXCEPTION 'Procedimento ESPIROMETRIA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id, observacao)
SELECT 100.00, p.id, c.id, u.id, 'SEM RETORNO' FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ESPIROMETRIA' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ESPIROMETRIA') THEN
RAISE EXCEPTION 'Procedimento ESPIROMETRIA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id, observacao)
SELECT 115.00, p.id, c.id, u.id, 'SEM RETORNO' FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ESPIROMETRIA' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ESPIROMETRIA') THEN
RAISE EXCEPTION 'Procedimento ESPIROMETRIA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id, observacao)
SELECT 130.00, p.id, c.id, u.id, 'SEM RETORNO' FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ESPIROMETRIA' and c.nome = 'PARTICULAR' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'EEG - ELETROENCEFALOGRAMA') THEN
RAISE EXCEPTION 'Procedimento EEG - ELETROENCEFALOGRAMA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id, observacao)
SELECT 150.00, p.id, c.id, u.id, NULL FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'EEG - ELETROENCEFALOGRAMA' and c.nome = 'VALE +' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'EEG - ELETROENCEFALOGRAMA') THEN
RAISE EXCEPTION 'Procedimento EEG - ELETROENCEFALOGRAMA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id, observacao)
SELECT 170.00, p.id, c.id, u.id, NULL FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'EEG - ELETROENCEFALOGRAMA' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'EEG - ELETROENCEFALOGRAMA') THEN
RAISE EXCEPTION 'Procedimento EEG - ELETROENCEFALOGRAMA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id, observacao)
SELECT 205.00, p.id, c.id, u.id, NULL FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'EEG - ELETROENCEFALOGRAMA' and c.nome = 'PARCEIRO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'EEG - ELETROENCEFALOGRAMA') THEN
RAISE EXCEPTION 'Procedimento EEG - ELETROENCEFALOGRAMA not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id, observacao)
SELECT 250.00, p.id, c.id, u.id, NULL FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'EEG - ELETROENCEFALOGRAMA' and c.nome = 'PARTICULAR' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'DINA LOMBAR') THEN
RAISE EXCEPTION 'Procedimento DINA LOMBAR not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id, observacao)
SELECT 45.00, p.id, c.id, u.id, NULL FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'DINA LOMBAR' and c.nome = 'VALE +' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'DINA LOMBAR') THEN
RAISE EXCEPTION 'Procedimento DINA LOMBAR not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id, observacao)
SELECT 50.00, p.id, c.id, u.id, NULL FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'DINA LOMBAR' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'DINA LOMBAR') THEN
RAISE EXCEPTION 'Procedimento DINA LOMBAR not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id, observacao)
SELECT 55.00, p.id, c.id, u.id, NULL FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'DINA LOMBAR' and c.nome = 'PARCEIRO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'DINA LOMBAR') THEN
RAISE EXCEPTION 'Procedimento DINA LOMBAR not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id, observacao)
SELECT 65.00, p.id, c.id, u.id, NULL FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'DINA LOMBAR' and c.nome = 'PARTICULAR' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'DINA PUNHO') THEN
RAISE EXCEPTION 'Procedimento DINA PUNHO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id, observacao)
SELECT 25.00, p.id, c.id, u.id, NULL FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'DINA PUNHO' and c.nome = 'VALE +' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'DINA PUNHO') THEN
RAISE EXCEPTION 'Procedimento DINA PUNHO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id, observacao)
SELECT 30.00, p.id, c.id, u.id, NULL FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'DINA PUNHO' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'DINA PUNHO') THEN
RAISE EXCEPTION 'Procedimento DINA PUNHO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id, observacao)
SELECT 40.00, p.id, c.id, u.id, NULL FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'DINA PUNHO' and c.nome = 'PARCEIRO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'DINA PUNHO') THEN
RAISE EXCEPTION 'Procedimento DINA PUNHO not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id, observacao)
SELECT 60.00, p.id, c.id, u.id, NULL FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'DINA PUNHO' and c.nome = 'PARTICULAR' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ACUIDADE VISUAL') THEN
RAISE EXCEPTION 'Procedimento ACUIDADE VISUAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id, observacao)
SELECT 18.00, p.id, c.id, u.id, NULL FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ACUIDADE VISUAL' and c.nome = 'VALE +' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ACUIDADE VISUAL') THEN
RAISE EXCEPTION 'Procedimento ACUIDADE VISUAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id, observacao)
SELECT 20.00, p.id, c.id, u.id, NULL FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ACUIDADE VISUAL' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ACUIDADE VISUAL') THEN
RAISE EXCEPTION 'Procedimento ACUIDADE VISUAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id, observacao)
SELECT 25.00, p.id, c.id, u.id, NULL FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ACUIDADE VISUAL' and c.nome = 'PARCEIRO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ACUIDADE VISUAL') THEN
RAISE EXCEPTION 'Procedimento ACUIDADE VISUAL not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id, observacao)
SELECT 35.00, p.id, c.id, u.id, NULL FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'ACUIDADE VISUAL' and c.nome = 'PARTICULAR' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AUDIOMETRIA TRAB') THEN
RAISE EXCEPTION 'Procedimento AUDIOMETRIA TRAB not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id, observacao)
SELECT 28.00, p.id, c.id, u.id, NULL FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'AUDIOMETRIA TRAB' and c.nome = 'VALE +' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AUDIOMETRIA TRAB') THEN
RAISE EXCEPTION 'Procedimento AUDIOMETRIA TRAB not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id, observacao)
SELECT 32.00, p.id, c.id, u.id, NULL FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'AUDIOMETRIA TRAB' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AUDIOMETRIA TRAB') THEN
RAISE EXCEPTION 'Procedimento AUDIOMETRIA TRAB not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id, observacao)
SELECT 35.00, p.id, c.id, u.id, NULL FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'AUDIOMETRIA TRAB' and c.nome = 'PARCEIRO' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AUDIOMETRIA TRAB') THEN
RAISE EXCEPTION 'Procedimento AUDIOMETRIA TRAB not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id, observacao)
SELECT 45.00, p.id, c.id, u.id, NULL FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'AUDIOMETRIA TRAB' and c.nome = 'PARTICULAR' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MAPA 24H') THEN
RAISE EXCEPTION 'Procedimento MAPA 24H not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id, observacao)
SELECT 195.00, p.id, c.id, u.id, 'SEM RETORNO' FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'MAPA 24H' and c.nome = 'VALE +' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MAPA 24H') THEN
RAISE EXCEPTION 'Procedimento MAPA 24H not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id, observacao)
SELECT 205.00, p.id, c.id, u.id, 'SEM RETORNO' FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'MAPA 24H' and c.nome = 'MENSALISTA' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MAPA 24H') THEN
RAISE EXCEPTION 'Procedimento MAPA 24H not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id, observacao)
SELECT 235.00, p.id, c.id, u.id, 'SEM RETORNO' FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'MAPA 24H' and c.nome = 'SUS/PARCEIROS' and u.nome = 'Itapoá';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'MAPA 24H') THEN
RAISE EXCEPTION 'Procedimento MAPA 24H not found';
END IF;
INSERT INTO preco_procedimento (preco, procedimento_id, convenio_id, unidade_id, observacao)
SELECT 280.00, p.id, c.id, u.id, 'SEM RETORNO' FROM procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
WHERE p.nome = 'MAPA 24H' and c.nome = 'PARTICULAR' and u.nome = 'Itapoá';
END $$;