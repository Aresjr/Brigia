ALTER TABLE agendamento ALTER COLUMN paciente_id SET NOT NULL;
ALTER TABLE agendamento ALTER COLUMN profissional_id SET NOT NULL;

ALTER TABLE agendamento ADD COLUMN IF NOT EXISTS unidade_id bigint;
ALTER TABLE agendamento ALTER COLUMN unidade_id SET NOT NULL;

ALTER TABLE agendamento ADD COLUMN IF NOT EXISTS duracao INTEGER;
ALTER TABLE agendamento ALTER COLUMN duracao SET NOT NULL;