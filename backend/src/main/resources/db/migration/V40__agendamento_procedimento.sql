CREATE TABLE agendamento_procedimento (
    id BIGSERIAL PRIMARY KEY,
    agendamento_id BIGINT NOT NULL,
    procedimento_id BIGINT NOT NULL,
    quantidade INTEGER NOT NULL,
    CONSTRAINT fk_agendamento_procedimento_agendamento FOREIGN KEY (agendamento_id) REFERENCES agendamento(id) ON DELETE CASCADE,
    CONSTRAINT fk_agendamento_procedimento_procedimento FOREIGN KEY (procedimento_id) REFERENCES procedimento(id)
);
