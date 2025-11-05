CREATE TABLE IF NOT EXISTS fila_espera (
    id BIGSERIAL PRIMARY KEY,
    paciente_id BIGINT NOT NULL,
    especialidade_id BIGINT NOT NULL,
    observacoes TEXT,
    criado_em TIMESTAMP NOT NULL DEFAULT NOW(),
    criado_por BIGINT,
    atualizado_em TIMESTAMP,
    atualizado_por BIGINT,
    excluido BOOLEAN NOT NULL DEFAULT FALSE,
    excluido_em TIMESTAMP,
    excluido_por BIGINT,
    CONSTRAINT fk_fila_espera_paciente FOREIGN KEY (paciente_id) REFERENCES paciente(id),
    CONSTRAINT fk_fila_espera_especialidade FOREIGN KEY (especialidade_id) REFERENCES especialidade(id)
);

CREATE INDEX IF NOT EXISTS idx_fila_espera_paciente ON fila_espera(paciente_id);
CREATE INDEX IF NOT EXISTS idx_fila_espera_especialidade ON fila_espera(especialidade_id);

COMMENT ON TABLE fila_espera IS 'Fila de espera para agendamentos por especialidade';
COMMENT ON COLUMN fila_espera.observacoes IS 'Observações como preferência de horário, retorno, etc.';
