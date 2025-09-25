import { Entidade } from '../shared/entidade.interface';
import { Paciente } from '../pacientes/paciente.interface';
import { Empresa } from '../empresa/empresa.interface';
import { Profissional } from '../profissionais/profissional.interface';

export interface ContaReceber extends Entidade {
    paciente: Paciente;
    empresa?: Empresa;
    profissional: Profissional;
    dataAtendimento: Date;
    valorAgendamento: number;
    valorProcedimentosLancados: number;
    valorTotal: number;
    valorDesconto: number;
    valorRecebido: number;
    convenio: string;
    formaPagamento: number;
    status: number;
}
