import { DataItem } from "@/models/models";

export const identificationColors = [
  { label: "Vermelho", value: "#ea384c" },
  { label: "Verde", value: "#22c55e" },
  { label: "Azul", value: "#0EA5E9" },
  { label: "Amarelo", value: "#eab308" },
  { label: "Roxo", value: "#8B5CF6" },
  { label: "Laranja", value: "#F97316" },
];

export const validatePatientForm = (formData: Partial<DataItem>): Record<string, string> => {
  const errors: Record<string, string> = {};
  
  if (!formData.cpf) errors.cpf = "CPF é obrigatório";
  if (!formData.email) errors.email = "Email é obrigatório";
  if (!formData.name) errors.name = "Name é obrigatório";
  
  if (formData.cpf && formData.cpf.includes('_')) {
    errors.cpf = "CPF inválido";
  }
  
  if (formData.cellphone && formData.cellphone.includes('_')) {
    errors.cellphone = "Celular inválido";
  }
  
  if (formData.birth_date && formData.birth_date.includes('_')) {
    errors.birth_date = "Data de Nascimento inválida";
  }
  
  return errors;
};

export const processInitialData = (initialData: DataItem | null, pathname: string): Partial<DataItem> => {
  if (!initialData) return {};

  const data: Partial<DataItem> = {
    name: initialData.name,
  };

  if (pathname === "/pacientes") {
    data.cpf = initialData.cpf || '';
    data.sex = initialData.sex || '';
    data.cellphone = initialData.cellphone || '';
    data.identification_color = initialData.identification_color || '';
    data.medical_plan_id = initialData.medical_plan_id || '';
    data.email = initialData.email || '';
    data.name = initialData.name || '';
    
    // Handle dates
    if (initialData.last_appointment) {
      data.last_appointment = initialData.last_appointment;
    }
    
    if (initialData.next_appointment) {
      data.next_appointment = initialData.next_appointment;
    }
    
    // Fix birth date formatting
    if (initialData.birth_date) {
      try {
        // If it's already in DD/MM/YYYY format, keep it
        if (initialData.birth_date.includes('/')) {
          const parts = initialData.birth_date.split('/');
          if (parts.length === 3) {
            const day = parts[0].padStart(2, '0');
            const month = parts[1].padStart(2, '0');
            const year = parts[2];
            data.birth_date = `${day}/${month}/${year}`;
          } else {
            data.birth_date = initialData.birth_date;
          }
        } else {
          // If it's in another format, convert it
          const date = new Date(initialData.birth_date);
          if (!isNaN(date.getTime())) {
            const day = date.getDate().toString().padStart(2, '0');
            const month = (date.getMonth() + 1).toString().padStart(2, '0');
            const year = date.getFullYear();
            data.birth_date = `${day}/${month}/${year}`;
          } else {
            data.birth_date = initialData.birth_date;
          }
        }
      } catch (error) {
        console.error("Erro formatando Data de Nascimento:", error);
        data.birth_date = initialData.birth_date;
      }
    }
  }

  return data;
};
