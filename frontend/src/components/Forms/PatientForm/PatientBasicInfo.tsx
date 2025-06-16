import { Input } from "@/components/ui/input";
import { Patient } from "@/models/models";
import { Select, SelectContent, SelectItem, SelectTrigger } from "@/components/ui/select";
import { Badge } from "@/components/ui/badge";
import { identificationColorOptions } from "@/components/Forms/utils/formUtils";

interface PatientBasicInfoProps {
    formData: Partial<Patient>;
    setFormData: (data: Partial<Patient>) => void;
    errors: Record<string, string>;
}

export const PatientBasicInfo = ({ 
    formData,
    setFormData,
    errors
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
                    <SelectTrigger className="w-full">
                        {formData.identification_color && (
                            <div className="flex items-center gap-2">
                                <Badge
                                    variant="outline"
                                    className="w-2 h-2 rounded-full p-0 border-0"
                                    style={{
                                        backgroundColor: identificationColorOptions.find(
                                            opt => opt.value === formData.identification_color
                                        )?.color
                                    }}
                                />
                                {identificationColorOptions.find(opt => opt.value === formData.identification_color)?.label}
                            </div>
                        )}
                    </SelectTrigger>
                    <SelectContent>
                        {identificationColorOptions.map(option => (
                            <SelectItem key={option.value} value={option.value}>
                                <div className="flex items-center gap-2">
                                    <Badge
                                        variant="outline"
                                        className="w-2 h-2 rounded-full p-0 border-0"
                                        style={{ backgroundColor: option.color }}
                                    />
                                    {option.label}
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
