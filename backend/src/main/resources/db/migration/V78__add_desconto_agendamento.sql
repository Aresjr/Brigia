-- Adiciona coluna desconto à tabela agendamento_procedimento
ALTER TABLE agendamento_procedimento ADD COLUMN IF NOT EXISTS desconto NUMERIC(10,2);

-- Adiciona comentário para documentação
COMMENT ON COLUMN agendamento_procedimento.desconto IS 'Desconto aplicado ao procedimento adicional';

