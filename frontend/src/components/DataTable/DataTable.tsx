import { Card, CardContent } from "@/components/ui/card";
import { Loader2 } from "lucide-react";
import { ContextMenu } from "./ContextMenu";
import { DataItem } from "@/models/models";
import { PatientDetailsDialog } from "../Patients/PatientDetailsDialog";
import { useDataTableState } from "@/hooks/useDataTableState";
import { DeleteConfirmationDialog } from "./DeleteConfirmationDialog";
import { SearchBar } from "./SearchBar";
import { TableActions } from "./TableActions";
import { TableContent } from "./TableContent";
import { Dialog, DialogContent, DialogTitle } from "@/components/ui/dialog";
import { useLocation } from 'react-router-dom';
import { routes } from '@/routes/routes';
import { useCallback } from "react";
import { filterItemsLocally, sortItems } from "@/components/DataTable/DataTableUtils.ts";

interface DataTableProps {
    items: DataItem[];
    isLoading: boolean;
    error: Error | null;
    pathname: string;
    selectedItems: string[];
    onToggleItem: (id: string) => void;
    onSelectAll: () => void;
    onSelectNone: () => void;
    onNewRecord: () => void;
    onEdit: (item: DataItem) => void;
    onDelete: (id: string) => void;
    formError?: string | null;
}

export const DataTable = ({
    items,
    isLoading,
    error,
    pathname,
    selectedItems,
    onToggleItem,
    onSelectAll,
    onSelectNone,
    onNewRecord,
    onEdit,
    onDelete
}: DataTableProps) => {
    const location = useLocation();
    const currentRoute = routes.find(route => route.path === location.pathname);

    const applyLocalFilters = useCallback(
        (displayItems, searchTerm, pathname, sortConfig, colorFilter, setFilteredItems) => {
            let filtered = filterItemsLocally(displayItems, searchTerm, pathname);

            if (colorFilter) {
                filtered = filtered.filter(item => item.identification_color === colorFilter);
            }

            const sorted = sortItems(filtered, sortConfig.key, sortConfig.direction);
            setFilteredItems(sorted);
        }, []);

    const {
        contextMenu,
        searchTerm,
        setSearchTerm,
        filterField,
        setFilterField,
        colorFilter,
        setColorFilter,
        paginatedItems,
        filteredItems,
        viewingPatient,
        setViewingPatient,
        showDeleteConfirmation,
        setShowDeleteConfirmation,
        itemsToDelete,
        setItemsToDelete,
        currentPage,
        setCurrentPage,
        totalPages,
        handleSort,
        handleContextMenu,
        closeContextMenu
    } = useDataTableState(isLoading, items, pathname, applyLocalFilters);

    const handleEdit = () => {
        if (!contextMenu.id) return;
        const item = items.find(item => item.id.toString() === contextMenu.id);
        if (item) {
            onEdit(item);
        }
    };

    const handleViewPatient = (patient: DataItem) => {
        setViewingPatient(patient);
    };

    const handleExportSelected = () => {
        if (selectedItems.length === 0) return;
        const selectedData = items.filter(item => selectedItems.includes(item.id.toString()));
        let csvContent = "data:text/csv;charset=utf-8,";
        const allKeys = new Set<string>();
        selectedData.forEach(item => {
            Object.keys(item).forEach(key => allKeys.add(key));
        });
        const headers = Array.from(allKeys).filter(key => !['address', 'id'].includes(key) && typeof selectedData[0][key as keyof DataItem] !== 'object');
        csvContent += headers.join(",") + "\r\n";
        selectedData.forEach(item => {
            const row = headers.map(header => {
                let cell = item[header as keyof DataItem];
                if (header === 'sex') {
                    cell = cell === 'M' ? 'Masculino' : cell === 'F' ? 'Feminino' : cell;
                }
                if (cell === null || cell === undefined) {
                    return '';
                } else if (typeof cell === 'string') {
                    return `"${cell.replace(/"/g, '""')}"`;
                } else {
                    return String(cell);
                }
            }).join(",");
            csvContent += row + "\r\n";
        });
        const encodedUri = encodeURI(csvContent);
        const link = document.createElement("a");
        link.setAttribute("href", encodedUri);
        link.setAttribute("download", `selected-data-${new Date().toISOString()}.csv`);
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
    };

    const handleDeleteSelected = () => {
        if (selectedItems.length === 0) return;
        setItemsToDelete(selectedItems);
        setShowDeleteConfirmation(true);
    };

    const confirmDeleteSelected = () => {
        itemsToDelete.forEach(id => onDelete(id));
        setShowDeleteConfirmation(false);
        setItemsToDelete([]);
    };

    const cancelDeleteSelected = () => {
        setShowDeleteConfirmation(false);
        setItemsToDelete([]);
    };

    if (isLoading) {
        return (
            <div className="h-[50vh] flex items-center justify-center">
                <Loader2 className="h-8 w-8 animate-spin text-muted-foreground"/>
            </div>
        );
    }

    if (error) {
        return <div className="p-4 bg-destructive/10 border border-destructive rounded-md text-destructive text-center">
            Error loading data: {error.message}
        </div>;
    }

    return <div className="space-y-6">
        <div className="py-4 -mx-[32px] rounded-none px-[32px] bg-gray-50">
            <div className="flex items-center justify-between bg-gray-50">
                <h1 className="text-2xl font-bold">
                    {currentRoute?.title || 'Página Inicial'}
                </h1>
                <div className="flex items-center gap-2">
                    <SearchBar
                        searchTerm={searchTerm}
                        setSearchTerm={setSearchTerm}
                        filterField={filterField}
                        setFilterField={setFilterField}
                        pathname={pathname}
                        colorFilter={colorFilter}
                        setColorFilter={setColorFilter}
                    />

                    <TableActions
                        selectedItems={selectedItems}
                        onNewRecord={onNewRecord}
                        onExportSelected={handleExportSelected}
                        onDeleteSelected={handleDeleteSelected}
                        pathname={pathname}
                    />
                </div>
            </div>
        </div>

        <Card className="shadow-lg">
            <CardContent className="p-0">
                <TableContent items={filteredItems} paginatedItems={paginatedItems} pathname={pathname}
                              selectedItems={selectedItems} onToggleItem={onToggleItem} onSelectAll={onSelectAll}
                              onSelectNone={onSelectNone} onView={handleViewPatient} onContextMenu={handleContextMenu}
                              onSort={handleSort} currentPage={currentPage} totalPages={totalPages}
                              onPageChange={setCurrentPage} colorFilter={colorFilter}/>
            </CardContent>
        </Card>

        {contextMenu.id &&
            <ContextMenu x={contextMenu.x} y={contextMenu.y} onClose={closeContextMenu} onEdit={handleEdit}
                         onDelete={() => {
                             onDelete(contextMenu.id!);
                             closeContextMenu();
                         }}/>}

        {viewingPatient && <Dialog open={!!viewingPatient} onOpenChange={open => {
            if (!open) setViewingPatient(null);
        }}>
            <DialogContent className="sm:max-w-[600px]" aria-describedby={undefined}>
                <DialogTitle></DialogTitle>
                <PatientDetailsDialog isOpen={!!viewingPatient} onOpenChange={open => {
                    if (!open) setViewingPatient(null);
                }} patient={viewingPatient} onEdit={onEdit}/>
            </DialogContent>
        </Dialog>}

        <DeleteConfirmationDialog open={showDeleteConfirmation} onOpenChange={setShowDeleteConfirmation}
                                  onCancel={cancelDeleteSelected} onConfirm={confirmDeleteSelected}/>
    </div>;
};

