import { useState, useCallback } from 'react';
import { useQuery, useQueryClient } from '@tanstack/react-query';
import { createPatient, deletePatient, getPatients, updatePatient } from '@/api/patientsApi';
import { Patient } from '@/models/models';
import { toast } from 'sonner';

export const usePatientManagement = () => {
    const queryClient = useQueryClient();
    const [selectedItems, setSelectedItems] = useState<string[]>([]);
    const [editingItem, setEditingItem] = useState<Patient | null>(null);
    const [formError, setFormError] = useState<string | null>(null);
    const [isFormOpen, setIsFormOpen] = useState(false);

    const {
        data: items = [],
        isLoading,
        error
    } = useQuery({
        queryKey: ['patients'],
        queryFn: async () => {
            try {
                const data = await getPatients();
                return data.map((item: any) => ({
                    ...item,
                    id: String(item.id),
                    medical_plan_id: item.medical_plan_id ? String(item.medical_plan_id) : undefined
                })) as Patient[];
            } catch (error) {
                console.error('Error fetching data:', error);
                toast.error("Erro ao buscar pacientes");
                return [];
            }
        },
        enabled: true
    });

    const handleDelete = async (id: string) => {
        try {
            await deletePatient(id);
            setSelectedItems(prev => prev.filter(itemId => itemId !== id));
            await queryClient.invalidateQueries({ queryKey: ['patients'] });
            toast.success("Registro excluído");
        } catch (error) {
            toast.error("Erro ao excluir o registro");
            console.error('Error:', error);
        }
    };

    const handleNewRecord = () => {
        setEditingItem(null);
        setFormError(null);
        setIsFormOpen(true);
    };

    const handleEdit = (item: Patient) => {
        setEditingItem(item);
        setIsFormOpen(true);
    };

    const handleToggleItem = (id: string) => {
        setSelectedItems(prev =>
            prev.includes(id) ?
                prev.filter(itemId => itemId !== id) :
                [...prev, id]
        );
    };

    const selectAll = () => {
        const allIds = items.map(item => String(item.id));
        setSelectedItems(allIds);
    };

    const selectNone = () => {
        setSelectedItems([]);
    };

    return {
        items,
        isLoading,
        error,
        selectedItems,
        editingItem,
        formError,
        isFormOpen,
        setIsFormOpen,
        handleDelete,
        handleNewRecord,
        handleEdit,
        handleToggleItem,
        selectAll,
        selectNone
    };
};
