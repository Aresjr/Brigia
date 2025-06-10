
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
    medical_plan_name?: string;
    identification_color?: string;
    // User fields
    role?: string;
    theme?: string | null;
    avatar_url?: string | null;
    establishment?: string | null;
    // Address fields (legacy format - for backward compatibility)
    address?: AddressData;
    // New direct address fields
    address_cep?: string;
    address_rua?: string;
    address_complemento?: string;
    address_bairro?: string;
    address_cidade?: string;
    address_uf?: string;
    medical_plans: MedicalPlan[];
    // Professional fields
    crm?: string;
    procedure_ids?: number[]; // IDs of procedures a professional can perform
    // Appointment fields
    start_date?: string;
    end_date?: string;
    patient_id?: number;
    professional_id?: number;
    is_paid?: boolean;
    cost?: number;
}

export interface MedicalPlan {
    id: string | number;
    name: string;
    description?: string;
    card_number: number;
    expiration_date: string;
    holder_name: string;
}

export interface Patient {
  id: string | number;
  name: string;
  email?: string;
  birth_date: string;
  cpf: string;
  cellphone: string;
  identification_color: string;
  medical_plan_id: string | number;
  last_appointment: string;
  next_appointment: string;
  created_at: string;
}

export interface PatientAddress {
  address_cep?: string;
  address_rua?: string;
  address_complemento?: string;
  address_bairro?: string;
  address_cidade?: string;
  address_uf?: string;
}

export interface User {
  id: string | number;
  avatar_url?: string;
  name: string;
  role: string;
  created_at: string;
}

interface AddressData {
  cep?: string;
  rua?: string;
  complemento?: string;
  bairro?: string;
  cidade?: string;
  uf?: string;
}
