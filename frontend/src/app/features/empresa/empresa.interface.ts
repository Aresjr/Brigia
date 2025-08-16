import { Entidade } from '../shared/entidade.interface';

export interface Empresa extends Entidade {
    descricao: string | null;
}

export interface EmpresaResponse {
    items: Empresa[];
    currentPage: number;
    totalPages: number;
    totalRecords: number;
}
