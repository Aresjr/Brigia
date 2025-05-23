
import { Search } from "lucide-react";
import { Input } from "@/components/ui/input";
import { useState, useRef, useEffect } from "react";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { identificationColors } from "../Forms/utils/formUtils";

interface SearchBarProps {
  searchTerm: string;
  setSearchTerm: (term: string) => void;
  filterField: string;
  setFilterField: (field: string) => void;
  pathname: string;
  colorFilter?: string;
  setColorFilter?: (color: string) => void;
}

export const SearchBar = ({
  searchTerm,
  setSearchTerm,
  pathname,
  colorFilter,
  setColorFilter
}: SearchBarProps) => {
  const [isExpanded, setIsExpanded] = useState(false);
  const searchInputRef = useRef<HTMLInputElement>(null);
  const containerRef = useRef<HTMLDivElement>(null);

  // Handle click outside to collapse the search bar
  useEffect(() => {
    const handleClickOutside = (event: MouseEvent) => {
      if (containerRef.current && !containerRef.current.contains(event.target as Node)) {
        setIsExpanded(false);
      }
    };

    document.addEventListener('mousedown', handleClickOutside);
    return () => {
      document.removeEventListener('mousedown', handleClickOutside);
    };
  }, []);

  // Focus the input when expanded
  useEffect(() => {
    if (isExpanded && searchInputRef.current) {
      searchInputRef.current.focus();
    }
  }, [isExpanded]);

  const handleFocus = () => {
    setIsExpanded(true);
  };

  return (
    <div className="flex items-center gap-2" ref={containerRef}>
      <div className={`relative transition-all duration-300 ease-in-out ${isExpanded ? "w-64" : "w-40"}`}>
        <Input
          ref={searchInputRef}
          placeholder="Pesquisar"
          value={searchTerm}
          onChange={(e) => setSearchTerm(e.target.value)}
          className="pr-10 border-gray-400"
          onFocus={handleFocus}
        />
        <Search className="absolute right-3 top-2.5 h-4 w-4 text-muted-foreground" />
      </div>
      
      {pathname === "/pacientes" && setColorFilter && (
        <Select 
          value={colorFilter || "all"} 
          onValueChange={(value) => {
            setColorFilter(value === "all" ? "" : value);
          }}
        >
          <SelectTrigger className="w-[130px] border-gray-400">
            <SelectValue placeholder="Filtrar por cor" />
          </SelectTrigger>
          <SelectContent className="border-gray-400">
            <SelectItem value="all">
              <div className="flex items-center gap-2">
                <span>Todas</span>
              </div>
            </SelectItem>
            {identificationColors.map((color) => (
              <SelectItem key={color.value} value={color.value}>
                <div className="flex items-center">
                  <div 
                    className="w-4 h-4 rounded-full mr-2"
                    style={{ backgroundColor: color.value }}
                  />
                  <span>{color.label}</span>
                </div>
              </SelectItem>
            ))}
          </SelectContent>
        </Select>
      )}
    </div>
  );
};
