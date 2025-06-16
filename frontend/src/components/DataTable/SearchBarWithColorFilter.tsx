import { Input } from "@/components/ui/input";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { Badge } from "@/components/ui/badge";
import { identificationColorOptions } from "@/components/Forms/utils/formUtils";

interface SearchBarWithColorFilterProps {
    searchTerm: string;
    setSearchTerm: (term: string) => void;
    colorFilter: string;
    setColorFilter: (color: string) => void;
    pathname: string;
}

export function SearchBarWithColorFilter({
    searchTerm,
    setSearchTerm,
    colorFilter,
    setColorFilter,
    pathname
}: SearchBarWithColorFilterProps) {
    return (
        <div className="flex gap-2">
            <div className="flex gap-2">
                <Input
                    placeholder="Buscar..."
                    value={searchTerm}
                    onChange={(e) => setSearchTerm(e.target.value)}
                    className="h-9"
                />

            </div>

            <Select value={colorFilter} onValueChange={setColorFilter}>
                <SelectTrigger className="w-[180px] h-9">
                    <SelectValue />
                </SelectTrigger>
                <SelectContent>
                    <SelectItem value="all">Todas as cores</SelectItem>
                    {identificationColorOptions.map(option => (
                        <SelectItem key={option.value} value={option.value}>
                            <div className="flex items-center gap-2">
                                <Badge
                                    variant="outline"
                                    className="w-2 h-2 rounded-full p-0 border-0"
                                    style={{ backgroundColor: option.color }}
                                />
                                {option.label}
                            </div>
                        </SelectItem>
                    ))}
                </SelectContent>
            </Select>

        </div>
    );
}
