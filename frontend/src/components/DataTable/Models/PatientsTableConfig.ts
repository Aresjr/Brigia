import { format } from "date-fns";
import { formatDate } from "@/utils/dateUtils";

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
        width: null,
        sortable: true
    },
    {
        key: 'cpf',
        label: 'CPF',
        width: null,
        sortable: true
    },
    {
        key: 'birth_date',
        label: 'Data de Nascimento',
        width: null,
        sortable: true
    },
    {
        key: 'cellphone',
        label: 'Telefone',
        width: null,
        sortable: true
    },
    {
        key: 'last_appointment',
        label: 'Último Agendamento',
        width: null,
        sortable: true
    },
    {
        key: 'next_appointment',
        label: 'Próximo Agendamento',
        width: null,
        sortable: true
    },
    {
        key: 'created_at',
        label: 'Data de Criação',
        width: null,
        sortable: true
    }
] as const;

export const PATIENT_TABLE_FORMATTERS = {
    birth_date: (date: string) => date ? formatDate(date) : '-',
    cellphone: (phone: string) => phone || '-',
    last_appointment: (date: string) => date ? format(new Date(date), 'dd/MM/yyyy HH:mm') : '-',
    next_appointment: (date: string) => date ? format(new Date(date), 'dd/MM/yyyy HH:mm') : '-',
    created_at: (date: string) => date ? format(new Date(date), 'dd/MM/yyyy HH:mm') : '-'
};
