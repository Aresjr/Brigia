-- Adiciona convenio_id e data_agendamento na tabela conta_receber
-- para permitir que conta a receber seja criada a partir do agendamento sem necessidade de atendimento

ALTER TABLE conta_receber
ADD COLUMN convenio_id BIGINT,
ADD COLUMN data_agendamento DATE;

-- Adiciona constraint de foreign key para convenio
ALTER TABLE conta_receber
ADD CONSTRAINT fk_conta_receber_convenio
FOREIGN KEY (convenio_id) REFERENCES convenio(id);

-- Popula os novos campos com dados existentes (quando houver atendimento)
UPDATE conta_receber cr
SET convenio_id = a.convenio_id,
    data_agendamento = a.data
FROM atendimento at
JOIN agendamento a ON at.agendamento_id = a.id
WHERE cr.atendimento_id = at.id
  AND cr.convenio_id IS NULL;

-- Popula data_agendamento para contas sem atendimento (se houver)
-- mas que foram criadas com data atual
UPDATE conta_receber cr
SET data_agendamento = CURRENT_DATE
WHERE cr.data_agendamento IS NULL;
