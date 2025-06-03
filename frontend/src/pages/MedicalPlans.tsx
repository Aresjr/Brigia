import { useState } from "react";
import { useToast } from "@/hooks/use-toast";
import { DataTable } from "@/components/DataTable/DataTable";
import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import { DataItem } from "@/models/models";
import { MedicalPlanSidePanelForm } from "./form/MedicalPlanSidePanelForm";
import {deleteMedicalPlan, getMedicalPlans} from "@/api/medicalPlansApi.ts";

export default function MedicalPlans() {
  const [isFormOpen, setIsFormOpen] = useState(false);
  const [editingItem, setEditingItem] = useState<DataItem | null>(null);
  const [selectedItems, setSelectedItems] = useState<string[]>([]);
  const [formError, setFormError] = useState<string | null>(null);
  const { toast } = useToast();
  const queryClient = useQueryClient();

  const { data: medicalPlans = [], isLoading, error } = useQuery({
    queryKey: ["medicalPlans"],
    queryFn: getMedicalPlans
  });

  const deleteMutation = useMutation({
    mutationFn: async (id: string) => {
      const { error } = await deleteMedicalPlan(id);
      
      if (error) throw new Error("Failed to delete medical plan. Please try again.");
      return id;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["medicalPlans"] });
      toast({
        description: "Convênio excluído"
      });
      setSelectedItems([]);
    },
    onError: (error: any) => {
      toast({
        title: "Error",
        description: "Failed to delete medical plan. Please try again.",
        variant: "destructive"
      });
    }
  });

  const handleEdit = (item: DataItem) => {
    setEditingItem(item);
    setIsFormOpen(true);
  };

  const handleDelete = (id: string) => {
    if (window.confirm("Are you sure you want to delete this medical plan?")) {
      deleteMutation.mutate(id);
    }
  };

  const toggleItem = (id: string) => {
    setSelectedItems(prevItems =>
      prevItems.includes(id)
        ? prevItems.filter(item => item !== id)
        : [...prevItems, id]
    );
  };

  const selectAll = () => {
    setSelectedItems(medicalPlans.map(item => item.id.toString()));
  };

  const selectNone = () => {
    setSelectedItems([]);
  };

  return (
    <>
      <DataTable
        items={medicalPlans}
        isLoading={isLoading}
        error={error as Error}
        pathname="/convenios"
        selectedItems={selectedItems}
        onToggleItem={toggleItem}
        onSelectAll={selectAll}
        onSelectNone={selectNone}
        onNewRecord={() => {
          setEditingItem(null);
          setFormError(null);
          setIsFormOpen(true);
        }}
        onEdit={handleEdit}
        onDelete={handleDelete}
        formError={formError}
      />
      <MedicalPlanSidePanelForm
        isOpen={isFormOpen}
        onOpenChange={setIsFormOpen}
        editingItem={editingItem} />
    </>
  );
}
