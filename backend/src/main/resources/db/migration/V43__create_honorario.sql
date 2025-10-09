CREATE TABLE honorario (
    id BIGSERIAL PRIMARY KEY,
    profissional_id BIGINT NOT NULL,
    data DATE NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    quantidade_atendimentos INTEGER NOT NULL,
    unidade_id BIGINT NOT NULL,
    criado_em TIMESTAMP NOT NULL DEFAULT NOW(),
    criado_por BIGINT,
    atualizado_em TIMESTAMP,
    atualizado_por BIGINT,
    excluido BOOLEAN NOT NULL DEFAULT FALSE,
    excluido_em TIMESTAMP,
    excluido_por BIGINT,
    CONSTRAINT fk_honorario_profissional FOREIGN KEY (profissional_id) REFERENCES profissional(id),
    CONSTRAINT fk_honorario_unidade FOREIGN KEY (unidade_id) REFERENCES unidade(id)
);

CREATE INDEX idx_honorario_profissional ON honorario(profissional_id);
CREATE INDEX idx_honorario_data ON honorario(data);
CREATE INDEX idx_honorario_unidade ON honorario(unidade_id);
