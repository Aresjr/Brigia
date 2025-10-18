CREATE TABLE agenda_semanal (
    id BIGSERIAL PRIMARY KEY,
    profissional_id BIGINT NOT NULL,
    dia_semana INTEGER NOT NULL,
    hora_inicial TIME NOT NULL,
    hora_final TIME NOT NULL,
    criado_em TIMESTAMP NOT NULL DEFAULT NOW(),
    criado_por BIGINT,
    atualizado_em TIMESTAMP,
    atualizado_por BIGINT,
    excluido BOOLEAN NOT NULL DEFAULT FALSE,
    excluido_em TIMESTAMP,
    excluido_por BIGINT,
    CONSTRAINT fk_agenda_semanal_profissional FOREIGN KEY (profissional_id) REFERENCES profissional(id)
);

CREATE INDEX idx_agenda_semanal_profissional ON agenda_semanal(profissional_id);
CREATE INDEX idx_agenda_semanal_dia_semana ON agenda_semanal(dia_semana);

COMMENT ON COLUMN agenda_semanal.dia_semana IS '0 = Domingo, 1 = Segunda, 2 = Terça, 3 = Quarta, 4 = Quinta, 5 = Sexta, 6 = Sábado';
