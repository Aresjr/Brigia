import {DataItem, MedicalPlan} from "@/models/models";

export const enrichItemsWithMedicalPlanNames = (
    itemsToEnrich: DataItem[],
    medicalPlans: MedicalPlan[],
    pathname: string
): DataItem[] => {
    if (pathname !== "/pacientes") return itemsToEnrich;

    return itemsToEnrich.map(item => {
        if (item.medical_plan_id) {
            const plan = medicalPlans.find(p => String(p.id) === String(item.medical_plan_id));
            return {
                ...item,
                medical_plan_name: plan ? plan.name : 'Plano desconhecido'
            };
        }
        return item;
    });
};

export const sortItems = (
    itemsToSort: DataItem[],
    sortKey: keyof DataItem,
    direction: 'asc' | 'desc'
): DataItem[] => {
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

export const filterItemsLocally = (
    items: DataItem[],
    searchTerm: string,
    pathname: string
): DataItem[] => {
    if (!searchTerm.trim()) {
        return items;
    }

    const searchTermLower = searchTerm.toLowerCase();

    return items.filter(item => {
        let matchesSearch = item.name.toLowerCase().includes(searchTermLower);

        if (item.email) {
            matchesSearch = matchesSearch || item.email.toLowerCase().includes(searchTermLower);
        }

        if (pathname === "/pacientes") {
            if (item.cpf) matchesSearch = matchesSearch || item.cpf.toLowerCase().includes(searchTermLower);
            if (item.cellphone) matchesSearch = matchesSearch || item.cellphone.toLowerCase().includes(searchTermLower);
            if (item.birth_date) matchesSearch = matchesSearch || item.birth_date.toLowerCase().includes(searchTermLower);
            if (item.sex) matchesSearch = matchesSearch || item.sex.toLowerCase().includes(searchTermLower);
            if (item.medical_plan_name) matchesSearch = matchesSearch || item.medical_plan_name.toLowerCase().includes(searchTermLower);
        } else if (pathname === "/convenios") {
            if (item.description) matchesSearch = matchesSearch || item.description.toLowerCase().includes(searchTermLower);
        }

        return matchesSearch;
    });
};
