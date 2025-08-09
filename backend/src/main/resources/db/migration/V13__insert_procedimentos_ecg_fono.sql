UPDATE especialidade SET nome = 'PSICÓLOGO' where nome = 'PSICOLÓGO';

delete from procedimento where nome = 'ACIDO FOLICO' and codigo is null;
ALTER TABLE procedimento ADD CONSTRAINT uc_procedimento_nome UNIQUE (nome);

insert into procedimento (nome, especialidade_id) SELECT 'ECG TELECARDIO', id from especialidade where nome = 'CARDIO + ECG';
insert into procedimento (nome, especialidade_id) SELECT 'ECG - ELETROCARDIOGRAMA', id from especialidade where nome = 'CARDIO + ECG';

insert into procedimento (nome, especialidade_id) SELECT 'AUDIOMETRIA CLINICA', id from especialidade where nome = 'FONOAUDIOLOGA';
insert into procedimento (nome, especialidade_id) SELECT 'ESPIROMETRIA', id from especialidade where nome = 'FONOAUDIOLOGA';

insert into procedimento (nome, especialidade_id) SELECT 'EEG - ELETROENCEFALOGRAMA', id from especialidade where nome = 'NEUROLOGISTA';

insert into procedimento (nome, especialidade_id) SELECT 'DINA LOMBAR', id from especialidade where nome = 'ORTOPEDISTA';
insert into procedimento (nome, especialidade_id) SELECT 'DINA PUNHO', id from especialidade where nome = 'ORTOPEDISTA';

insert into procedimento (nome, especialidade_id) SELECT 'ACUIDADE VISUAL', id from especialidade where nome = 'OFTALMOLOGISTA';

insert into procedimento (nome, especialidade_id) SELECT 'AUDIOMETRIA TRAB', id from especialidade where nome = 'FONOAUDIOLOGA';

insert into procedimento (nome, especialidade_id) SELECT 'MAPA 24H', id from especialidade where nome = 'MAPA 24H';