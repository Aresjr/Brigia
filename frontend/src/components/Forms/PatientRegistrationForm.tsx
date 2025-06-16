import { useState } from "react";
import { useQuery } from "@tanstack/react-query";
import { Patient } from "@/models/models";
import { toast } from "sonner";
import { BaseForm } from "./BaseForm";
import {
    PatientBasicInfo,
    PatientContactInfo,
    ProfilePictureUpload,
    AddressFields
} from "./PatientForm";
import { getMedicalPlans } from "@/api/medicalPlansApi";

interface PatientRegistrationFormProps {
    onSubmit: (data: Omit<Patient, 'id' | 'created_at'>) => void;
    initialData?: Patient | null;
}

export function PatientRegistrationForm({ onSubmit, initialData }: PatientRegistrationFormProps) {
    const [formData, setFormData] = useState<Partial<Patient>>(() => {
        if (!initialData) return { name: '' };

        // Process initial patient data
        const data: Partial<Patient> = {
            name: initialData.name,
            cpf: initialData.cpf || '',
            sex: initialData.sex || '',
            cellphone: initialData.cellphone || '',
            identification_color: initialData.identification_color || '',
            medical_plan_id: initialData.medical_plan_id || '',
            email: initialData.email || '',
            birth_date: initialData.birth_date || '',
            image_url: initialData.image_url,
        };

        // Process address data if it exists
        if (initialData.address && !initialData.address_cep) {
            data.address_cep = initialData.address.cep || '';
            data.address_rua = initialData.address.rua || '';
            data.address_complemento = initialData.address.complemento || '';
            data.address_bairro = initialData.address.bairro || '';
            data.address_cidade = initialData.address.cidade || '';
            data.address_uf = initialData.address.uf || '';
        } else {
            data.address_cep = initialData.address_cep || '';
            data.address_rua = initialData.address_rua || '';
            data.address_complemento = initialData.address_complemento || '';
            data.address_bairro = initialData.address_bairro || '';
            data.address_cidade = initialData.address_cidade || '';
            data.address_uf = initialData.address_uf || '';
        }

        return data;
    });
    const [errors, setErrors] = useState<Record<string, string>>({});
    const [profilePicture, setProfilePicture] = useState<File | null>(null);
    const [profilePicturePreview, setProfilePicturePreview] = useState<string | null>(initialData?.image_url || null);
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
        }
    });

    const validateForm = () => {
        const errors: Record<string, string> = {};

        if (!formData.cpf) errors.cpf = "CPF é obrigatório";
        if (!formData.email) errors.email = "Email é obrigatório";
        if (!formData.name) errors.name = "Nome é obrigatório";

        if (formData.cpf && formData.cpf.includes('_')) {
            errors.cpf = "CPF inválido";
        }

        if (formData.cellphone && formData.cellphone.includes('_')) {
            errors.cellphone = "Celular inválido";
        }

        if (formData.birth_date && formData.birth_date.includes('_')) {
            errors.birth_date = "Data de Nascimento inválida";
        }

        setErrors(errors);
        return Object.keys(errors).length === 0;
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

    const handleSubmit = async (data: Omit<Patient, 'id' | 'created_at'>) => {
        if (!validateForm()) {
            toast.error("Erro de validação", {
                description: "Por favor, corrija os erros no formulário."
            });
            return;
        }

        setIsSubmitting(true);
        try {
            if (profilePicture) {
                // TODO: Handle profile picture upload
                // For now, just include the existing image_url if any
                data.image_url = initialData?.image_url;
            }

            await onSubmit(data);
        } catch (error) {
            console.error('Error submitting patient form:', error);
            toast.error("Erro ao salvar paciente");
        } finally {
            setIsSubmitting(false);
        }
    };

    const handleFormDataChange = (newData: Partial<Patient>) => {
        setFormData(prev => ({ ...prev, ...newData }));
    };

    return (
        <BaseForm<Patient>
            onSubmit={handleSubmit}
            initialData={formData as Patient}
            isSubmitting={isSubmitting}
        >
            <ProfilePictureUpload
                profilePicturePreview={profilePicturePreview}
                onPictureChange={handleProfilePictureChange}
            />

            <PatientBasicInfo
                formData={formData}
                setFormData={handleFormDataChange}
                errors={errors}
            />

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
        </BaseForm>
    );
}
