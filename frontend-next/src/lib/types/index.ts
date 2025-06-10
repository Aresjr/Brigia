export interface DataItem {
    id: string | number;
    name: string;
    email?: string;
    created_at: string;
    description?: string;
    specialty?: string;
    provider?: string;
    duration?: number;
    date?: string;
    reason?: string;
    birth_date?: string;
    image_url?: string;
    // Patient fields
    cpf?: string;
    sex?: string;
    cellphone?: string;
    last_appointment?: string;
    next_appointment?: string;
    is_deleted?: boolean;
    medical_plan_id?: string | number;
    medical_plan_ids?: string[]; // Support for multiple medical plans
    identification_color?: string;
}

export interface Patient extends DataItem {
    cpf: string;
    birth_date: string;
    sex: string;
    cellphone: string;
    address?: {
        street: string;
        number: string;
        complement?: string;
        neighborhood: string;
        city: string;
        state: string;
        zip_code: string;
    };
}

export interface MedicalPlan extends DataItem {
    description: string;
}

export interface PaginatedResponse<T> {
    items: T[];
    total: number;
    page: number;
    size: number;
    pages: number;
}

export interface CountResponse {
    count: number;
}
