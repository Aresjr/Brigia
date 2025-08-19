import { Entidade } from '../shared/entidade.interface';

export interface Empresa extends Entidade {
    observacao: string | null;
    codigoBc: string | null;
    valorMinimoMensal: number | null;
    minimoPorFuncionario: number | null;
    valorMes: number | null;
    func: number | null;
    plano: EmpresaPlano | null;
}

export interface EmpresaPlano extends Entidade {
    corFundo: string | null;
}

export interface EmpresaResponse {
    items: Empresa[];
    currentPage: number;
    totalPages: number;
    totalRecords: number;
}
