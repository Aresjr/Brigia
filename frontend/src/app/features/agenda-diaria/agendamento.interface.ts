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
    convenio?: Convenio;
    empresa?: Empresa;
    unidade: Unidade;
    tipoAgendamento: number | null;
    formaPagamento: number;
    status: number;
    observacoes?: string;
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
}
