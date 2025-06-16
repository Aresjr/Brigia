// Common base interface for all entities
export interface BaseEntity {
    id: string | number;
    created_at: string;
    is_deleted?: boolean;
}

// Patient specific interface
export interface Patient extends BaseEntity, AddressFields {
    name: string;
    birth_date?: string;
    cpf?: string;
    sex?: string;
    cellphone?: string;
    email?: string;
    image_url?: string;
    last_appointment?: string;
    next_appointment?: string;
    medical_plan_id?: string | number;
    medical_plan_ids?: string[];
    medical_plan_name?: string;
    identification_color?: string;
    medical_plans: MedicalPlan[];
}

// User specific interface
export interface User extends BaseEntity {
    name: string;
    email?: string;
    role?: string;
    theme?: string | null;
    avatar_url?: string | null;
    establishment?: string | null;
}

// Professional specific interface
export interface Professional extends BaseEntity, AddressFields {
    email?: string;
    specialty?: string;
    crm?: string;
    procedure_ids?: number[];
}

// Appointment specific interface
export interface Appointment extends BaseEntity {
    provider?: string;
    duration?: number;
    date?: string;
    reason?: string;
    start_date?: string;
    end_date?: string;
    patient_id?: number;
}

export interface MedicalPlan extends BaseEntity {
    name: string;
    description?: string;
}

export interface PatientAddress {
    address_cep?: string;
    address_rua?: string;
    address_complemento?: string;
    address_bairro?: string;
    address_cidade?: string;
    address_uf?: string;
}

interface AddressData {
    cep?: string;
    rua?: string;
    complemento?: string;
    bairro?: string;
    cidade?: string;
    uf?: string;
}

// Address related fields
export interface AddressFields {
    address?: AddressData;
    address_cep?: string;
    address_rua?: string;
    address_complemento?: string;
    address_bairro?: string;
    address_cidade?: string;
    address_uf?: string;
}
