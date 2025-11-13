import { Entidade, EntidadeRequest } from '../shared/entidade.interface';

export interface Convenio extends Entidade {
    descricao: string | null;
    particular: boolean;
}

export interface ConvenioRequest extends EntidadeRequest {
    descricao: string | null;
    particular: boolean;
}
