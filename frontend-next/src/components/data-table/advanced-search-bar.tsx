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

interface AdvancedSearchBarProps {
    searchTerm: string;
    setSearchTerm: (value: string) => void;
    filterField: string;
    setFilterField: (value: string) => void;
    colorFilter?: string;
    setColorFilter?: (value: string | undefined) => void;
    availableColors?: string[];
}

export function AdvancedSearchBar({
    searchTerm,
    setSearchTerm,
    filterField,
    setFilterField,
    colorFilter,
    setColorFilter,
    availableColors = []
}: AdvancedSearchBarProps) {
    return (
        <div className="flex gap-2 items-center">
            <div className="relative w-[250px]">
                <Search className="absolute left-2 top-2.5 h-4 w-4 text-muted-foreground" />
                <Input
                    placeholder="Buscar..."
                    value={searchTerm}
                    onChange={(e) => setSearchTerm(e.target.value)}
                    className="pl-8"
                />
            </div>

            <Select
                value={filterField}
                onValueChange={setFilterField}
            >
                <SelectTrigger className="w-[140px]">
                    <SelectValue placeholder="Filtrar por" />
                </SelectTrigger>
                <SelectContent>
                    <SelectItem value="name">Nome</SelectItem>
                    <SelectItem value="cpf">CPF</SelectItem>
                    <SelectItem value="cellphone">Telefone</SelectItem>
                    <SelectItem value="email">Email</SelectItem>
                </SelectContent>
            </Select>

            {setColorFilter && availableColors.length > 0 && (
                <Select
                    value={colorFilter}
                    onValueChange={setColorFilter}
                >
                    <SelectTrigger className="w-[140px]">
                        <SelectValue placeholder="Cor" />
                    </SelectTrigger>
                    <SelectContent>
                        <SelectItem value="">Todas as cores</SelectItem>
                        {availableColors.map(color => (
                            <SelectItem key={color} value={color}>
                                <div className="flex items-center gap-2">
                                    <div
                                        className="w-4 h-4 rounded-full"
                                        style={{ backgroundColor: color }}
                                    />
                                    {color}
                                </div>
                            </SelectItem>
                        ))}
                    </SelectContent>
                </Select>
            )}
        </div>
    );
}
