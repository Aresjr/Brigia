import { Sheet, SheetContent,  SheetHeader, SheetTitle } from "@/components/ui/sheet";
import { Patient } from "@/models/models";
import { useState, useEffect } from "react";
import { toast } from "sonner";
import { MedicalPlansForm } from "./MedicalPlansForm";
import {createMedicalPlan, updateMedicalPlan} from "@/api/medicalPlansApi.ts";

interface MedicalPlanFormProps {
  isOpen: boolean;
  onOpenChange: (open: boolean) => void;
  editingItem: Patient | null;
}

export const MedicalPlanSidePanelForm = ({ 
  isOpen, 
  onOpenChange,
  editingItem
}: MedicalPlanFormProps) => {
  const [preparedData, setPreparedData] = useState<Patient | null>(null);
  const [formError, setFormError] = useState<string | null>(null);

  useEffect(() => {
    setPreparedData(editingItem);
  }, [editingItem]);

    const handleSubmit = async (data: Omit<Patient, 'id' | 'created_at'>) => {
      setFormError(null);
      try {
          if (editingItem) {
              await updateMedicalPlan(editingItem.id, data);

              toast.success("Registro atualizado");
          } else {
              await createMedicalPlan(data);

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

    toast.error(friendlyErrorMessage);

    setFormError(friendlyErrorMessage);
  }

  const handleFormSubmit = async (data: Omit<Patient, 'id' | 'created_at'>) => {
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
