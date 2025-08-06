alter table if exists agendamento
	alter column criado_por set data type bigint USING criado_por::bigint,
	alter column atualizado_por set data type bigint USING atualizado_por::bigint,
	alter column excluido_por set data type bigint USING excluido_por::bigint;
alter table if exists convenio
	alter column criado_por set data type bigint USING criado_por::bigint,
	alter column atualizado_por set data type bigint USING atualizado_por::bigint,
	alter column excluido_por set data type bigint USING excluido_por::bigint;
alter table if exists especialidade
	alter column criado_por set data type bigint USING criado_por::bigint,
	alter column atualizado_por set data type bigint USING atualizado_por::bigint,
	alter column excluido_por set data type bigint USING excluido_por::bigint;
alter table if exists paciente
	alter column criado_por set data type bigint USING criado_por::bigint,
	alter column atualizado_por set data type bigint USING atualizado_por::bigint,
	alter column excluido_por set data type bigint USING excluido_por::bigint;
alter table if exists preco_procedimento
	alter column criado_por set data type bigint USING criado_por::bigint,
	alter column atualizado_por set data type bigint USING atualizado_por::bigint,
	alter column excluido_por set data type bigint USING excluido_por::bigint;
alter table if exists procedimento
	alter column criado_por set data type bigint USING criado_por::bigint,
	alter column atualizado_por set data type bigint USING atualizado_por::bigint,
	alter column excluido_por set data type bigint USING excluido_por::bigint;
alter table if exists profissional
	alter column criado_por set data type bigint USING criado_por::bigint,
	alter column atualizado_por set data type bigint USING atualizado_por::bigint,
	alter column excluido_por set data type bigint USING excluido_por::bigint;
alter table if exists unidade
	alter column criado_por set data type bigint USING criado_por::bigint,
	alter column atualizado_por set data type bigint USING atualizado_por::bigint,
	alter column excluido_por set data type bigint USING excluido_por::bigint;
