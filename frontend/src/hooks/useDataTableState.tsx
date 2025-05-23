
import { useState, useEffect } from "react";
import { useQuery } from "@tanstack/react-query";
import { DataItem, MedicalPlan } from "@/models/models";
import { supabase } from "@/integrations/supabase/client";
import { enrichItemsWithMedicalPlanNames } from "@/components/DataTable/DataTableUtils";

export function useDataTableState(
  isLoading: boolean,
  items: DataItem[],
  pathname: string,
  applyLocalFilters
) {
  const [contextMenu, setContextMenu] = useState<{ x: number; y: number; id: string | null }>({ x: 0, y: 0, id: null });
  const [searchTerm, setSearchTerm] = useState("");
  const [filterField, setFilterField] = useState<string>("name");
  const [colorFilter, setColorFilter] = useState<string>("");
  const [filteredItems, setFilteredItems] = useState<DataItem[]>([]);
  const [sortConfig, setSortConfig] = useState<{ key: keyof DataItem; direction: 'asc' | 'desc' }>({ key: "created_at", direction: 'desc' });
  const [viewingPatient, setViewingPatient] = useState<DataItem | null>(null);
  const [showDeleteConfirmation, setShowDeleteConfirmation] = useState(false);
  const [itemsToDelete, setItemsToDelete] = useState<string[]>([]);
  const [currentPage, setCurrentPage] = useState(1);

  const ITEMS_PER_PAGE = 15;
  const totalPages = Math.ceil(filteredItems.length / ITEMS_PER_PAGE);

  const { data: medicalPlansData = [] } = useQuery<MedicalPlan[]>({
    queryKey: ["medicalPlansLookup"],
    queryFn: async () => {
      const { data, error } = await supabase
        .from("medical_plans")
        .select("id, name");
      
      if (error) throw error;
      
      // Convert all IDs to strings to match MedicalPlan interface
      return data.map((plan: any) => ({
        ...plan,
        id: String(plan.id)
      })) as MedicalPlan[];
    },
    enabled: pathname === "/pacientes"
  });

  const displayItems = enrichItemsWithMedicalPlanNames(
      items,
    medicalPlansData,
    pathname
  );

  const paginatedItems = filteredItems.slice(
    (currentPage - 1) * ITEMS_PER_PAGE,
    currentPage * ITEMS_PER_PAGE
  );

  const handleSort = (key: keyof DataItem) => {
    let direction: 'asc' | 'desc' = 'asc';
    if (sortConfig && sortConfig.key === key && sortConfig.direction === 'asc') {
      direction = 'desc';
    }
    setSortConfig({ key, direction });
  };

  const handleContextMenu = (e: React.MouseEvent, id: string) => {
    e.preventDefault();
    setContextMenu({ x: e.clientX, y: e.clientY, id });
  };

  const closeContextMenu = () => {
    setContextMenu({ x: 0, y: 0, id: null });
  };

  const handleConfirmDelete = (ids: string[]) => {
    setItemsToDelete(ids);
    setShowDeleteConfirmation(true);
  };

  useEffect(() => {
    const handleClick = () => closeContextMenu();
    document.addEventListener('click', handleClick);
    return () => document.removeEventListener('click', handleClick);
  }, []);

  useEffect(() => {
    if (!isLoading) {
      applyLocalFilters(displayItems, searchTerm, pathname, sortConfig, colorFilter, setFilteredItems);
    }
  }, [searchTerm, pathname, colorFilter, sortConfig, setFilteredItems, isLoading]);

  return {
    contextMenu,
    searchTerm,
    setSearchTerm,
    filterField,
    setFilterField,
    colorFilter,
    setColorFilter,
    filteredItems,
    paginatedItems,
    sortConfig,
    viewingPatient,
    setViewingPatient,
    showDeleteConfirmation,
    setShowDeleteConfirmation,
    itemsToDelete,
    setItemsToDelete,
    currentPage,
    setCurrentPage,
    totalPages,
    medicalPlansData,
    handleSort,
    handleContextMenu,
    closeContextMenu,
    handleConfirmDelete,
  };
}
