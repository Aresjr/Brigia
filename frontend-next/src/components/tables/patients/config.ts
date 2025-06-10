import { format } from "date-fns";

export const PATIENT_TABLE_COLUMNS = [
    {
        key: 'selection',
        label: '',
        width: '64px',
        sortable: false
    },
    {
        key: 'name',
        label: 'Nome',
        width: '250px',
        minWidth: '250px',
        sortable: true
    },
    {
        key: 'cpf',
        label: 'CPF',
        width: '140px',
        sortable: true
    },
    {
        key: 'birth_date',
        label: 'Nascimento',
        width: '120px',
        sortable: true
    },
    {
        key: 'cellphone',
        label: 'Telefone',
        width: '140px',
        sortable: true
    },
    {
        key: 'last_appointment',
        label: 'Último Agendamento',
        width: '180px',
        sortable: true
    },
    {
        key: 'next_appointment',
        label: 'Próximo Agendamento',
        width: '180px',
        sortable: true
    }
] as const;

export const PATIENT_TABLE_FORMATTERS = {
    birth_date: (date: string) => date ? format(new Date(date), 'dd/MM/yyyy') : '-',
    cellphone: (phone: string) => phone || '-',
    last_appointment: (date: string) => date ? format(new Date(date), 'dd/MM/yyyy HH:mm') : '-',
    next_appointment: (date: string) => date ? format(new Date(date), 'dd/MM/yyyy HH:mm') : '-'
};
