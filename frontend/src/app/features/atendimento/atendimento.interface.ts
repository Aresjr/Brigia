import { Entidade, EntidadeRequest } from '../shared/entidade.interface';
import { Paciente } from '../pacientes/paciente.interface';
import { Profissional } from '../profissionais/profissional.interface';
import { Agendamento, StatusAgendamentoEnum } from '../agenda-diaria/agendamento.interface';
import { Convenio } from '../convenio/convenio.interface';
import { Empresa } from '../empresa/empresa.interface';
import { Especialidade } from '../especialidade/especialidade.interface';

export interface Atendimento extends Entidade {
    status: number;
    paciente: Paciente;
    profissional: Profissional;
    data: Date;
    horaInicio: Date;
    horaFim: Date;
    agendamento: Agendamento;
    convenio: Convenio;
    empresa: Empresa;
    especialidade: Especialidade;
    tipoAtendimento?: string;
    anamnese?: string;
    exameClinico?: string;
    diagnostico?: string;
    conduta?: string;
    observacoes?: string;
}

export interface AtendimentoRequest extends EntidadeRequest {
    descricao: string | null;
}

export enum StatusAtendimentoEnum {
  EM_ATENDIMENTO = 0,
  CANCELADO = 1,
  FINALIZADO = 2
}

export const StatusAtendimento: Record<number, { descricao: string; cor: string }> = {
  [StatusAtendimentoEnum.EM_ATENDIMENTO]: { descricao: 'Em Atendimento', cor: '#A78BFA' },
  [StatusAtendimentoEnum.CANCELADO]: { descricao: 'Cancelado', cor: '#EF4444' },
  [StatusAtendimentoEnum.FINALIZADO]: { descricao: 'Finalizado', cor: '#14B8A6' }
};
