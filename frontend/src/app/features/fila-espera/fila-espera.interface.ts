import { Paciente } from '../pacientes/paciente.interface';
import { Especialidade } from '../especialidade/especialidade.interface';
import { Entidade } from '../shared/entidade.interface';
import { Convenio } from '../convenio/convenio.interface';
import { Empresa } from '../empresa/empresa.interface';
import { Profissional } from '../profissionais/profissional.interface';
import { Procedimento } from '../procedimentos/procedimento.interface';

export interface FilaEspera extends Entidade {
  paciente: Paciente;
  especialidade: Especialidade;
  observacoes: string | null;
  // Campos opcionais do agendamento
  convenio?: Convenio | null;
  empresa?: Empresa | null;
  profissional?: Profissional | null;
  procedimento?: Procedimento | null;
  tipoAgendamento?: number | null;
  formaPagamento?: number | null;
  valor?: number | null;
  desconto?: number | null;
  duracao?: number | null;
}

export interface FilaEsperaRequest {
  pacienteId: number;
  especialidadeId: number;
  observacoes: string | null;
  // Campos opcionais do agendamento
  convenioId?: number | null;
  empresaId?: number | null;
  profissionalId?: number | null;
  procedimentoId?: number | null;
  tipoAgendamento?: number | null;
  formaPagamento?: number | null;
  valor?: number | null;
  desconto?: number | null;
  duracao?: number | null;
}
