'use client';

import { Input } from "@/components/ui/input";
import { Search } from "lucide-react";
import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue,
} from "@/components/ui/select";
import { Button } from "@/components/ui/button";
import { SlidersHorizontal } from "lucide-react";
import {
    DropdownMenu,
    DropdownMenuCheckboxItem,
    DropdownMenuContent,
    DropdownMenuLabel,
    DropdownMenuSeparator,
    DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu";

interface SearchBarProps {
    searchTerm: string;
    onSearchChange: (value: string) => void;
    filterField: string;
    onFilterFieldChange: (value: string) => void;
    columns: {
        key: string;
        label: string;
    }[];
    visibleColumns: string[];
    onColumnVisibilityChange: (column: string) => void;
}

export function SearchBar({
    searchTerm,
    onSearchChange,
    filterField,
    onFilterFieldChange,
    columns,
    visibleColumns,
    onColumnVisibilityChange,
}: SearchBarProps) {
    return (
        <div className="flex items-center gap-4">
            <div className="flex items-center gap-2">
                <div className="relative">
                    <Search className="absolute left-2 top-2.5 h-4 w-4 text-muted-foreground" />
                    <Input
                        placeholder="Buscar..."
                        value={searchTerm}
                        onChange={(e) => onSearchChange(e.target.value)}
                        className="pl-8 w-[250px]"
                    />
                </div>

                <Select
                    value={filterField}
                    onValueChange={onFilterFieldChange}
                >
                    <SelectTrigger className="w-[150px]">
                        <SelectValue placeholder="Filtrar por" />
                    </SelectTrigger>
                    <SelectContent>
                        {columns
                            .filter(col => col.key !== 'selection')
                            .map(column => (
                                <SelectItem key={column.key} value={column.key}>
                                    {column.label}
                                </SelectItem>
                            ))}
                    </SelectContent>
                </Select>
            </div>

            <DropdownMenu>
                <DropdownMenuTrigger asChild>
                    <Button variant="outline" size="sm" className="ml-auto">
                        <SlidersHorizontal className="mr-2 h-4 w-4" />
                        Colunas
                    </Button>
                </DropdownMenuTrigger>
                <DropdownMenuContent align="end" className="w-[200px]">
                    <DropdownMenuLabel>Colunas Visíveis</DropdownMenuLabel>
                    <DropdownMenuSeparator />
                    {columns
                        .filter(col => col.key !== 'selection')
                        .map(column => (
                            <DropdownMenuCheckboxItem
                                key={column.key}
                                checked={visibleColumns.includes(column.key)}
                                onCheckedChange={() => onColumnVisibilityChange(column.key)}
                            >
                                {column.label}
                            </DropdownMenuCheckboxItem>
                        ))}
                </DropdownMenuContent>
            </DropdownMenu>
        </div>
    );
}
