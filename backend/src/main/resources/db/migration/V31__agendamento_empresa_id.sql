ALTER TABLE agendamento ADD COLUMN IF NOT EXISTS empresa_id bigint;
ALTER TABLE agendamento ADD CONSTRAINT agendamento_empresa_id FOREIGN KEY (empresa_id)
    REFERENCES public.empresa (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;