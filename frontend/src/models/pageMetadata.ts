import { ROUTES, AppRoute } from '@/routes/routes';

interface PageMetadata {
    columns?: string;
    defaultSort?: string;
    defaultFilter?: string;
}

export const PAGE_METADATA: Record<AppRoute, PageMetadata> = {
    [ROUTES.DASHBOARD]: {},
    [ROUTES.PATIENTS]: {
        columns: "cpf, created_at, id, identification_color, last_appointment, name, next_appointment, sex, birth_date, cellphone",
        defaultSort: "name",
        defaultFilter: "name"
    },
    [ROUTES.MEDICAL_PLANS]: {
        columns: "name, created_at",
        defaultSort: "name"
    },
    [ROUTES.PROFESSIONALS]: {
        columns: "id, name, email, created_at, specialty, cellphone, cpf, sex, birth_date, crm, identification_color",
        defaultSort: "name"
    },
    [ROUTES.PROCEDURES]: {},
    [ROUTES.APPOINTMENTS]: {},
    [ROUTES.SETTINGS]: {}
};
