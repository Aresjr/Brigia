import { useQuery } from "@tanstack/react-query";
import { DataTable } from "@/components/DataTable/DataTable";
import { DataItem } from "@/models/models";
import { useState } from "react";
import { supabase } from "@/integrations/supabase/client";
import { toast } from "sonner";
import { FormDialog } from "@/components/Forms/FormDialog";
import {getPatients} from "@/api/patientsApi.ts";

const Patients = () => {
    const [selectedItems, setSelectedItems] = useState<string[]>([]);
    const [editingItem, setEditingItem] = useState<DataItem | null>(null);
    const [formError, setFormError] = useState<string | null>(null);
    const [isFormOpen, setIsFormOpen] = useState(false);

    console.log("Got here!");

    const selectAll = () => {
        const allIds = items.map(item => String(item.id));
        setSelectedItems(allIds);
    };

    const selectNone = () => {
        setSelectedItems([]);
    };

    const fetchData = async () => {

        try {
            const data = await getPatients();

            return data.map((item: any) => ({
                ...item,
                id: String(item.id),
                medical_plan_id: item.medical_plan_id ? String(item.medical_plan_id) : undefined
            })) as DataItem[];
        } catch (error) {
            console.error('Error fetching data:', error);
            toast.error("Erro ao buscar pacientes");
            return [];
        }
    };

    const handleDelete = async (id: string) => {
        const tableName = getPatients();
        if (!tableName) return;
        try {
            if (tableName === 'patients') {
                const {
                    error
                } = await supabase.from(tableName).update({
                    is_deleted: true
                }).eq('id', parseInt(id, 10));
                if (error) throw error;
                toast.success("Paciente marcado como excluído");
            } else {
                const {
                    error
                } = await supabase.from(tableName).delete().eq('id', parseInt(id, 10));
                if (error) throw error;
                toast.success("Registro excluído");
            }
            refetch();
        } catch (error) {

            toastError({
                description: "Erro ao excluir o registro",
                variant: "destructive"
            });
    
            console.error('Error:', error);
        }
    };

    const {
        data: items = [],
        isLoading,
        error,
        refetch
    } = useQuery({
        queryKey: ['items', location.pathname],
        queryFn: fetchData,
        enabled: true
    });

    return (
        <>
            <DataTable
                items={items}
                isLoading={isLoading}
                error={error as Error}
                pathname={location.pathname}
                selectedItems={selectedItems}
                onToggleItem={id => {
                    setSelectedItems(prev =>
                        prev.includes(id) ?
                            prev.filter(itemId => itemId !== id) :
                            [...prev, id]
                    );
                }}
                onSelectAll={selectAll}
                onSelectNone={selectNone}
                onNewRecord={() => {
                    setEditingItem(null);
                    setFormError(null);
                    setIsFormOpen(true);
                }}
                onEdit={item => {
                    setEditingItem(item);
                    setIsFormOpen(true);
                }}
                onDelete={handleDelete}
                formError={formError}
            />
            <FormDialog
                isOpen={isFormOpen}
                onOpenChange={setIsFormOpen}
                pathname={location.pathname}
                editingItem={editingItem} />
        </>
    );
};

export default Patients;
function toastError(arg0: { description: string; variant: string; }) {
    throw new Error("Function not implemented.");
}

