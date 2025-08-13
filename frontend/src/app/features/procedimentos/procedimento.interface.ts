import { Entidade } from '../shared/entidade.interface';
import { Especialidade } from '../especialidade/especialidade.interface';
import { Convenio } from '../convenio/convenio.interface';
import { Empresa } from '../empresa/empresa.interface';
import { Unidade } from '../unidade/unidade.interface';

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

export interface PrecoProcedimentoConvenio {
    preco: number;
    repasse: number;
    convenio: Convenio;
    unidade: Unidade | null;
}

export interface PrecoProcedimentoEmpresa {
    preco: number;
    repasse: number;
    empresa: Empresa;
    unidade: Unidade | null;
}

export interface TabelaPrecoResponse {
    procedimento: ProcedimentoResponse;
    tabelaConvenio: PrecoProcedimentoConvenio[];
    tabelaEmpresa: PrecoProcedimentoEmpresa[];
}
