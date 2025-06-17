import { Card, CardContent } from "@/components/ui/card";
import { Loader2 } from "lucide-react";
import { ContextMenu } from "./ContextMenu";
import { Patient } from "@/models/models";
import { DeleteConfirmationDialog } from "./DeleteConfirmationDialog";
import { TableActions } from "./TableActions";
import { useLocation } from 'react-router-dom';
import { routes } from '@/routes/routes';
import { useCallback, useEffect, useState } from "react";
import { filterItemsLocally, sortItems } from "@/components/DataTable/DataTableUtils";
import { SearchBarWithColorFilter } from "./SearchBarWithColorFilter";
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { Pagination } from "./Pagination";
import { PatientDetailsDialog } from "@/components/Patients/PatientDetailsDialog";

interface PatientTableProps {
    patients: Patient[];
    isLoading: boolean;
    error: Error | null;
    pathname: string;
    selectedItems: string[];
    onToggleItem: (id: string) => void;
    onSelectAll: () => void;
    onSelectNone: () => void;
    onNewRecord: () => void;
    onEdit: (item: Patient) => void;
    onDelete: (id: string) => void;
    formError?: string | null;
}

export function PatientTable({
    patients,
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
}: PatientTableProps) {
    const location = useLocation();
    const currentRoute = routes.find(route => route.path === location.pathname);

    // Add state for patient details dialog
    const [selectedPatient, setSelectedPatient] = useState<Patient | null>(null);
    const [isDetailsOpen, setIsDetailsOpen] = useState(false);

    // Search and filter states
    const [searchTerm, setSearchTerm] = useState("");
    const [colorFilter, setColorFilter] = useState<string>("");
    const [filteredItems, setFilteredItems] = useState<Patient[]>([]);

    // Table states
    const [sortConfig, setSortConfig] = useState<{ key: keyof Patient; direction: 'asc' | 'desc' }>({
        key: "created_at",
        direction: 'desc'
    });
    const [currentPage, setCurrentPage] = useState(1);

    // Context menu and delete states
    const [contextMenu, setContextMenu] = useState<{ x: number; y: number; id: string | null }>({
        x: 0,
        y: 0,
        id: null
    });
    const [showDeleteConfirmation, setShowDeleteConfirmation] = useState(false);
    const [itemsToDelete, setItemsToDelete] = useState<string[]>([]);

    const ITEMS_PER_PAGE = 15;

    const applyFilters = useCallback(() => {
        let filtered = filterItemsLocally(patients, searchTerm, pathname);
        if (colorFilter) {
            filtered = filtered.filter(item => item.identification_color === colorFilter);
        }
        return sortItems(filtered, sortConfig.key, sortConfig.direction);
    }, [patients, searchTerm, pathname, colorFilter, sortConfig]);

    // Effect to update filtered items
    useEffect(() => {
        if (!isLoading) {
            const filtered = applyFilters();
            setFilteredItems(filtered);
        }
    }, [isLoading, applyFilters]);

    const paginatedItems = filteredItems.slice(
        (currentPage - 1) * ITEMS_PER_PAGE,
        currentPage * ITEMS_PER_PAGE
    );

    const totalPages = Math.ceil(filteredItems.length / ITEMS_PER_PAGE);

    const handleSort = (key: keyof Patient) => {
        let direction: 'asc' | 'desc' = 'asc';
        if (sortConfig.key === key && sortConfig.direction === 'asc') {
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

    const handleEditFromContext = () => {
        if (!contextMenu.id) return;
        const item = patients.find(item => item.id.toString() === contextMenu.id);
        if (item) {
            onEdit(item);
        }
    };

    const handleExportSelected = () => {
        if (selectedItems.length === 0) return;
        const selectedData = patients.filter(item => selectedItems.includes(item.id.toString()));
        let csvContent = "data:text/csv;charset=utf-8,";
        const allKeys = new Set<string>();
        selectedData.forEach(item => {
            Object.keys(item).forEach(key => allKeys.add(key));
        });
        const headers = Array.from(allKeys).filter(key => !['address', 'id'].includes(key));
        csvContent += headers.join(",") + "\r\n";
        selectedData.forEach(item => {
            const row = headers.map(header => {
                let cell = item[header as keyof Patient];
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
        link.setAttribute("download", `patients-export-${new Date().toISOString()}.csv`);
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

    // Click outside handler for context menu
    useEffect(() => {
        const handleClick = () => closeContextMenu();
        document.addEventListener('click', handleClick);
        return () => document.removeEventListener('click', handleClick);
    }, []);

    const renderCheckboxCell = (item: Patient) => (
        <TableCell>
            <input
                type="checkbox"
                checked={selectedItems.includes(String(item.id))}
                onChange={() => onToggleItem(String(item.id))}
                onClick={(e) => e.stopPropagation()}
            />
        </TableCell>
    );

    const renderTableHeader = () => (
        <TableHeader className="bg-[#524ED2] text-white">
            <TableRow className="text-white">
                <TableHead className="w-12">
                    <input
                        type="checkbox"
                        checked={patients.length > 0 && selectedItems.length === patients.length}
                        onChange={selectedItems.length === patients.length ? onSelectNone : onSelectAll}
                    />
                </TableHead>
                <TableHead
                    className="cursor-pointer w-12"
                    onClick={() => handleSort("identification_color")}
                >
                </TableHead>
                <TableHead
                    className="cursor-pointer text-white"
                    onClick={() => handleSort("name")}
                >
                    Nome
                </TableHead>
                <TableHead
                    className="cursor-pointer text-white w-36"
                    onClick={() => handleSort("cpf")}
                >
                    CPF
                </TableHead>
                <TableHead
                    className="cursor-pointer text-white w-36"
                    onClick={() => handleSort("cellphone")}
                >
                    Telefone
                </TableHead>
                <TableHead
                    className="cursor-pointer text-white w-36"
                    onClick={() => handleSort("medical_plan_name")}
                >
                    Convênio
                </TableHead>
                <TableHead
                    className="cursor-pointer text-white w-30"
                    onClick={() => handleSort("last_appointment")}
                >
                    Última Consulta
                </TableHead>
                <TableHead
                    className="cursor-pointer text-white w-30"
                    onClick={() => handleSort("next_appointment")}
                >
                    Próxima Consulta
                </TableHead>
            </TableRow>
        </TableHeader>
    );

    const handleRowClick = (item: Patient) => {
        setSelectedPatient(item);
        setIsDetailsOpen(true);
    };

    const renderTableBody = () => (
        <TableBody>
            {paginatedItems.map((item : Patient) => (
                <TableRow
                    key={item.id}
                    className={selectedItems.includes(String(item.id)) ? 'bg-muted' : 'cursor-pointer hover:bg-muted/50'}
                    onClick={() => handleRowClick(item)}
                    onContextMenu={(e) => handleContextMenu(e, String(item.id))}
                >
                    {renderCheckboxCell(item)}
                    <TableCell>
                        <div className="flex items-center gap-2">
                            {item.identification_color && (
                                <span
                                    className="w-4 h-4 rounded-full"
                                    style={{ backgroundColor: item.identification_color }}
                                />
                            )}
                        </div>
                    </TableCell>
                    <TableCell>{item.name}</TableCell>
                    <TableCell>{item.cpf}</TableCell>
                    <TableCell>{item.cellphone}</TableCell>
                    <TableCell>{item.medical_plan_name}</TableCell>
                    <TableCell>{new Date(item.last_appointment).toLocaleDateString()}</TableCell>
                    <TableCell>{new Date(item.next_appointment).toLocaleDateString()}</TableCell>
                </TableRow>
            ))}
        </TableBody>
    );

    const renderTableContent = () => {
        if (paginatedItems.length === 0) {
            return (
                <div className="py-8 text-center">
                    <p className="text-muted-foreground">
                        Nenhum registro encontrado
                    </p>
                </div>
            );
        }

        return (
            <>
                <div className="overflow-x-auto">
                    <Table>
                        {renderTableHeader()}
                        {renderTableBody()}
                    </Table>
                </div>

                {patients.length > 0 && (
                    <Pagination
                        currentPage={currentPage}
                        totalPages={totalPages}
                        onPageChange={setCurrentPage}
                    />
                )}
            </>
        );
    };

    if (isLoading) {
        return (
            <div className="h-[50vh] flex items-center justify-center">
                <Loader2 className="h-8 w-8 animate-spin text-muted-foreground"/>
            </div>
        );
    }

    if (error) {
        return (
            <div className="p-4 bg-destructive/10 border border-destructive rounded-md text-destructive text-center">
                Error loading data: {error.message}
            </div>
        );
    }

    return (
        <div className="space-y-6">
            <div className="py-4 -mx-[32px] rounded-none px-[32px] bg-gray-50">
                <div className="flex items-center justify-between bg-gray-50">
                    <h1 className="text-2xl font-bold">
                        {currentRoute?.title || 'Pacientes'}
                    </h1>
                    <div className="flex items-center gap-2">
                        <SearchBarWithColorFilter
                            searchTerm={searchTerm}
                            setSearchTerm={setSearchTerm}
                            colorFilter={colorFilter}
                            setColorFilter={setColorFilter}
                            pathname={pathname}
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
                    {renderTableContent()}
                </CardContent>
            </Card>

            {contextMenu.id && (
                <ContextMenu
                    x={contextMenu.x}
                    y={contextMenu.y}
                    onClose={closeContextMenu}
                    onEdit={handleEditFromContext}
                    onDelete={() => {
                        onDelete(contextMenu.id!);
                        closeContextMenu();
                    }}
                />
            )}

            <DeleteConfirmationDialog
                open={showDeleteConfirmation}
                onOpenChange={setShowDeleteConfirmation}
                onCancel={cancelDeleteSelected}
                onConfirm={confirmDeleteSelected}
            />

            <PatientDetailsDialog
                patient={selectedPatient}
                open={isDetailsOpen}
                onOpenChange={setIsDetailsOpen}
            />
        </div>
    );
}
