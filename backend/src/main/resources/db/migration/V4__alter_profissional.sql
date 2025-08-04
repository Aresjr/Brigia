ALTER TABLE profissional DROP COLUMN IF EXISTS cep;
ALTER TABLE profissional DROP COLUMN IF EXISTS bairro;
ALTER TABLE profissional DROP COLUMN IF EXISTS cidade;
ALTER TABLE profissional DROP COLUMN IF EXISTS complemento;
ALTER TABLE profissional DROP COLUMN IF EXISTS uf;
ALTER TABLE profissional DROP COLUMN IF EXISTS rua;

ALTER TABLE profissional ADD COLUMN IF NOT EXISTS crm VARCHAR(7) NULL UNIQUE;

ALTER TABLE profissional ADD CONSTRAINT uc_profissional_cpf UNIQUE (cpf);
ALTER TABLE profissional ADD CONSTRAINT uc_profissional_crm UNIQUE (crm);
ALTER TABLE profissional ADD CONSTRAINT uc_profissional_email UNIQUE (email);
ALTER TABLE profissional ADD CONSTRAINT uc_profissional_celular UNIQUE (celular);