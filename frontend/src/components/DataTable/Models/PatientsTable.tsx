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
            <Table>
                <TableHeaderRoot className="bg-[#524ED2]">
                    <TableRow className="hover:bg-[#B0CFF9]">
                        {PATIENT_TABLE_COLUMNS.map(column => (
                            <TableHead
                                key={column.key}
                                onClick={column.key === 'selection' ? onToggleAll : () => onSort(column.key)}
                                className={`${column.width ? `w-[${column.width}]` : ''} ${column.key === 'selection' ? 'text-white' : 'cursor-pointer hover:bg-[#6560E7] text-white whitespace-nowrap'}`}
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
                            <TableCell className="w-[64px]" onClick={(e) => {
                                e.stopPropagation();
                                onToggleItem(item.id.toString());
                            }}>
                                <div className="flex items-center h-full w-full">
                                    <input
                                        type="checkbox"
                                        checked={selectedItems.includes(item.id.toString())}
                                        onChange={() => onToggleItem(item.id.toString())}
                                        onClick={(e) => e.stopPropagation()}
                                    />
                                </div>
                            </TableCell>
                            <TableCell className="whitespace-nowrap">
                                <div className="flex items-center gap-2">
                                    {item.identification_color && (
                                        <div
                                            className="h-4 w-4 rounded-full flex-shrink-0"
                                            style={{backgroundColor: item.identification_color}}
                                            data-color={item.identification_color}
                                        />
                                    )}
                                    {item.name}
                                </div>
                            </TableCell>
                            <TableCell>{item.cpf}</TableCell>
                            <TableCell>{PATIENT_TABLE_FORMATTERS.birth_date(item.birth_date)}</TableCell>
                            <TableCell>{PATIENT_TABLE_FORMATTERS.cellphone(item.cellphone)}</TableCell>
                            <TableCell>{PATIENT_TABLE_FORMATTERS.last_appointment(item.last_appointment)}</TableCell>
                            <TableCell>{PATIENT_TABLE_FORMATTERS.next_appointment(item.next_appointment)}</TableCell>
                            <TableCell>{PATIENT_TABLE_FORMATTERS.created_at(item.created_at)}</TableCell>
                        </TableRow>
                    ))}
                </TableBody>
            </Table>

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
