import { MedicalPlan, Patient, BaseEntity } from "@/models/models";

export const enrichItemsWithMedicalPlanNames = (
    patients: Patient[],
    medicalPlans: MedicalPlan[],
    pathname: string
): Patient[] => {
    if (pathname !== "/pacientes") return patients;

    return patients.map(patient => {
        if (patient.medical_plan_id) {
            const plan = medicalPlans.find(p => String(p.id) === String(patient.medical_plan_id));
            return {
                ...patient,
                medical_plan_name: plan ? plan.name : 'Plano desconhecido'
            };
        }
        return patient;
    });
};

export const sortItems = <T extends BaseEntity>(
    itemsToSort: T[],
    sortKey: keyof T,
    direction: 'asc' | 'desc'
): T[] => {
    return [...itemsToSort].sort((a, b) => {
        const aValue = a[sortKey];
        const bValue = b[sortKey];

        if (!aValue && !bValue) return 0;
        if (!aValue) return direction === 'asc' ? -1 : 1;
        if (!bValue) return direction === 'asc' ? 1 : -1;

        if (typeof aValue === 'string' && typeof bValue === 'string') {
            return direction === 'asc'
                ? aValue.localeCompare(bValue)
                : bValue.localeCompare(aValue);
        }

        if (aValue < bValue) {
            return direction === 'asc' ? -1 : 1;
        }
        if (aValue > bValue) {
            return direction === 'asc' ? 1 : -1;
        }
        return 0;
    });
};

export const filterItemsLocally = <T extends BaseEntity>(
    items: T[],
    searchTerm: string,
    pathname: string
): T[] => {
    if (!searchTerm.trim()) {
        return items;
    }

    const searchTermLower = searchTerm.toLowerCase();

    return items.filter(item => {
        let matchesSearch = item.name.toLowerCase().includes(searchTermLower);

        // Type guard for PatientData
        const isPatient = (item: T): item is T & Patient => {
            return 'email' in item && 'cpf' in item;
        };

        if ('email' in item) {
            matchesSearch = matchesSearch || (item as { email?: string }).email?.toLowerCase().includes(searchTermLower) || false;
        }

        if (pathname === "/pacientes" && isPatient(item)) {
            if (item.cpf) matchesSearch = matchesSearch || item.cpf.toLowerCase().includes(searchTermLower);
            if (item.cellphone) matchesSearch = matchesSearch || item.cellphone.toLowerCase().includes(searchTermLower);
            if (item.birth_date) matchesSearch = matchesSearch || item.birth_date.toLowerCase().includes(searchTermLower);
            if (item.sex) matchesSearch = matchesSearch || item.sex.toLowerCase().includes(searchTermLower);
            if (item.medical_plan_name) matchesSearch = matchesSearch || item.medical_plan_name.toLowerCase().includes(searchTermLower);
        } else if (pathname === "/convenios") {
            if ('description' in item) {
                matchesSearch = matchesSearch || ((item as { description?: string }).description?.toLowerCase().includes(searchTermLower) || false);
            }
        }

        return matchesSearch;
    });
};
