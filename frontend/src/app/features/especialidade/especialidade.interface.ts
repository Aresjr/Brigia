import { Entidade } from '../shared/entidade.interface';

export interface Especialidade extends Entidade {
    nome: string;
    descricao: string | null;
}

export interface EspecialidadesResponse {
    items: Especialidade[];
    currentPage: number;
    totalPages: number;
    totalRecords: number;
}
