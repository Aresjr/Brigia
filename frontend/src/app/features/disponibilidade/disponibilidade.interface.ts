import { Entidade, EntidadeRequest } from '../shared/entidade.interface';
import { Profissional } from '../profissionais/profissional.interface';

export interface Disponibilidade extends Entidade {
  profissional: Profissional;
  dia: string;
  horaInicial: string;
  horaFinal: string;
  valorAdicional?: number;
  intervalo?: number;
}

export interface DisponibilidadeRequest extends EntidadeRequest {
  profissionalId: number;
  dia: string;
  horaInicial: string;
  horaFinal: string;
  valorAdicional?: number;
  intervalo?: number;
}

export interface HorarioSemana {
  diaSemana: number;
  horaInicial: string;
  horaFinal: string;
  ativo: boolean;
  intervalo?: number;
}
