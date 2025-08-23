export interface Entidade {
    id: number;
    nome: string;
    criadoEm: string | null;
    excluido: boolean;
}

export interface EntidadeResponse {
  items: Entidade[];
  currentPage: number;
  totalPages: number;
  totalRecords: number;
}
