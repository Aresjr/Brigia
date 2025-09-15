import { Entidade, EntidadeRequest } from '../shared/entidade.interface';

export interface ContaReceber extends Entidade {
    descricao: string | null;
}

export interface ContaReceberRequest extends EntidadeRequest {
    descricao: string | null;
}
