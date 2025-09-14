import { Entidade, EntidadeRequest } from '../shared/entidade.interface';
import { Paciente } from '../pacientes/paciente.interface';
import { Profissional } from '../profissionais/profissional.interface';
import { Agendamento } from '../agenda-diaria/agendamento.interface';
import { Convenio } from '../convenio/convenio.interface';
import { Empresa } from '../empresa/empresa.interface';
import { Especialidade } from '../especialidade/especialidade.interface';

export interface Atendimento extends Entidade {
    paciente: Paciente;
    profissional: Profissional;
    data: Date;
    horaInicio: Date;
    horaFim: Date;
    agendamento: Agendamento;
    convenio: Convenio;
    empresa: Empresa;
    especialidade: Especialidade;
}

export interface AtendimentoRequest extends EntidadeRequest {
    descricao: string | null;
}
