import { Entidade, EntidadeRequest } from '../shared/entidade.interface';
import { Paciente } from '../pacientes/paciente.interface';
import { Especialidade } from '../especialidade/especialidade.interface';
import { Procedimento } from '../procedimentos/procedimento.interface';
import { Convenio } from '../convenio/convenio.interface';
import { Empresa } from '../empresa/empresa.interface';

export interface OrcamentoProcedimento {
  id?: number;
  procedimento: Procedimento;
  quantidade: number;
  valor?: number;
  valorRepasse?: number;
  desconto?: number;
}

export interface Orcamento extends Entidade {
    descricao?: string | null;
    data: string;
    hora: string;
    duracao?: number;
    paciente: Paciente;
    especialidade?: Especialidade;
    procedimento?: Procedimento | null;
    procedimentos?: OrcamentoProcedimento[] | null;
    convenio?: Convenio;
    empresa?: Empresa;
    valor: number;
    desconto?: number | null;
    formaPagamento?: number | null;
    observacoes?: string;
    precoAlterado?: boolean;
    tipoAgendamento?: number | null;
}

export interface OrcamentoRequest extends EntidadeRequest {
    descricao?: string | null;
    data: string;
    hora: string;
    duracao?: number;
    pacienteId: number;
    especialidadeId?: number;
    procedimentoId?: number;
    procedimentos?: OrcamentoProcedimento[] | null;
    convenioId?: number;
    empresaId?: number;
    valor: number;
    desconto?: number | null;
    formaPagamento?: number | null;
    observacoes?: string;
    precoAlterado?: boolean;
    tipoAgendamento?: number | null;
}

export const TIPO_AGENDAMENTO = [
  { label: 'Encaixe', value: 0 },
  { label: 'Agendado', value: 1 }
];

export const FORMAS_PAGAMENTO = [
  { label: 'Dinheiro', value: 0 },
  { label: 'Cheque', value: 1 },
  { label: 'Cartão', value: 2 }
];

