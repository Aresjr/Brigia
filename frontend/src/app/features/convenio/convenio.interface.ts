import { Entidade, EntidadeRequest } from '../shared/entidade.interface';

export interface Convenio extends Entidade {
    descricao: string | null;
}

export interface ConvenioRequest extends EntidadeRequest {
    descricao: string | null;
}
