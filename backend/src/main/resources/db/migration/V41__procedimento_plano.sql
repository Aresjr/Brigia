CREATE TABLE procedimento_plano (
    id BIGSERIAL PRIMARY KEY,
    procedimento_id BIGINT NOT NULL,
    plano_id BIGINT NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    repasse DECIMAL(10, 2),
    CONSTRAINT fk_procedimento_plano_procedimento FOREIGN KEY (procedimento_id) REFERENCES procedimento(id) ON DELETE CASCADE,
    CONSTRAINT fk_procedimento_plano_plano FOREIGN KEY (plano_id) REFERENCES empresa_plano(id),
    CONSTRAINT uk_procedimento_plano UNIQUE (procedimento_id, plano_id)
);

CREATE INDEX idx_procedimento_plano_procedimento ON procedimento_plano(procedimento_id);
CREATE INDEX idx_procedimento_plano_plano ON procedimento_plano(plano_id);
