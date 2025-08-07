import { Entidade } from '../shared/entidade.interface';

export interface Especialidades extends Entidade {
    nome: string;
    descricao: string | null;
}

export interface EspecialidadesResponse {
    items: Especialidades[];
    currentPage: number;
    totalPages: number;
    totalRecords: number;
}
