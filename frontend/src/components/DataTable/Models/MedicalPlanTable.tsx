import {
    Table, TableBody, TableCell, TableHead, TableHeader as TableHeaderRoot, TableRow
} from "@/components/ui/table.tsx";
import { Pagination } from "@/components/DataTable/Pagination.tsx";
import { MedicalPlan } from "@/models/models";
import { MEDICAL_PLAN_TABLE_COLUMNS, MEDICAL_PLAN_TABLE_FORMATTERS } from "./MedicalPlanTableConfig";

interface MedicalPlanTableProps {
    items: MedicalPlan[];
    allSelected: boolean;
    selectedItems: string[];
    filteredItems: MedicalPlan[];
    onToggleItem: (id: string) => void;
    onToggleAll: () => void;
    handleRowClick: (e: React.MouseEvent, item: MedicalPlan) => void;
    onContextMenu: (e: React.MouseEvent, id: string) => void;
    onSort: (key: string) => void;
    currentPage: number;
    totalPages: number;
    onPageChange: (page: number) => void;
}

export const MedicalPlanTable = ({
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
}: MedicalPlanTableProps) => {
    return (
        <>
            <div className="overflow-x-auto">
                <Table className="bg-white">
                    <TableHeaderRoot className="bg-[#524ED2] sticky top-0">
                        <TableRow className="hover:bg-[#B0CFF9]">
                            {MEDICAL_PLAN_TABLE_COLUMNS.map(column => (
                                <TableHead
                                    key={column.key}
                                    onClick={column.key === 'selection' ? onToggleAll : () => onSort(column.key)}
                                    style={{
                                        width: column.width,
                                        minWidth: column.minWidth || column.width,
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
                        {filteredItems.map((item: MedicalPlan) => (
                            <TableRow
                                key={item.id}
                                className={`cursor-pointer hover:bg-gray-50 ${selectedItems.includes(item.id.toString()) ? 'bg-accent hover:bg-accent' : 'bg-white'}`}
                                onClick={(e) => handleRowClick(e, item)}
                                onContextMenu={(e) => onContextMenu(e, item.id.toString())}
                            >
                                {MEDICAL_PLAN_TABLE_COLUMNS.map(column => (
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
                                        ) : MEDICAL_PLAN_TABLE_FORMATTERS[column.key as keyof typeof MEDICAL_PLAN_TABLE_FORMATTERS] ?
                                            MEDICAL_PLAN_TABLE_FORMATTERS[column.key as keyof typeof MEDICAL_PLAN_TABLE_FORMATTERS](item[column.key]) :
                                            item[column.key]}
                                    </TableCell>
                                ))}
                            </TableRow>
                        ))}
                    </TableBody>
                </Table>
            </div>

            {items.length > 0 && (
                <div className="bg-white py-4 px-2 rounded-md">
                    <Pagination
                        currentPage={currentPage}
                        totalPages={totalPages}
                        onPageChange={onPageChange}
                    />
                </div>
            )}
        </>
    );
};
