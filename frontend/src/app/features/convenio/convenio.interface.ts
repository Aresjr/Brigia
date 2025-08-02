export interface Convenio {
    id: number;
    nome: string;
    descricao: string | null;
}

export interface ConvenioResponse {
    items: Convenio[];
    currentPage: number;
    totalPages: number;
    totalRecords: number;
}
