import { api } from "@/lib/api";
import { Patient, PaginatedResponse, CountResponse } from "@/lib/types";

export async function getPatients(
    page: number = 1,
    size: number = 20,
    orderBy?: string,
    search?: string,
    isDeleted: boolean = false,
    medicalPlanId?: number
): Promise<PaginatedResponse<Patient>> {
    const params = new URLSearchParams({
        page: page.toString(),
        size: size.toString(),
        is_deleted: isDeleted.toString(),
        ...(orderBy && { order_by: orderBy }),
        ...(search && { search }),
        ...(medicalPlanId && { medical_plan_id: medicalPlanId.toString() })
    });

    const response = await api.get<PaginatedResponse<Patient>>(`/patients?${params}`);
    return response.data;
}

export async function getPatient(id: string): Promise<Patient> {
    const response = await api.get<Patient>(`/patients/${id}`);
    return response.data;
}

export async function getBirthdayPatients(): Promise<Patient[]> {
    const response = await api.get<Patient[]>('/patients/birthday');
    return response.data;
}

export async function getPatientsCount(isDeleted: boolean = false): Promise<number> {
    const response = await api.get<CountResponse>(`/patients/count?is_deleted=${isDeleted}`);
    return response.data.count;
}

export async function deletePatient(id: string): Promise<void> {
    await api.delete(`/patients/${id}`);
}
