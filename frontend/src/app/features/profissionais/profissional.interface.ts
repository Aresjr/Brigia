import { Entidade } from '../shared/entidade.interface';
import { Especialidade } from '../especialidade/especialidade.interface';

export interface Profissional extends Entidade {
    email: string | null;
    cpf: string | null;
    dataNascimento: string;
    sexo: string | null;
    celular: string | null;
    crm: string | null;
    urlImagem: string | null;
    especialidades?: Especialidade[];
}

export interface ProfissionalResponse {
    items: Profissional[];
    currentPage: number;
    totalPages: number;
    totalRecords: number;
}
