
import { Sheet, SheetContent,  SheetHeader, SheetTitle } from "@/components/ui/sheet";
import { DataItem } from "@/models/models";
import { useState, useEffect } from "react";
import { supabase } from "@/integrations/supabase/client";
import { useToast } from "@/hooks/use-toast";
import { toast } from "sonner";
import { TableName } from "@/models/tables";
import { MedicalPlansForm } from "./MedicalPlansForm";

interface MedicalPlanFormProps {
  isOpen: boolean;
  onOpenChange: (open: boolean) => void;
  editingItem: DataItem | null;
}

export const MedicalPlanSidePanelForm = ({ 
  isOpen, 
  onOpenChange,
  editingItem
}: MedicalPlanFormProps) => {
  const [preparedData, setPreparedData] = useState<DataItem | null>(null);
  const [formError, setFormError] = useState<string | null>(null);
  const { toast: toastError } = useToast();

  useEffect(() => {
    setPreparedData(editingItem);
  }, [editingItem]);

    const handleSubmit = async (data: Omit<DataItem, 'id' | 'created_at'>) => {
      const tableName = TableName.MEDICAL_PLANS;
      setFormError(null);
      try {
          if (editingItem) {
              const {
                  error
              } = await supabase.from(tableName).update(data).eq('id', 
                typeof editingItem.id === 'string' ? parseInt(editingItem.id, 10) : editingItem.id);
              if (error) throw error;
              toast.success("Registro atualizado");
          } else {
              const {
                  error
              } = await supabase.from(tableName).insert([data]);
              if (error) throw error;
              toast.success("Registro criado");
          }
          onOpenChange(false);
          
      } catch (error: any) {
          console.error('error', error);
          handleErrorFormSubmit(error);
      }
  };

  const handleErrorFormSubmit = (error: any) => {
    const errorMessage = error.message || '';
    let friendlyErrorMessage = 'Erro ao Salvar o Convênio';

    toastError({
        description: friendlyErrorMessage,
        variant: "destructive"
    });

    setFormError(friendlyErrorMessage);
  }

  const handleFormSubmit = async (data: Omit<DataItem, 'id' | 'created_at'>) => {
    try {
      handleSubmit(data);
    } catch (error) {
      console.error('Error handling medical plans:', error);
    }
  };
  
  return (
    <Sheet open={isOpen} onOpenChange={onOpenChange}>
      <SheetContent className="sm:max-w-md overflow-y-auto">
        <SheetHeader>
          <SheetTitle>
            {editingItem ? 'Editar' : 'Novo'} Convênio
          </SheetTitle>
        </SheetHeader>
        <div className="mt-6">
          {formError && (
              <div className="mb-4 p-4 mt-4 bg-destructive/10 border border-destructive rounded-md text-destructive">
                {formError}
              </div>
          )}

          <MedicalPlansForm 
            onSubmit={handleFormSubmit}
            initialData={preparedData}
          />

        </div>
      </SheetContent>
    </Sheet>
  );
};
