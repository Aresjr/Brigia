'use client';

import { PatientsTable } from "@/components/tables/patients/patients-table";
import { Patient } from "@/lib/types";
import { useCallback, useState } from "react";
import { useQuery, useQueryClient } from "@tanstack/react-query";
import { deletePatient, getPatients } from "@/lib/services/patients";
import { toast } from "sonner";
//import { filterItemsLocally, sortItems } from "@/lib/utils";

export default function PatientsPage() {
    const [selectedItems, setSelectedItems] = useState<string[]>([]);
    const [editingItem, setEditingItem] = useState<Patient | null>(null);
    const [formError, setFormError] = useState<string | null>(null);
    const [isFormOpen, setIsFormOpen] = useState(false);
    const [currentPage, setCurrentPage] = useState(1);
    const [searchTerm, setSearchTerm] = useState("");
    const [sortConfig, setSortConfig] = useState({ key: "name", direction: "asc" });
    const queryClient = useQueryClient();

    const { data, isLoading } = useQuery({
        queryKey: ['patients', currentPage],
        queryFn: () => getPatients(currentPage),
    });

    const items = data?.items || [];
    const totalPages = data?.pages || 1;

    const applyLocalFilters = useCallback(
        (displayItems: Patient[]) => {
            //let filtered = filterItemsLocally(displayItems, searchTerm);
            //return sortItems(filtered, sortConfig.key, sortConfig.direction);
            return displayItems;
        }, [searchTerm, sortConfig]);

    const filteredItems = applyLocalFilters(items);

    const handleDelete = async (id: string) => {
        try {
            await deletePatient(id);
            setSelectedItems(prev => prev.filter(itemId => itemId !== id));
            await queryClient.invalidateQueries({ queryKey: ['patients'] });
            toast.success("Paciente excluído com sucesso");
        } catch (error) {
            toast.success("Erro ao excluir paciente", {
                description: "Ocorreu um erro ao excluir o paciente"
            });
            console.error('Error:', error);
        }
    };

    const handleSort = (key: string) => {
        setSortConfig(prev => ({
            key,
            direction: prev.key === key && prev.direction === "asc" ? "desc" : "asc"
        }));
    };

    return (
        <div className="space-y-6">
            <div className="py-4 -mx-[32px] rounded-none px-[32px] bg-gray-50">
                <div className="flex items-center justify-between bg-gray-50">
                    <h1 className="text-2xl font-bold">Pacientes</h1>
                </div>
            </div>

            <PatientsTable
                items={items}
                allSelected={selectedItems.length === items.length}
                selectedItems={selectedItems}
                filteredItems={filteredItems}
                onToggleItem={(id) => {
                    setSelectedItems(prev =>
                        prev.includes(id) ?
                            prev.filter(itemId => itemId !== id) :
                            [...prev, id]
                    );
                }}
                onToggleAll={() => {
                    if (selectedItems.length === items.length) {
                        setSelectedItems([]);
                    } else {
                        setSelectedItems(items.map(item => item.id.toString()));
                    }
                }}
                handleRowClick={(_, item) => {
                    setEditingItem(item);
                    setIsFormOpen(true);
                }}
                onContextMenu={() => {}}
                onSort={handleSort}
                currentPage={currentPage}
                totalPages={totalPages}
                onPageChange={setCurrentPage}
            />
        </div>
    );
}
