import { useState, useEffect } from "react";
import { useLocation } from "react-router-dom";
import { useQuery } from "@tanstack/react-query";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Cake } from "lucide-react";
import { DataItem } from "@/models/models";
import { SearchBar } from "@/components/DataTable/SearchBar";
import { format } from "date-fns";
import { getBirthdayPatients } from "@/services/patientService";
import { getPatientsCount } from "@/api/patientsApi";

const Index = () => {
    const location = useLocation();
    const [patientStats, setPatientStats] = useState<{patients: number}>({ patients: 0 });

    const fetchPatientStats = async () => {
        try {
            const count = await getPatientsCount();
            setPatientStats({ patients: count });
        } catch (error) {
            console.error("Error fetching patient stats:", error);
        }
    };

    useEffect(() => {
        fetchPatientStats();
    }, [location.pathname]);

    const {
        data: allPatients = [],
        isLoading: patientsLoading,
    } = useQuery({
        queryKey: ['all-patients'],
        enabled: true
    });

    const birthdayPatients = getBirthdayPatients(allPatients as DataItem[]);

    return (
        <>
            <div className="py-4 -mx-[32px] rounded-none px-[32px] bg-gray-50">
                <div className="flex items-center justify-between bg-gray-50">
                    <h1 className="text-2xl font-bold">Página Inicial</h1>
                    <div className="flex items-center gap-2">
                        <SearchBar
                            searchTerm=""
                            setSearchTerm={() => {}}
                            filterField=""
                            setFilterField={() => {}}
                            pathname="/"
                        />
                    </div>
                </div>
            </div>
            <div className="space-y-8">
                <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <Card>
                        <CardContent className="pt-6">
                            <div className="text-2xl font-bold">{patientStats?.patients || 0}</div>
                            <div className="text-sm text-muted-foreground">Total Patients</div>
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
                            {patientsLoading ? (
                                <div className="text-sm text-muted-foreground">Carregando...</div>
                            ) : birthdayPatients.length > 0 ? (
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
                                                <div 
                                                    className="w-3 h-3 rounded-full" 
                                                    style={{ backgroundColor: patient.identification_color }}
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
        </>
    );
};

export default Index;
