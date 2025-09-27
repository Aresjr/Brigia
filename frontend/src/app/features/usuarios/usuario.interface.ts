import { Entidade, EntidadeRequest } from '../shared/entidade.interface';
import { Role } from '../../core/constans';
import { Unidade } from '../unidade/unidade.interface';

export interface Usuario extends Entidade {
    email: string;
    nome: string;
    avatarUrl: string;
    roles: Role[];
    unidade: Unidade;
}

export interface UsuarioRequest extends EntidadeRequest {
  email: string;
  nome: string;
  unidadeId: Role;
}
