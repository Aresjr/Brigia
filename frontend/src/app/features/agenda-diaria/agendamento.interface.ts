import { Entidade, EntidadeResponse } from '../shared/entidade.interface';

export interface Agendamento extends Entidade {
    descricao: string | null;
}

export interface AgendamentoRequest {
    pacienteId: number;
    data: Date;
    hora: string;
    profissionalId: number;
    especialidadeId: number | null;
    procedimentoId: number | null;
    convenioId: number | null;
    empresaId: number | null;
    observacoes: string | null;
}

export interface AgendamentoResponse extends EntidadeResponse {
    items: Agendamento[];
}
