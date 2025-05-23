import {
    Table, TableBody, TableCell, TableHead, TableHeader as TableHeaderRoot, TableRow
} from "@/components/ui/table.tsx";
import {Pagination} from "@/components/DataTable/Pagination.tsx";
import {format} from "date-fns";
import {formatDate} from "@/utils/dateUtils.ts";
import {Patient} from "@/models/models";

export const PatientsTable = ({
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
                        <TableHead onClick={() => onSort('cpf')}
                                   className="cursor-pointer hover:bg-[#6560E7] text-white whitespace-nowrap">
                            CPF
                        </TableHead>
                        <TableHead onClick={() => onSort('birth_date')}
                                   className="cursor-pointer hover:bg-[#6560E7] text-white whitespace-nowrap">
                            Data de Nascimento
                        </TableHead>
                        <TableHead onClick={() => onSort('cellphone')}
                                   className="cursor-pointer hover:bg-[#6560E7] text-white whitespace-nowrap">
                            Telefone
                        </TableHead>
                        <TableHead onClick={() => onSort('last_appointment')}
                                   className="cursor-pointer hover:bg-[#6560E7] text-white whitespace-nowrap">
                            Último Agendamento
                        </TableHead>
                        <TableHead onClick={() => onSort('next_appointment')}
                                   className="cursor-pointer hover:bg-[#6560E7] text-white whitespace-nowrap">
                            Próximo Agendamento
                        </TableHead>
                        <TableHead onClick={() => onSort('created_at')}
                                   className="cursor-pointer hover:bg-[#6560E7] text-white whitespace-nowrap">
                            Data de Criação
                        </TableHead>
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
                            <TableCell className="whitespace-nowrap">{item.cpf}</TableCell>
                            <TableCell
                                className="whitespace-nowrap">{item.birth_date ? formatDate(item.birth_date) : '-'}</TableCell>
                            <TableCell className="whitespace-nowrap">{item.cellphone || '-'}</TableCell>
                            <TableCell
                                className="whitespace-nowrap">{item.last_appointment ? format(new Date(item.last_appointment), 'dd/MM/yyyy HH:mm') : '-'}</TableCell>
                            <TableCell
                                className="whitespace-nowrap">{item.next_appointment ? format(new Date(item.next_appointment), 'dd/MM/yyyy HH:mm') : '-'}</TableCell>
                            <TableCell
                                className="whitespace-nowrap">{item.created_at ? format(new Date(item.created_at), 'dd/MM/yyyy HH:mm') : '-'}</TableCell>
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
