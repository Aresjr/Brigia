import { Entidade } from '../shared/entidade.interface';

export interface Convenio extends Entidade {
    nome: string;
    descricao: string | null;
}

export interface ConvenioResponse {
    items: Convenio[];
    currentPage: number;
    totalPages: number;
    totalRecords: number;
}
