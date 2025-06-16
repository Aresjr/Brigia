import { Sheet, SheetContent, SheetHeader, SheetTitle } from "@/components/ui/sheet";
import { Patient, User, Professional, Appointment, BaseEntity, MedicalPlan } from "@/models/models";
import { getPageTitle } from "@/models/pages";
import { PatientRegistrationForm } from "./PatientRegistrationForm";
import { MedicalPlanRegistrationForm } from "./MedicalPlanRegistrationForm";
import { useState } from "react";
import { toast } from "sonner";

type FormEntity = Patient | User | Professional | Appointment;

interface FormDialogProps {
    isOpen: boolean;
    onOpenChange: (open: boolean) => void;
    pathname: string;
    editingItem: FormEntity | null;
}

export const FormDialog = ({ 
    isOpen,
    onOpenChange,
    pathname,
    editingItem
}: FormDialogProps) => {
    const [formError, setFormError] = useState<string | null>(null);

    const handleFormSubmit = async <T extends BaseEntity>(data: Omit<T, 'id' | 'created_at'>) => {
        setFormError(null);
        try {
            // TODO: Implement form submission logic based on pathname
            if (editingItem) {
                // Update logic
                toast.success("Registro atualizado");
            } else {
                // Create logic
                toast.success("Registro criado");
            }
            onOpenChange(false);
        } catch (error: any) {
            console.error('error', error);
            //handleErrorFormSubmit(error);
        }
    };

    const renderForm = () => {
        switch (pathname) {
            case "/pacientes":
                return (
                    <PatientRegistrationForm
                        onSubmit={handleFormSubmit}
                        initialData={editingItem as Patient}
                    />
                );
            case "/convenios":
                return (
                    <MedicalPlanRegistrationForm
                        onSubmit={handleFormSubmit}
                        initialData={editingItem as MedicalPlan}
                    />
                );
            // Add other form types here as needed
            default:
                return null;
        }
    };

    return (
        <Sheet open={isOpen} onOpenChange={onOpenChange}>
            <SheetContent className="sm:max-w-md overflow-y-auto">
                <SheetHeader>
                    <SheetTitle>
                        {editingItem ? 'Editar' : 'Novo'} {getPageTitle(pathname)}
                    </SheetTitle>
                </SheetHeader>
                <div className="mt-6">
                    {formError && (
                        <div className="mb-4 p-4 mt-4 bg-destructive/10 border border-destructive rounded-md text-destructive">
                            {formError}
                        </div>
                    )}
                    {renderForm()}
                </div>
            </SheetContent>
        </Sheet>
    );
};
