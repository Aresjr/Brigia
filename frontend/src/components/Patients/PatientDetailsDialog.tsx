import { Sheet, SheetContent, SheetHeader, SheetTitle, SheetFooter } from "@/components/ui/sheet";
import {PatientAddress, Patient} from "@/models/models";
import { format } from "date-fns";
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar";
import { Button } from "@/components/ui/button";
import { UserCircle, Edit, History } from "lucide-react";
import { useQuery } from "@tanstack/react-query";
import {getPatient} from "@/api/patientsApi.ts";
import { identificationColorOptions } from "@/components/Forms/utils/formUtils";
import {Badge} from "@/components/ui/badge.tsx";

interface PatientDetailsDialogProps {
  open: boolean;
  onOpenChange: (open: boolean) => void;
  patient: Patient | null;
  onEdit?: (patient: Patient) => void;
}

export const PatientDetailsDialog = ({
  open,
  onOpenChange,
  patient,
  onEdit
}: PatientDetailsDialogProps) => {

  const { data: patientAddress } = useQuery<PatientAddress>({
    queryKey: ["patientAddress", patient?.id],
    queryFn: async () => {
      if (!patient?.id) return null;
      return getPatient(patient.id);
    },
    enabled: !!patient?.id && open
  });

  const handleEdit = () => {
    if (patient) {
      // Prepare patient data with all necessary fields for the form
      const patientWithAddressAndDetails = {
        ...patient,
        address_cep: patientAddress?.address_cep,
        address_rua: patientAddress?.address_rua,
        address_complemento: patientAddress?.address_complemento,
        address_bairro: patientAddress?.address_bairro,
        address_cidade: patientAddress?.address_cidade,
        address_uf: patientAddress?.address_uf,
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
    <Sheet open={open} onOpenChange={onOpenChange}>
      <SheetContent className="sm:max-w-lg overflow-y-auto">
        {patient ? (
          <>
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
                        <Badge
                            variant="outline"
                            className="w-2 h-2 rounded-full p-0 border-0"
                            style={{
                                backgroundColor: identificationColorOptions.find(
                                    opt => opt.value === patient.identification_color
                                )?.color
                            }}
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
                  <h3 className="text-sm font-medium text-muted-foreground mb-1">Convênio</h3>
                  {patient.medical_plan_name ? (
                      <div className="space-y-2">
                            <div className="bg-muted/30 p-3 rounded-md space-y-1">
                              <p className="font-medium">{patient.medical_plan_name || "Convênio Desconhecido"}</p>
                            </div>
                      </div>
                  ) : (
                      <p className="text-sm text-muted-foreground">Sem convênio cadastrado</p>
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
          </>
        ) : (
          <div className="p-4 text-center">
            <p className="text-sm text-muted-foreground">Nenhum paciente selecionado.</p>
          </div>
        )}
      </SheetContent>
    </Sheet>
  );
};
