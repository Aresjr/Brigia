import { Entidade } from '../shared/entidade.interface';

export interface Unidade extends Entidade {
    id: number;
    nome: string;
    endereco: string;
    email: string;
}
