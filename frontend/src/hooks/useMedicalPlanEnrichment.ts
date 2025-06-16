import { useQuery } from "@tanstack/react-query";
import { MedicalPlan, Patient } from "@/models/models";
import { getMedicalPlans } from "@/api/medicalPlansApi";
import { enrichItemsWithMedicalPlanNames } from "@/components/DataTable/DataTableUtils";

export function useMedicalPlanEnrichment(items: Patient[], pathname: string) {
    console.log(pathname);
    const { data: medicalPlansData = [] } = useQuery<MedicalPlan[]>({
        queryKey: ["medicalPlansLookup"],
        queryFn: async () => {
            const { data, error } = await getMedicalPlans();

            if (error) throw error;

            return data.map((plan: any) => ({
                ...plan,
                id: String(plan.id)
            })) as MedicalPlan[];
        },
        enabled: pathname === "/pacientes"
    });

    return enrichItemsWithMedicalPlanNames(items, medicalPlansData, pathname);
}
