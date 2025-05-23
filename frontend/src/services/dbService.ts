
import { supabase } from "@/integrations/supabase/client";
import { TableName } from "../models/tables";
import { Appointment, Procedure } from "@/models/models";

export async function getFetchFromTableName<T>(tableName: TableName, tableColumns: string) {
    const { data, error } = await supabase
        .from(tableName)
        .select(tableColumns)
        .eq('is_deleted', false)
        .order('created_at', { ascending: false });

    if (error) {
        console.error("Erro ao buscar os dados da tabela:", error);
        return null;
    }

    return data as T[] || [];
}

export async function getProfile(userId: string): Promise<any> {
    const { data, error } = await supabase
        .from(TableName.PROFILES).select().eq("user_id", userId).single();
    
    if (error) {
        console.error("Erro ao buscar o perfil:", error);
        return null;
    }

    return data;
}

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

export async function createProcedure(description: string): Promise<Procedure | null> {
    const { data, error } = await supabase
        .from(TableName.PROCEDURES)
        .insert([{ description }])
        .select()
        .single();

    if (error) {
        console.error("Erro ao criar procedimento:", error);
        return null;
    }

    return data as Procedure;
}

export async function updateProfessionalProcedures(professionalId: number, procedureIds: number[]): Promise<boolean> {
    // First delete existing associations
    const { error: deleteError } = await supabase
        .from(TableName.PROFESSIONAL_PROCEDURES)
        .delete()
        .eq('professional_id', professionalId);

    if (deleteError) {
        console.error("Erro ao remover procedimentos existentes:", deleteError);
        return false;
    }

    // Then insert new ones
    if (procedureIds.length > 0) {
        const proceduresToInsert = procedureIds.map(procedureId => ({
            professional_id: professionalId,
            procedure_id: procedureId
        }));

        const { error: insertError } = await supabase
            .from(TableName.PROFESSIONAL_PROCEDURES)
            .insert(proceduresToInsert);

        if (insertError) {
            console.error("Erro ao inserir novos procedimentos:", insertError);
            return false;
        }
    }

    return true;
}

export async function createAppointment(appointment: Omit<Appointment, 'id' | 'created_at'>): Promise<Appointment | null> {
    const { data, error } = await supabase
        .from(TableName.APPOINTMENTS)
        .insert([appointment])
        .select()
        .single();

    if (error) {
        console.error("Erro ao criar consulta:", error);
        return null;
    }

    return data as Appointment;
}

export async function updateAppointment(id: number, updates: Partial<Appointment>): Promise<Appointment | null> {
    const { data, error } = await supabase
        .from(TableName.APPOINTMENTS)
        .update(updates)
        .eq('id', id)
        .select()
        .single();

    if (error) {
        console.error("Erro ao atualizar consulta:", error);
        return null;
    }

    return data as Appointment;
}

export async function deleteAppointment(id: number): Promise<boolean> {
    const { error } = await supabase
        .from(TableName.APPOINTMENTS)
        .update({ is_deleted: true })
        .eq('id', id);

    if (error) {
        console.error("Erro ao excluir consulta:", error);
        return false;
    }

    return true;
}
