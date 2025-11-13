CREATE TABLE notificacao (
    id BIGSERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    mensagem TEXT NOT NULL,
    data_notificacao TIMESTAMP NOT NULL,
    tipo VARCHAR(50),
    lida BOOLEAN NOT NULL DEFAULT FALSE,
    lida_em TIMESTAMP,
    unidade_id BIGINT NOT NULL,
    criado_em TIMESTAMP NOT NULL DEFAULT NOW(),
    criado_por BIGINT,
    atualizado_em TIMESTAMP,
    atualizado_por BIGINT,
    excluido BOOLEAN NOT NULL DEFAULT FALSE,
    excluido_em TIMESTAMP,
    excluido_por BIGINT,
    CONSTRAINT fk_notificacao_unidade FOREIGN KEY (unidade_id) REFERENCES unidade(id)
);

CREATE INDEX idx_notificacao_unidade ON notificacao(unidade_id);
CREATE INDEX idx_notificacao_lida ON notificacao(lida, data_notificacao);
