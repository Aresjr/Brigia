-- Renomeia a coluna valor_total_lancado para valor_procedimentos_adicionais na tabela conta_receber
ALTER TABLE conta_receber RENAME COLUMN valor_total_lancado TO valor_procedimentos_adicionais;
