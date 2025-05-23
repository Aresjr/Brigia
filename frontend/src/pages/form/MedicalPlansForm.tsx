import { Button } from "@/components/ui/button";
import { DataItem } from "@/models/models";
import { useEffect, useState } from "react";
import { useToast } from "@/hooks/use-toast";
import { processInitialData } from "@/components/Forms/utils/formUtils";
import { Input } from "@/components/ui/input";
import { Textarea } from "@/components/ui/textarea";

interface MedicalPlansFormProps {
  onSubmit: (data: Omit<DataItem, 'id' | 'created_at'>) => void;
  initialData?: DataItem | null;
}

export const MedicalPlansForm = ({ onSubmit, initialData }: MedicalPlansFormProps) => {
  const { toast } = useToast();
  const [formData, setFormData] = useState<Partial<DataItem>>({
    name: ''
  });
  const [isSubmitting, setIsSubmitting] = useState(false);

  useEffect(() => {
    if (initialData) {
      const processedData = processInitialData(initialData, null);
      
      setFormData(processedData);
    }
  }, [initialData]);

  const validateForm = () => {
    return true;
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    
    if (!validateForm()) {
      toast({
        title: "Erro de validação",
        description: "Por favor, corrija os erros no formulário.",
        variant: "destructive"
      });
      return;
    }
    
    setIsSubmitting(true);
    
    try {
      const submitData = { ...formData } as Omit<DataItem, 'id' | 'created_at'>;
      
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
