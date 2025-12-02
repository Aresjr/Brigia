ALTER TABLE paciente
    ALTER COLUMN celular TYPE VARCHAR(20),
    ALTER COLUMN celular_2 TYPE VARCHAR(20);

COMMENT ON COLUMN paciente.celular IS 'Número de celular principal do paciente';
COMMENT ON COLUMN paciente.celular_2 IS 'Número de celular secundário do paciente';