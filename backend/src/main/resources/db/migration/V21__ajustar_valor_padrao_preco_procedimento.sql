-- 1 - deletar preco_procedimento duplicado
delete from preco_procedimento
where id IN (
	select pp_id
	from (
		select p.id, count(*), max(pp.id) as pp_id
		from procedimento p
		JOIN preco_procedimento pp ON p.id = pp.procedimento_id
		where pp.convenio_id is null and pp.empresa_id is null
		group by p.id
	) where count > 1
);

-- 2 - atualizar valor_padrao a patir dos registros de preco_procedimento que não têm convênio e nem empresa
UPDATE procedimento p
SET valor_padrao = pp.preco
FROM preco_procedimento pp
WHERE p.id = pp.procedimento_id
  AND pp.convenio_id IS NULL
  AND pp.empresa_id IS NULL;

-- 3 - deletar os registros preco_procedimento que não têm convênio e nem empresa
delete from preco_procedimento pp
where pp.convenio_id is null and pp.empresa_id is null;