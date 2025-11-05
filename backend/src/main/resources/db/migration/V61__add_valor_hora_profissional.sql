-- Adiciona coluna valor_hora na tabela profissional
ALTER TABLE profissional ADD COLUMN IF NOT EXISTS valor_hora DECIMAL(10, 2);
