import { format } from "date-fns";
import { formatDate } from "@/utils/dateUtils";

export const PATIENT_TABLE_COLUMNS = [
    {
        key: 'selection',
        label: '',
        width: '64px',
        minWidth: null,
        sortable: false
    },
    {
        key: 'name',
        label: 'Nome',
        width: '',
        minWidth: '250px',
        sortable: true
    },
    {
        key: 'cpf',
        label: 'CPF',
        width: '130px',
        minWidth: null,
        sortable: true
    },
    {
        key: 'birth_date',
        label: 'Nascimento',
        width: '120px',
        minWidth: null,
        sortable: true
    },
    {
        key: 'cellphone',
        label: 'Telefone',
        width: '140px',
        minWidth: null,
        sortable: true
    },
    {
        key: 'last_appointment',
        label: 'Último Agendamento',
        width: '140px',
        minWidth: null,
        sortable: true
    },
    {
        key: 'next_appointment',
        label: 'Próximo Agendamento',
        width: '140px',
        minWidth: null,
        sortable: true
    }
] as const;

export const PATIENT_TABLE_FORMATTERS = {
    birth_date: (date: string) => date ? formatDate(date) : '-',
    cellphone: (phone: string) => phone || '-',
    last_appointment: (date: string) => date ? format(new Date(date), 'dd/MM/yyyy HH:mm') : '-',
    next_appointment: (date: string) => date ? format(new Date(date), 'dd/MM/yyyy HH:mm') : '-'
};
