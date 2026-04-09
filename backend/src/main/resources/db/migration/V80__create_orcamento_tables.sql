CREATE TABLE orcamento (
    id BIGSERIAL PRIMARY KEY,
    paciente_id BIGINT NOT NULL,
    data DATE NOT NULL,
    hora TIME NOT NULL,
    duracao INTEGER,
    convenio_id BIGINT,
    empresa_id BIGINT,
    especialidade_id BIGINT,
    procedimento_id BIGINT,
    forma_pagamento SMALLINT,
    valor NUMERIC(19,2) NOT NULL,
    desconto NUMERIC(19,2),
    observacoes TEXT,
    tipo_agendamento SMALLINT NOT NULL,
    preco_alterado BOOLEAN NOT NULL DEFAULT FALSE,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    criado_por VARCHAR(100),
    atualizado_por VARCHAR(100),
    excluido BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT fk_orcamento_paciente FOREIGN KEY (paciente_id) REFERENCES paciente(id),
    CONSTRAINT fk_orcamento_convenio FOREIGN KEY (convenio_id) REFERENCES convenio(id),
    CONSTRAINT fk_orcamento_empresa FOREIGN KEY (empresa_id) REFERENCES empresa(id),
    CONSTRAINT fk_orcamento_especialidade FOREIGN KEY (especialidade_id) REFERENCES especialidade(id),
    CONSTRAINT fk_orcamento_procedimento FOREIGN KEY (procedimento_id) REFERENCES procedimento(id)
);

CREATE TABLE orcamento_procedimento (
    id BIGSERIAL PRIMARY KEY,
    orcamento_id BIGINT NOT NULL,
    procedimento_id BIGINT NOT NULL,
    quantidade INTEGER NOT NULL,
    valor NUMERIC(19,2),
    valor_repasse NUMERIC(19,2),
    desconto NUMERIC(19,2),
    CONSTRAINT fk_orcamento_procedimento_orcamento FOREIGN KEY (orcamento_id) REFERENCES orcamento(id),
    CONSTRAINT fk_orcamento_procedimento_procedimento FOREIGN KEY (procedimento_id) REFERENCES procedimento(id)
);

CREATE INDEX idx_orcamento_paciente ON orcamento(paciente_id);
CREATE INDEX idx_orcamento_data ON orcamento(data);
CREATE INDEX idx_orcamento_procedimento ON orcamento_procedimento(orcamento_id);
