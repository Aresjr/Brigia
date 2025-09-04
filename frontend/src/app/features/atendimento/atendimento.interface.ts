import { Entidade, EntidadeRequest, EntidadeResponse } from '../shared/entidade.interface';

export interface Atendimento extends Entidade {
    descricao: string | null;
}

export interface AtendimentoRequest extends EntidadeRequest {
    descricao: string | null;
}

export interface AtendimentoResponse extends EntidadeResponse {
    items: Atendimento[];
}
