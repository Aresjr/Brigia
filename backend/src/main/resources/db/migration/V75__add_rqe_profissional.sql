ALTER TABLE profissional ADD COLUMN IF NOT EXISTS rqe VARCHAR(7) NULL;

ALTER TABLE profissional ADD CONSTRAINT uc_profissional_rqe UNIQUE (rqe);

