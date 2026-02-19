import { Entidade } from '../shared/entidade.interface';
import { Procedimento } from '../procedimentos/procedimento.interface';
import { Unidade } from '../unidade/unidade.interface';
import { Convenio } from '../convenio/convenio.interface';
import { Profissional } from '../profissionais/profissional.interface';

export interface Repasse extends Entidade {
    procedimento: Procedimento;
    unidade: Unidade;
    convenio: Convenio;
    profissional: Profissional;
    valor: number;
    percentual: number | null;
    observacoes: string | null;
}

export interface RepasseRequest {
    procedimentoId: number;
    unidadeId: number;
    convenioId: number;
    profissionalId: number;
    valor: number;
    percentual: number | null;
    observacoes: string | null;
}

export interface RepasseProfissional {
    unidadeId: number;
    unidadeNome: string;
    convenioId: number;
    convenioNome: string;
    procedimentoId: number;
    procedimentoNome: string;
    valor: number;
}

