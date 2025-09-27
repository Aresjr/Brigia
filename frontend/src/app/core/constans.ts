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

export const StatusAgendamento: Record<number, { descricao: string; cor: string }> = {
  0: { descricao: 'Agendado', cor: '#60a5fa' },
  1: { descricao: 'Confirmado', cor: '#2563EB' },
  2: { descricao: 'Em Atendimento', cor: '#A78BFA' },
  3: { descricao: 'Cancelado', cor: '#EF4444' },
  4: { descricao: 'Não Compareceu', cor: '#F59E0B' },
  5: { descricao: 'Reagendado', cor: '#F59E0B' },
  6: { descricao: 'Finalizado', cor: '#14B8A6' },
  7: { descricao: 'Cancelado Pelo Usuário', cor: '#EF4444' }
};

export const AGENDAMENTO_PODE_EDITAR: number[] = [0, 1];

export const StatusAtendimento: Record<number, { descricao: string; cor: string }> = {
  0: { descricao: 'Em Atendimento', cor: '#A78BFA' },
  1: { descricao: 'Cancelado', cor: '#EF4444' },
  2: { descricao: 'Finalizado', cor: '#14B8A6' }
};

export const STATUS_ABRIR_ATENDIMENTO: number[] = [0, 1, 5];

export const StatusContaReceber: Record<number, { descricao: string; cor: string }> = {
  0: { descricao: 'Aberto', cor: '#60a5fa' },
  1: { descricao: 'Pago', cor: '#14B8A6' },
  2: { descricao: 'Atrasado', cor: '#EF4444' },
  3: { descricao: 'Parcial', cor: '#A78BFA' }
}
