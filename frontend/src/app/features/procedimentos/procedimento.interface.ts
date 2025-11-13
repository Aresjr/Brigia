import { Entidade, EntidadeRequest } from '../shared/entidade.interface';
import { Especialidade } from '../especialidade/especialidade.interface';
import { Convenio } from '../convenio/convenio.interface';
import { Unidade } from '../unidade/unidade.interface';
import { EmpresaPlano } from '../empresa/empresa.interface';

export interface Procedimento extends Entidade {
    codigo: string | null;
    especialidade: Especialidade;
    observacoes: string | null;
    duracao: number | null;
    tipo: number | null;
}

export interface ProcedimentoRequest extends EntidadeRequest {
    nome: string;
    codigo: string | null;
    observacoes: string | null;
    especialidadeId: number;
    duracao: number | null;
    tipo: number | null;
    precosConvenios: PrecoProcedimentoConvenioRequest[];
    precosPlanos: PrecoProcedimentoPlanoRequest[];
}

export interface PrecoProcedimentoConvenio {
    id: number;
    preco: number;
    repasse: number;
    convenio: Convenio;
    unidade: Unidade | null;
}

export interface PrecoProcedimentoPlano {
    id: number;
    preco: number;
    repasse: number;
    plano: EmpresaPlano;
    unidade: Unidade | null;
}

export interface PrecoProcedimentoConvenioRequest {
    convenioId: number;
    unidadeId: number;
    preco: number;
    repasse: number | null;
}

export interface PrecoProcedimentoPlanoRequest {
    planoId: number;
    unidadeId: number | null;
    preco: number;
    repasse: number | null;
}
