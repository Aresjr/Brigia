import { Entidade, EntidadeResponse } from '../shared/entidade.interface';

export interface Convenio extends Entidade {
    descricao: string | null;
}

export interface ConvenioResponse extends EntidadeResponse {
    items: Convenio[];
}
