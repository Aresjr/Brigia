
import { ChevronFirst, ChevronLast } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Search } from "lucide-react";

interface SidebarHeaderProps {
  expanded: boolean;
  setExpanded: (expanded: boolean) => void;
  searchTerm: string;
  setSearchTerm: (term: string) => void;
}

export const SidebarHeader = ({ 
  expanded, 
  setExpanded, 
  searchTerm, 
  setSearchTerm 
}: SidebarHeaderProps) => {
  
  return (
    <div className="p-4 pb-2">
      <div className="flex items-center mb-4">
        {expanded ? (
          <div className="flex items-center">
            <img 
              src="/bem-estar-saude-logo-sidebar.png" 
              alt="Bem Estar Saúde Logo" 
              className="h-10 object-contain" 
            />
          </div>
        ) : (
          <div className="w-full flex justify-center">
            <img 
              src="/bem-estar-saude-icone.png" 
              alt="Bem Estar Saúde Logo" 
              className="h-10 object-contain"
            />
          </div>
        )}
        <Button
          variant="ghost"
          size="icon"
          onClick={() => setExpanded(!expanded)}
          className="ml-auto"
        >
          {expanded ? <ChevronFirst /> : <ChevronLast />}
        </Button>
      </div>
      
      {expanded ? (
        <div className="flex-1 relative">
          <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 h-4 w-4 text-muted-foreground" />
          <Input
            placeholder="Pesquisar"
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
            className="h-8 pl-9"
          />
        </div>
      ) : null}
    </div>
  );
};
