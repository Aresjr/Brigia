import { Button } from "@/components/ui/button";
import { DataItem } from "@/models/models";
import { useEffect, useState } from "react";
import { useQuery } from "@tanstack/react-query";
import { 
  PatientBasicInfo, 
  PatientContactInfo, 
  ProfilePictureUpload,
  AddressFields
} from "./PatientForm";
import { identificationColors, validatePatientForm, processInitialData } from "./utils/formUtils";
import {getMedicalPlans} from "@/api/medicalPlansApi.ts";
import {getPatientMedicalPlan} from "@/api/patientsApi.ts";
import {toast} from "sonner";

interface RegisterFormProps {
  pathname: string;
  onSubmit: (data: Omit<DataItem, 'id' | 'created_at'>) => void;
  initialData?: DataItem | null;
}

export const RegisterForm = ({ pathname, onSubmit, initialData }: RegisterFormProps) => {
  const [formData, setFormData] = useState<Partial<DataItem>>({
    name: ''
  });
  const [errors, setErrors] = useState<Record<string, string>>({});
  const [profilePicture, setProfilePicture] = useState<File | null>(null);
  const [profilePicturePreview, setProfilePicturePreview] = useState<string | null>(null);
  const [isSubmitting, setIsSubmitting] = useState(false);

  const { data: medicalPlans = [] } = useQuery({
    queryKey: ["medicalPlansOptions"],
    queryFn: async () => {
      const { data, error } = await getMedicalPlans();
      
      if (error) throw error;
      return data.map((plan: any) => ({
        ...plan,
        id: String(plan.id)
      }));
    },
    enabled: pathname === "/pacientes",
  });

  // Load patient's medical plans if editing
  const { data: patientMedicalPlans = [] } = useQuery({
    queryKey: ["patientMedicalPlans", initialData?.id],
    queryFn: async () => {
      const patientId = typeof initialData?.id === 'string' 
        ? parseInt(initialData.id) 
        : initialData?.id;

      return await getPatientMedicalPlan(patientId);
    },
    enabled: !!initialData?.id && pathname === "/pacientes",
  });

  useEffect(() => {
    if (initialData) {
      const processedData = processInitialData(initialData, pathname);
      
      if (initialData.address && !initialData.address_cep) {
        processedData.address_cep = initialData.address.cep;
        processedData.address_rua = initialData.address.rua;
        processedData.address_complemento = initialData.address.complemento;
        processedData.address_bairro = initialData.address.bairro;
        processedData.address_cidade = initialData.address.cidade;
        processedData.address_uf = initialData.address.uf;
      }
      
      setFormData(processedData);
      
      if (pathname === "/pacientes" && initialData.image_url) {
        setProfilePicturePreview(initialData.image_url);
      }
    }
  }, [initialData, pathname]);

  // Set the patient's medical plans when they are loaded
  useEffect(() => {
    if (patientMedicalPlans.length > 0 && initialData) {
      setFormData(prev => ({
        ...prev,
        medical_plan_ids: patientMedicalPlans
      }));
    }
  }, [patientMedicalPlans, initialData]);

  const validateForm = () => {
    if (pathname === "/pacientes") {
      const newErrors = validatePatientForm(formData);
      setErrors(newErrors);
      return Object.keys(newErrors).length === 0;
    }
    return true;
  };

  const handleProfilePictureChange = (file: File | null) => {
    setProfilePicture(file);
    
    if (file) {
      const reader = new FileReader();
      reader.onloadend = () => {
        setProfilePicturePreview(reader.result as string);
      };
      reader.readAsDataURL(file);
    }
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
      const submitData = { ...formData } as Omit<DataItem, 'id' | 'created_at'>;
      
      if (pathname === "/pacientes" && profilePicture) {
        const fileName = `${Date.now()}_${profilePicture.name}`;

        //TODO - implement
        const uploadError = null;
        
        if (uploadError) {
          toast.error("Erro de upload", {
            description: "Falha ao enviar a foto do perfil.",
          });
          setIsSubmitting(false);
          return;
        }

      }
      
      onSubmit(submitData);
    } catch (error: any) {

      console.log('error', error);

    } finally {
      setIsSubmitting(false);
    }
  };

  const handleFormDataChange = (newData: Partial<DataItem>) => {
    setFormData(prev => ({ ...prev, ...newData }));
  };

  return (
    <form onSubmit={handleSubmit} className="space-y-6">
      {pathname === "/pacientes" && (
        <ProfilePictureUpload 
          profilePicturePreview={profilePicturePreview}
          onPictureChange={handleProfilePictureChange}
        />
      )}

      {pathname !== "/convenios" && (
        <PatientBasicInfo 
          formData={formData}
          setFormData={handleFormDataChange}
          errors={errors}
          identificationColors={identificationColors}
        />
      )}

      {pathname === "/pacientes" && (
        <>
          <PatientContactInfo
            formData={formData}
            setFormData={handleFormDataChange}
            errors={errors}
            medicalPlans={medicalPlans}
          />
          
          <AddressFields
            formData={formData}
            setFormData={handleFormDataChange}
            errors={errors}
          />
        </>
      )}

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
