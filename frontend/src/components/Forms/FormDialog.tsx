
import { Sheet, SheetContent,  SheetHeader, SheetTitle } from "@/components/ui/sheet";
import { RegisterForm } from "./RegisterForm";
import { DataItem } from "@/models/models";
import { getPageTitle, getTableName } from "@/models/pages";
import { useState, useEffect } from "react";
import { useToast } from "@/hooks/use-toast";
import { toast } from "sonner";

interface FormDialogProps {
  isOpen: boolean;
  onOpenChange: (open: boolean) => void;
  pathname: string;
  editingItem: DataItem | null;
}

export const FormDialog = ({ 
  isOpen, 
  onOpenChange, 
  pathname,
  editingItem
}: FormDialogProps) => {
  const [preparedData, setPreparedData] = useState<DataItem | null>(null);
  const [formError, setFormError] = useState<string | null>(null);
  const { toast: toastError } = useToast();

  useEffect(() => {
    if (editingItem && pathname === "/pacientes") {
      const patientData = { ...editingItem };
      
      if (patientData.address && !patientData.address_cep) {
        patientData.address_cep = patientData.address?.cep || '';
        patientData.address_rua = patientData.address?.rua || '';
        patientData.address_complemento = patientData.address?.complemento || '';
        patientData.address_bairro = patientData.address?.bairro || '';
        patientData.address_cidade = patientData.address?.cidade || '';
        patientData.address_uf = patientData.address?.uf || '';
      }
      
      setPreparedData(patientData);
    } else {
      setPreparedData(editingItem);
    }
  }, [editingItem, pathname]);

    const handleSubmit = async (data: Omit<DataItem, 'id' | 'created_at'>) => {
      const tableName = getTableName(location.pathname);
      if (!tableName) return;
      setFormError(null);
      try {
          //TODO - implement and make sure each page has its own update logic
          if (editingItem) {
              toast.success("Registro atualizado");
          } else {
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
    let friendlyErrorMessage = '';

    if (errorMessage.includes('patients_cpf_unique')) {
        friendlyErrorMessage = "Já existe um paciente cadastrado com este CPF";
    } else if (errorMessage.includes('patients_email_unique')) {
        friendlyErrorMessage = "Já existe um paciente cadastrado com este e-mail";
    } else if (errorMessage.includes('patients_cellphone_unique')) {
        friendlyErrorMessage = "Já existe um paciente cadastrado com este número de celular";
    } else if (errorMessage.includes("type date")) {
        friendlyErrorMessage = "Formato inválido de data";
    } else {
        friendlyErrorMessage = "Erro ao salvar o Paciente";
    }

    toastError({
        description: friendlyErrorMessage,
        variant: "destructive"
    });

    setFormError(friendlyErrorMessage);
  }

  const handleFormSubmit = async (data: Omit<DataItem, 'id' | 'created_at'>) => {
    try {
      if (pathname === "/pacientes" && data.medical_plan_ids) {
        if (editingItem?.id) {
          const patientId = typeof editingItem.id === 'string' ? parseInt(editingItem.id) : editingItem.id;

          if (data.medical_plan_ids.length > 0) {
            const planInserts = data.medical_plan_ids.map(planId => ({
              patient_id: patientId,
              medical_plan_id: parseInt(planId)
            }));

            //TODO - make sure to send the medical plans to backend
          }
        }
        
        const { medical_plan_ids, ...submitData } = data;
        handleSubmit(submitData);
      } else {
        handleSubmit(data);
      }
    } catch (error) {
      console.error('Error handling medical plans:', error);
    }
  };

  return (
    <Sheet open={isOpen} onOpenChange={onOpenChange}>
      <SheetContent className="sm:max-w-md overflow-y-auto">
        <SheetHeader>
          <SheetTitle>
            {editingItem ? 'Editar' : 'Novo'} {getPageTitle(pathname).slice(0, -1)}
          </SheetTitle>
        </SheetHeader>
        <div className="mt-6">
          {formError && (
              <div className="mb-4 p-4 mt-4 bg-destructive/10 border border-destructive rounded-md text-destructive">
                {formError}
              </div>
          )}
          <RegisterForm 
            pathname={pathname} 
            onSubmit={handleFormSubmit}
            initialData={preparedData}
          />
        </div>
      </SheetContent>
    </Sheet>
  );
};
