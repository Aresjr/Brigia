
import { useState } from "react";
import { Input } from "@/components/ui/input";
import { DataItem } from "@/models/models";
import InputMask from "react-input-mask";
import { Loader2 } from "lucide-react";
import {toast} from "sonner";

interface AddressFieldsProps {
  formData: Partial<DataItem>;
  setFormData: (data: Partial<DataItem>) => void;
  errors: Record<string, string>;
}

interface ViaCepResponse {
  cep: string;
  logradouro: string;
  complemento: string;
  bairro: string;
  localidade: string;
  uf: string;
  erro?: boolean;
}

export const AddressFields = ({ formData, setFormData, errors }: AddressFieldsProps) => {
  const [isLoading, setIsLoading] = useState(false);

  const updateAddressField = (field: string, value: string) => {
    setFormData({
      ...formData,
      [`address_${field}`]: value
    });
  };
  
  const fetchAddressFromCep = async (cep: string) => {
    if (!cep || cep.includes('_')) return;
    
    const cleanCep = cep.replace(/\D/g, '');
    if (cleanCep.length !== 8) return;
    
    setIsLoading(true);
    try {
      const response = await fetch(`https://viacep.com.br/ws/${cleanCep}/json`);
      const data: ViaCepResponse = await response.json();
      
      if (data.erro) {
        toast.error("CEP não encontrado", {
          description: "Verifique o CEP informado e tente novamente."
        });
        return;
      }
      
      setFormData({
        ...formData,
        address_cep: data.cep,
        address_rua: data.logradouro,
        address_complemento: data.complemento,
        address_bairro: data.bairro,
        address_cidade: data.localidade,
        address_uf: data.uf
      });
    } catch (error) {
      console.error("Erro ao buscar o endereço:", error);
      toast.error("Erro ao buscar o endereço", {
        description: "Houve um problema ao buscar o endereço pelo CEP. Tente novamente mais tarde."
      });
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <div className="space-y-4">
      <div className="text-lg font-bold mb-2">Endereço</div>
      
      <div className="flex items-center gap-2">
        <div className="flex-1">
          <label htmlFor="cep" className="block text-sm font-medium mb-1">CEP</label>
          <InputMask
            mask="99999-999"
            value={(formData.address_cep || '')}
            onChange={(e) => updateAddressField('cep', e.target.value)}
            onBlur={(e) => fetchAddressFromCep(e.target.value)}
          >
            {(inputProps: any) => <Input {...inputProps} id="cep" />}
          </InputMask>
          {errors.address_cep && <p className="text-destructive text-sm mt-1">{errors.address_cep}</p>}
        </div>
        {isLoading && <Loader2 className="h-5 w-5 animate-spin text-muted-foreground" />}
      </div>
      
      <div>
        <label htmlFor="rua" className="block text-sm font-medium mb-1">Rua</label>
        <Input
          id="rua"
          value={(formData.address_rua || '')}
          onChange={(e) => updateAddressField('rua', e.target.value)}
        />
      </div>
      
      <div>
        <label htmlFor="complemento" className="block text-sm font-medium mb-1">Complemento</label>
        <Input
          id="complemento"
          value={(formData.address_complemento || '')}
          onChange={(e) => updateAddressField('complemento', e.target.value)}
        />
      </div>
      
      <div>
        <label htmlFor="bairro" className="block text-sm font-medium mb-1">Bairro</label>
        <Input
          id="bairro"
          value={(formData.address_bairro || '')}
          onChange={(e) => updateAddressField('bairro', e.target.value)}
        />
      </div>
      
      <div className="grid grid-cols-2 gap-4">
        <div>
          <label htmlFor="cidade" className="block text-sm font-medium mb-1">Cidade</label>
          <Input
            id="cidade"
            value={(formData.address_cidade || '')}
            onChange={(e) => updateAddressField('cidade', e.target.value)}
          />
        </div>
        
        <div>
          <label htmlFor="uf" className="block text-sm font-medium mb-1">UF</label>
          <Input
            id="uf"
            value={(formData.address_uf || '')}
            onChange={(e) => updateAddressField('uf', e.target.value)}
          />
        </div>
      </div>
    </div>
  );
};
