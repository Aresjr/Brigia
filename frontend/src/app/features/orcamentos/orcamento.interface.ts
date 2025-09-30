import { Entidade, EntidadeRequest } from '../shared/entidade.interface';

export interface Orcamento extends Entidade {
    descricao: string | null;
    valor: number | null;
    status: string | null;
    clienteNome: string | null;
}

export interface OrcamentoRequest extends EntidadeRequest {
    nome: string;
    descricao: string | null;
    valor: number;
    status: string;
    clienteNome: string;
}
