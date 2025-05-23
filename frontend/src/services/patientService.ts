import { supabase } from "@/integrations/supabase/client";
import { DataItem, PatientAddress } from "../models/models";
import { TableName } from "../models/tables";

export async function getPatientAddress(patientId: number | string): Promise<PatientAddress> {
    const { data, error } = await supabase
        .from(TableName.PATIENTS)
        .select(`address_cep, address_rua, address_complemento, address_bairro, address_cidade, address_uf`)
        .eq("id", Number(patientId))
        .maybeSingle();

    if (error) {
        console.error("Erro ao buscar o endereço do paciente:", error);
        return null;
    }

    return data as PatientAddress | null;
}

export async function getPatientsCount(): Promise<number> {
    const { count, error } = await supabase
    .from("patients")
    .select('*', { count: 'exact', head: true })
    .eq('is_deleted', false);

    if (error) {
        console.error("Erro ao buscar o total de pacientes:", error);
    }

    return count || 0;
}

export async function getPatientMedicalPlans(patientId: number): Promise<string[]> {

    const { data, error } = await supabase
    .from("patient_medical_plans")
    .select("medical_plan_id")
    .eq("patient_id", patientId);
  
    if (error) {
        console.error("Erro ao buscar os convênios do paciente:", error);
        return [];
    }

    return data.map((plan: any) => String(plan.medical_plan_id));
}

export const getBirthdayPatients = (patients: DataItem[]): DataItem[] => {
    const today = new Date();
    const currentMonth = today.getMonth() + 1;
    const currentDay = today.getDate();

    return patients.filter(patient => {
        if (!patient.birth_date) return false;

        const birthDate = new Date(patient.birth_date);
        const birthMonth = birthDate.getMonth() + 1;
        const birthDay = birthDate.getDate();

        return birthMonth === currentMonth && birthDay === currentDay;
    });
};
