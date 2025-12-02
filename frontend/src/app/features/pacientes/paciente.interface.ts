import { Entidade, EntidadeRequest } from '../shared/entidade.interface';
import { Convenio } from '../convenio/convenio.interface';
import { Empresa } from '../empresa/empresa.interface';

export interface Paciente extends Entidade {
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
    convenio: Convenio | null;
    empresa: Empresa | null;
    nomeSocial: string;
    pressaoArterial: string;
    celular2: string | null;
    fixo: string | null;
    peso: number | null;
    altura: number | null;
    profissao: string | null;
    documento: string | null;
}

export interface PacienteRequest extends EntidadeRequest {
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
    empresaId: number | null;
    celular2: string | null;
    fixo: string | null;
    peso: number | null;
    altura: number | null;
    profissao: string | null;
    documento: string | null;
}
