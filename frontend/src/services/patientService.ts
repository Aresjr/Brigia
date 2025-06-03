import { DataItem } from "../models/models";
import {getPatientMedicalPlan} from "@/api/patientsApi.ts";

export async function getPatientMedicalPlans(patientId: number): Promise<string[]> {

    const { data, error } = await getPatientMedicalPlan(patientId);
  
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
