import { Entidade, EntidadeRequest } from '../shared/entidade.interface';
import { Especialidade } from '../especialidade/especialidade.interface';

export interface Profissional extends Entidade {
    email: string | null;
    cpf: string | null;
    dataNascimento: string;
    sexo: string | null;
    celular: string | null;
    crm: string | null;
    rqe: string | null;
    valorHora: number | null;
    urlImagem: string | null;
    especialidades?: Especialidade[];
}

export interface ProfissionalRequest extends EntidadeRequest {
    email: string | null;
    cpf: string | null;
    dataNascimento: string;
    sexo: string | null;
    celular: string | null;
    crm: string | null;
    rqe: string | null;
    valorHora: number | null;
    urlImagem: string | null;
    especialidades?: Especialidade[];
}
