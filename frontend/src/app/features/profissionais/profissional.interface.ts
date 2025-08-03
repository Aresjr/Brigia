export interface Profissional {
    id: number;
    nome: string;
    email: string | null;
    cpf: string | null;
    dataNascimento: string;
    sexo: string | null;
    celular: string | null;
    crm: string | null;
    urlImagem: string | null;
    criadoEm: string | null;
}

export interface ProfissionalResponse {
    items: Profissional[];
    currentPage: number;
    totalPages: number;
    totalRecords: number;
}
