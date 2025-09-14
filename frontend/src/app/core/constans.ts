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

export const StatusDescricao: Record<number, string> = {
  [StatusAgendamento.Agendado]: 'Agendado',
  [StatusAgendamento.Confirmado]: 'Confirmado',
  [StatusAgendamento.EmAtendimento]: 'Em Atendimento',
  [StatusAgendamento.Cancelado]: 'Cancelado',
  [StatusAgendamento.NaoCompareceu]: 'Não Compareceu',
  [StatusAgendamento.Reagendado]: 'Reagendado',
  [StatusAgendamento.Finalizado]: 'Finalizado'
};

export const STATUS_ABRIR_ATENDIMENTO = [StatusAgendamento.Agendado, StatusAgendamento.Confirmado,
  StatusAgendamento.Reagendado];
