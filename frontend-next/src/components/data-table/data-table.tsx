'use client';

import { Card, CardContent } from "@/components/ui/card";
import { DataContextMenu } from "./context-menu";
import { SearchBar } from "./search-bar";
import { TableActions } from "./table-actions";
import { useState } from "react";
import { PatientsTable } from "../tables/patients/patients-table";
import { Patient } from "@/lib/types";
import { TableSkeleton } from "@/components/ui/table-skeleton";
import { ErrorState } from "@/components/ui/error-state";
import { DataTableProvider, useDataTable } from "./data-table-context";
import { useTableState } from "@/hooks/useTableState";
import { DeleteConfirmationDialog } from "./delete-confirmation-dialog";

interface DataTableProps {
    items: Patient[];
    isLoading: boolean;
    error: Error | null;
    selectedItems: string[];
    onToggleItem: (id: string) => void;
    onSelectAll: () => void;
    onSelectNone: () => void;
    onNewRecord: () => void;
    onEdit: (item: Patient) => void;
    onDelete: (id: string) => void;
    columns: { key: string; label: string }[];
}

export function DataTableContent({
    items,
    isLoading,
    error,
    selectedItems,
    onToggleItem,
    onSelectAll,
    onSelectNone,
    onNewRecord,
    onEdit,
    onDelete,
    columns,
}: DataTableProps) {
    const [contextMenu, setContextMenu] = useState<{ x: number; y: number; id: string | null }>({
        x: 0,
        y: 0,
        id: null,
    });

    const [showDeleteDialog, setShowDeleteDialog] = useState(false);
    const [itemToDelete, setItemToDelete] = useState<string | null>(null);

    const { visibleColumns, toggleColumn } = useDataTable();

    const {
        searchTerm,
        setSearchTerm,
        filterField,
        setFilterField,
        sortConfig,
        handleSort,
        currentPage,
        setCurrentPage,
        totalPages,
        paginatedItems,
    } = useTableState(items);

    const handleContextMenu = (e: React.MouseEvent, id: string) => {
        e.preventDefault();
        setContextMenu({
            x: e.clientX,
            y: e.clientY,
            id,
        });
    };

    const handleDelete = (id: string) => {
        setItemToDelete(id);
        setShowDeleteDialog(true);
    };

    const confirmDelete = () => {
        if (itemToDelete) {
            onDelete(itemToDelete);
            setItemToDelete(null);
        }
        setShowDeleteDialog(false);
    };

    return (
        <div className="space-y-4">
            <div className="flex justify-between items-center">
                <SearchBar
                    searchTerm={searchTerm}
                    onSearchChange={setSearchTerm}
                    filterField={filterField}
                    onFilterFieldChange={setFilterField}
                    columns={columns}
                    visibleColumns={visibleColumns}
                    onColumnVisibilityChange={toggleColumn}
                />
                <TableActions
                    selectedItems={selectedItems}
                    items={items}
                    onNewRecord={onNewRecord}
                    onDeleteSelected={() => selectedItems.forEach(onDelete)}
                />
            </div>

            <Card>
                <CardContent className="p-0">
                    {isLoading ? (
                        <TableSkeleton />
                    ) : error ? (
                        <div className="p-4">
                            <ErrorState error={error} />
                        </div>
                    ) : (
                        <PatientsTable
                            items={items}
                            allSelected={items.length > 0 && selectedItems.length === items.length}
                            selectedItems={selectedItems}
                            filteredItems={paginatedItems}
                            visibleColumns={visibleColumns}
                            onToggleItem={onToggleItem}
                            onToggleAll={() => {
                                if (selectedItems.length === items.length) {
                                    onSelectNone();
                                } else {
                                    onSelectAll();
                                }
                            }}
                            handleRowClick={(_, item) => onEdit(item)}
                            onContextMenu={handleContextMenu}
                            onSort={handleSort}
                            sortConfig={sortConfig}
                            currentPage={currentPage}
                            totalPages={totalPages}
                            onPageChange={setCurrentPage}
                        />
                    )}
                </CardContent>
            </Card>

            {contextMenu.id && (
                <DataContextMenu
                    x={contextMenu.x}
                    y={contextMenu.y}
                    onClose={() => setContextMenu({ x: 0, y: 0, id: null })}
                    onEdit={() => {
                        const item = items.find(i => i.id.toString() === contextMenu.id);
                        if (item) onEdit(item);
                    }}
                    onDelete={() => {
                        if (contextMenu.id) handleDelete(contextMenu.id);
                    }}
                />
            )}

            <DeleteConfirmationDialog
                open={showDeleteDialog}
                onOpenChange={setShowDeleteDialog}
                onConfirm={confirmDelete}
                onCancel={() => {
                    setItemToDelete(null);
                    setShowDeleteDialog(false);
                }}
            />
        </div>
    );
}

export function DataTable(props: DataTableProps) {
    const defaultColumns = props.columns.map(col => col.key);

    return (
        <DataTableProvider defaultColumns={defaultColumns}>
            <DataTableContent {...props} />
        </DataTableProvider>
    );
}

