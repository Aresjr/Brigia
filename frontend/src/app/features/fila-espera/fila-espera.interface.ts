import { Paciente } from '../pacientes/paciente.interface';
import { Especialidade } from '../especialidade/especialidade.interface';
import { Entidade } from '../shared/entidade.interface';

export interface FilaEspera extends Entidade {
  paciente: Paciente;
  especialidade: Especialidade;
  observacoes: string | null;
}

export interface FilaEsperaRequest {
  pacienteId: number;
  especialidadeId: number;
  observacoes: string | null;
}
