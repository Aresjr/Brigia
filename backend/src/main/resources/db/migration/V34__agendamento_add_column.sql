ALTER TABLE agendamento ADD COLUMN IF NOT EXISTS preco_alterado boolean DEFAULT false;
ALTER TABLE agendamento ADD COLUMN IF NOT EXISTS tipo_agendamento smallint;