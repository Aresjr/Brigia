import { Entidade, EntidadeRequest } from '../shared/entidade.interface';
import { Paciente } from '../pacientes/paciente.interface';
import { Profissional } from '../profissionais/profissional.interface';
import { Especialidade } from '../especialidade/especialidade.interface';
import { Procedimento } from '../procedimentos/procedimento.interface';
import { Convenio } from '../convenio/convenio.interface';
import { Empresa } from '../empresa/empresa.interface';
import { Unidade } from '../unidade/unidade.interface';

export interface Agendamento extends Entidade {
    descricao: string | null;
    data: string;
    hora: string;
    horaFim: string;
    duracao: number;
    paciente: Paciente;
    profissional: Profissional;
    especialidade: Especialidade;
    procedimento: Procedimento | null;
    procedimentos: ProcedimentoAgendamento[] | null;
    convenio?: Convenio;
    empresa?: Empresa;
    unidade: Unidade;
    tipoAgendamento: number | null;
    formaPagamento: number;
    valor: number;
    valorTotal: number;
    status: StatusAgendamentoEnum;
    observacoes?: string;
    encaixe: boolean;
    pago: boolean;
}

export function podeEditarAgendamento(agendamento: Agendamento): boolean {
  return [StatusAgendamentoEnum.Agendado, StatusAgendamentoEnum.Confirmado].includes(agendamento.status);
}

export function podeAbrirAtendimento(agendamento: Agendamento): boolean {
  return [StatusAgendamentoEnum.Agendado, StatusAgendamentoEnum.Confirmado].includes(agendamento.status);
}

export interface AgendamentoDetalhes {
    nomePaciente: string,
    data: string;
    hora: string;
    horaFim: string;
    nomeUnidade: string;
    enderecoUnidade: string;
    nomeProfissional: string;
    status: number;
}

export interface AgendamentoRequest extends EntidadeRequest {
    pacienteId: number;
    data: Date;
    hora: string;
    profissionalId: number;
    especialidadeId: number | null;
    procedimentoId: number | null;
    convenioId: number | null;
    empresaId: number | null;
    duracao: number | null;
    tipoAgendamento: number | null;
    formaPagamento: number | null;
    valor: string | null;
    desconto: number | null;
    observacoes: string | null;
    precoAlterado: boolean;
    encaixe: boolean;
    pago: boolean;
    procedimentos: ProcedimentoAgendamentoRequest[];
}

export interface ProcedimentoAgendamentoRequest {
    procedimentoId: number;
    quantidade: number;
}

export interface ProcedimentoAgendamento {
    procedimento: Procedimento;
    quantidade: number;
    valor: number | null;
    valorRepasse: number | null;
}

export enum StatusAgendamentoEnum {
  Agendado = 0,
  Confirmado = 1,
  EmAtendimento = 2,
  Cancelado = 3,
  NaoCompareceu = 4,
  Reagendado = 5,
  Finalizado = 6,
  CanceladoPeloUsuario = 7,
}

export const StatusAgendamento: Record<StatusAgendamentoEnum, { descricao: string; cor: string }> = {
  [StatusAgendamentoEnum.Agendado]: { descricao: 'Agendado', cor: '#60a5fa' },
  [StatusAgendamentoEnum.Confirmado]: { descricao: 'Confirmado', cor: '#2563EB' },
  [StatusAgendamentoEnum.EmAtendimento]: { descricao: 'Em Atendimento', cor: '#A78BFA' },
  [StatusAgendamentoEnum.Cancelado]: { descricao: 'Cancelado', cor: '#EF4444' },
  [StatusAgendamentoEnum.NaoCompareceu]: { descricao: 'Não Compareceu', cor: '#F59E0B' },
  [StatusAgendamentoEnum.Reagendado]: { descricao: 'Reagendado', cor: '#F59E0B' },
  [StatusAgendamentoEnum.Finalizado]: { descricao: 'Finalizado', cor: '#14B8A6' },
  [StatusAgendamentoEnum.CanceladoPeloUsuario]: { descricao: 'Cancelado Pelo Usuário', cor: '#EF4444' },
};

export const TIPO_AGENDAMENTO = [
  { valor: 0, descricao: 'Consulta' },
  { valor: 1, descricao: 'Exame' },
  { valor: 2, descricao: 'ASO' },
  { valor: 3, descricao: 'Procedimento' },
  { valor: 4, descricao: 'Sessão' },
  { valor: 5, descricao: 'Retorno' }
];
