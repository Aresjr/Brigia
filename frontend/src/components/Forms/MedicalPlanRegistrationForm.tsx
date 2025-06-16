import { useState } from "react";
import { MedicalPlan } from "@/models/models";
import { BaseForm } from "./BaseForm";
import { Input } from "@/components/ui/input";
import { Textarea } from "@/components/ui/textarea";
import { toast } from "sonner";

interface MedicalPlanRegistrationFormProps {
    onSubmit: (data: Omit<MedicalPlan, 'id' | 'created_at'>) => void;
    initialData?: MedicalPlan | null;
}

export function MedicalPlanRegistrationForm({ onSubmit, initialData }: MedicalPlanRegistrationFormProps) {
    const [formData, setFormData] = useState<Partial<MedicalPlan>>(() => {
        if (!initialData) {
            return {
                name: '',
                description: ''
            };
        }

        // Process initial medical plan data
        return {
            name: initialData.name,
            description: initialData.description || ''
        };
    });
    const [isSubmitting, setIsSubmitting] = useState(false);

    const validateForm = () => {
        const errors: Record<string, string> = {};
        if (!formData.name?.trim()) errors.name = "Nome é obrigatório";
        return Object.keys(errors).length === 0;
    };

    const handleSubmit = async (data: Omit<MedicalPlan, 'id' | 'created_at'>) => {
        if (!validateForm()) {
            toast.error("Erro de validação", {
                description: "Por favor, preencha todos os campos obrigatórios."
            });
            return;
        }

        setIsSubmitting(true);
        try {
            await onSubmit(data);
        } catch (error) {
            console.error('Error submitting medical plan form:', error);
            toast.error("Erro ao salvar convênio");
        } finally {
            setIsSubmitting(false);
        }
    };

    return (
        <BaseForm<MedicalPlan>
            onSubmit={handleSubmit}
            initialData={formData as MedicalPlan}
            isSubmitting={isSubmitting}
        >
            <div className="space-y-4">
                <div>
                    <label htmlFor="name" className="block text-sm font-medium mb-1">Nome do Convênio</label>
                    <Input
                        id="name"
                        value={formData.name}
                        onChange={(e) => setFormData({ ...formData, name: e.target.value })}
                        required
                    />
                </div>

                <div>
                    <label htmlFor="description" className="block text-sm font-medium mb-1">Descrição</label>
                    <Textarea
                        id="description"
                        value={formData.description}
                        onChange={(e) => setFormData({ ...formData, description: e.target.value })}
                    />
                </div>

            </div>
        </BaseForm>
    );
}
