import { Entidade, EntidadeRequest, EntidadeResponse } from '../shared/entidade.interface';
import { Especialidade } from '../especialidade/especialidade.interface';
import { Convenio } from '../convenio/convenio.interface';
import { Unidade } from '../unidade/unidade.interface';

export interface Procedimento extends Entidade {
    codigo: string | null;
    especialidade: Especialidade;
    valorPadrao?: number;
    observacoes: string | null;
}

export interface ProcedimentoRequest extends EntidadeRequest {
    codigo: string | null;
    especialidade: Especialidade;
    valorPadrao: number;
    observacoes: string | null;
}

export interface ProcedimentoResponse extends EntidadeResponse {
    items: Procedimento[];
}

export interface PrecoProcedimentoConvenio {
    id: number;
    preco: number;
    repasse: number;
    convenio: Convenio;
    unidade: Unidade | null;
}

export interface TabelaPrecoResponse {
    procedimento: ProcedimentoResponse;
    tabelaConvenio: PrecoProcedimentoConvenio[];
}
