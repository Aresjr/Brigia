import { Entidade } from '../shared/entidade.interface';
import { Paciente } from '../pacientes/paciente.interface';
import { Empresa } from '../empresa/empresa.interface';
import { Atendimento } from '../atendimento/atendimento.interface';
import { Profissional } from '../profissionais/profissional.interface';

export interface ContaReceber extends Entidade {
    paciente: Paciente;
    empresa?: Empresa;
    atendimento: Atendimento;
    profissional: Profissional;
    dataAtendimento: Date;
    valorAgendamento: number;
    descontoAtendimento: number;
    valorTotalLancado: number;
    valorTotal: number;
    valorDesconto: number;
    valorRecebido: number;
    formaPagamento: number;
    status: number;
}
