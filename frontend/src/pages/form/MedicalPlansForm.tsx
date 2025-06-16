import { Button } from "@/components/ui/button";
import { MedicalPlan } from "@/models/models";
import { useEffect, useState } from "react";
import { Input } from "@/components/ui/input";
import { Textarea } from "@/components/ui/textarea";
import { toast } from "sonner";

interface MedicalPlansFormProps {
  onSubmit: (data: Omit<MedicalPlan, 'id' | 'created_at'>) => void;
  initialData?: MedicalPlan | null;
}

const processInitialData = (data: MedicalPlan | null): Partial<MedicalPlan> => {
  if (!data) return { name: '' };

  return {
    name: data.name,
    description: data.description || ''
  };
};

export const MedicalPlansForm = ({ onSubmit, initialData }: MedicalPlansFormProps) => {
  const [formData, setFormData] = useState<Partial<MedicalPlan>>({
    name: ''
  });
  const [isSubmitting, setIsSubmitting] = useState(false);

  useEffect(() => {
    if (initialData) {
      const processedData = processInitialData(initialData);
      
      setFormData(processedData);
    }
  }, [initialData]);

  const validateForm = () => {
    return true;
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    
    if (!validateForm()) {
      toast.error("Erro de validação", {
        description: "Por favor, corrija os erros no formulário."
      });
      return;
    }
    
    setIsSubmitting(true);
    
    try {
      const submitData = { ...formData } as Omit<MedicalPlan, 'id' | 'created_at'>;

      onSubmit(submitData);
    } catch (error: any) {

      console.log('error', error);

    } finally {
      setIsSubmitting(false);
    }
  };

  return (
    <form onSubmit={handleSubmit} className="space-y-6">

      <div>
          <label htmlFor="name" className="block text-sm font-medium mb-1">
            Nome
          </label>
          <Input
              id="name"
              value={(formData as any).name || ''}
              onChange={(e) => setFormData({ ...formData, name: e.target.value })}
              required
          />
        <label htmlFor="description" className="block text-sm font-medium mb-1 mt-4">Descrição</label>
        <Textarea
          id="description"
          value={formData.description || ''}
          onChange={(e) => setFormData({ ...formData, description: e.target.value })}
        />
      </div>

      <Button 
        type="submit" 
        className="w-full"
        disabled={isSubmitting}
      >
        {isSubmitting ? 'Salvando...' : initialData ? 'Atualizar' : 'Salvar'}
      </Button>
    </form>
  );
};
