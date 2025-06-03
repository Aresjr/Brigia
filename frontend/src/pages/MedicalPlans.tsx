import { useState } from "react";
import { useToast } from "@/hooks/use-toast";
import { DataTable } from "@/components/DataTable/DataTable";
import { supabase } from "@/integrations/supabase/client";
import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import { DataItem } from "@/models/models";
import { MedicalPlanSidePanelForm } from "./form/MedicalPlanSidePanelForm";
import {getMedicalPlans} from "@/api/medicalPlansApi.ts";

export default function MedicalPlans() {
  const [isFormOpen, setIsFormOpen] = useState(false);
  const [editingItem, setEditingItem] = useState<DataItem | null>(null);
  const [selectedItems, setSelectedItems] = useState<string[]>([]);
  const [formError, setFormError] = useState<string | null>(null);
  const { toast } = useToast();
  const queryClient = useQueryClient();

  const fetchMedicalPlans = async (): Promise<DataItem[]> => {
    const { data, error } = await supabase
      .from("medical_plans")
      .select("*")
      .order("name", { ascending: true });

    if (error) throw error;

    return data.map((item: any) => ({
      id: String(item.id),
      name: item.name,
      description: item.description || "",
      created_at: item.created_at,
      medical_plans: item
    }));
  };

  const { data: medicalPlans = [], isLoading, error } = useQuery({
    queryKey: ["medicalPlans"],
    queryFn: getMedicalPlans
  });

  const createMutation = useMutation({
    mutationFn: async (data: Omit<DataItem, "id" | "created_at">) => {
      const { data: result, error } = await supabase
        .from("medical_plans")
        .insert([
          {
            name: data.name,
            description: data.description
          }
        ])
        .select();
      
      if (error) throw new Error("Failed to create medical plan. Please try again.");
      return result[0];
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["medicalPlans"] });
      toast({
        description: "Convênio criado"
      });
      setEditingItem(null);
    },
    onError: (error: any) => {
      setFormError("Erro ao criar convênio. Tente novamente.");
    }
  });

  const updateMutation = useMutation({
    mutationFn: async (data: DataItem) => {
      const { data: result, error } = await supabase
        .from("medical_plans")
        .update({
          name: data.name,
          description: data.description
        })
        .eq("id", typeof data.id === 'string' ? parseInt(data.id, 10) : data.id)
        .select();
      
      if (error) throw new Error("Failed to update medical plan. Please try again.");
      return result[0];
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["medicalPlans"] });
      toast({
        description: "Convênio atualizado"
      });
      setEditingItem(null);
    },
    onError: (error: any) => {
      setFormError("Erro ao atualizar o convênio. Tente novamente.");
    }
  });

  const deleteMutation = useMutation({
    mutationFn: async (id: string) => {
      const { error } = await supabase
        .from("medical_plans")
        .delete()
        .eq("id", parseInt(id, 10));
      
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

  const handleSubmit = (data: Omit<DataItem, "id" | "created_at">) => {
    if (editingItem) {
      updateMutation.mutate({ ...data, id: editingItem.id, created_at: editingItem.created_at });
    } else {
      createMutation.mutate(data);
    }
  };

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
