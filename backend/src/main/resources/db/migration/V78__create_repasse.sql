CREATE TABLE repasse (
    id BIGSERIAL PRIMARY KEY,
    procedimento_id BIGINT NOT NULL,
    unidade_id BIGINT NOT NULL,
    convenio_id BIGINT NOT NULL,
    profissional_id BIGINT NOT NULL,
    valor NUMERIC(10, 2) NOT NULL,
    percentual NUMERIC(5, 2),
    observacoes TEXT,
    criado_em TIMESTAMP NOT NULL DEFAULT NOW(),
    criado_por BIGINT,
    atualizado_em TIMESTAMP,
    atualizado_por BIGINT,
    excluido BOOLEAN NOT NULL DEFAULT FALSE,
    excluido_em TIMESTAMP,
    excluido_por BIGINT,
    CONSTRAINT fk_repasse_procedimento FOREIGN KEY (procedimento_id) REFERENCES procedimento(id),
    CONSTRAINT fk_repasse_unidade FOREIGN KEY (unidade_id) REFERENCES unidade(id),
    CONSTRAINT fk_repasse_convenio FOREIGN KEY (convenio_id) REFERENCES convenio(id),
    CONSTRAINT fk_repasse_profissional FOREIGN KEY (profissional_id) REFERENCES profissional(id),
    CONSTRAINT uk_repasse_proc_unid_conv_prof UNIQUE (procedimento_id, unidade_id, convenio_id, profissional_id)
);

CREATE INDEX idx_repasse_procedimento ON repasse(procedimento_id);
CREATE INDEX idx_repasse_unidade ON repasse(unidade_id);
CREATE INDEX idx_repasse_convenio ON repasse(convenio_id);
CREATE INDEX idx_repasse_profissional ON repasse(profissional_id);

