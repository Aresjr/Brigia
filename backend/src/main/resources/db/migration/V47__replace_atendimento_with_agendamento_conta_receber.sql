-- Substitui atendimento_id por agendamento_id em conta_receber
-- Isso permite que contas a receber sejam criadas diretamente do agendamento
-- e mantém a referência ao agendamento mesmo após o atendimento

-- Adiciona a coluna agendamento_id
ALTER TABLE conta_receber
ADD COLUMN agendamento_id BIGINT;

-- Migra os dados existentes: busca o agendamento através do atendimento
UPDATE conta_receber cr
SET agendamento_id = at.agendamento_id
FROM atendimento at
WHERE cr.atendimento_id = at.id
  AND cr.agendamento_id IS NULL;

-- Adiciona constraint de foreign key para agendamento
ALTER TABLE conta_receber
ADD CONSTRAINT fk_conta_receber_agendamento
FOREIGN KEY (agendamento_id) REFERENCES agendamento(id);

-- Remove a constraint de foreign key antiga
ALTER TABLE conta_receber
DROP CONSTRAINT IF EXISTS fk_conta_receber_atendimento;

-- Remove a coluna atendimento_id
ALTER TABLE conta_receber
DROP COLUMN atendimento_id;

-- Cria índice para melhor performance nas consultas
CREATE INDEX idx_conta_receber_agendamento_id ON conta_receber(agendamento_id);
