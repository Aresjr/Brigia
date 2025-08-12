import { Entidade } from '../shared/entidade.interface';
import { Especialidade } from '../especialidade/especialidade.interface';

export interface Procedimento extends Entidade {
    codigo: string | null;
    nome: string;
    especialidade: Especialidade;
    valorPadrao: number;
    observacoes: string | null;
}

export interface ProcedimentoResponse {
    items: Procedimento[];
    currentPage: number;
    totalPages: number;
    totalRecords: number;
}
