import {
    Table, TableBody, TableCell, TableHead, TableHeader as TableHeaderRoot, TableRow
} from "@/components/ui/table.tsx";
import {Pagination} from "@/components/DataTable/Pagination.tsx";
import {MedicalPlan} from "@/models/models";

export const MedicalPlansTable = ({
                                      items, allSelected, selectedItems, onToggleItem, filteredItems, handleRowClick, onToggleAll, onContextMenu, onSort, currentPage, totalPages, onPageChange
                                  }) => {

    return (
        <>
            <Table>
                <TableHeaderRoot className="bg-[#524ED2]">
                    <TableRow className="hover:bg-[#B0CFF9]">
                        <TableHead onClick={onToggleAll} className="w-[64px] text-white">
                            <div className="flex items-center">
                                <input
                                    type="checkbox"
                                    checked={allSelected}
                                    onChange={onToggleAll}
                                />
                            </div>
                        </TableHead>
                        <TableHead onClick={() => onSort('name')}
                                   className="cursor-pointer hover:bg-[#6560E7] text-white">
                            Nome
                        </TableHead>
                        <TableHead onClick={() => onSort('description')}
                                   className="cursor-pointer hover:bg-[#6560E7] text-white">
                            Descrição
                        </TableHead>
                    </TableRow>
                </TableHeaderRoot>
                <TableBody>
                    {filteredItems.map((item : MedicalPlan) => (
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
                                    {item.name}
                                </div>
                            </TableCell>
                            <TableCell className="whitespace-nowrap">{item.description}</TableCell>
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
