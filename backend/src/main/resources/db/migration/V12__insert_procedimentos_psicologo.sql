--excluídos procedimentos duplicados cadastrados das especialidades duplicadas
DELETE FROM procedimento
where especialidade_id IN (
	select id
	from especialidade
	where id NOT IN (
	    SELECT MAX(id)
	    FROM especialidade
	    GROUP BY nome
	)
);

--excluídas especialidades duplicadas
DELETE FROM especialidade
where id NOT IN (
    SELECT MAX(id)
    FROM especialidade
    GROUP BY nome
);

--excluídos procedimentos duplicados (um estava com acento, outro não)
DELETE FROM procedimento WHERE nome = 'US DOOPLER AORTA/ILIACAS';
DELETE FROM procedimento WHERE nome = 'US AP URINARIO - MASC (C/ DOOPLER)';
DELETE FROM procedimento WHERE nome = 'US AP URINARIO - FEM (C/ DOOPLER)';
DELETE FROM procedimento WHERE nome = 'US AP URINARIO - MASC';
DELETE FROM procedimento WHERE nome = 'US AP URINARIO - FEM';
DELETE FROM procedimento WHERE nome = 'CULT SEC VAGINAL (STREPTOCOCCUS B)';

ALTER TABLE especialidade ADD CONSTRAINT uc_especialidade_nome UNIQUE (nome);
ALTER TABLE procedimento ADD CONSTRAINT uc_procedimento_codigo UNIQUE (codigo);

insert into procedimento (nome, especialidade_id) SELECT '1º a 3º SESSÃO', id from especialidade where nome like 'PSICOLÓGO';
insert into procedimento (nome, especialidade_id) SELECT 'A PARTIR DA 4º SESSÃO', id from especialidade where nome like 'PSICOLÓGO';
insert into procedimento (nome, especialidade_id) SELECT '1º SESSÃO', id from especialidade where nome like 'PSICOLÓGO';
insert into procedimento (nome, especialidade_id) SELECT '2º a 5ºSESSÃO', id from especialidade where nome like 'PSICOLÓGO';
insert into procedimento (nome, especialidade_id) SELECT 'A PARTIR DA 6º SESSÃO', id from especialidade where nome like 'PSICOLÓGO';