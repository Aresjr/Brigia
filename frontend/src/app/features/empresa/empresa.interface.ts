import { Entidade, EntidadeRequest } from '../shared/entidade.interface';

export interface Empresa extends Entidade {
    observacao: string | null;
    codigoBc: string | null;
    valorMinimoMensal: number | null;
    minimoPorFuncionario: number | null;
    valorMes: number | null;
    func: number | null;
    plano: EmpresaPlano | null;
}

export interface EmpresaRequest extends EntidadeRequest {
    observacao: string | null;
    codigoBc: string | null;
    valorMinimoMensal: number | null;
    minimoPorFuncionario: number | null;
    valorMes: number | null;
    func: number | null;
    plano: EmpresaPlano | null;
}

export interface EmpresaPlano {
    id: number;
    nome: string;
    corFundo: string;
    descricao: string;
}
