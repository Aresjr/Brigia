export interface Paciente {
    id: number;
    nome: string;
    email: string | null;
    cpf: string;
    dataNascimento: string;
    sexo: string;
    celular: string;
    ultimaConsulta: string | null;
    proximaConsulta: string | null;
    urlImagem: string | null;
    corIdentificacao: string;
    cep: string;
    rua: string;
    complemento: string;
    bairro: string;
    cidade: string;
    uf: string;
    convenioId: number | null;
    criadoEm: string | null;
}

export interface PacienteResponse {
    items: Paciente[];
    currentPage: number;
    totalPages: number;
    totalRecords: number;
}
