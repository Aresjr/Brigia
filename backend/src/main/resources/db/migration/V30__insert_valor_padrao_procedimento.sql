DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ASO - ADM') THEN
RAISE EXCEPTION 'Procedimento ASO - ADM not found';
END IF;
UPDATE procedimento SET valor_padrao = 90.00 WHERE nome = 'ASO - ADM';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ASO - DEM') THEN
RAISE EXCEPTION 'Procedimento ASO - DEM not found';
END IF;
UPDATE procedimento SET valor_padrao = 90.00 WHERE nome = 'ASO - DEM';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ASO - PER') THEN
RAISE EXCEPTION 'Procedimento ASO - PER not found';
END IF;
UPDATE procedimento SET valor_padrao = 90.00 WHERE nome = 'ASO - PER';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ASO - RET. AO TRAB.') THEN
RAISE EXCEPTION 'Procedimento ASO - RET. AO TRAB. not found';
END IF;
UPDATE procedimento SET valor_padrao = 90.00 WHERE nome = 'ASO - RET. AO TRAB.';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ASO - MUD. FUNÇÃO') THEN
RAISE EXCEPTION 'Procedimento ASO - MUD. FUNÇÃO not found';
END IF;
UPDATE procedimento SET valor_padrao = 90.00 WHERE nome = 'ASO - MUD. FUNÇÃO';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ASSINATURA DE CAT') THEN
RAISE EXCEPTION 'Procedimento ASSINATURA DE CAT not found';
END IF;
UPDATE procedimento SET valor_padrao = 260.00 WHERE nome = 'ASSINATURA DE CAT';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'REMANEJAMENTO') THEN
RAISE EXCEPTION 'Procedimento REMANEJAMENTO not found';
END IF;
UPDATE procedimento SET valor_padrao = 260.00 WHERE nome = 'REMANEJAMENTO';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ATESTADO') THEN
RAISE EXCEPTION 'Procedimento ATESTADO not found';
END IF;
UPDATE procedimento SET valor_padrao = 260.00 WHERE nome = 'ATESTADO';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AUDIO - TRAB.') THEN
RAISE EXCEPTION 'Procedimento AUDIO - TRAB. not found';
END IF;
UPDATE procedimento SET valor_padrao = 45.00 WHERE nome = 'AUDIO - TRAB.';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ACUIDADE') THEN
RAISE EXCEPTION 'Procedimento ACUIDADE not found';
END IF;
UPDATE procedimento SET valor_padrao = 35.00 WHERE nome = 'ACUIDADE';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'DINA LOMBAR') THEN
RAISE EXCEPTION 'Procedimento DINA LOMBAR not found';
END IF;
UPDATE procedimento SET valor_padrao = 65.00 WHERE nome = 'DINA LOMBAR';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'DINA PUNHO') THEN
RAISE EXCEPTION 'Procedimento DINA PUNHO not found';
END IF;
UPDATE procedimento SET valor_padrao = 60.00 WHERE nome = 'DINA PUNHO';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ECG - ELETROCARDIOGRAMA') THEN
RAISE EXCEPTION 'Procedimento ECG - ELETROCARDIOGRAMA not found';
END IF;
UPDATE procedimento SET valor_padrao = 65.00 WHERE nome = 'ECG - ELETROCARDIOGRAMA';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'EEG - ELETROENCEFALOGRAMA') THEN
RAISE EXCEPTION 'Procedimento EEG - ELETROENCEFALOGRAMA not found';
END IF;
UPDATE procedimento SET valor_padrao = 220.00 WHERE nome = 'EEG - ELETROENCEFALOGRAMA';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'ESPIROMETRIA') THEN
RAISE EXCEPTION 'Procedimento ESPIROMETRIA not found';
END IF;
UPDATE procedimento SET valor_padrao = 80.00 WHERE nome = 'ESPIROMETRIA';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AVALIAÇÃO PSICO.') THEN
RAISE EXCEPTION 'Procedimento AVALIAÇÃO PSICO. not found';
END IF;
UPDATE procedimento SET valor_padrao = 300.00 WHERE nome = 'AVALIAÇÃO PSICO.';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'RX - TORAX - 2 INC.') THEN
RAISE EXCEPTION 'Procedimento RX - TORAX - 2 INC. not found';
END IF;
UPDATE procedimento SET valor_padrao = 85.00 WHERE nome = 'RX - TORAX - 2 INC.';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'RX - COLUNA LOMBAR') THEN
RAISE EXCEPTION 'Procedimento RX - COLUNA LOMBAR not found';
END IF;
UPDATE procedimento SET valor_padrao = 105.00 WHERE nome = 'RX - COLUNA LOMBAR';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'HEMOGRAMA - TRAB.') THEN
RAISE EXCEPTION 'Procedimento HEMOGRAMA - TRAB. not found';
END IF;
UPDATE procedimento SET valor_padrao = 23.70 WHERE nome = 'HEMOGRAMA - TRAB.';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'GLICOSE - TRAB.') THEN
RAISE EXCEPTION 'Procedimento GLICOSE - TRAB. not found';
END IF;
UPDATE procedimento SET valor_padrao = 19.50 WHERE nome = 'GLICOSE - TRAB.';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'GAMA GT - TRAB.') THEN
RAISE EXCEPTION 'Procedimento GAMA GT - TRAB. not found';
END IF;
UPDATE procedimento SET valor_padrao = 20.00 WHERE nome = 'GAMA GT - TRAB.';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COLINESTERASE - TRAB.') THEN
RAISE EXCEPTION 'Procedimento COLINESTERASE - TRAB. not found';
END IF;
UPDATE procedimento SET valor_padrao = 30.00 WHERE nome = 'COLINESTERASE - TRAB.';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'CREATININA - TRAB.') THEN
RAISE EXCEPTION 'Procedimento CREATININA - TRAB. not found';
END IF;
UPDATE procedimento SET valor_padrao = 23.00 WHERE nome = 'CREATININA - TRAB.';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AC. HUPURICO - TRAB.') THEN
RAISE EXCEPTION 'Procedimento AC. HUPURICO - TRAB. not found';
END IF;
UPDATE procedimento SET valor_padrao = 29.50 WHERE nome = 'AC. HUPURICO - TRAB.';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AC. METIL HIPURICO - TRAB.') THEN
RAISE EXCEPTION 'Procedimento AC. METIL HIPURICO - TRAB. not found';
END IF;
UPDATE procedimento SET valor_padrao = 29.50 WHERE nome = 'AC. METIL HIPURICO - TRAB.';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'AC. MANDELICO - TRAB.') THEN
RAISE EXCEPTION 'Procedimento AC. MANDELICO - TRAB. not found';
END IF;
UPDATE procedimento SET valor_padrao = 29.50 WHERE nome = 'AC. MANDELICO - TRAB.';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'RETICULOCITOS - TRAB.') THEN
RAISE EXCEPTION 'Procedimento RETICULOCITOS - TRAB. not found';
END IF;
UPDATE procedimento SET valor_padrao = 26.00 WHERE nome = 'RETICULOCITOS - TRAB.';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'VDRL - TRAB.') THEN
RAISE EXCEPTION 'Procedimento VDRL - TRAB. not found';
END IF;
UPDATE procedimento SET valor_padrao = 22.00 WHERE nome = 'VDRL - TRAB.';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'COPROCULTURA - TRAB.') THEN
RAISE EXCEPTION 'Procedimento COPROCULTURA - TRAB. not found';
END IF;
UPDATE procedimento SET valor_padrao = 25.00 WHERE nome = 'COPROCULTURA - TRAB.';
END $$;

DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM procedimento WHERE nome = 'PARASITOLÓGICO DE FEZES') THEN
RAISE EXCEPTION 'Procedimento PARASITOLÓGICO DE FEZES not found';
END IF;
UPDATE procedimento SET valor_padrao = 20.50 WHERE nome = 'PARASITOLÓGICO DE FEZES';
END $$;
