ALTER TABLE procedimento ADD COLUMN IF NOT EXISTS tipo smallint;

UPDATE procedimento set tipo = 3;
UPDATE procedimento set tipo = 0 where nome like 'CONSULTA %';
UPDATE procedimento set tipo = 1 where nome like 'EXAME %';
UPDATE procedimento set tipo = 2 where nome like 'ASO %';