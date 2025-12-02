ALTER TABLE paciente
    ADD COLUMN peso VARCHAR(255),
    ADD COLUMN altura VARCHAR(255);

COMMENT ON COLUMN paciente.peso IS 'Peso do paciente';
COMMENT ON COLUMN paciente.altura IS 'Altura do paciente';

