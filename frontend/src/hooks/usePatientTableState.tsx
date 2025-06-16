import { useState } from "react";
import { Patient } from "@/models/models";
import { useBaseTableState } from "./useBaseTableState";
import { filterItemsLocally, sortItems } from "@/components/DataTable/DataTableUtils";

export function usePatientTableState(
    isLoading: boolean,
    items: Patient[],
    pathname: string
) {
    const [colorFilter, setColorFilter] = useState<string>("");
    const [viewingPatient, setViewingPatient] = useState<Patient | null>(null);

    const applyFilters = (
        items: Patient[],
        searchTerm: string,
        sortConfig: { key: keyof Patient; direction: 'asc' | 'desc' }
    ) => {
        let filtered = filterItemsLocally(items, searchTerm, pathname);

        // Apply patient-specific color filter
        if (colorFilter) {
            filtered = filtered.filter(item => item.identification_color === colorFilter);
        }

        return sortItems(filtered, sortConfig.key, sortConfig.direction);
    };

    const baseTableState = useBaseTableState(isLoading, items, applyFilters);

    return {
        ...baseTableState,
        colorFilter,
        setColorFilter,
        viewingPatient,
        setViewingPatient,
    };
}
