import {
    Table, TableBody, TableCell, TableHead, TableHeader as TableHeaderRoot, TableRow
} from "@/components/ui/table.tsx";
import { Pagination } from "@/components/DataTable/Pagination.tsx";
import { Patient } from "@/models/models";
import { PATIENT_TABLE_COLUMNS, PATIENT_TABLE_FORMATTERS } from "./PatientsTableConfig";

interface PatientsTableProps {
    items: Patient[];
    allSelected: boolean;
    selectedItems: string[];
    filteredItems: Patient[];
    onToggleItem: (id: string) => void;
    onToggleAll: () => void;
    handleRowClick: (e: React.MouseEvent, item: Patient) => void;
    onContextMenu: (e: React.MouseEvent, id: string) => void;
    onSort: (key: string) => void;
    currentPage: number;
    totalPages: number;
    onPageChange: (page: number) => void;
}

export const PatientsTable = ({
    items,
    allSelected,
    selectedItems,
    filteredItems,
    onToggleItem,
    onToggleAll,
    handleRowClick,
    onContextMenu,
    onSort,
    currentPage,
    totalPages,
    onPageChange
}: PatientsTableProps) => {
    return (
        <>
            <div className="overflow-x-auto">
                <Table>
                    <TableHeaderRoot className="bg-[#524ED2]">
                        <TableRow className="hover:bg-[#B0CFF9]">
                            {PATIENT_TABLE_COLUMNS.map(column => (
                                <TableHead
                                    key={column.key}
                                    onClick={column.key === 'selection' ? onToggleAll : () => onSort(column.key)}
                                    style={{
                                        width: column.width,
                                        minWidth: column?.minWidth || column.width,
                                    }}
                                    className={`${column.key === 'selection' ? 'text-white' : 'cursor-pointer hover:bg-[#6560E7] text-white whitespace-nowrap'}`}
                                >
                                    {column.key === 'selection' ? (
                                        <div className="flex items-center">
                                            <input
                                                type="checkbox"
                                                checked={allSelected}
                                                onChange={onToggleAll}
                                            />
                                        </div>
                                    ) : column.label}
                                </TableHead>
                            ))}
                        </TableRow>
                    </TableHeaderRoot>
                    <TableBody>
                        {filteredItems.map((item: Patient) => (
                            <TableRow
                                key={item.id}
                                className={`cursor-pointer ${selectedItems.includes(item.id.toString()) ? 'bg-accent hover:bg-accent' : ''}`}
                                onClick={(e) => handleRowClick(e, item)}
                                onContextMenu={(e) => onContextMenu(e, item.id.toString())}
                            >
                                {PATIENT_TABLE_COLUMNS.map(column => (
                                    <TableCell
                                        key={`${item.id}-${column.key}`}
                                        style={{
                                            width: column.width,
                                            minWidth: column.minWidth || column.width,
                                        }}
                                        className="whitespace-nowrap"
                                    >
                                        {column.key === 'selection' ? (
                                            <div className="flex items-center h-full w-full">
                                                <input
                                                    type="checkbox"
                                                    checked={selectedItems.includes(item.id.toString())}
                                                    onChange={() => onToggleItem(item.id.toString())}
                                                    onClick={(e) => e.stopPropagation()}
                                                />
                                            </div>
                                        ) : column.key === 'name' ? (
                                            <div className="flex items-center gap-2">
                                                {item.identification_color && (
                                                    <div
                                                        className="h-4 w-4 rounded-full flex-shrink-0"
                                                        style={{backgroundColor: item.identification_color}}
                                                    />
                                                )}
                                                {item.name}
                                            </div>
                                        ) : PATIENT_TABLE_FORMATTERS[column.key as keyof typeof PATIENT_TABLE_FORMATTERS] ?
                                            PATIENT_TABLE_FORMATTERS[column.key as keyof typeof PATIENT_TABLE_FORMATTERS](item[column.key]) :
                                            item[column.key]}
                                    </TableCell>
                                ))}
                            </TableRow>
                        ))}
                    </TableBody>
                </Table>
            </div>

            {items.length > 0 && (
                <Pagination
                    currentPage={currentPage}
                    totalPages={totalPages}
                    onPageChange={onPageChange}
                />
            )}
        </>
    );
};
