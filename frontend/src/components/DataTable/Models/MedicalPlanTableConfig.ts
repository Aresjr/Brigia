import { format } from "date-fns";

export const MEDICAL_PLAN_TABLE_COLUMNS = [
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
        width: '250px',
        minWidth: '250px',
        sortable: true
    },
    {
        key: 'description',
        label: 'Descrição',
        width: '300px',
        minWidth: '300px',
        sortable: true
    },
    {
        key: 'created_at',
        label: 'Data de Criação',
        width: '180px',
        minWidth: null,
        sortable: true
    }
] as const;

export const MEDICAL_PLAN_TABLE_FORMATTERS = {
    description: (desc: string) => desc || '-',
    created_at: (date: string) => date ? format(new Date(date), 'dd/MM/yyyy HH:mm') : '-'
};
