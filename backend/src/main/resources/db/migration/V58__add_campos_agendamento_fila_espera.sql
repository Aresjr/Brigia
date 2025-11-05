-- Adiciona campos do agendamento à tabela fila_espera para facilitar
-- a conversão de fila de espera para agendamento com dados pré-preenchidos

ALTER TABLE fila_espera ADD COLUMN IF NOT EXISTS convenio_id BIGINT;
ALTER TABLE fila_espera ADD COLUMN IF NOT EXISTS empresa_id BIGINT;
ALTER TABLE fila_espera ADD COLUMN IF NOT EXISTS profissional_id BIGINT;
ALTER TABLE fila_espera ADD COLUMN IF NOT EXISTS procedimento_id BIGINT;
ALTER TABLE fila_espera ADD COLUMN IF NOT EXISTS tipo_agendamento SMALLINT;
ALTER TABLE fila_espera ADD COLUMN IF NOT EXISTS forma_pagamento SMALLINT;
ALTER TABLE fila_espera ADD COLUMN IF NOT EXISTS valor NUMERIC(10,2);
ALTER TABLE fila_espera ADD COLUMN IF NOT EXISTS desconto NUMERIC(10,2);
ALTER TABLE fila_espera ADD COLUMN IF NOT EXISTS duracao INTEGER;

-- Adiciona constraints de foreign key
ALTER TABLE fila_espera ADD CONSTRAINT fk_fila_espera_convenio
    FOREIGN KEY (convenio_id) REFERENCES convenio(id);

ALTER TABLE fila_espera ADD CONSTRAINT fk_fila_espera_empresa
    FOREIGN KEY (empresa_id) REFERENCES empresa(id);

ALTER TABLE fila_espera ADD CONSTRAINT fk_fila_espera_profissional
    FOREIGN KEY (profissional_id) REFERENCES profissional(id);

ALTER TABLE fila_espera ADD CONSTRAINT fk_fila_espera_procedimento
    FOREIGN KEY (procedimento_id) REFERENCES procedimento(id);

-- Adiciona índices para melhorar performance
CREATE INDEX idx_fila_espera_convenio ON fila_espera(convenio_id);
CREATE INDEX idx_fila_espera_empresa ON fila_espera(empresa_id);
CREATE INDEX idx_fila_espera_profissional ON fila_espera(profissional_id);
CREATE INDEX idx_fila_espera_procedimento ON fila_espera(procedimento_id);

-- Adiciona comentários para documentação
COMMENT ON COLUMN fila_espera.convenio_id IS 'Convênio do paciente (opcional)';
COMMENT ON COLUMN fila_espera.empresa_id IS 'Empresa do paciente (opcional)';
COMMENT ON COLUMN fila_espera.profissional_id IS 'Profissional preferencial (opcional)';
COMMENT ON COLUMN fila_espera.procedimento_id IS 'Procedimento desejado (opcional)';
COMMENT ON COLUMN fila_espera.tipo_agendamento IS 'Tipo de agendamento: 0=CONSULTA, 1=RETORNO, 2=EXAME, etc (opcional)';
COMMENT ON COLUMN fila_espera.forma_pagamento IS 'Forma de pagamento: 0=DINHEIRO, 1=CARTAO_CREDITO, etc (opcional)';
COMMENT ON COLUMN fila_espera.valor IS 'Valor estimado do procedimento (opcional)';
COMMENT ON COLUMN fila_espera.desconto IS 'Desconto aplicado (opcional)';
COMMENT ON COLUMN fila_espera.duracao IS 'Duração estimada em minutos (opcional)';
