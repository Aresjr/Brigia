'use client';

import { Button } from "@/components/ui/button";
import {
    DropdownMenu,
    DropdownMenuCheckboxItem,
    DropdownMenuContent,
    DropdownMenuLabel,
    DropdownMenuSeparator,
    DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu";
import { SlidersHorizontal } from "lucide-react";

interface Column {
    key: string;
    label: string;
    width?: string;
    sortable?: boolean;
}

interface ColumnToggleProps {
    columns: Column[];
    visibleColumns: string[];
    onColumnToggle: (column: string) => void;
}

export function ColumnToggle({
    columns,
    visibleColumns,
    onColumnToggle,
}: ColumnToggleProps) {
    return (
        <DropdownMenu>
            <DropdownMenuTrigger asChild>
                <Button variant="outline" size="sm" className="ml-auto h-8">
                    <SlidersHorizontal className="mr-2 h-4 w-4" />
                    Colunas
                </Button>
            </DropdownMenuTrigger>
            <DropdownMenuContent align="end" className="w-[150px]">
                <DropdownMenuLabel>Colunas Visíveis</DropdownMenuLabel>
                <DropdownMenuSeparator />
                {columns
                    .filter(col => col.key !== 'selection')
                    .map((column) => (
                        <DropdownMenuCheckboxItem
                            key={column.key}
                            checked={visibleColumns.includes(column.key)}
                            onCheckedChange={() => onColumnToggle(column.key)}
                        >
                            {column.label}
                        </DropdownMenuCheckboxItem>
                    ))}
            </DropdownMenuContent>
        </DropdownMenu>
    );
}
