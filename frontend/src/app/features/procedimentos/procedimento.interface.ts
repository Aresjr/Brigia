import { Entidade } from '../shared/entidade.interface';

export interface Procedimento extends Entidade {
    codigo: string | null;
    nome: string;
    observacoes: string | null;
}

export interface ProcedimentoResponse {
    items: Procedimento[];
    currentPage: number;
    totalPages: number;
    totalRecords: number;
}
