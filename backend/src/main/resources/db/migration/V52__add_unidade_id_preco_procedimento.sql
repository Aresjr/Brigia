-- Adicionar coluna unidade_id na tabela preco_procedimento
ALTER TABLE preco_procedimento
ADD COLUMN unidade_id BIGINT;

-- Atualizar registros existentes com a primeira unidade (Itapoá)
UPDATE preco_procedimento
SET unidade_id = (SELECT id FROM unidade ORDER BY id LIMIT 1)
WHERE unidade_id IS NULL;

-- Tornar a coluna obrigatória após atualizar os registros
ALTER TABLE preco_procedimento
ALTER COLUMN unidade_id SET NOT NULL;

-- Adicionar constraint de foreign key
ALTER TABLE preco_procedimento
ADD CONSTRAINT fk_preco_procedimento_unidade
FOREIGN KEY (unidade_id) REFERENCES unidade(id);
