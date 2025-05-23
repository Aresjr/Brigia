
import { Input } from "@/components/ui/input";
import { DataItem } from "@/models/models";
import InputMask from "react-input-mask";
import { RadioGroup, RadioGroupItem } from "@/components/ui/radio-group";
import { Label } from "@/components/ui/label";
import {Select, SelectContent, SelectItem, SelectTrigger, SelectValue} from "@/components/ui/select";

interface PatientContactInfoProps {
  formData: Partial<DataItem>;
  setFormData: (data: Partial<DataItem>) => void;
  errors: Record<string, string>;
  medicalPlans: Array<{ id: string | number; name: string }>;
}

export const PatientContactInfo = ({ 
  formData, 
  setFormData, 
  errors,
  medicalPlans
}: PatientContactInfoProps) => {
  const selectedMedicalPlans = formData.medical_plan_ids || [];

  const handleMedicalPlanChange = (planId: string, checked: boolean) => {
    const currentPlans = [...selectedMedicalPlans];
    
    if (checked) {
      // Add the plan if it's not already selected
      if (!currentPlans.includes(planId)) {
        currentPlans.push(planId);
      }
    } else {
      // Remove the plan if it's selected
      const index = currentPlans.indexOf(planId);
      if (index !== -1) {
        currentPlans.splice(index, 1);
      }
    }
    
    setFormData({ ...formData, medical_plan_ids: currentPlans });
  };

  return (
    <>
      <div>
        <label htmlFor="cpf" className="block text-sm font-medium mb-1">CPF</label>
        <InputMask
          mask="999.999.999-99"
          value={formData.cpf || ''}
          onChange={(e) => setFormData({ ...formData, cpf: e.target.value })}
        >
          {(inputProps: any) => <Input {...inputProps} id="cpf" required />}
        </InputMask>
        {errors.cpf && <p className="text-destructive text-sm mt-1">{errors.cpf}</p>}
      </div>

      <div>
        <label htmlFor="birth_date" className="block text-sm font-medium mb-1">Data de Nascimento</label>
        <InputMask
          mask="99/99/9999"
          value={formData.birth_date || ''}
          onChange={(e) => {
            const value = e.target.value;
            setFormData({ ...formData, birth_date: value });
          }}
        >
          {(inputProps: any) => <Input {...inputProps} id="birth_date" />}
        </InputMask>
        {errors.birth_date && <p className="text-destructive text-sm mt-1">{errors.birth_date}</p>}
      </div>

      <div>
        <label className="block text-sm font-medium mb-1">Sexo</label>
        <RadioGroup 
          value={formData.sex || ''} 
          onValueChange={(value) => setFormData({ ...formData, sex: value })}
          className="flex gap-4"
        >
          <div className="flex items-center space-x-2">
            <RadioGroupItem value="F" id="feminino" />
            <Label htmlFor="feminino">Feminino</Label>
          </div>
          <div className="flex items-center space-x-2">
            <RadioGroupItem value="M" id="masculino" />
            <Label htmlFor="masculino">Masculino</Label>
          </div>
        </RadioGroup>
      </div>

      <div>
        <label htmlFor="cellphone" className="block text-sm font-medium mb-1">Celular</label>
        <InputMask
          mask="(99) 99999-9999"
          value={formData.cellphone || ''}
          onChange={(e) => setFormData({ ...formData, cellphone: e.target.value })}
        >
          {(inputProps: any) => <Input {...inputProps} id="cellphone" />}
        </InputMask>
        {errors.cellphone && <p className="text-destructive text-sm mt-1">{errors.cellphone}</p>}
      </div>

      <div className="space-y-2">
        <label className="block text-sm font-medium mb-1">Convênios</label>

        <Select
            value={formData.medical_plan_id ? String(formData.medical_plan_id) : ''}
            onValueChange={(value) => setFormData({ ...formData, medical_plan_id: value })}
        >
          <SelectTrigger className="w-full">
            <SelectValue placeholder="Selecione um plano de saúde" />
          </SelectTrigger>
          <SelectContent>
            <SelectItem value="none">Nenhum</SelectItem>
            {medicalPlans.map((plan) => (
                <SelectItem key={String(plan.id)} value={String(plan.id)}>{plan.name}</SelectItem>
            ))}
          </SelectContent>
        </Select>

      </div>
    </>
  );
};
