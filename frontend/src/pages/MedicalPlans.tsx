import { useState } from "react";
import { useQuery, useQueryClient } from "@tanstack/react-query";
import { MedicalPlanSidePanelForm } from "./form/MedicalPlanSidePanelForm";
import { deleteMedicalPlan, getMedicalPlans } from "@/api/medicalPlansApi.ts";
import { MedicalPlanTable } from "@/components/DataTable/Models/MedicalPlanTable";
import { useDataTableState } from "@/hooks/useDataTableState";
import { useMedicalPlanEnrichment } from "@/hooks/useMedicalPlanEnrichment";
import { filterItemsLocally, sortItems } from "@/components/DataTable/DataTableUtils";
import { useCallback } from "react";
import { toast } from "sonner";
import { useLocation } from "react-router-dom";
import { MedicalPlan } from "@/models/models";

export default function MedicalPlans() {
    const location = useLocation();
    const [isFormOpen, setIsFormOpen] = useState(false);
    const [editingItem, setEditingItem] = useState<MedicalPlan | null>(null);
    const [selectedItems, setSelectedItems] = useState<string[]>([]);
    const [formError, setFormError] = useState<string | null>(null);
    const queryClient = useQueryClient();

    const { data: items = [], isLoading, error } = useQuery({
        queryKey: ["medicalPlans"],
        queryFn: getMedicalPlans
    });

    const applyLocalFilters = useCallback(
        (displayItems, searchTerm, pathname, sortConfig, colorFilter, setFilteredItems) => {
            let filtered = filterItemsLocally(displayItems, searchTerm, pathname);
            const sorted = sortItems(filtered, sortConfig.key, sortConfig.direction);
            setFilteredItems(sorted);
        }, []);

    const enrichedItems = useMedicalPlanEnrichment(items, location.pathname);

    const {
        contextMenu,
        searchTerm,
        setSearchTerm,
        filterField,
        setFilterField,
        paginatedItems,
        filteredItems,
        showDeleteConfirmation,
        setShowDeleteConfirmation,
        itemsToDelete,
        setItemsToDelete,
        currentPage,
        setCurrentPage,
        totalPages,
        handleSort,
        handleContextMenu,
        closeContextMenu
    } = useDataTableState(isLoading, enrichedItems, location.pathname, applyLocalFilters);

    const handleDelete = async (id: string) => {
        try {
            await deleteMedicalPlan(id);
            setSelectedItems(prev => prev.filter(itemId => itemId !== id));
            await queryClient.invalidateQueries({ queryKey: ['medicalPlans'] });
            toast.success("Convênio excluído com sucesso");
        } catch (error) {
            toast.success("Erro ao excluir convênio", {
                description: "Ocorreu um erro ao excluir o convênio"
            });
            console.error('Error:', error);
        }
    };

    const handleNewRecord = () => {
        setEditingItem(null);
        setFormError(null);
        setIsFormOpen(true);
    };

    const handleEdit = (item: MedicalPlan) => {
        setEditingItem(item);
        setIsFormOpen(true);
    };

    const handleExportSelected = () => {
        // Implementation for export
    };

    const handleDeleteSelected = () => {
        if (selectedItems.length === 0) return;
        setItemsToDelete(selectedItems);
        setShowDeleteConfirmation(true);
    };

    return (
        <>
            <div className="space-y-6">
                <div className="py-4 -mx-[32px] rounded-none px-[32px] bg-gray-50">
                    <div className="flex items-center justify-between bg-gray-50">
                        <h1 className="text-2xl font-bold">Convênios</h1>
                    </div>
                </div>

                <MedicalPlanTable
                    items={items}
                    allSelected={selectedItems.length === items.length}
                    selectedItems={selectedItems}
                    filteredItems={paginatedItems}
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
                    handleRowClick={(_, item) => handleEdit(item)}
                    onContextMenu={handleContextMenu}
                    onSort={handleSort}
                    currentPage={currentPage}
                    totalPages={totalPages}
                    onPageChange={setCurrentPage}
                />
            </div>

            <MedicalPlanSidePanelForm
                open={isFormOpen}
                onOpenChange={setIsFormOpen}
                editingItem={editingItem}
            />
        </>
    );
}
