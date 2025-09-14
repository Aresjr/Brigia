import { Entidade, EntidadeRequest } from '../shared/entidade.interface';

export interface Especialidade extends Entidade {
    descricao: string | null;
}

export interface EspecialidadeRequest extends EntidadeRequest {
    descricao: string | null;
}
