import { Sheet, SheetContent, SheetHeader, SheetTitle, SheetFooter } from "@/components/ui/sheet";
import { DataItem, PatientAddress } from "@/models/models";
import { format } from "date-fns";
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar";
import { Button } from "@/components/ui/button";
import { UserCircle, Edit, History } from "lucide-react";
import { useQuery } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";
import { getPatientAddress } from "@/services/patientService";

interface PatientDetailsDialogProps {
  isOpen: boolean;
  onOpenChange: (open: boolean) => void;
  patient: DataItem;
  onEdit?: (patient: DataItem) => void;
}

export const PatientDetailsDialog = ({
  isOpen, 
  onOpenChange, 
  patient,
  onEdit
}: PatientDetailsDialogProps) => {

  const { data: patientMedicalPlans = [] } = useQuery({
    queryKey: ["patientMedicalPlans", patient.id],
    queryFn: async () => {
      const { data, error } = await supabase
        .from("patient_medical_plans")
        .select(`*, medical_plans (id, name, description) `)
        .eq("patient_id", Number(patient.id));

      if (error) throw error;
      return data || [];
    },
    enabled: !!patient.id && isOpen
  });

  const { data: patientAddress } = useQuery<PatientAddress>({
    queryKey: ["patientAddress", patient.id],
    queryFn: async () => {
      return getPatientAddress(patient.id);
    },
    enabled: !!patient.id && isOpen
  });

  const handleEdit = () => {
    if (onEdit) {
      const patientWithAddressAndDetails = {
        ...patient,
        name: patient.name,
        email: patient.email,
        identification_color: patient.identification_color
      };
      onEdit(patientWithAddressAndDetails);
      onOpenChange(false);
    }
  };

  const formatBirthDate = (dateString: string | undefined) => {
    if (!dateString) return "N/A";
    
    try {
      if (dateString.includes('/')) {
        const [day, month, year] = dateString.split('/').map(Number);
        return format(new Date(year, month - 1, day), "dd/MM/yyyy");
      }
      return format(new Date(dateString), "dd/MM/yyyy");
    } catch (error) {
      console.error("Erro ao formatar a data:", error);
      return dateString;
    }
  };

  const formatSex = (value: string | undefined) => {
    if (!value) return "N/A";
    return value === 'M' ? 'Masculino' : value === 'F' ? 'Feminino' : value;
  };

  return (
    <Sheet open={isOpen} onOpenChange={onOpenChange}>
      <SheetContent className="sm:max-w-lg overflow-y-auto">
        <SheetHeader>
          <SheetTitle className="flex items-center gap-4">
            <div className="flex-shrink-0">
              <Avatar className="h-16 w-16">
                <AvatarImage src={patient.image_url || ""} />
                <AvatarFallback className="bg-primary/10">
                  <UserCircle className="h-8 w-8 text-primary" />
                </AvatarFallback>
              </Avatar>
            </div>
            <div className="flex-1">
              <div className="flex items-center gap-2">
                {patient.identification_color && (
                  <div 
                    className="h-4 w-4 rounded-full flex-shrink-0" 
                    style={{backgroundColor: patient.identification_color}}
                  />
                )}
                <h2 className="text-xl font-bold">{patient.name}</h2>
              </div>
              <p className="text-muted-foreground">{patient.email}</p>
            </div>
          </SheetTitle>
        </SheetHeader>
        
        <div className="mt-6 space-y-4">
          <div className="grid grid-cols-2 gap-2">
            <div>
              <h3 className="text-sm font-medium text-muted-foreground mb-1">CPF</h3>
              <p>{patient.cpf || "N/A"}</p>
            </div>
            
            <div>
              <h3 className="text-sm font-medium text-muted-foreground mb-1">Data de Nascimento</h3>
              <p>{patient.birth_date ? formatBirthDate(patient.birth_date) : "N/A"}</p>
            </div>
            
            <div>
              <h3 className="text-sm font-medium text-muted-foreground mb-1">Sexo</h3>
              <p>{formatSex(patient.sex)}</p>
            </div>
            
            <div>
              <h3 className="text-sm font-medium text-muted-foreground mb-1">Telefone</h3>
              <p>{patient.cellphone || "N/A"}</p>
            </div>
            
            <div>
              <h3 className="text-sm font-medium text-muted-foreground mb-1">Última Consulta</h3>
              <p>{patient.last_appointment ? format(new Date(patient.last_appointment), "dd/MM/yyyy HH:mm") : "N/A"}</p>
            </div>
            
            <div>
              <h3 className="text-sm font-medium text-muted-foreground mb-1">Próxima Consulta</h3>
              <p>{patient.next_appointment ? format(new Date(patient.next_appointment), "dd/MM/yyyy HH:mm") : "N/A"}</p>
            </div>

            <div>
              <h3 className="text-sm font-medium text-muted-foreground mb-1">Criado em</h3>
              <p>{format(new Date(patient.created_at), "dd/MM/yyyy")}</p>
            </div>

            <div className="col-span-2">
              <h3 className="text-sm font-medium text-muted-foreground mb-1">Convênios</h3>
              {patientMedicalPlans && patientMedicalPlans.length > 0 ? (
                  <div className="space-y-2">
                    {patientMedicalPlans.map((plan: any, index: number) => (
                        <div key={index} className="bg-muted/30 p-3 rounded-md space-y-1">
                          <p className="font-medium">{plan.medical_plans?.name || "Convênio Desconhecido"}</p>
                          {plan.card_number && (
                              <p className="text-sm"><span className="font-medium">Carteirinha:</span> {plan.card_number}</p>
                          )}
                          {plan.holder_name && (
                              <p className="text-sm"><span className="font-medium">Titular:</span> {plan.holder_name}</p>
                          )}
                          {plan.expiration_date && (
                              <p className="text-sm"><span className="font-medium">Validade:</span> {format(new Date(plan.expiration_date), "MM/yyyy")}</p>
                          )}
                        </div>
                    ))}
                  </div>
              ) : (
                  <p className="text-sm text-muted-foreground">Sem convênios cadastrados</p>
              )}
            </div>
            
            <div className="col-span-2">
              <h3 className="text-sm font-medium text-muted-foreground">Endereço</h3>
              {patientAddress ? (
                <div className="bg-muted/30 p-3 rounded-md space-y-1">
                  {patientAddress.address_cep && (
                    <p className="text-sm"><span className="font-medium">CEP:</span> {patientAddress.address_cep}</p>
                  )}
                  {patientAddress.address_rua && (
                    <p className="text-sm"><span className="font-medium">Rua:</span> {patientAddress.address_rua}</p>
                  )}
                  {patientAddress.address_complemento && (
                    <p className="text-sm"><span className="font-medium">Complemento:</span> {patientAddress.address_complemento}</p>
                  )}
                  {patientAddress.address_bairro && (
                    <p className="text-sm"><span className="font-medium">Bairro:</span> {patientAddress.address_bairro}</p>
                  )}
                  <p className="text-sm">
                    <span className="font-medium">Cidade/UF:</span> {patientAddress.address_cidade || "N/A"}{patientAddress.address_uf ? ` - ${patientAddress.address_uf}` : ""}
                  </p>
                </div>
              ) : (
                <p className="text-sm text-muted-foreground">Nenhuma informação de endereço disponível</p>
              )}
            </div>
          </div>
        </div>
        
        <SheetFooter className="mt-6 flex flex-col sm:flex-row gap-2">
          <Button 
            onClick={handleEdit} 
            className="w-full gap-2"
          >
            <Edit className="h-4 w-4" />
            Editar Paciente
          </Button>
          <Button 
            variant="secondary"
            className="w-full gap-2"
          >
            <History className="h-4 w-4" />
            Ver Histórico
          </Button>
        </SheetFooter>
      </SheetContent>
    </Sheet>
  );
};
