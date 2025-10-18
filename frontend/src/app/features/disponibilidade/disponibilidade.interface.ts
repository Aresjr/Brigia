import { Entidade, EntidadeRequest } from '../shared/entidade.interface';
import { Profissional } from '../profissionais/profissional.interface';

export interface Disponibilidade extends Entidade {
  profissional: Profissional;
  dia: string;
  horaInicial: string;
  horaFinal: string;
  valorAdicional?: number;
}

export interface DisponibilidadeRequest extends EntidadeRequest {
  profissionalId: number;
  dia: string;
  horaInicial: string;
  horaFinal: string;
  valorAdicional?: number;
}
