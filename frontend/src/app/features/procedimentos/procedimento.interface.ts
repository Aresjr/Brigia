import { Entidade } from '../shared/entidade.interface';

export interface Procedimento extends Entidade {
    nome: string;
    descricao: string | null;
}

export interface ProcedimentoResponse {
    items: Procedimento[];
    currentPage: number;
    totalPages: number;
    totalRecords: number;
}
