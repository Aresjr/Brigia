import { Entidade, EntidadeRequest } from '../shared/entidade.interface';
import { Profissional } from '../profissionais/profissional.interface';
import { Unidade } from '../unidade/unidade.interface';

export interface Honorario extends Entidade {
  profissional: Profissional;
  data: string;
  valorTotal: number;
  quantidadeAtendimentos: number;
  valorAdicional?: number;
  valorHora?: number;
  unidade: Unidade;
}

export interface HonorarioRequest extends EntidadeRequest {
  profissionalId: number;
  data: string;
  valorHora?: number;
}
