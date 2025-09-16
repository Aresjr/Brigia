import { Agendamento } from '../features/agenda-diaria/agendamento.interface';
import { CalendarEvent } from 'angular-calendar';

export enum Role {
  ADMIN = 'ADMIN',
  PACIENTE = 'PACIENTE',
  RECEPCIONISTA = 'RECEPCIONISTA',
  MEDICO = 'MEDICO',
  FATURAMENTO = 'FATURAMENTO'
}

export const ESTADOS = [
  { sigla: 'AC', nome: 'Acre' },
  { sigla: 'AL', nome: 'Alagoas' },
  { sigla: 'AP', nome: 'Amapá' },
  { sigla: 'AM', nome: 'Amazonas' },
  { sigla: 'BA', nome: 'Bahia' },
  { sigla: 'CE', nome: 'Ceará' },
  { sigla: 'DF', nome: 'Distrito Federal' },
  { sigla: 'ES', nome: 'Espírito Santo' },
  { sigla: 'GO', nome: 'Goiás' },
  { sigla: 'MA', nome: 'Maranhão' },
  { sigla: 'MT', nome: 'Mato Grosso' },
  { sigla: 'MS', nome: 'Mato Grosso do Sul' },
  { sigla: 'MG', nome: 'Minas Gerais' },
  { sigla: 'PA', nome: 'Pará' },
  { sigla: 'PB', nome: 'Paraíba' },
  { sigla: 'PR', nome: 'Paraná' },
  { sigla: 'PE', nome: 'Pernambuco' },
  { sigla: 'PI', nome: 'Piauí' },
  { sigla: 'RJ', nome: 'Rio de Janeiro' },
  { sigla: 'RN', nome: 'Rio Grande do Norte' },
  { sigla: 'RS', nome: 'Rio Grande do Sul' },
  { sigla: 'RO', nome: 'Rondônia' },
  { sigla: 'RR', nome: 'Roraima' },
  { sigla: 'SC', nome: 'Santa Catarina' },
  { sigla: 'SP', nome: 'São Paulo' },
  { sigla: 'SE', nome: 'Sergipe' },
  { sigla: 'TO', nome: 'Tocantins' }
];

export const SEXOS = [
  { sigla: 'M', descricao: 'Masculino' },
  { sigla: 'F', descricao: 'Feminino' },
  { sigla: 'O', descricao: 'Outro' }
];

export const FORMAS_PAGAMENTO = [
  { valor: 0, descricao: 'Dinheiro' },
  { valor: 1, descricao: 'Cartão de Crédito' },
  { valor: 2, descricao: 'Cartão de Débito' },
  { valor: 3, descricao: 'Pix' },
  { valor: 4, descricao: 'Boleto' },
];

export const TIPO_AGENDAMENTO = [
  { valor: 0, descricao: 'Consulta' },
  { valor: 1, descricao: 'Exame' },
  { valor: 2, descricao: 'ASO' },
  { valor: 3, descricao: 'Procedimento' },
  { valor: 4, descricao: 'Sessão' },
  { valor: 5, descricao: 'Retorno' }
];

export enum StatusAgendamento {
  Agendado = 0,
  Confirmado = 1,
  EmAtendimento = 2,
  Cancelado = 3,
  NaoCompareceu = 4,
  Reagendado = 5,
  Finalizado = 6
}

export const StatusAgendamentoDescricao: Record<number, string> = {
  [StatusAgendamento.Agendado]: 'Agendado',
  [StatusAgendamento.Confirmado]: 'Confirmado',
  [StatusAgendamento.EmAtendimento]: 'Em Atendimento',
  [StatusAgendamento.Cancelado]: 'Cancelado',
  [StatusAgendamento.NaoCompareceu]: 'Não Compareceu',
  [StatusAgendamento.Reagendado]: 'Reagendado',
  [StatusAgendamento.Finalizado]: 'Finalizado'
};

export const CorAgendamento: Record<number, string> = {
  [StatusAgendamento.Agendado]: '#60a5fa',
  [StatusAgendamento.Confirmado]: '#2563EB',
  [StatusAgendamento.EmAtendimento]: '#A78BFA',
  [StatusAgendamento.Cancelado]: '#EF4444',
  [StatusAgendamento.NaoCompareceu]: '#F59E0B',
  [StatusAgendamento.Reagendado]: '#F59E0B',
  [StatusAgendamento.Finalizado]: '#14B8A6'
  //Disponibilidade do médico - #D1FAE5
};

export enum StatusAtendimento {
  EmAtendimento = 0,
  Cancelado = 1,
  Finalizado = 2
}

export const StatusAtendimentoDescricao: Record<number, string> = {
  [StatusAtendimento.EmAtendimento]: 'Em Atendimento',
  [StatusAtendimento.Cancelado]: 'Cancelado',
  [StatusAtendimento.Finalizado]: 'Finalizado'
};

export const CorAtendimento: Record<number, string> = {
  [StatusAtendimento.EmAtendimento]: '#A78BFA',
  [StatusAtendimento.Cancelado]: '#EF4444',
  [StatusAtendimento.Finalizado]: '#14B8A6'
};

export const STATUS_ABRIR_ATENDIMENTO = [StatusAgendamento.Agendado, StatusAgendamento.Confirmado,
  StatusAgendamento.Reagendado];
