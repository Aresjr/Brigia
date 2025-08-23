import { Entidade, EntidadeResponse } from '../shared/entidade.interface';

export interface Especialidade extends Entidade {
    descricao: string | null;
}

export interface EspecialidadesResponse extends EntidadeResponse {
    items: Especialidade[];
}
