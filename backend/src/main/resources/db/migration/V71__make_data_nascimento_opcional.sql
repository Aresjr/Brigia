ALTER TABLE paciente
    ALTER COLUMN data_nascimento DROP NOT NULL;

COMMENT ON COLUMN paciente.data_nascimento IS 'Data de nascimento do paciente (opcional)';

