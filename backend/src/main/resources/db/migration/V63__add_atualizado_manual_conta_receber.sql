-- Adiciona campo atualizado_manual na tabela conta_receber
ALTER TABLE conta_receber
ADD COLUMN IF NOT EXISTS atualizado_manual BOOLEAN DEFAULT FALSE;

-- Define o valor padrão como FALSE para registros existentes
UPDATE conta_receber
SET atualizado_manual = FALSE
WHERE atualizado_manual IS NULL;
