export interface Paciente {
    id: number;
    nome: string;
    email: string | null;
    cpf: string | null;
    dataNascimento: string;
    sexo: string | null;
    celular: string | null;
    ultimaConsulta: string | null;
    proximaConsulta: string | null;
    urlImagem: string | null;
    corIdentificacao: string | null;
    cep: string | null;
    rua: string | null;
    complemento: string | null;
    bairro: string | null;
    cidade: string | null;
    uf: string | null;
    convenioId: number | null;
    criadoEm: string | null;
}

export interface PacienteResponse {
    items: Paciente[];
    currentPage: number;
    totalPages: number;
    totalRecords: number;
}
