import { Entidade } from '../shared/entidade.interface';
import { Paciente } from '../pacientes/paciente.interface';
import { Empresa } from '../empresa/empresa.interface';
import { Atendimento } from '../atendimento/atendimento.interface';
import { Profissional } from '../profissionais/profissional.interface';
import { FormaPagamento } from '../../core/constans';

export interface ContaReceber extends Entidade {
    paciente: Paciente;
    empresa: Empresa;
    atendimento: Atendimento;
    profissional: Profissional;
    valorAgendamento: number;
    descontoAtendimento: number;
    valorTotalLancado: number;
    valorTotal: number;
    valorRecebido: number;
    formaPagamento: FormaPagamento;
    status: number;
}
