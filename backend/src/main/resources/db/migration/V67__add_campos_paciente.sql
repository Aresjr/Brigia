ALTER TABLE paciente
    ADD COLUMN documento VARCHAR(255),
    ADD COLUMN celular_2 VARCHAR(11),
    ADD COLUMN fixo VARCHAR(11),
    ADD COLUMN fixo_2 VARCHAR(11),
    ADD COLUMN profissao VARCHAR(255);

ALTER TABLE paciente ADD CONSTRAINT uk_paciente_documento UNIQUE (documento);

COMMENT ON COLUMN paciente.documento IS 'Documento de identificação do paciente (RG, CNH, etc.)';
COMMENT ON COLUMN paciente.celular_2 IS 'Número de celular secundário do paciente';
COMMENT ON COLUMN paciente.fixo IS 'Número de telefone fixo do paciente';
COMMENT ON COLUMN paciente.fixo_2 IS 'Número de telefone fixo secundário do paciente';
COMMENT ON COLUMN paciente.profissao IS 'Profissão do paciente';

