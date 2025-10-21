-- Adicionar coluna unidade_id na tabela procedimento_plano
ALTER TABLE procedimento_plano ADD COLUMN unidade_id BIGINT;

-- Adicionar foreign key para unidade
ALTER TABLE procedimento_plano
    ADD CONSTRAINT fk_procedimento_plano_unidade FOREIGN KEY (unidade_id) REFERENCES unidade(id);

-- Criar índice para melhorar performance
CREATE INDEX IF NOT EXISTS idx_procedimento_plano_unidade ON procedimento_plano(unidade_id);

-- Remover constraint de unique antiga (procedimento_id, plano_id)
ALTER TABLE procedimento_plano DROP CONSTRAINT IF EXISTS uk_procedimento_plano;

-- Adicionar nova constraint de unique incluindo unidade_id
ALTER TABLE procedimento_plano
    ADD CONSTRAINT uk_procedimento_plano UNIQUE (procedimento_id, plano_id, unidade_id);
