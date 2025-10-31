-- Renomeia a coluna evolucao_clinica para sinais_vitais na tabela atendimento

ALTER TABLE atendimento RENAME COLUMN evolucao_clinica TO sinais_vitais;

COMMENT ON COLUMN atendimento.sinais_vitais IS 'Sinais vitais do paciente durante o atendimento';
