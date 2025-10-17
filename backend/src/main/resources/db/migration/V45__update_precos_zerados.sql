-- Atualiza preços zerados em preco_procedimento (preços por convênio) com o valor padrão do procedimento
UPDATE preco_procedimento pp
SET preco = p.valor_padrao
FROM procedimento p
WHERE pp.procedimento_id = p.id
  AND pp.preco = 0
  AND p.valor_padrao IS NOT NULL
  AND p.valor_padrao > 0;

-- Atualiza preços zerados em procedimento_plano (preços por plano) com o valor padrão do procedimento
UPDATE procedimento_plano ppl
SET preco = p.valor_padrao
FROM procedimento p
WHERE ppl.procedimento_id = p.id
  AND ppl.preco = 0
  AND p.valor_padrao IS NOT NULL
  AND p.valor_padrao > 0;
