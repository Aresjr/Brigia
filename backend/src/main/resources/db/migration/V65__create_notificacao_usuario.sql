ALTER TABLE notificacao
    DROP COLUMN lida,
    DROP COLUMN lida_em;

CREATE TABLE notificacao_usuario (
    id BIGSERIAL PRIMARY KEY,
    notificacao_id BIGINT NOT NULL,
    usuario_id BIGINT NOT NULL,
    lida BOOLEAN NOT NULL DEFAULT FALSE,
    lida_em TIMESTAMP,
    CONSTRAINT fk_notificacao_usuario_notificacao FOREIGN KEY (notificacao_id) REFERENCES notificacao(id),
    CONSTRAINT fk_notificacao_usuario_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id),
    CONSTRAINT uk_notificacao_usuario UNIQUE (notificacao_id, usuario_id)
);

CREATE INDEX idx_notificacao_usuario_usuario ON notificacao_usuario(usuario_id, lida);
