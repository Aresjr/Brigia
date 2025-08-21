ALTER TABLE preco_procedimento DROP COLUMN IF EXISTS empresa_planio_id;

update convenio set nome = 'VALE+' where nome = 'VALUE+';
update convenio set nome = 'VALE+/MENSALISTA' where nome = 'VALUE+/MENSALISTA';