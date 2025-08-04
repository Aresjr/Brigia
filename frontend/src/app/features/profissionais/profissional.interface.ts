import { Entidade } from '../shared/entidade.interface';

export interface Profissional extends Entidade {
    nome: string;
    email: string | null;
    cpf: string | null;
    dataNascimento: string;
    sexo: string | null;
    celular: string | null;
    crm: string | null;
    urlImagem: string | null;
}

export interface ProfissionalResponse {
    items: Profissional[];
    currentPage: number;
    totalPages: number;
    totalRecords: number;
}
