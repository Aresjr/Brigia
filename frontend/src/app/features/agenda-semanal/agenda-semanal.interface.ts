import { Entidade, EntidadeRequest } from '../shared/entidade.interface';
import { Profissional } from '../profissionais/profissional.interface';

export interface AgendaSemanal extends Entidade {
  profissional: Profissional;
  diaSemana: number; // 0 = Domingo, 1 = Segunda, ... 6 = Sábado
  horaInicial: string;
  horaFinal: string;
}

export interface AgendaSemanalRequest extends EntidadeRequest {
  profissionalId: number;
  diaSemana: number;
  horaInicial: string;
  horaFinal: string;
}

export interface HorarioSemana {
  diaSemana: number;
  horaInicial: string;
  horaFinal: string;
}
