ALTER TABLE paciente
    ALTER COLUMN celular_2 TYPE VARCHAR(20),
    ALTER COLUMN fixo TYPE VARCHAR(20);

COMMENT ON COLUMN paciente.celular_2 IS 'Número de celular secundário do paciente';
COMMENT ON COLUMN paciente.fixo IS 'Número de telefone fixo do paciente';

