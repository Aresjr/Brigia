import { supabase } from "@/integrations/supabase/client";
import { TableName } from "../models/tables";
import { Appointment, Procedure } from "@/models/models";

export async function getProcedures(): Promise<Procedure[]> {
    const { data, error } = await supabase
        .from(TableName.PROCEDURES)
        .select('*')
        .eq('is_deleted', false)
        .order('created_at', { ascending: false });

    if (error) {
        console.error("Erro ao buscar procedimentos:", error);
        return [];
    }

    return data as Procedure[] || [];
}

export async function getProfessionalProcedures(professionalId: number): Promise<number[]> {
    const { data, error } = await supabase
        .from(TableName.PROFESSIONAL_PROCEDURES)
        .select('procedure_id')
        .eq('professional_id', professionalId);

    if (error) {
        console.error("Erro ao buscar procedimentos do profissional:", error);
        return [];
    }

    return data.map(item => item.procedure_id) || [];
}

export async function getAppointments(filters?: Partial<Appointment>): Promise<Appointment[]> {
    let query = supabase
        .from(TableName.APPOINTMENTS)
        .select('*')
        .eq('is_deleted', false);

    // Apply any filters
    if (filters) {
        if (filters.patient_id) {
            query = query.eq('patient_id', filters.patient_id);
        }
        if (filters.professional_id) {
            query = query.eq('professional_id', filters.professional_id);
        }
        // Can add more filters as needed
    }

    const { data, error } = await query.order('start_date', { ascending: true });

    if (error) {
        console.error("Erro ao buscar consultas:", error);
        return [];
    }

    return data as Appointment[] || [];
}
