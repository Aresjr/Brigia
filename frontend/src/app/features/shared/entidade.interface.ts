export interface Entidade {
    id: number;
    nome: string;
    criadoEm: string | null;
    excluido: boolean;
}

export interface EntidadeRequest {
}

export interface PagedResponse<T> {
  items: T[];
  currentPage: number;
  totalPages: number;
  totalRecords: number;
}
