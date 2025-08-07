ALTER TABLE preco_procedimento DROP CONSTRAINT preco_procedimento_pkey;
ALTER TABLE preco_procedimento ADD COLUMN id BIGINT;
ALTER TABLE preco_procedimento ADD PRIMARY KEY (id);