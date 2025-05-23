
import { Input } from "@/components/ui/input";
import { DataItem } from "@/models/models";
import {Select, SelectContent, SelectItem, SelectTrigger, SelectValue} from "@/components/ui/select.tsx";

interface PatientBasicInfoProps {
  formData: Partial<DataItem>;
  setFormData: (data: Partial<DataItem>) => void;
  errors: Record<string, string>;
  identificationColors: { label: string; value: string }[];
}

export const PatientBasicInfo = ({ 
  formData, 
  setFormData, 
  errors,
  identificationColors 
}: PatientBasicInfoProps) => {

  return (
    <>
      <div>
        <label htmlFor="name" className="block text-sm font-medium mb-1">Nome</label>
        <Input 
          id="name"
          value={formData.name || ''}
          onChange={(e) => setFormData({ ...formData, name: e.target.value })}
          required
          className="border-gray-400"
        />
        {errors.name && <p className="text-destructive text-sm mt-1">{errors.name}</p>}
      </div>

      <div>
        <label htmlFor="identification_color" className="block text-sm font-medium mb-1">Cor</label>
        <Select
            value={formData.identification_color || ''}
            onValueChange={(value) => setFormData({...formData, identification_color: value})}
        >
          <SelectTrigger className="w-full h-10 p-0">
            <SelectValue placeholder="">
              {formData.identification_color && (
                  <div className="w-full h-full flex items-center justify-center">
                    <div
                        className="w-6 h-6 rounded-full"
                        style={{backgroundColor: formData.identification_color}}
                    />
                  </div>
              )}
            </SelectValue>
          </SelectTrigger>
          <SelectContent>
            {identificationColors.map((color) => (
                <SelectItem key={color.value} value={color.value}>
                  <div className="flex items-center gap-2">
                    <div
                        className="w-4 h-4 rounded-full"
                        style={{backgroundColor: color.value}}
                    />
                    <span>{color.label}</span>
                  </div>
                </SelectItem>
            ))}
          </SelectContent>
        </Select>
      </div>

      <div>
        <label htmlFor="email" className="block text-sm font-medium mb-1">E-mail</label>
        <Input 
          id="email"
          type="email"
          value={formData.email || ''}
          onChange={(e) => setFormData({ ...formData, email: e.target.value })}
          required
          className="border-gray-400"
        />
        {errors.email && <p className="text-destructive text-sm mt-1">{errors.email}</p>}
      </div>
    </>
  );
};
