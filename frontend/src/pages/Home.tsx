import { useQuery } from "@tanstack/react-query";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import {Cake} from "lucide-react";
import { format } from "date-fns";
import { getPatientsCount, getBirthdayPatients } from "@/api/patientsApi";
import { identificationColorOptions } from "@/components/Forms/utils/formUtils";
import {Badge} from "@/components/ui/badge.tsx";

const Home = () => {

    const { data: patientCount } = useQuery({
        queryKey: ['patient-count'],
        queryFn: getPatientsCount
    });

    const { data: birthdayPatients } = useQuery({
        queryKey: ['birthday-patients'],
        queryFn: getBirthdayPatients
    });

    return (
        <div className="space-y-8">
            <div className="py-4 -mx-[32px] rounded-none px-[32px] bg-gray-50">
                <div className="flex items-center justify-between bg-gray-50">
                    <h1 className="text-2xl font-bold">Página Inicial</h1>
                </div>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                <Card>
                    <CardContent className="pt-6">
                        <div className="text-2xl font-bold">{patientCount || 0}</div>
                        <div className="text-sm text-muted-foreground">Total de Pacientes</div>
                    </CardContent>
                </Card>

                <Card>
                    <CardHeader className="pb-2">
                        <CardTitle className="text-lg flex items-center">
                            <Cake className="h-5 w-5 mr-2 text-blue-500" />
                            Aniversariantes de Hoje
                        </CardTitle>
                    </CardHeader>
                    <CardContent>
                        {birthdayPatients && birthdayPatients.length > 0 ? (
                            <div className="space-y-2">
                                {birthdayPatients.map(patient => (
                                    <div key={patient.id} className="flex items-center justify-between p-2 border rounded-md">
                                        <div>
                                            <div className="font-medium">{patient.name}</div>
                                            <div className="text-xs text-muted-foreground">
                                                {patient.birth_date && format(new Date(patient.birth_date), "dd/MM/yyyy")}
                                            </div>
                                        </div>
                                        {patient.identification_color && (
                                            <Badge
                                                variant="outline"
                                                className="w-18 h-18 rounded-full p-2 border-2"
                                                style={{
                                                    backgroundColor: identificationColorOptions.find(
                                                        opt => opt.color === patient.identification_color
                                                    )?.color
                                                }}
                                            />
                                        )}
                                    </div>
                                ))}
                            </div>
                        ) : (
                            <div className="text-sm text-muted-foreground">Nenhum paciente faz aniversário hoje</div>
                        )}
                    </CardContent>
                </Card>
            </div>
        </div>
    );
};

export default Home;
