ALTER TABLE paciente ADD COLUMN id_externo BIGINT;

COMMENT ON COLUMN paciente.id_externo IS 'ID do paciente em sistema externo para integração';

