delete from convenio where nome = 'PARTICULAR';

alter table procedimento add valor_padrao numeric(38) NULL;

update procedimento set valor_padrao = 120 where nome like '17-HIDROXICORTICOSTEROIDES';

alter table preco_procedimento DROP id;
alter table preco_procedimento add id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY;
alter table preco_procedimento DROP CONSTRAINT IF EXISTS fkapng51ol66ley0yeihfjbjeep;

insert into preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
select 110, p.id, c.id, u.id from procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
where p.nome = '17-HIDROXICORTICOSTEROIDES' and c.nome = 'VALUE+/MENSALISTA' and u.nome = 'Itapoá';
insert into preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
select 115, p.id, c.id, u.id from procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
where p.nome = '17-HIDROXICORTICOSTEROIDES' and c.nome = 'PARCEIRO/SUS' and u.nome = 'Itapoá';
insert into preco_procedimento (preco, procedimento_id, convenio_id, unidade_id)
select 115, p.id, c.id, u.id from procedimento p JOIN convenio c ON 1 = 1 JOIN unidade u ON 1 = 1
where p.nome = '17-HIDROXICORTICOSTEROIDES' and c.nome = 'CLINIPAM' and u.nome = 'Itapoá';
